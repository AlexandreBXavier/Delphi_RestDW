unit Model.Service;

interface

uses
  SysUtils, Classes, SysTypes, Data.DB, Dialogs, ServerUtils, System.JSON,
  //
  FireDAC.Dapt, FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Stan.StorageJSON, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.Stan.StorageBin, FireDAC.Dapt.Intf, FireDAC.Comp.DataSet, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Phys.PGDef, FireDAC.Phys.PG, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient, FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBC,
  //
  uDWAbout, uDWDatamodule, uDWMassiveBuffer, uDWJSONObject, uDWConstsData, uRESTDWPoolerDB, uRestDWDriverFD, uDWConsts, uRESTDWServerEvents, uSystemEvents, uRESTDWServerContext, uRESTDWDriverRDW, uDWJSONTools,
  //
  View.Main;

type
  TModelMethod = class(TServerMethodDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDStanStorageJSONLink: TFDStanStorageJSONLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDTransaction: TFDTransaction;
    FDQuery: TFDQuery;
    FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink;
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    FDMoniRemoteClientLink: TFDMoniRemoteClientLink;
    FDPhysODBCDriverLink: TFDPhysODBCDriverLink;
    DWServerEvents: TDWServerEvents;
    RESTDWPoolerDB: TRESTDWPoolerDB;
    RESTDWDriverFD: TRESTDWDriverFD;
    procedure FDConnectionBeforeConnect(Sender: TObject);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
    procedure DWServerEventsEventsservertimeReplyEvent(var Params: TDWParams; var Result: string);
    procedure ServerMethodDataModuleReplyEvent(SendType: TSendEvent; Context: string; var Params: TDWParams; var Result: string; AccessTag: string);
    procedure DWServerEventsEventstestReplyEvent(var Params: TDWParams; var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelMethod: TModelMethod;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Controller.Server.Factory, Controller.Database.Factory;

{$R *.dfm}

procedure TModelMethod.DWServerEventsEventsservertimeReplyEvent(var Params: TDWParams; var Result: string);
begin
  if Params.ItemsString['result'] <> nil then
    Params.ItemsString['result'].AsDateTime := Now;
  //
  Result := DateTimeToStr(Now);
end;

procedure TModelMethod.DWServerEventsEventstestReplyEvent(var Params: TDWParams; var Result: string);
begin
  if Params.ItemsString['result'] <> nil then
    Params.ItemsString['result'].AsString := '{ "Result": "Test Access" }';
  //
  Result := 'Test Access!';
end;

procedure TModelMethod.FDConnectionBeforeConnect(Sender: TObject);
begin
  TFDConnection(Sender).Params.Clear;
  TFDConnection(Sender).DriverName := TControllerDatabaseFactory.New.Driver;
  TFDConnection(Sender).LoginPrompt := False;
  //
  if TControllerDatabaseFactory.New.Driver = 'FB' then
  begin
    TFDConnection(Sender).Params.Add('DriverID=' + TControllerDatabaseFactory.New.Driver);
    TFDConnection(Sender).Params.Add('Server=' + TControllerDatabaseFactory.New.DataSourceName);
    TFDConnection(Sender).Params.Add('Port=' + TControllerDatabaseFactory.New.Port.ToString);
    TFDConnection(Sender).Params.Add('Database=' + IncludeTrailingPathDelimiter(TControllerDatabaseFactory.New.Folder) + TControllerDatabaseFactory.New.DatabaseName);
    TFDConnection(Sender).Params.Add('User_Name=' + TControllerDatabaseFactory.New.Username);
    TFDConnection(Sender).Params.Add('Password=' + TControllerDatabaseFactory.New.Password);
    TFDConnection(Sender).Params.Add('Protocol=TCPIP');
    TFDConnection(Sender).Params.Add('Charset=ISO8859_1');
  end;
  //
  if TControllerDatabaseFactory.New.Driver = 'MSSQL' then
  begin
    TFDConnection(Sender).Params.Add('DriverID=' + TControllerDatabaseFactory.New.Driver);
    TFDConnection(Sender).Params.Add('Server=' + TControllerDatabaseFactory.New.DataSourceName);
    TFDConnection(Sender).Params.Add('Database=' + TControllerDatabaseFactory.New.DatabaseName);
    TFDConnection(Sender).Params.Add('User_Name=' + TControllerDatabaseFactory.New.Username);
    TFDConnection(Sender).Params.Add('Password=' + TControllerDatabaseFactory.New.Password);
    //
    if TControllerDatabaseFactory.New.OSAuthentic then
      TFDConnection(Sender).Params.Add('OsAuthent=Yes')
    else
      TFDConnection(Sender).Params.Add('OsAuthent=No');
  end;
  //
  TFDConnection(Sender).UpdateOptions.CountUpdatedRecords := False;
end;

procedure TModelMethod.ServerMethodDataModuleCreate(Sender: TObject);
begin
  DWServerEvents.AccessTag := TControllerServerFactory.New.AccessTag;
  //
  RESTDWPoolerDB.AccessTag := TControllerServerFactory.New.AccessTag;
end;

procedure TModelMethod.ServerMethodDataModuleReplyEvent(SendType: TSendEvent; Context: string; var Params: TDWParams; var Result: string; AccessTag: string);
begin
  if (AccessTag = TControllerServerFactory.New.AccessTag) then
  begin
    if (Context = 'test') and (SendType = seGET) then
      Params.ItemsString['result'].AsString := '{ "Result": "Test Access" }';
    //
    Result := 'Test Access';
  end;
end;

end.
