program RestDWServer;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {ViewMain},
  Model.Service in 'Model\Model.Service.pas' {ModelMethod: TDataModule},
  View.Log in 'View\View.Log.pas' {ViewLog},
  View.Database in 'View\View.Database.pas' {ViewDatabase},
  View.Server in 'View\View.Server.pas' {ViewServer},
  Model.Server.Interfaces in 'Model\Server\Model.Server.Interfaces.pas',
  Model.Server in 'Model\Server\Model.Server.pas',
  Model.IniFile in 'Model\IniFile\Model.IniFile.pas',
  Controller.IniFile.Factory in 'Controller\IniFile\Controller.IniFile.Factory.pas',
  Controller.IniFile.Interfaces in 'Controller\IniFile\Controller.IniFile.Interfaces.pas',
  Model.IniFile.Interfaces in 'Model\IniFile\Model.IniFile.Interfaces.pas',
  Controller.Server.Factory in 'Controller\Server\Controller.Server.Factory.pas',
  Controller.Server.Interfaces in 'Controller\Server\Controller.Server.Interfaces.pas',
  Model.Database in 'Model\Database\Model.Database.pas',
  Model.Database.Interfaces in 'Model\Database\Model.Database.Interfaces.pas',
  Controller.Database.Factory in 'Controller\Database\Controller.Database.Factory.pas',
  Controller.Database.Interfaces in 'Controller\Database\Controller.Database.Interfaces.pas',
  Model.Log.Interfaces in 'Model\Log\Model.Log.Interfaces.pas',
  Model.Log in 'Model\Log\Model.Log.pas',
  Controller.Log.Factory in 'Controller\Log\Controller.Log.Factory.pas',
  Controller.Log.Interfaces in 'Controller\Log\Controller.Log.Interfaces.pas',
  Model.FireDAC in 'Model\Model.FireDAC.pas' {ModelFireDAC: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.Title := 'RestDW Server CORE';
  Application.CreateForm(TModelFireDAC, ModelFireDAC);
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
