unit Controller.Server.Factory;

interface

uses Controller.Server.Interfaces, Model.Server;

type
  TControllerServerFactory = class(TInterfacedObject, iControllerServerFactory)
  private
    LocalServer: TModelServer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerServerFactory;
    function DateTime: TDateTime;
    function Pooler: Boolean;
    function AccessTag: String;
    function ForceWelcome: Boolean;
    function Authentication: Boolean;
    function Port: Integer;
    function Log: Boolean;
    function Password: String;
    function User: String;
    function FileCertification: String;
    function PassPrivateKey: String;
    function FilePrivateKey: String;
    procedure SetPooler(Value: Boolean);
    procedure SetAccessTag(Value: String);
    procedure SetForceWelcome(Value: Boolean);
    procedure SetAuthentication(Value: Boolean);
    procedure SetPort(Value: Integer);
    procedure SetLog(Value: Boolean);
    procedure SetPassword(Value: String);
    procedure SetUser(Value: String);
    procedure SetFileCertification(Value: String);
    procedure SetPassPrivateKey(Value: String);
    procedure SetFilePrivateKey(Value: String);
  end;

implementation

{ TControllerServerFactory }

function TControllerServerFactory.AccessTag: String;
begin
  Result := LocalServer.ServerAccessTag;
end;

function TControllerServerFactory.Authentication: Boolean;
begin
  Result := LocalServer.ServerAuthentication;
end;

constructor TControllerServerFactory.Create;
begin
  LocalServer := TModelServer.Create;
end;

destructor TControllerServerFactory.Destroy;
begin
  LocalServer.Free;
  //
  inherited;
end;

function TControllerServerFactory.FileCertification: String;
begin
  Result := LocalServer.ServerFileCertification;
end;

function TControllerServerFactory.FilePrivateKey: String;
begin
  Result := LocalServer.ServerFilePrivateKey;
end;

function TControllerServerFactory.ForceWelcome: Boolean;
begin
  Result := LocalServer.ServerForceWelcome;
end;

function TControllerServerFactory.Log: Boolean;
begin
  Result := LocalServer.ServerLog;
end;

class function TControllerServerFactory.New: iControllerServerFactory;
begin
  Result := Self.Create;
end;

function TControllerServerFactory.DateTime: TDateTime;
begin
  Result := LocalServer.ServerDateTime;
end;

function TControllerServerFactory.PassPrivateKey: String;
begin
  Result := LocalServer.ServerPassPrivateKey;
end;

function TControllerServerFactory.Password: String;
begin
  Result := LocalServer.ServerPassword;
end;

function TControllerServerFactory.Pooler: Boolean;
begin
  Result := LocalServer.ServerPooler;
end;

function TControllerServerFactory.Port: Integer;
begin
  Result := LocalServer.ServerPort;
end;

procedure TControllerServerFactory.SetAccessTag(Value: String);
begin
  LocalServer.ServerAccessTag := Value;
end;

procedure TControllerServerFactory.SetAuthentication(Value: Boolean);
begin
  LocalServer.ServerAuthentication := Value;
end;

procedure TControllerServerFactory.SetFileCertification(Value: String);
begin
  LocalServer.ServerFileCertification := Value;
end;

procedure TControllerServerFactory.SetFilePrivateKey(Value: String);
begin
  LocalServer.ServerFilePrivateKey := Value;
end;

procedure TControllerServerFactory.SetForceWelcome(Value: Boolean);
begin
  LocalServer.ServerForceWelcome := Value;
end;

procedure TControllerServerFactory.SetLog(Value: Boolean);
begin
  LocalServer.ServerLog := Value;
end;

procedure TControllerServerFactory.SetPassPrivateKey(Value: String);
begin
  LocalServer.ServerPassPrivateKey := Value;
end;

procedure TControllerServerFactory.SetPassword(Value: String);
begin
  LocalServer.ServerPassword := Value;
end;

procedure TControllerServerFactory.SetPooler(Value: Boolean);
begin
  LocalServer.ServerPooler := Value;
end;

procedure TControllerServerFactory.SetPort(Value: Integer);
begin
  LocalServer.ServerPort := Value;
end;

procedure TControllerServerFactory.SetUser(Value: String);
begin
  LocalServer.ServerUser := Value;
end;

function TControllerServerFactory.User: String;
begin
  Result := LocalServer.ServerUser;
end;

end.
