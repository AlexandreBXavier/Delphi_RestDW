unit Model.Log;

interface

uses Model.Log.Interfaces, System.SysUtils, System.Classes;

type
  TModelLog = class(TInterfacedObject, iModelLog)
  private
    //
  published
    constructor Create;
    destructor Destroy; override;
    class function New: iModelLog;
    procedure RegisterEvent(aFile: String; aDateTime: TDateTime; aValue: String);
    function LoadLog(aFile: String): TStrings;
  end;

implementation

{ TModelLog }

procedure TModelLog.RegisterEvent(aFile: String; aDateTime: TDateTime; aValue: String);
var
  aFileLog: String;
  txtLog: TextFile;
begin
  aFileLog := aFile + '.dat';
  //
  AssignFile(txtLog, aFileLog);
  //
  if FileExists(aFileLog) then
    Append(txtLog)
  else
    ReWrite(txtLog);
  //
  WriteLn(txtLog, DateTimeToStr(aDateTime) + ' - ' + aValue);
  //
  CloseFile(txtLog);
end;

function TModelLog.LoadLog(aFile: String): TStrings;
var
  aFileLog: String;
  aStrings: TStrings;
begin
  aFileLog := aFile + '.dat';
  //
  aStrings := TStringList.Create;
  //
  if FileExists(aFileLog) then
    aStrings.LoadFromFile(aFileLog)
  else aStrings.Add('<none>');
  //
  Result := aStrings;
end;

constructor TModelLog.Create;
begin
  //
end;

destructor TModelLog.Destroy;
begin
  inherited;
end;

class function TModelLog.New: iModelLog;
begin
  Result := Self.Create;
end;

end.
