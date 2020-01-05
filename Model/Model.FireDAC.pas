unit Model.FireDAC;

interface

uses
  System.SysUtils, System.Classes,
  //
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL;

type
  TModelFireDAC = class(TDataModule)
    FDConnectionLocal: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDTransaction: TFDTransaction;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function TestConnection(aDriver: String; aPort: Integer; aServer: String; aDatabase: String; aFolder: String; aUsername: String; aPassword: String; aDataSource: String; aMonitor: String; aOSAuthent: Boolean): Boolean;
  end;

var
  ModelFireDAC: TModelFireDAC;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TModelFireDAC.TestConnection(aDriver: String; aPort: Integer; aServer: String; aDatabase: String; aFolder: String; aUsername: String; aPassword: String; aDataSource: String; aMonitor: String; aOSAuthent: Boolean): Boolean;
begin
  Result := False;
  //
  try
    FDConnectionLocal.DriverName := aDriver;
    FDConnectionLocal.LoginPrompt := False;
    //
    FDConnectionLocal.Params.Clear;
    //
    if aDriver = 'FB' then
    begin
      FDConnectionLocal.Params.Add('DriverID=' + aDriver);
      FDConnectionLocal.Params.Add('Server=' + aServer);
      FDConnectionLocal.Params.Add('Port=' + aPort.ToString);
      FDConnectionLocal.Params.Add('Database=' + aFolder + aDatabase);
      FDConnectionLocal.Params.Add('User_Name=' + aUsername);
      FDConnectionLocal.Params.Add('Password=' + aPassword);
    end;
    //
    if aDriver = 'MSSQL' then
    begin
      FDConnectionLocal.Params.Add('DriverID=' + aDriver);
      FDConnectionLocal.Params.Add('Server=' + aServer);
      FDConnectionLocal.Params.Add('Database=' + aDatabase);
      FDConnectionLocal.Params.Add('User_Name=' + aUsername);
      FDConnectionLocal.Params.Add('Password=' + aPassword);
      //
      if aOSAuthent then
        FDConnectionLocal.Params.Add('OsAuthent=Yes')
      else
        FDConnectionLocal.Params.Add('OsAuthent=No');
    end;
    //
    FDConnectionLocal.UpdateOptions.CountUpdatedRecords := False;
    //
    FDConnectionLocal.Open;
    //
    Result := FDConnectionLocal.Connected;
  finally
    FDConnectionLocal.Close;
  end;
end;

end.
