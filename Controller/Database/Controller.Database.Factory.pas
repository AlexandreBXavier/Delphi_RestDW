unit Controller.Database.Factory;

interface

uses Controller.Database.Interfaces, Model.Database;

type
  TControllerDatabaseFactory = class(TInterfacedObject, iControllerDatabaseFactory)
  private
    ConfigDatabase: TModelDatabase;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerDatabaseFactory;
    function Server: String;
    function Driver: String;
    function DataSourceName: String;
    function Folder: String;
    function Monitor: String;
    function Port: Integer;
    function Password: String;
    function URL: String;
    function OSAuthentic: Boolean;
    function UserName: String;
    function UseURL: Boolean;
    function DatabaseName: String;
    procedure SetServer(Value: String);
    procedure SetDriver(Value: String);
    procedure SetDataSourceName(Value: String);
    procedure SetFolder(Value: String);
    procedure SetMonitor(Value: String);
    procedure SetPort(Value: Integer);
    procedure SetPassword(Value: String);
    procedure SetURL(Value: String);
    procedure SetOSAuthentic(Value: Boolean);
    procedure SetUserName(Value: String);
    procedure SetUseURL(Value: Boolean);
    procedure SetDatabaseName(Value: String);
  end;

implementation

{ TControllerDatabaseFactory }

constructor TControllerDatabaseFactory.Create;
begin
  ConfigDatabase := TModelDatabase.Create;
end;

function TControllerDatabaseFactory.DatabaseName: String;
begin
  Result := ConfigDatabase.DatabaseName;
end;

function TControllerDatabaseFactory.DataSourceName: String;
begin
  Result := ConfigDatabase.DataSourceName;
end;

destructor TControllerDatabaseFactory.Destroy;
begin
  ConfigDatabase.Free;
  //
  inherited;
end;

function TControllerDatabaseFactory.Driver: String;
begin
  Result := ConfigDatabase.Driver;
end;

function TControllerDatabaseFactory.Folder: String;
begin
  Result := ConfigDatabase.Folder;
end;

function TControllerDatabaseFactory.Server: String;
begin
  Result := ConfigDatabase.Server;
end;

procedure TControllerDatabaseFactory.SetDatabaseName(Value: String);
begin
  ConfigDatabase.DatabaseName := Value;
end;

procedure TControllerDatabaseFactory.SetDataSourceName(Value: String);
begin
  ConfigDatabase.DataSourceName := Value;
end;

procedure TControllerDatabaseFactory.SetDriver(Value: String);
begin
  ConfigDatabase.Driver:= Value;
end;

procedure TControllerDatabaseFactory.SetFolder(Value: String);
begin
  ConfigDatabase.Folder := Value;
end;

procedure TControllerDatabaseFactory.SetMonitor(Value: String);
begin
  ConfigDatabase.Monitor := Value;
end;

procedure TControllerDatabaseFactory.SetOSAuthentic(Value: Boolean);
begin
  ConfigDatabase.OSAuthentic := Value;
end;

procedure TControllerDatabaseFactory.SetPassword(Value: String);
begin
  ConfigDatabase.Password := Value;
end;

procedure TControllerDatabaseFactory.SetPort(Value: Integer);
begin
  ConfigDatabase.Port := Value;
end;

procedure TControllerDatabaseFactory.SetServer(Value: String);
begin
  ConfigDatabase.Server := Value;
end;

procedure TControllerDatabaseFactory.SetURL(Value: String);
begin
  ConfigDatabase.URL := Value;
end;

procedure TControllerDatabaseFactory.SetUserName(Value: String);
begin
  ConfigDatabase.Username := Value;
end;

procedure TControllerDatabaseFactory.SetUseURL(Value: Boolean);
begin
  ConfigDatabase.UseURL := Value;
end;

function TControllerDatabaseFactory.Monitor: String;
begin
  Result := ConfigDatabase.Monitor;
end;

class function TControllerDatabaseFactory.New: iControllerDatabaseFactory;
begin
  Result := Self.Create;
end;

function TControllerDatabaseFactory.OSAuthentic: Boolean;
begin
  Result := ConfigDatabase.OSAuthentic;
end;

function TControllerDatabaseFactory.Password: String;
begin
  Result := ConfigDatabase.Password;
end;

function TControllerDatabaseFactory.Port: Integer;
begin
  Result := ConfigDatabase.Port;
end;

function TControllerDatabaseFactory.URL: String;
begin
  Result := ConfigDatabase.URL;
end;

function TControllerDatabaseFactory.UserName: String;
begin
  Result := ConfigDatabase.UserName;
end;

function TControllerDatabaseFactory.UseURL: Boolean;
begin
  Result := ConfigDatabase.UseURL;
end;

end.
