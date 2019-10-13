program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  GdiPlus in 'Lib\GdiPlus.pas',
  GdiPlusHelpers in 'Lib\GdiPlusHelpers.pas',
  tga in 'tga.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
