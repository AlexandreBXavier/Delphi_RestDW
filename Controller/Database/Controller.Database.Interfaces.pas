unit Controller.Database.Interfaces;

interface

uses System.SysUtils, System.Variants, System.Classes, System.DateUtils;

type
  iControllerDatabaseFactory = interface
    ['{E5C83101-EAD9-49BC-8CFA-C4997B084F02}']
    function Server: String;
    function Driver: String;
    function DataSourceName: String;
    function Folder: String;
    function Monitor: String;
    function Port: Integer;
    function Password: String;
    function URL: String;
    function OSAuthentic: Boolean;
    function UserName: String;
    function UseURL: Boolean;
    function DatabaseName: String;
    procedure SetServer(Value: String);
    procedure SetDriver(Value: String);
    procedure SetDataSourceName(Value: String);
    procedure SetFolder(Value: String);
    procedure SetMonitor(Value: String);
    procedure SetPort(Value: Integer);
    procedure SetPassword(Value: String);
    procedure SetURL(Value: String);
    procedure SetOSAuthentic(Value: Boolean);
    procedure SetUserName(Value: String);
    procedure SetUseURL(Value: Boolean);
    procedure SetDatabaseName(Value: String);
  end;

implementation

end.
