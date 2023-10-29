object FrmCancelarAgenda: TFrmCancelarAgenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cancelar Agenda'
  ClientHeight = 324
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 340
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
    TabOrder = 0
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 278
    Width = 340
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      340
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
      Caption = 'Cancelar'
      TabOrder = 0
      TabStop = True
      PictureCenter = True
      Style = bsSuccess
    end
    object btnFechar: TPraButtonStyle
      Left = 283
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
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 340
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 63
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
    object GroupBox1: TGroupBox
      Left = 8
      Top = 94
      Width = 321
      Height = 146
      Caption = 'Motivo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
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
      Top = 60
      Width = 247
      Height = 21
      Enabled = False
      KeyField = 'CO_PROFISSIONAL'
      ListField = 'NM_PROFISSIONAL'
      ListSource = dtsProfissional
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 5
      Width = 321
      Height = 45
      Caption = 'Per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 82
        Top = 20
        Width = 18
        Height = 13
        Caption = 'De:'
      end
      object Label2: TLabel
        Left = 179
        Top = 20
        Width = 19
        Height = 13
        Caption = 'at'#233
      end
      object edtDataInicio: TMaskEdit
        Left = 105
        Top = 17
        Width = 68
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '  /  /    '
      end
      object edtDataFim: TMaskEdit
        Left = 205
        Top = 17
        Width = 68
        Height = 21
        EditMask = '99/99/9999;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '  /  /    '
        OnExit = edtDataFimExit
      end
    end
  end
  object FDQProfissional: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT DISTINCT A.CO_PROFISSIONAL, P.NM_PROFISSIONAL'
      '  FROM AGENDA A'
      '    JOIN PROFISSIONAL P ON (P.CO_EMPRESA      = A.CO_EMPRESA AND'
      
        '                            P.CO_PROFISSIONAL = A.CO_PROFISSIONA' +
        'L)'
      '  WHERE A.DT_AGENDA BETWEEN :DT_INICIO AND :DT_FIM;')
    Left = 144
    Top = 16
    ParamData = <
      item
        Name = 'DT_INICIO'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DT_FIM'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsProfissional: TDataSource
    DataSet = FDQProfissional
    Left = 184
    Top = 16
  end
end
