unit Model.Log.Interfaces;

interface

uses System.Classes;

type
     iModelLog = interface
          ['{0ACD9742-E8CB-4A1B-9DB1-A1F004558A6F}']
          procedure RegisterEvent(aFile: String; aDateTime: TDateTime; aValue: String);
          function LoadLog(aFile: String): TStrings;
     end;

implementation

end.
