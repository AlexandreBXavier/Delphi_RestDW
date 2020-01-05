unit Model.IniFile.Interfaces;

interface

type
     iModelIniFile = interface
          ['{7949BCDB-312A-4988-A6DC-50707B21B511}']
          function GetFileINI(FileName: String; Sector: String; Key: String; Value: String; Action: String): String;
     end;

implementation

end.
