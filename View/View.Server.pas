unit View.Server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TViewServer = class(TForm)
    GroupBoxSSL: TGroupBox;
    EditFileCertification: TEdit;
    LabelFileCertification: TLabel;
    LabelFilePrivateKey: TLabel;
    EditFilePrivateKey: TEdit;
    LabelPassPrivateKey: TLabel;
    EditPassPrivateKey: TMaskEdit;
    GroupBoxExtras: TGroupBox;
    CheckBoxPooler: TCheckBox;
    CheckBoxLog: TCheckBox;
    CheckBoxForceWelcome: TCheckBox;
    CheckBoxAuthentication: TCheckBox;
    GroupBoxAuthentication: TGroupBox;
    EditPassword: TEdit;
    LabelPassword: TLabel;
    EditUsername: TEdit;
    LabelUsername: TLabel;
    EditAccessTag: TEdit;
    LabelAccessTag: TLabel;
    LabelPort: TLabel;
    EditPort: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure GetAuthentication;
    procedure GetExtras;
    procedure GetSSL;
    procedure SetAuthentication;
    procedure SetExtras;
    procedure SetSSL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewServer: TViewServer;

implementation

{$R *.dfm}

uses Controller.Server.Factory;

procedure TViewServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetAuthentication;
  //
  SetExtras;
  //
  SetSSL;
end;

procedure TViewServer.FormShow(Sender: TObject);
begin
  GetAuthentication;
  //
  GetExtras;
  //
  GetSSL;
end;

procedure TViewServer.GetAuthentication;
begin
  EditPort.Text := TControllerServerFactory.New.Port.ToString;
  EditAccessTag.Text := TControllerServerFactory.New.AccessTag;
  EditUsername.Text := TControllerServerFactory.New.User;
  EditPassword.Text := TControllerServerFactory.New.Password;
end;

procedure TViewServer.GetExtras;
begin
  CheckBoxPooler.Checked := TControllerServerFactory.New.Pooler;
  CheckBoxLog.Checked := TControllerServerFactory.New.Log;
  CheckBoxForceWelcome.Checked := TControllerServerFactory.New.ForceWelcome;
  CheckBoxAuthentication.Checked := TControllerServerFactory.New.Authentication;
end;

procedure TViewServer.GetSSL;
begin
  EditFilePrivateKey.Text := TControllerServerFactory.New.FilePrivateKey;
  EditPassPrivateKey.Text := TControllerServerFactory.New.PassPrivateKey;
  EditFileCertification.Text := TControllerServerFactory.New.FileCertification;
end;

procedure TViewServer.SetAuthentication;
begin
  TControllerServerFactory.New.SetPort(StrToInt(EditPort.Text));
  TControllerServerFactory.New.SetAccessTag(EditAccessTag.Text);
  TControllerServerFactory.New.SetUser(EditUsername.Text);
  TControllerServerFactory.New.SetPassword(EditPassword.Text);
end;

procedure TViewServer.SetExtras;
begin
  TControllerServerFactory.New.SetPooler(CheckBoxPooler.Checked);
  TControllerServerFactory.New.SetAuthentication(CheckBoxAuthentication.Checked);
  TControllerServerFactory.New.SetForceWelcome(CheckBoxForceWelcome.Checked);
  TControllerServerFactory.New.SetLog(CheckBoxLog.Checked);
end;

procedure TViewServer.SetSSL;
begin
  TControllerServerFactory.New.SetFilePrivateKey(EditFilePrivateKey.Text);
  TControllerServerFactory.New.SetPassPrivateKey(EditPassPrivateKey.Text);
  TControllerServerFactory.New.SetFileCertification(EditFileCertification.Text);
end;

end.
