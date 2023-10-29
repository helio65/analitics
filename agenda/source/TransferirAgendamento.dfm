object FrmTransferirAgendamento: TFrmTransferirAgendamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Transferir agendamento'
  ClientHeight = 365
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Color = 4934475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 319
    Width = 346
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      346
      46)
    object btnProcessar: TPraButtonStyle
      Left = 107
      Top = 9
      Width = 90
      Height = 32
      Hint = 'Processar agenda'
      Anchors = [akLeft]
      Constraints.MaxWidth = 117
      ParentShowHint = False
      ShowHint = True
      OnClick = btnProcessarClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 10671252
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 4565545
      BrushDown.Color = 3705378
      BrushFocused.Color = 3705378
      BrushDisabled.Color = 16773346
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
      Caption = 'Transferir'
      TabOrder = 0
      TabStop = True
      PictureCenter = True
      Style = bsSuccess
    end
    object btnFechar: TPraButtonStyle
      Left = 289
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
      TabOrder = 1
      TabStop = True
      PictureCenter = True
      Style = bsInfo
      ExplicitLeft = 484
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 31
    Width = 346
    Height = 288
    Align = alClient
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 30
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 120
      Top = 19
      Width = 45
      Height = 13
      Caption = 'Hor'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 83
      Width = 45
      Height = 13
      Caption = 'Servi'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 53
      Width = 68
      Height = 13
      Caption = 'Profissional:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 110
      Width = 117
      Height = 13
      Caption = 'Hor'#225'rios dispon'#237'veis:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtData: TMaskEdit
      Left = 42
      Top = 15
      Width = 68
      Height = 21
      TabStop = False
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 0
      Text = '  /  /    '
    end
    object edtHorario: TMaskEdit
      Left = 170
      Top = 15
      Width = 47
      Height = 21
      TabStop = False
      EditMask = '99:99;1;_'
      MaxLength = 5
      ReadOnly = True
      TabOrder = 1
      Text = '  :  '
    end
    object comboServico: TDBLookupComboBox
      Left = 57
      Top = 80
      Width = 272
      Height = 21
      KeyField = 'CO_SERVICO'
      ListField = 'NM_SERVICO'
      ListSource = dtsServico
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 136
      Width = 321
      Height = 146
      Caption = 'Observa'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object memObservacoes: TMemo
        Left = 5
        Top = 19
        Width = 310
        Height = 119
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object comboProfissional: TDBLookupComboBox
      Left = 81
      Top = 50
      Width = 248
      Height = 21
      KeyField = 'CO_PROFISSIONAL'
      ListField = 'NM_PROFISSIONAL'
      ListSource = dtsProfissional
      TabOrder = 2
    end
    object comboHorarios: TComboBox
      Left = 130
      Top = 107
      Width = 75
      Height = 21
      TabOrder = 4
    end
  end
  object dtsServico: TDataSource
    Left = 240
    Top = 135
  end
  object dtsProfissional: TDataSource
    DataSet = FDQProfissional
    Left = 280
    Top = 135
  end
  object FDQProfissional: TFDQuery
    AfterScroll = FDQProfissionalAfterScroll
    SQL.Strings = (
      'SELECT P.CO_PROFISSIONAL, P.NM_PROFISSIONAL'
      '  FROM PROFISSIONAL P'
      '  WHERE P.CO_EMPRESA = :CO_EMPRESA AND'
      '        P.IN_SITUACAO = '#39'A'#39';')
    Left = 272
    Top = 47
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        ParamType = ptInput
      end>
  end
end
