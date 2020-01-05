unit Model.Server;

interface

uses System.SysUtils, System.Variants, System.Classes, System.DateUtils, Data.DB, Datasnap.DBClient, Model.Server.Interfaces;

type
  TModelServer = class(TInterfacedObject, iModelServer)
  private
    FServerDateTime: TDateTime;
    FServerForceWelcome: Boolean;
    FServerAccessTag: String;
    FServerAuthentication: Boolean;
    FServerPooler: Boolean;
    FServerPort: Integer;
    FServerLog: Boolean;
    FServerPassword: String;
    FServerUser: String;
    FServerFileCertification: String;
    FServerPassPrivateKey: String;
    FServerFilePrivateKey: String;
    function GetServerDateTime: TDateTime;
    procedure SetGetServerPooler(const Value: Boolean);
    procedure SetServerAccessTag(const Value: String);
    procedure SetServerAuthentication(const Value: Boolean);
    procedure SetServerForceWelcome(const Value: Boolean);
    procedure SetServerLog(const Value: Boolean);
    procedure SetServerPassword(const Value: String);
    procedure SetServerPort(const Value: Integer);
    procedure SetServerUser(const Value: String);
    procedure SetServerFileCertification(const Value: String);
    procedure SetServerFilePrivateKey(const Value: String);
    procedure SetServerPassPrivateKey(const Value: String);
  published
    constructor Create;
    destructor Destroy; override;
    class function New: iModelServer;
    property ServerDateTime: TDateTime read GetServerDateTime;
    property ServerPort: Integer read FServerPort write SetServerPort;
    property ServerUser: String read FServerUser write SetServerUser;
    property ServerPassword: String read FServerPassword write SetServerPassword;
    property ServerAccessTag: String read FServerAccessTag write SetServerAccessTag;
    property ServerAuthentication: Boolean read FServerAuthentication write SetServerAuthentication;
    property ServerForceWelcome: Boolean read FServerForceWelcome write SetServerForceWelcome;
    property ServerLog: Boolean read FServerLog write SetServerLog;
    property ServerPooler: Boolean read FServerPooler write SetGetServerPooler;
    property ServerFilePrivateKey: String read FServerFilePrivateKey write SetServerFilePrivateKey;
    property ServerPassPrivateKey: String read FServerPassPrivateKey write SetServerPassPrivateKey;
    property ServerFileCertification: String read FServerFileCertification write SetServerFileCertification;
  end;

implementation

uses Controller.IniFile.Factory;

constructor TModelServer.Create;
begin
  // Default Values
  FServerPort := StrToInt(TControllerIniFileFactory.New.FileINI('Server', 'Port', '8081', 'RW'));
  FServerAccessTag := TControllerIniFileFactory.New.FileINI('Server', 'AccessTag', 'RestDW', 'RW');
  FServerUser := TControllerIniFileFactory.New.FileINI('Server', 'Username', 'User', 'RW');
  FServerPassword := TControllerIniFileFactory.New.FileINI('Server', 'Password', 'pass', 'RW');
  //
  FServerPooler := (TControllerIniFileFactory.New.FileINI('Server', 'Pooler', '1', 'RW') = '1');
  FServerForceWelcome := (TControllerIniFileFactory.New.FileINI('Server', 'ForceWelcome', '1', 'RW') = '1');
  FServerAuthentication := (TControllerIniFileFactory.New.FileINI('Server', 'Authentication', '1', 'RW') = '1');
  FServerLog := (TControllerIniFileFactory.New.FileINI('Server', 'Log', '1', 'RW') = '1');
  //
  FServerFileCertification := TControllerIniFileFactory.New.FileINI('Server', 'FileCertification', '', 'RW');
  FServerPassPrivateKey := TControllerIniFileFactory.New.FileINI('Server', 'PassPrivateKey', '', 'RW');
  FServerFilePrivateKey := TControllerIniFileFactory.New.FileINI('Server', 'FilePrivateKey', '', 'RW');
end;

destructor TModelServer.Destroy;
begin
  inherited;
end;

function TModelServer.GetServerDateTime: TDateTime;
begin
  try
    Result := Now;
  except
    Result := StrToDateTime('01/01/1980 00:00:00');
  end;
end;

class function TModelServer.New: iModelServer;
begin
  Result := Self.Create;
end;

procedure TModelServer.SetGetServerPooler(const Value: Boolean);
begin
  FServerPooler := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Pooler', IntToStr(FServerPooler.toInteger), 'W');
end;

procedure TModelServer.SetServerAccessTag(const Value: String);
begin
  FServerAccessTag := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'AccessTag', FServerAccessTag, 'W');
end;

procedure TModelServer.SetServerAuthentication(const Value: Boolean);
begin
  FServerAuthentication := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Authentication', IntToStr(FServerAuthentication.toInteger), 'W');
end;

procedure TModelServer.SetServerFileCertification(const Value: String);
begin
  FServerFileCertification := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'FileCertification', FServerFileCertification, 'W');
end;

procedure TModelServer.SetServerFilePrivateKey(const Value: String);
begin
  FServerFilePrivateKey := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'FilePrivateKey', FServerFilePrivateKey, 'W');
end;

procedure TModelServer.SetServerForceWelcome(const Value: Boolean);
begin
  FServerForceWelcome := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'ForceWelcome', IntToStr(FServerForceWelcome.toInteger), 'W');
end;

procedure TModelServer.SetServerLog(const Value: Boolean);
begin
  FServerLog := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Log', IntToStr(FServerLog.toInteger), 'W');
end;

procedure TModelServer.SetServerPassPrivateKey(const Value: String);
begin
  FServerPassPrivateKey := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'PassPrivateKey', FServerPassPrivateKey, 'W');
end;

procedure TModelServer.SetServerPassword(const Value: String);
begin
  FServerPassword := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Password', FServerPassword, 'W');
end;

procedure TModelServer.SetServerPort(const Value: Integer);
begin
  FServerPort := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Port', IntToStr(FServerPort), 'W');
end;

procedure TModelServer.SetServerUser(const Value: String);
begin
  FServerUser := Value;
  //
  TControllerIniFileFactory.New.FileINI('Server', 'Username', FServerUser, 'W');
end;

end.
