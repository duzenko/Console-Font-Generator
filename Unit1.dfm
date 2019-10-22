object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 512
  ClientWidth = 512
  Color = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 512
    Height = 493
    Align = alClient
    Center = True
    Proportional = True
    Stretch = True
    ExplicitLeft = 216
    ExplicitTop = 232
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 493
    Width = 512
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 264
    object File1: TMenuItem
      Caption = 'File'
      object Save1: TMenuItem
        Caption = 'Save'
        ShortCut = 113
        OnClick = Save1Click
      end
    end
    object Font1: TMenuItem
      Caption = 'Font'
      object Change1: TMenuItem
        Caption = 'Change'
        ShortCut = 114
        OnClick = Change1Click
      end
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqAntialiased
    Left = 312
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.tga|*.tga'
    Left = 320
    Top = 296
  end
end
