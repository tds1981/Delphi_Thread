unit Zadanie1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LoggerUt, ComCtrls, TypInfo, ExtCtrls;

type
  TForm1 = class(TForm)
    LitBoxMes: TListBox;
    grp1: TGroupBox;
    NewThread: TButton;
    DeltaTime: TEdit;
    ud1: TUpDown;
    lbl1: TLabel;
    Label1: TLabel;
    grp2: TGroupBox;
    DellThread: TButton;
    ListThread: TListBox;
    lbl2: TLabel;
    grp3: TGroupBox;
    ClearFile: TEdit;
    ud2: TUpDown;
    TimerClearFile: TTimer;
    procedure NewThreadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DellThreadClick(Sender: TObject);
    procedure TimerClearFileTimer(Sender: TObject);
    procedure ClearFileChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyThread = class(TThread)
     private
     protected
        procedure UpdateListBox();
        function DeleteThread(): Boolean;
        procedure Execute(); override;
     public
       DeltaT:TDateTime;     // период формирования сообщения
   end;
   {  TThreadClearFile = class(TThread)
     private
     protected
        procedure Execute(); override;
     public
       DeltaClear:TDateTime;     // период очистки файла логов
   end; }

var
  Form1: TForm1;
  Logger :TLogger;
  MyThread: TMyThread;
 // ThreadForClearfile: TThreadClearFile;
implementation

{$R *.dfm}

procedure TForm1.NewThreadClick(Sender: TObject);
begin
   MyThread:=TMyThread.Create(False);
   MyThread.Priority:=tpNormal;
   MyThread.DeltaT:=StrToDateTime('00:00:'+DeltaTime.Text);
   ListThread.Items.Add(IntToStr(MyThread.ThreadID));
end;

procedure TMyThread.Execute ();
var OldDataTime :TDateTime;
    N:Integer;
begin
  N :=1;
  OldDataTime:=Date;
  while DeleteThread()  do      
  begin
      if now-OldDataTime>=DeltaT then
      begin
        Logger.SaveMessage(Info, ThreadID,'Сообщение №'+ IntToStr(N));
        Synchronize(UpdateListBox);
        N:=N+1;
        OldDataTime:=now;
      end;
  end;
  WaitFor;
  Free();
end;
procedure TMyThread.UpdateListBox();
var Buf: TMessage;
begin
    Form1.LitBoxMes.Items:=Logger;
end;
Function TMyThread.DeleteThread(): Boolean;
begin
  if Form1.ListThread.Items.IndexOf(IntToStr(ThreadID))= -1
  then result:=False else result:=True;
End;

procedure TForm1.FormCreate(Sender: TObject);
begin
    Logger:=TLogger.Create();
    Logger.TimeClearFile:=StrToDateTime('00:'+ClearFile.Text+':00');
    TimerClearFile.Interval:= StrToInt(ClearFile.Text)*60000;
end;

procedure TForm1.DellThreadClick(Sender: TObject);
begin
 ListThread.Items.Delete(ListThread.ItemIndex);
end;

{procedure TThreadClearFile.Execute();
var OldDataTime :TDateTime;
Begin
  while true  do
  begin
      if now-OldDataTime>=DeltaClear then
      begin
        Logger.ClearFile();
        OldDataTime:=now;
      end;
  end;
End ; }

procedure TForm1.TimerClearFileTimer(Sender: TObject);
begin
   Logger.ClearFile();
end;

procedure TForm1.ClearFileChange(Sender: TObject);
begin
  TimerClearFile.Interval:= StrToInt(ClearFile.Text)*60000;
  Logger.TimeClearFile:=StrToDateTime('00:'+ClearFile.Text+':00');
end;

end.
