program Stream;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  ThreadUnit in 'ThreadUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
