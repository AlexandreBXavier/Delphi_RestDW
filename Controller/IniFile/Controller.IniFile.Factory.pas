unit Controller.IniFile.Factory;

interface

uses Controller.IniFile.Interfaces, Model.IniFile;

type
     TControllerIniFileFactory = class(TInterfacedObject, iControllerIniFileFactory)
     private
          FFileName: String;
          FModelIniFile: TModelIniFile;
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerIniFileFactory;
          function FileINI(Sector: String; Key: String; Value: String; Action: String): String;
     end;

implementation

uses Vcl.Forms, System.SysUtils;

{ TControllerIniFileFactory }

function TControllerIniFileFactory.FileINI(Sector: String; Key: String; Value: String; Action: String): String;
begin
     Result := FModelIniFile.GetFileINI(FFileName, Sector, Key, Value, Action);
end;

constructor TControllerIniFileFactory.Create;
begin
     FFileName := copy(Application.ExeName, 1, Length(Application.ExeName) - 4) + '.INI';
     //
     FModelIniFile := TModelIniFile.Create;
end;

destructor TControllerIniFileFactory.Destroy;
begin
     FreeAndNil(FModelIniFile);
     //
     inherited;
end;

class function TControllerIniFileFactory.New: iControllerIniFileFactory;
begin
     Result := Self.Create;
end;

end.
