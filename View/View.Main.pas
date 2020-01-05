unit View.Main;

Interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winsock, Winapi.Iphlpapi, Winapi.IpTypes, System.IniFiles, Vcl.AppEvnts, Vcl.StdCtrls, Web.HTTPApp, Vcl.ExtCtrls, Vcl.Imaging.Jpeg, Vcl.Imaging.Pngimage, Vcl.Mask, Vcl.Menus, Vcl.ComCtrls,
  //
  uDWJSONObject, uDWConsts, uDWAbout, uRESTDWBase, dwCGIRunner, dwISAPIRunner;

type
  TViewMain = class(TForm)
    ApplicationEvents: TApplicationEvents;
    TrayIcon: TTrayIcon;
    RESTServicePooler: TRESTServicePooler;
    RESTDWServiceNotification: TRESTDWServiceNotification;
    PanelLogo: TPanel;
    ImageLogo: TImage;
    PanelButton: TPanel;
    ButtonStart: TButton;
    ButtonStop: TButton;
    ButtonServer: TButton;
    ButtonDatabase: TButton;
    ButtonLog: TButton;
    PanelBody: TPanel;
    LabelSecurity: TLabel;
    LabelServer: TLabel;
    LabelVersion: TLabel;
    LabelRequest: TLabel;
    LabelResponse: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RESTServicePoolerLastRequest(Value: string);
    procedure RESTServicePoolerLastResponse(Value: string);
    procedure ButtonLogClick(Sender: TObject);
    procedure ButtonDatabaseClick(Sender: TObject);
    procedure ButtonServerClick(Sender: TObject);
  private
    { Private declarations }
    NumberRequest, NumberResponse: Integer;
    function GetHandleOnTaskBar: THandle;
    procedure ChangeStatusWindow;
    procedure HideApplication;
    procedure SecureStatus;
    procedure ServerStatus;
    procedure UpdateResponse(Start: Boolean);
    procedure UpdateRequest(Start: Boolean);
  public
    { Public declarations }
    procedure ShowBalloonTips(IconMessage: Integer = 0; MessageValue: string = '');
    procedure ShowApplication;
  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

uses Model.Service, View.Log, View.Database, View.Server, Controller.Server.Factory, Controller.Log.Factory;

function TViewMain.GetHandleOnTaskBar: THandle;
begin
  if Application.MainFormOnTaskBar and Assigned(Application.MainForm) then
    Result := Application.MainForm.Handle
  else
    Result := Application.Handle;
end;

procedure TViewMain.ChangeStatusWindow;
begin
  Application.ProcessMessages;
end;

procedure TViewMain.TrayIconDblClick(Sender: TObject);
begin
  ShowApplication;
end;

procedure TViewMain.HideApplication;
begin
  TrayIcon.Visible := True;
  //
  Application.ShowMainForm := False;
  //
  if Self <> Nil then
    Self.Visible := False;
  //
  Application.Minimize;
  //
  ShowWindow(GetHandleOnTaskBar, SW_HIDE);
  //
  ChangeStatusWindow;
end;

procedure TViewMain.RESTServicePoolerLastRequest(Value: string);
var
  VLastRequest: String;
begin
  UpdateRequest(False);
  //
  if TControllerServerFactory.New.Log then
    TControllerLogFactory.New.SetEvent('Request', Now, Value);
end;

procedure TViewMain.RESTServicePoolerLastResponse(Value: string);
var
  VLastResponse: String;
begin
  UpdateResponse(False);
  //
  if TControllerServerFactory.New.Log then
    TControllerLogFactory.New.SetEvent('Response', Now, Value);
end;

procedure TViewMain.ShowApplication;
begin
  TrayIcon.Visible := False;
  //
  Application.ShowMainForm := True;
  //
  if Self <> Nil then
  begin
    Self.Visible := True;
    Self.WindowState := WsNormal;
  end;
  //
  ShowWindow(GetHandleOnTaskBar, SW_SHOW);
  //
  ChangeStatusWindow;
end;

procedure TViewMain.UpdateRequest(Start: Boolean);
begin
  if not Start then
    Inc(NumberRequest)
  else
    NumberRequest := 0;
  //
  if (NumberRequest > 0) then
  begin
    LabelRequest.Font.Color := ClBlue;
    LabelRequest.Caption := 'Request: ' + NumberRequest.ToString;
  end
  else
  begin
    LabelRequest.Font.Color := ClRed;
    LabelRequest.Caption := 'Request: ' + NumberRequest.ToString;
  end;
end;

