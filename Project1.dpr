program Project1;

uses
  Forms,
  Zadanie1 in 'Zadanie1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
