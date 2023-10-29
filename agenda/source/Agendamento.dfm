object FrmAgendamento: TFrmAgendamento
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Agendamento'
  ClientHeight = 364
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
    TabOrder = 0
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 318
    Width = 346
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 1
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
      Caption = 'Agendar'
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
    Height = 287
    Align = alClient
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 2
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
    object Label3: TLabel
      Left = 8
      Top = 50
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
    object Label4: TLabel
      Left = 8
      Top = 111
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
      Top = 81
      Width = 42
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlProgresso: TPanel
      Left = 0
      Top = 267
      Width = 346
      Height = 20
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
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
      TabOrder = 1
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
      TabOrder = 2
      Text = '  :  '
    end
    object edtProfissional: TEdit
      Left = 80
      Top = 47
      Width = 249
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 3
    end
    object comboServico: TDBLookupComboBox
      Left = 57
      Top = 108
      Width = 272
      Height = 21
      KeyField = 'CO_SERVICO'
      ListField = 'NM_SERVICO'
      ListSource = dtsServicos
      TabOrder = 4
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
    object comboCliente: TDBLookupComboBox
      Left = 57
      Top = 78
      Width = 272
      Height = 21
      KeyField = 'CO_CLIENTE'
      ListField = 'NM_CLIENTE'
      ListSource = dtsCliente
      TabOrder = 6
    end
  end
  object dtsServicos: TDataSource
    DataSet = FDQServico
    Left = 224
    Top = 39
  end
  object FDQCliente: TFDQuery
    SQL.Strings = (
      
        'SELECT CO_CLIENTE, (NM_CLIENTE || '#39'  -  Data de Nascimento: '#39' ||' +
        ' DT_NASCIMENTO) AS NM_CLIENTE'
      '  FROM CLIENTE C'
      '  WHERE C.CO_EMPRESA = :CO_EMPRESA AND'
      '        C.IN_SITUACAO = '#39'A'#39';')
    Left = 256
    Top = 39
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsCliente: TDataSource
    DataSet = FDQCliente
    Left = 288
    Top = 39
  end
  object FDQServico: TFDQuery
    SQL.Strings = (
      
        'SELECT S.CO_SERVICO, S.NM_SERVICO                               ' +
        '                      '
      
        '  FROM PROFISSIONAL_SERVICO PS                                  ' +
        '                      '
      
        '    JOIN SERVICO S ON (S.CO_EMPRESA = PS.CO_EMPRESA AND S.CO_SER' +
        'VICO = PS.CO_SERVICO) '
      
        '  WHERE PS.CO_EMPRESA      = :CO_EMPRESA AND                    ' +
        '                      '
      '        PS.CO_PROFISSIONAL = :CO_PROFISSIONAL;')
    Left = 256
    Top = 8
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CO_PROFISSIONAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