procedure TViewMain.UpdateResponse(Start: Boolean);
begin
  if not Start then
    Inc(NumberResponse)
  else
    NumberResponse := 0;
  //
  if (NumberResponse > 0) then
  begin
    LabelResponse.Font.Color := ClBlue;
    LabelResponse.Caption := 'Response: ' + NumberResponse.ToString;
  end
  else
  begin
    LabelResponse.Font.Color := ClRed;
    LabelResponse.Caption := 'Response: ' + NumberResponse.ToString;
  end;
end;

procedure TViewMain.ServerStatus;
begin
  if RESTServicePooler.Active then
  begin
    LabelServer.Font.Color := ClBlue;
    LabelServer.Caption := 'Server: Active';
  end
  else
  begin
    LabelServer.Font.Color := ClRed;
    LabelServer.Caption := 'Server: Inactive';
  end;
end;

procedure TViewMain.SecureStatus;
begin
  if RESTServicePooler.Secure then
  begin
    LabelSecurity.Font.Color := ClBlue;
    LabelSecurity.Caption := 'Security: Active';
  end
  else
  begin
    LabelSecurity.Font.Color := ClRed;
    LabelSecurity.Caption := 'Security: Inactive';
  end;
end;

procedure TViewMain.ShowBalloonTips(IconMessage: Integer = 0; MessageValue: string = '');
begin
  case IconMessage of
    0:
      TrayIcon.BalloonFlags := BfInfo;
    1:
      TrayIcon.BalloonFlags := BfWarning;
    2:
      TrayIcon.BalloonFlags := BfError;
  else
    TrayIcon.BalloonFlags := BfInfo;
  end;
  //
  TrayIcon.BalloonTitle := ViewMain.Caption;
  TrayIcon.BalloonHint := MessageValue;
  TrayIcon.ShowBalloonHint;
  //
  Application.ProcessMessages;
end;

procedure TViewMain.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  ButtonStart.Enabled := not RESTServicePooler.Active;
  ButtonStop.Enabled := RESTServicePooler.Active;
  //
  ButtonServer.Enabled := not RESTServicePooler.Active;
  ButtonDatabase.Enabled := not RESTServicePooler.Active;
  ButtonLog.Enabled := not RESTServicePooler.Active;
end;

procedure TViewMain.ButtonDatabaseClick(Sender: TObject);
begin
  ViewDatabase := TViewDatabase.Create(Self);
  //
  ViewDatabase.ShowModal;
end;

procedure TViewMain.ButtonLogClick(Sender: TObject);
begin
  ViewLog := TViewLog.Create(Self);
  //
  ViewLog.ShowModal;
end;

procedure TViewMain.ButtonServerClick(Sender: TObject);
begin
  ViewServer := TViewServer.Create(Self);
  //
  ViewServer.ShowModal;
end;

procedure TViewMain.ButtonStartClick(Sender: TObject);
begin
  UpdateRequest(True);
  UpdateResponse(True);
  //
  if not RESTServicePooler.Active then
  begin
    RESTDWServiceNotification.AccessTag := TControllerServerFactory.New.AccessTag;
    //
    RESTServicePooler.ServerParams.HasAuthentication := TControllerServerFactory.New.Authentication;
    RESTServicePooler.ServerParams.Username := TControllerServerFactory.New.User;
    RESTServicePooler.ServerParams.Password := TControllerServerFactory.New.Password;
    RESTServicePooler.ServicePort := TControllerServerFactory.New.Port;
    RESTServicePooler.SSLPrivateKeyFile := TControllerServerFactory.New.FilePrivateKey;
    RESTServicePooler.SSLPrivateKeyPassword := TControllerServerFactory.New.PassPrivateKey;
    RESTServicePooler.SSLCertFile := TControllerServerFactory.New.FileCertification;
    RESTServicePooler.ForceWelcomeAccess := TControllerServerFactory.New.ForceWelcome;
    RESTServicePooler.Active := True;
    //
    if not RESTServicePooler.Active then
      Exit;
    //
    HideApplication;
  end;
  //
  ServerStatus;
  SecureStatus;
end;

procedure TViewMain.ButtonStopClick(Sender: TObject);
begin
  UpdateRequest(True);
  UpdateResponse(True);
  //
  RESTServicePooler.Active := False;
  //
  ShowApplication;
end;

procedure TViewMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not RESTServicePooler.Active;
  //
  if not CanClose then
  begin
    CanClose := not Self.Visible;
    //
    if CanClose then
      CanClose := Application.MessageBox('Close Server?', PWideChar(Application.Title), Mb_IconQuestion + Mb_YesNo) = MrYes
    else
      HideApplication;
  end;
end;

procedure TViewMain.FormCreate(Sender: TObject);
begin
  LabelVersion.Caption := 'Version ' + uDWConsts.DWVERSAO;
  //
  UpdateRequest(True);
  UpdateResponse(True);
  //
  RESTServicePooler.ServerMethodClass := TModelMethod;
end;

end.
