unit Controller.Server.Interfaces;

interface

uses System.SysUtils, System.Variants, System.Classes, System.DateUtils;

type
  iControllerServerFactory = interface
    ['{F0D2663D-EF96-4BC1-9A46-A4DE095E915E}']
    function DateTime: TDateTime;
    function Pooler: Boolean;
    function AccessTag: String;
    function ForceWelcome: Boolean;
    function Authentication: Boolean;
    function Port: Integer;
    function Log: Boolean;
    function Password: String;
    function User: String;
    function FileCertification: String;
    function PassPrivateKey: String;
    function FilePrivateKey: String;
    procedure SetPooler(Value: Boolean);
    procedure SetAccessTag(Value: String);
    procedure SetForceWelcome(Value: Boolean);
    procedure SetAuthentication(Value: Boolean);
    procedure SetPort(Value: Integer);
    procedure SetLog(Value: Boolean);
    procedure SetPassword(Value: String);
    procedure SetUser(Value: String);
    procedure SetFileCertification(Value: String);
    procedure SetPassPrivateKey(Value: String);
    procedure SetFilePrivateKey(Value: String);
  end;

implementation

end.
