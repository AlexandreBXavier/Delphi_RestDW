unit Controller.Log.Interfaces;

interface

uses System.Classes;

type
     iControllerLogFactory = interface
          ['{147B6B94-B45C-4BE8-A2E3-4EA087DD35C8}']
          procedure SetEvent(aFile: String; aDateTime: TDateTime; aValue: String);
          function LoadEvents(aFile: String): TStrings;
     end;

implementation

end.
