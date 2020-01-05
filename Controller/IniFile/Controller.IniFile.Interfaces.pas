unit Controller.IniFile.Interfaces;

interface

type
     iControllerIniFileFactory = interface
          ['{71ABF879-779C-4012-94EC-422E06133ACF}']
          function FileINI(Sector: String; Key: String; Value: String; Action: String): String;
     end;

implementation

end.
