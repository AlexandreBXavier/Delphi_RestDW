unit Model.Database;

interface

uses System.SysUtils, System.Variants, System.Classes, System.DateUtils, Data.DB, Datasnap.DBClient, Model.Database.Interfaces;

type
  TModelDatabase = class(TInterfacedObject, iModelDatabase)
  private
    FDriver: String;
    FServer: String;
    FDataSourceName: String;
    FFolder: String;
    FMonitor: String;
    FPort: Integer;
    FPassword: String;
    FURL: String;
    FOSAuthentic: Boolean;
    FUserName: String;
    FUseURL: Boolean;
    FDatabaseName: String;
    procedure SetServer(const Value: String);
    procedure SetDriver(const Value: String);
    procedure SetDataSourceName(const Value: String);
    procedure SetFolder(const Value: String);
    procedure SetMonitor(const Value: String);
    procedure SetOSAuthentic(const Value: Boolean);
    procedure SetPassword(const Value: String);
    procedure SetPort(const Value: Integer);
    procedure SetURL(const Value: String);
    procedure SetUserName(const Value: String);
    procedure SetUseURL(const Value: Boolean);
    procedure SetDatabaseName(const Value: String);
    //
  published
    constructor Create;
    destructor Destroy; override;
    class function New: iModelDatabase;
    property Driver: String read FDriver write SetDriver;
    property Server: String read FServer write SetServer;
    property Port: Integer read FPort write SetPort;
    property UserName: String read FUserName write SetUserName;
    property Password: String read FPassword write SetPassword;
    property OSAuthentic: Boolean read FOSAuthentic write SetOSAuthentic;
    property UseURL: Boolean read FUseURL write SetUseURL;
    property URL: String read FURL write SetURL;
    property Folder: String read FFolder write SetFolder;
    property Monitor: String read FMonitor write SetMonitor;
    property DataSourceName: String read FDataSourceName write SetDataSourceName;
    property DatabaseName: String read FDatabaseName write SetDatabaseName;
  end;

implementation

{ TModelDatabase }

uses Controller.IniFile.Factory;

constructor TModelDatabase.Create;
begin
  // Default Values
  FDriver := TControllerIniFileFactory.New.FileINI('Database', 'Driver', 'MSSQL', 'RW');
  FServer := TControllerIniFileFactory.New.FileINI('Database', 'Server', '127.0.0.1', 'RW');
  FPort := StrToInt(TControllerIniFileFactory.New.FileINI('Database', 'Port', '1433', 'RW'));
  FUseURL := (TControllerIniFileFactory.New.FileINI('Database', 'UseURL', '0', 'RW') = '1');
  FURL := TControllerIniFileFactory.New.FileINI('Database', 'URL', '', 'RW');
  //
  FUserName := TControllerIniFileFactory.New.FileINI('Database', 'Username', 'sa', 'RW');
  FPassword := TControllerIniFileFactory.New.FileINI('Database', 'Password', 'password', 'RW');
  FOSAuthentic := (TControllerIniFileFactory.New.FileINI('Database', 'OSAuthentic', '0', 'RW') = '1');
  //
  FFolder := TControllerIniFileFactory.New.FileINI('Database', 'Folder', '', 'RW');
  FDatabaseName := TControllerIniFileFactory.New.FileINI('Database', 'Name', 'Master', 'RW');
  FMonitor := TControllerIniFileFactory.New.FileINI('Database', 'Monitor', 'Monitor', 'RW');
  FDataSourceName := TControllerIniFileFactory.New.FileINI('Database', 'DataSource', 'SQL', 'RW');
end;

destructor TModelDatabase.Destroy;
begin
  inherited;
end;

class function TModelDatabase.New: iModelDatabase;
begin
  Result := Self.Create;
end;

procedure TModelDatabase.SetServer(const Value: String);
begin
  FServer := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Server', FServer, 'W');
end;

procedure TModelDatabase.SetDatabaseName(const Value: String);
begin
  FDatabaseName := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Name', FDatabaseName, 'W');
end;

procedure TModelDatabase.SetDataSourceName(const Value: String);
begin
  FDataSourceName := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'DataSource', FDataSourceName, 'W');
end;

procedure TModelDatabase.SetMonitor(const Value: String);
begin
  FMonitor := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Monitor', FMonitor, 'W');
end;

procedure TModelDatabase.SetOSAuthentic(const Value: Boolean);
begin
  FOSAuthentic := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'OSAuthentic', IntToStr(FOSAuthentic.ToInteger), 'W');
end;

procedure TModelDatabase.SetPassword(const Value: String);
begin
  FPassword := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Password', FPassword, 'W');
end;

procedure TModelDatabase.SetPort(const Value: Integer);
begin
  FPort := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Port', IntToStr(FPort), 'W');
end;

procedure TModelDatabase.SetURL(const Value: String);
begin
  FURL := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'URL', FURL, 'W');
end;

procedure TModelDatabase.SetUserName(const Value: String);
begin
  FUserName := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Username', FUserName, 'W');
end;

procedure TModelDatabase.SetUseURL(const Value: Boolean);
begin
  FUseURL := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'UseURL', IntToStr(FUseURL.ToInteger), 'W');
end;

procedure TModelDatabase.SetDriver(const Value: String);
begin
  FDriver := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Driver', FDriver, 'W');
end;

procedure TModelDatabase.SetFolder(const Value: String);
begin
  FFolder := Value;
  //
  TControllerIniFileFactory.New.FileINI('Database', 'Folder', FFolder, 'W');
end;

end.
