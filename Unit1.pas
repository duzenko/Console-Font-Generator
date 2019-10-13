unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    FontDialog1: TFontDialog;
    File1: TMenuItem;
    Save1: TMenuItem;
    Font1: TMenuItem;
    Change1: TMenuItem;
    StatusBar1: TStatusBar;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    procedure Change1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Bitmap: TBitmap;
    OutputPath: string;
    procedure Rebuild;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation uses
  PngImage, TGA;

{$R *.dfm}

procedure TForm1.Change1Click(Sender: TObject);
begin
  FontDialog1.Execute();
  Rebuild;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Bitmap := TBitmap.Create;
  Bitmap.PixelFormat := pf32bit;
  Rebuild;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Bitmap);
end;

procedure TForm1.Rebuild;
var
  cw,ch,c: Integer;
begin
  with Bitmap.Canvas do begin
    Font := FontDialog1.Font;
    Font.Color := $ffffff;
    cw := TextWidth('a');
    Bitmap.Width := cw*16;
    ch := TextHeight('fg');
    Bitmap.Height := ch*16;
//    Brush.Color := Bitmap.TransparentColor;
    Brush.Color := $0;
    FillRect(ClipRect);
    Brush.Color := $ffffff;
    for c := 0 to 255 do
    case c of
    10:
      FillRect(Rect(c mod 16 * cw, c div 16 * ch, c mod 16 * cw + 2, c div 16 * ch + ch-1));
    11:
      FillRect(Rect(c mod 16 * cw, c div 16 * ch, c mod 16 * cw + cw - 1, c div 16 * ch + ch-1));
    else
      TextOut(c mod 16 * cw, c div 16 * ch, Chr(c));
    end;
  end;
  Image1.Picture.Graphic := Bitmap;
  StatusBar1.SimpleText := Format('%d: %d x %d',
    [FontDialog1.Font.Size, Bitmap.Width, Bitmap.Height]);
end;

type
  DWORD_ARRAY = array[0..0] of DWORD;
  P_DWORD_ARRAY = ^DWORD_ARRAY;
procedure TForm1.Save1Click(Sender: TObject);
var
  png: TPngImage;
  i: Integer;
  j: Integer;
  pixels: P_DWORD_ARRAY;
  fn: string;
begin
  fn := Format('consolefont_%d.tga', [FontDialog1.Font.Size]);
  SaveDialog1.FileName := OutputPath + fn;
  if not DirectoryExists(OutputPath) then begin
    SaveDialog1.FileName := fn;
    if not SaveDialog1.Execute() then
      Exit;
    OutputPath := ExtractFilePath(SaveDialog1.FileName);
  end;
  for i := 0 to Bitmap.Height-1 do begin
    pixels := Bitmap.ScanLine[i];
    for j := 0 to Bitmap.Width-1 do begin
      pixels[j] := pixels[j] shl 24 + $ffffff
    end;
  end;
//  Bitmap.SaveToFile(Format('consolefont_%d.bmp', [FontDialog1.Font.Size]));
  with TTGAImage.Create do try
    Assign(bitmap);
    SaveToFile(SaveDialog1.FileName);
  finally
    Free
  end;
end;

end.
