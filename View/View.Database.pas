unit View.Database;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TViewDatabase = class(TForm)
    GroupBoxConnection: TGroupBox;
    ComboBoxDriver: TComboBox;
    LabelDriver: TLabel;
    CheckBoxUseURL: TCheckBox;
    EditURL: TEdit;
    EditServer: TEdit;
    LabelServer: TLabel;
    EditPort: TEdit;
    LabelPort: TLabel;
    GroupBoxAuthentication: TGroupBox;
    EditUsername: TEdit;
    LabelUsername: TLabel;
    EditPassword: TEdit;
    LabelPassword: TLabel;
    CheckBoxOsAuthent: TCheckBox;
    GroupBoxDatabase: TGroupBox;
    LabelFolder: TLabel;
    EditFolder: TEdit;
    LabelDatabase: TLabel;
    EditDatabase: TEdit;
    LabelDataSource: TLabel;
    EditDataSource: TEdit;
    LabelMonitor: TLabel;
    EditMonitor: TEdit;
    ButtonTest: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ButtonTestClick(Sender: TObject);
  private
    procedure SetConnection;
    procedure SetAuthentication;
    procedure SetDatabase;
    procedure GetConnection;
    procedure GetAuthentication;
    procedure GetDatabase;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewDatabase: TViewDatabase;

implementation

{$R *.dfm}

uses Controller.Database.Factory, Model.FireDAC;

procedure TViewDatabase.ButtonTestClick(Sender: TObject);
var
  aDriver: String;
  aPort: Integer;
  aServer: String;
  aDatabase: String;
  aFolder: String;
  aUsername: String;
  aPassword: String;
  aDataSource: String;
  aMonitor: String;
  aOSAuthent: Boolean;
begin
  aDriver := ComboBoxDriver.Text;
  aPort := StrToInt(EditPort.Text);
  aServer := EditServer.Text;
  aDatabase := EditDatabase.Text;
  aFolder := EditFolder.Text;
  aUsername := EditUsername.Text;
  aPassword := EditPassword.Text;
  aDataSource := EditDataSource.Text;
  aMonitor := EditMonitor.Text;
  aOSAuthent := CheckBoxOsAuthent.Checked;
  //
  if ModelFireDAC.TestConnection(aDriver, aPort, aServer, aDatabase, aFolder, aUsername, aPassword, aDataSource, aMonitor, aOSAuthent) then
    ShowMessage('Connected Successfully')
  else
    ShowMessage('Connection Error');
end;

procedure TViewDatabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetConnection;
  //
  SetAuthentication;
  //
  SetDatabase
end;

procedure TViewDatabase.FormShow(Sender: TObject);
begin
  GetConnection;
  //
  GetAuthentication;
  //
  GetDatabase;
end;

procedure TViewDatabase.SetConnection;
begin
  TControllerDatabaseFactory.New.SetDriver(ComboBoxDriver.Text);
  TControllerDatabaseFactory.New.SetServer(EditServer.Text);
  TControllerDatabaseFactory.New.SetPort(StrToInt(EditPort.Text));
  TControllerDatabaseFactory.New.SetUseURL(CheckBoxUseURL.Checked);
  TControllerDatabaseFactory.New.SetURL(EditURL.Text);
end;

procedure TViewDatabase.SetAuthentication;
begin
  TControllerDatabaseFactory.New.SetUsername(EditUsername.Text);
  TControllerDatabaseFactory.New.SetPassword(EditPassword.Text);
  TControllerDatabaseFactory.New.SetOSAuthentic(CheckBoxOsAuthent.Checked);
end;

procedure TViewDatabase.SetDatabase;
begin
  TControllerDatabaseFactory.New.SetFolder(EditFolder.Text);
  TControllerDatabaseFactory.New.SetDatabaseName(EditDatabase.Text);
  TControllerDatabaseFactory.New.SetDataSourceName(EditDataSource.Text);
  TControllerDatabaseFactory.New.SetMonitor(EditMonitor.Text);
end;

procedure TViewDatabase.GetConnection;
begin
  ComboBoxDriver.Text := TControllerDatabaseFactory.New.Driver;
  EditServer.Text := TControllerDatabaseFactory.New.Server;
  EditPort.Text := TControllerDatabaseFactory.New.Port.ToString;
  CheckBoxUseURL.Checked := TControllerDatabaseFactory.New.UseURL;
  EditURL.Text := TControllerDatabaseFactory.New.URL;
end;

procedure TViewDatabase.GetAuthentication;
begin
  EditUsername.Text := TControllerDatabaseFactory.New.Username;
  EditPassword.Text := TControllerDatabaseFactory.New.Password;
  CheckBoxOsAuthent.Checked := TControllerDatabaseFactory.New.OSAuthentic;
end;

procedure TViewDatabase.GetDatabase;
begin
  EditFolder.Text := TControllerDatabaseFactory.New.Folder;
  EditDatabase.Text := TControllerDatabaseFactory.New.DatabaseName;
  EditDataSource.Text := TControllerDatabaseFactory.New.DataSourceName;
  EditMonitor.Text := TControllerDatabaseFactory.New.Monitor;
end;

end.
