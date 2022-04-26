unit LoggerUt;

interface
uses   SysUtils, Dialogs,  Classes,  TypInfo,  Math;

type
  TStatusMessage = (Critical, Warning, Info);

  TLogger = class(TStringList) // класс для хранения сообщений
  private
    FileDir: String;
  public
    TimeClearFile: TDateTime;
    constructor Create();
    procedure SaveMessage(Status: TStatusMessage; ID :Integer; Text: string);  // медод для записи сообщения в файл
    procedure ClearFile();
  end;

implementation
procedure SaveString(Text: string; Path:String);
var
   f:TextFile;
Begin
  AssignFile(f,Path);
  if not FileExists(Path) then
  begin
    Rewrite(f);
    CloseFile(f);
   end;
  Append(f);
  Writeln(f,Text);
  Flush(f);
  CloseFile(f);
End;

constructor TLogger.Create();
begin
    FileDir:=GetCurrentDir+'\file.txt';
end;
procedure TLogger.SaveMessage(Status: TStatusMessage; ID :Integer; Text: string);
var
   Str:String;
Begin
  Str:=DateTimeToStr(Now())+' | '+ IntToStr(ID)+' | '+GetEnumName(TypeInfo(TStatusMessage), Ord(RandomRange(0,3)))+' | '+ Text;
  if Count>=10 then Delete(Count-10);
  Add(Str);
  SaveString(Str, FileDir);
End;

procedure TLogger.ClearFile();
var
   I, OldS: integer;
   TimeWord: string;
   T:TDateTime; // время строки из файла
   F:TStringList;
Begin
  F:=TStringList.Create;
  F.LoadFromFile(FileDir);
  OldS:= F.Count;
   for I := F.Count - 1 downto 0 do
   begin
     TimeWord:=Copy(F.Strings[I], 1, 19) ;
     T:=StrToDateTime(TimeWord);
     if now-T>=TimeClearFile then  F.Delete(I);
   end;
  F.SaveToFile(FileDir);
  ShowMessage('Из файла лога удалено:' +IntToStr(OldS-F.Count)+'записей');
  F.Free;
End;

End.
