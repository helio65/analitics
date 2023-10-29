object FrmSelecaoEmpresa: TFrmSelecaoEmpresa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 152
  ClientWidth = 378
  Color = 10132122
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 61
    Width = 52
    Height = 13
    Caption = 'Empresa:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 106
    Width = 378
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      378
      46)
    object btnNovo: TPraButtonStyle
      Left = 3
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Incluir uma nova empresa'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnNovoClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 16758677
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 16674604
      BrushDown.Color = 14180132
      BrushFocused.Color = 14180132
      BrushDisabled.Color = 16755034
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE90000009549444154
        78DAE5D5C10D80300805509940377006377014DDAC4EE02A8EE206484C3C0914
        091813491A0E2D7DCDBF149AE482D701441CA9ADB4BACA6C0180D903ECD45AE3
        03AB0807E0B941250D5D672C4804A02251808844022C120DDCE65C8086FE10D0
        F2E6CEA501E27E5444E94068441CFE5DC0128B54F0E4259180E5C3196874F346
        34522BB47A0558E89EC905782B1D90EA0014EBAC19D8A094270000000049454E
        44AE426082}
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = [fsBold]
      FontFocused.Charset = DEFAULT_CHARSET
      FontFocused.Color = clWhite
      FontFocused.Height = -13
      FontFocused.Name = 'Tahoma'
      FontFocused.Style = [fsBold]
      FontDisabled.Charset = DEFAULT_CHARSET
      FontDisabled.Color = 16773346
      FontDisabled.Height = -13
      FontDisabled.Name = 'Tahoma'
      FontDisabled.Style = [fsBold]
      Caption = ''
      TabOrder = 1
      TabStop = True
      PictureCenter = True
      Style = bsPrimary
    end
    object btnSelecionar: TPraButtonStyle
      Left = 59
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Selecionar empresa'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSelecionarClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 12499381
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 8222060
      BrushDown.Color = 6840922
      BrushFocused.Color = 6840922
      BrushDisabled.Color = 11446434
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE9000000A649444154
        78DAEDD2E10980201080516F8336698536A936A94D1CA515DAA40DEC820CBBBC
        3ABDFA51742022C8F72804F3F0C00F7C0770CED9650380F676608DD7EBD18688
        1A20713F3D229D1A60E223AE0A81490548E2D98034CE021868F0A2D5C6A34010
        B0F4C9A5C60F4024B02139F11D808102B7015749EEF85FD5A4C6635FC0217444
        F1032044C4F128708124C559804192E3A700414C4EFC12081093131701DA793F
        3003537769191DC4B00B0000000049454E44AE426082}
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = [fsBold]
      FontFocused.Charset = DEFAULT_CHARSET
      FontFocused.Color = clWhite
      FontFocused.Height = -13
      FontFocused.Name = 'Tahoma'
      FontFocused.Style = [fsBold]
      FontDisabled.Charset = DEFAULT_CHARSET
      FontDisabled.Color = 16773346
      FontDisabled.Height = -13
      FontDisabled.Name = 'Tahoma'
      FontDisabled.Style = [fsBold]
      Caption = ''
      TabOrder = 2
      TabStop = True
      PictureCenter = True
      Style = bsSecondary
    end
    object btnFechar: TPraButtonStyle
      Left = 321
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Fechar'
      Anchors = [akRight]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFecharClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 14405779
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 12099623
      BrushDown.Color = 9929760
      BrushFocused.Color = 9929760
      BrushDisabled.Color = 14864506
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE9000000F849444154
        78DAC594810D82301045DB09C4091C4146281BE8068C0093E0086EA01BC808B8
        094C507F0398B3B481F6AC5EF243D336FF95BBCB499138E4DF005AEB129F06CA
        023D7BA896525ED700E6E22EF2E13D00FB358066A50611027842157477FCD500
        9DA00B74F40266C3F9C00214D86EB19563DD1288315738EB70A6B07EC402FA09
        D2118820E6F9649EC5025C10E1338F057C40A63B4E730EE09D7302A035610168
        41ED142D20A100DB7CEE96C207E1B429CD392DBC128C363539AFA19BA3A00672
        16E3DCCAB945DE1C5B009C6137C0265B0394629C2FA110D310D5625CDB806FC5
        4F019C9C7B1F46010A1F93B7431240AA480E78018DDEDA19A79AD67E00000000
        49454E44AE426082}
      FontDown.Charset = DEFAULT_CHARSET
      FontDown.Color = clWhite
      FontDown.Height = -13
      FontDown.Name = 'Tahoma'
      FontDown.Style = [fsBold]
      FontFocused.Charset = DEFAULT_CHARSET
      FontFocused.Color = clWhite
      FontFocused.Height = -13
      FontFocused.Name = 'Tahoma'
      FontFocused.Style = [fsBold]
      FontDisabled.Charset = DEFAULT_CHARSET
      FontDisabled.Color = 16773346
      FontDisabled.Height = -13
      FontDisabled.Name = 'Tahoma'
      FontDisabled.Style = [fsBold]
      Caption = ''
      TabOrder = 0
      TabStop = True
      PictureCenter = True
      Style = bsInfo
    end
  end
  object comboEmpresa: TDBLookupComboBox
    Left = 70
    Top = 60
    Width = 291
    Height = 21
    KeyField = 'CO_EMPRESA'
    ListField = 'NM_FANTASIA'
    ListSource = dtsEmpresa
    TabOrder = 0
    OnExit = comboEmpresaExit
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 378
    Height = 31
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Selecione uma empresa'
    Color = 4934475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object dtsEmpresa: TDataSource
    Left = 24
    Top = 40
  end
end
