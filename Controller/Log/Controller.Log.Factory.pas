unit Controller.Log.Factory;

interface

uses Controller.Log.Interfaces, Model.Log, System.Classes;

type
     TControllerLogFactory = class(TInterfacedObject, iControllerLogFactory)
     private
          //
     public
          constructor Create;
          destructor Destroy; override;
          class function New: iControllerLogFactory;
          procedure SetEvent(aFile: String; aDateTime: TDateTime; aValue: String);
          function LoadEvents(aFile: String): TStrings;
     end;

implementation

{ TControllerLogFactory }

constructor TControllerLogFactory.Create;
begin
     //
end;

destructor TControllerLogFactory.Destroy;
begin
     inherited;
end;

function TControllerLogFactory.LoadEvents(aFile: String): TStrings;
begin
     Result := TModelLog.New.LoadLog(aFile);
end;

procedure TControllerLogFactory.SetEvent(aFile: String; aDateTime: TDateTime; aValue: String);
begin
     TModelLog.New.RegisterEvent(aFile, aDateTime, aValue);
end;

class function TControllerLogFactory.New: iControllerLogFactory;
begin
     Result := Self.Create;
end;

end.
