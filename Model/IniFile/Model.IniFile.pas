unit Model.IniFile;

interface

uses Model.IniFile.Interfaces;

type
  TModelIniFile = class(TInterfacedObject, iModelIniFile)
  private
    //
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelIniFile;
    function GetFileINI(FileName: String; Sector: String; Key: String; Value: String; Action: String): String;
  end;

implementation

{ TModelIniFile }

uses System.IniFiles, System.SysUtils;

constructor TModelIniFile.Create;
begin
  //
end;

destructor TModelIniFile.Destroy;
begin
  inherited;
end;

function TModelIniFile.GetFileINI(FileName: String; Sector: String; Key: String; Value: String; Action: String): String;
var
  MyIniFile: TIniFile;
begin
  MyIniFile := Nil;
  //
  try
    MyIniFile := TIniFile.Create(FileName);
    //
    if (Action = 'W') then
    begin
      MyIniFile.WriteString(Sector, Key, Value);
      //
      result := Value;
    end;
    //
    if (Action = 'R') then
    begin
      try
        result := Trim(MyIniFile.ReadString(Sector, Key, ''));
      except
        result := '';
      end;
    end;
    //
    if (Action = 'RW') then
    begin
      try
        result := Trim(MyIniFile.ReadString(Sector, Key, ''));
      except
        result := '';
      end;
      //
      if (result = '') then
      begin
        MyIniFile.WriteString(Sector, Key, Value);
        //
        result := Value;
      end;
    end;
  finally
    MyIniFile.Free;
  end;
end;

class function TModelIniFile.New: iModelIniFile;
begin
  result := Self.Create;
end;

end.
