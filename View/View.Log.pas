unit View.Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TViewLog = class(TForm)
    TimerLog: TTimer;
    GroupBoxRequest: TGroupBox;
    MemoRequest: TMemo;
    GroupBoxResponse: TGroupBox;
    MemoResponse: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerLogTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure UpdateResponse;
    procedure UpdateRequest;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewLog: TViewLog;

implementation

{$R *.dfm}

uses Controller.Log.Factory;

procedure TViewLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerLog.Enabled := False;
  //
  Action := caFree;
end;

procedure TViewLog.FormShow(Sender: TObject);
begin
  TimerLog.Enabled := True;
end;

procedure TViewLog.UpdateResponse;
begin
  try
    MemoResponse.Lines.Clear;
    //
    MemoResponse.Lines.AddStrings(TControllerLogFactory.New.LoadEvents('Response'));
  except
    MemoResponse.Lines.Clear;
  end;
end;

procedure TViewLog.UpdateRequest;
begin
  try
    MemoRequest.Lines.Clear;
    //
    MemoRequest.Lines.AddStrings(TControllerLogFactory.New.LoadEvents('Request'));
  except
    MemoRequest.Lines.Clear;
  end;
end;

procedure TViewLog.TimerLogTimer(Sender: TObject);
begin
  TimerLog.Enabled := False;
  //
  UpdateRequest;
  //
  UpdateResponse;
  //
  TimerLog.Enabled := True;
end;

end.
