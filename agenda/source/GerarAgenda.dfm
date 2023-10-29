object FrmGerarAgenda: TFrmGerarAgenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Gerar agenda do m'#234's'
  ClientHeight = 240
  ClientWidth = 250
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
    Width = 250
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
    Top = 194
    Width = 250
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 195
    DesignSize = (
      250
      46)
    object btnProcessar: TPraButtonStyle
      Left = 43
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
      Caption = 'Processar'
      TabOrder = 0
      TabStop = True
      PictureCenter = True
      Style = bsSuccess
    end
    object btnFechar: TPraButtonStyle
      Left = 193
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
    Width = 250
    Height = 163
    Align = alClient
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 164
    object Label3: TLabel
      Left = 16
      Top = 95
      Width = 71
      Height = 13
      Caption = 'Profissional: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 217
      Height = 57
      Caption = 'Per'#237'odo (data inicial e final)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 18
        Height = 13
        Caption = 'De:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 109
        Top = 24
        Width = 19
        Height = 13
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DataInicial: TMaskEdit
        Left = 32
        Top = 21
        Width = 69
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnKeyPress = DataInicialKeyPress
      end
      object DataFinal: TMaskEdit
        Left = 136
        Top = 21
        Width = 69
        Height = 21
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnKeyPress = DataInicialKeyPress
      end
    end
    object chkTodoProfissionais: TCheckBox
      Left = 16
      Top = 75
      Width = 145
      Height = 17
      Caption = 'Todos profissionais'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = chkTodoProfissionaisClick
    end
    object comboProfissionais: TDBLookupComboBox
      Left = 16
      Top = 112
      Width = 217
      Height = 21
      Enabled = False
      KeyField = 'CO_PROFISSIONAL'
      ListField = 'NM_PROFISSIONAL'
      ListSource = dtsProfissionais
      TabOrder = 2
    end
    object pnlProgresso: TPanel
      Left = 0
      Top = 143
      Width = 250
      Height = 20
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      ExplicitTop = 144
      object Gauge1: TGauge
        Left = 0
        Top = 0
        Width = 250
        Height = 20
        Align = alClient
        ForeColor = clYellow
        Progress = 0
        ExplicitLeft = 48
        ExplicitTop = 16
        ExplicitWidth = 100
        ExplicitHeight = 100
      end
    end
  end
  object FDQProfissionais: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT P.CO_PROFISSIONAL, P.NM_PROFISSIONAL'
      '  FROM PROFISSIONAL P'
      '  WHERE P.IN_SITUACAO = '#39'A'#39';')
    Left = 88
    Top = 103
  end
  object dtsProfissionais: TDataSource
    DataSet = FDQProfissionais
    Left = 120
    Top = 103
  end
end
