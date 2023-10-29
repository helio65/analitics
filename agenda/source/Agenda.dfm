object FrmAgenda: TFrmAgenda
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Agenda'
  ClientHeight = 739
  ClientWidth = 734
  Color = 4934475
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
    Width = 734
    Height = 33
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = 'Agendamento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pnlHoratios: TPanel
    Left = 334
    Top = 33
    Width = 400
    Height = 671
    Align = alRight
    BevelOuter = bvNone
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object dbgAgenda: TDBGrid
      Left = 0
      Top = 0
      Width = 395
      Height = 666
      Align = alClient
      DataSource = dtsAgenda
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      PopupMenu = popUpAgenda
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = dbgAgendaDrawColumnCell
      OnDblClick = dbgAgendaDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TI_HORARIO'
          Title.Caption = 'Hor'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_SERVICO'
          Title.Caption = 'Servi'#231'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 303
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 33
    Width = 334
    Height = 671
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlCalendario: TPanel
      Left = 0
      Top = 0
      Width = 334
      Height = 190
      Align = alTop
      BevelOuter = bvNone
      Padding.Left = 40
      Padding.Top = 5
      Padding.Right = 40
      Padding.Bottom = 5
      TabOrder = 0
      DesignSize = (
        334
        190)
      object btnMesAnterior: TPraButtonStyle
        Left = 22
        Top = 163
        Width = 40
        Height = 24
        Hint = 'M'#234's anterior'
        Anchors = []
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 40
        ParentShowHint = False
        ShowHint = True
        OnClick = btnMesAnteriorClick
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Pen.Style = psClear
        PenDown.Color = 15065306
        PenDown.Width = 3
        PenFocused.Style = psClear
        PenDisabled.Style = psClear
        Brush.Color = 16447992
        BrushDown.Color = 15065306
        BrushFocused.Color = 15394530
        BrushDisabled.Color = 13551035
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000017352474200AECE1CE90000009249444154
          78DA6364A031601C76160400713D101B9069DE03202E04E20DB82C002990A7D0
          D11780D8109705FF7188130B30F40F3A0B12807801AD2C00193E9F80EFC8B600
          6638A1E023CB0264C3B101467CFA095940C8F0C16F01CD83089B25344945C896
          D0CC0298250B6869012130F0163C60A0BCB8BEC880549F60AB701A80589F4CC3
          1F027101039E0A87EA60E85B0000B41E3019A600A6AC0000000049454E44AE42
          6082}
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clBlack
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = [fsBold]
        FontFocused.Charset = DEFAULT_CHARSET
        FontFocused.Color = clBlack
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
        Style = bsLight
      end
      object btnProximoMes: TPraButtonStyle
        Left = 70
        Top = 163
        Width = 40
        Height = 24
        Hint = 'Pr'#243'ximo m'#234's'
        Anchors = []
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 40
        ParentShowHint = False
        ShowHint = True
        OnClick = btnProximoMesClick
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Pen.Style = psClear
        PenDown.Color = 15065306
        PenDown.Width = 3
        PenFocused.Style = psClear
        PenDisabled.Style = psClear
        Brush.Color = 16447992
        BrushDown.Color = 15065306
        BrushFocused.Color = 15394530
        BrushDisabled.Color = 13551035
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000017352474200AECE1CE90000009B49444154
          78DA6364A031601C76160400713D101B9069DE03202E04E20DB82C002990A7D0
          D11780D8109705FF7188130B30F40F4A0B160071022D2DF80FB524919616C07C
          9248483F3116FC67C00DD02DA1BA05E896D0C482850C8848A7BA05C886936D01
          030E35E88653D5026C8653CD82050C34CE68F8C0C05BF08081F2E2FA2203527D
          82ADC26900627D320D7F08C4050C782A1CAA83A16F01007C2A3819BD81A8F700
          00000049454E44AE426082}
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clBlack
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = [fsBold]
        FontFocused.Charset = DEFAULT_CHARSET
        FontFocused.Color = clBlack
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
        Style = bsLight
      end
      object PraButtonStyle1: TPraButtonStyle
        Left = 252
        Top = 162
        Width = 40
        Height = 24
        Hint = 'Pr'#243'ximo m'#234's'
        Anchors = []
        Constraints.MaxHeight = 24
        Constraints.MaxWidth = 40
        ParentShowHint = False
        ShowHint = True
        OnClick = PraButtonStyle1Click
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Pen.Style = psClear
        PenDown.Color = 15065306
        PenDown.Width = 3
        PenFocused.Style = psClear
        PenDisabled.Style = psClear
        Brush.Color = 16447992
        BrushDown.Color = 15065306
        BrushFocused.Color = 15394530
        BrushDisabled.Color = 13551035
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
          00180806000000E0773DF8000000017352474200AECE1CE90000011049444154
          78DAC5958D0D823010858F099409D40960037102750275039D409840371037D0
          097403750271027502BDA647521B4A2F2DC497BCD0427A5FEFE84F002D2BF807
          60825EA363CBD81CBD700114E81E7382564815E053F3ADD41CBDE3405C016C88
          0F8005F10558215C4002726525D43FA3337AEA909F981C404AC1ABB4426FEB32
          B701C48C4FD4CF94604B053AA24C9C0062E0509B69A932B323C8CDE90478A13B
          E890DAAAFAE83BBD0F7D0103903BBC0AF0A0B65789322A49E3251207DE4509B8
          A7F64C014ED10757809058311B30EB0A72253D5D01420981C6E837952EA72C22
          82C43E0093BA048B4C319B388B7488155000FFC2D17503ED26345D99A9963647
          623F88FF74B0011A55EB802F15D2501962B170F90000000049454E44AE426082}
        FontDown.Charset = DEFAULT_CHARSET
        FontDown.Color = clBlack
        FontDown.Height = -13
        FontDown.Name = 'Tahoma'
        FontDown.Style = [fsBold]
        FontFocused.Charset = DEFAULT_CHARSET
        FontFocused.Color = clBlack
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
        Style = bsLight
      end
      object lblCurrentDate: TLabel
        Left = 306
        Top = 29
        Width = 10
        Height = 100
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Lucida Console'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object lblMes: TLabel
        Left = 5
        Top = 8
        Width = 10
        Height = 147
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Lucida Console'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object Calendario: TCalendar
        Left = 22
        Top = 5
        Width = 270
        Height = 150
        BorderStyle = bsNone
        StartOfWeek = 0
        TabOrder = 3
        OnChange = CalendarioChange
      end
      object edtData: TMaskEdit
        Left = 181
        Top = 163
        Width = 66
        Height = 21
        Hint = 'Ir para data...'
        EditMask = '99/99/9999;1;_'
        MaxLength = 10
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Text = '  /  /    '
        TextHint = 'Ir para data'
      end
      object chkDataCorrente: TCheckBox
        Left = 304
        Top = 5
        Width = 97
        Height = 17
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = chkDataCorrenteClick
      end
    end
    object pnlProfissionais: TPanel
      Left = 0
      Top = 190
      Width = 334
      Height = 481
      Align = alClient
      BevelOuter = bvNone
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 1
      object Panel2: TPanel
        Left = 5
        Top = 0
        Width = 324
        Height = 280
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 324
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Profissionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 43
          Width = 324
          Height = 237
          Align = alClient
          DataSource = dtsProfissional
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NM_PROFISSIONAL'
              Title.Caption = 'Nome'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 345
              Visible = True
            end>
        end
        object edtPesquisaProfissional: TEdit
          Left = 0
          Top = 22
          Width = 324
          Height = 21
          Align = alTop
          TabOrder = 2
          TextHint = 'Pesquisar Profissional'
          OnChange = edtPesquisaProfissionalChange
        end
      end
      object Panel3: TPanel
        Left = 5
        Top = 280
        Width = 324
        Height = 201
        Align = alClient
        BevelOuter = bvNone
        Padding.Bottom = 5
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 324
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Servi'#231'os'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 22
          Width = 324
          Height = 174
          Align = alClient
          DataSource = dtsHabilidades
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NM_SERVICO'
              Title.Caption = 'Habilidades'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = [fsBold]
              Width = 345
              Visible = True
            end>
        end
      end
    end
  end
  object pnlControles: TPanel
    Left = 0
    Top = 704
    Width = 734
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      734
      35)
    object btnFechar: TPraButtonStyle
      Left = 674
      Top = 1
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
      ExplicitLeft = 610
    end
    object Shape1: TShape
      Left = 60
      Top = 5
      Width = 20
      Height = 20
      Pen.Style = psClear
    end
    object Label1: TLabel
      Left = 82
      Top = 9
      Width = 28
      Height = 13
      Caption = 'Livre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 124
      Top = 5
      Width = 20
      Height = 20
      Brush.Color = clGreen
      Pen.Style = psClear
    end
    object Label2: TLabel
      Left = 146
      Top = 9
      Width = 57
      Height = 13
      Caption = 'Agendado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape3: TShape
      Left = 220
      Top = 5
      Width = 20
      Height = 20
      Brush.Color = clRed
      Pen.Style = psClear
    end
    object Label3: TLabel
      Left = 242
      Top = 9
      Width = 58
      Height = 13
      Caption = 'Cancelado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 9
      Width = 48
      Height = 13
      Caption = 'Hor'#225'rio: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object FDQProfissional: TFDQuery
    AfterScroll = FDQProfissionalAfterScroll
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT CO_PROFISSIONAL, CO_EMPRESA, NM_PROFISSIONAL'
      '  FROM PROFISSIONAL'
      '  WHERE CO_EMPRESA = :CO_EMPRESA;')
    Left = 208
    Top = 637
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQProfissionalCO_PROFISSIONAL: TIntegerField
      FieldName = 'CO_PROFISSIONAL'
      Origin = 'CO_PROFISSIONAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQProfissionalCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      Required = True
    end
    object FDQProfissionalNM_PROFISSIONAL: TStringField
      FieldName = 'NM_PROFISSIONAL'
      Origin = 'NM_PROFISSIONAL'
      Required = True
      Size = 60
    end
  end
  object FDQHabilidades: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT S.NM_SERVICO'
      '  FROM PROFISSIONAL_SERVICO P'
      '    JOIN SERVICO S ON (S.CO_SERVICO = P.CO_SERVICO AND'
      '                       S.CO_EMPRESA = P.CO_EMPRESA)'
      '  WHERE P.CO_PROFISSIONAL = :CO_PROFISSIONAL AND'
      '        P.CO_EMPRESA      = :CO_EMPRESA;')
    Left = 248
    Top = 638
    ParamData = <
      item
        Name = 'CO_PROFISSIONAL'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsProfissional: TDataSource
    AutoEdit = False
    DataSet = FDQProfissional
    Left = 168
    Top = 637
  end
  object dtsHabilidades: TDataSource
    AutoEdit = False
    DataSet = FDQHabilidades
    Left = 288
    Top = 637
  end
  object FDQAgenda: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      
        'SELECT A.CO_AGENDA, A.CO_CLIENTE, A.CO_SERVICO, A.IN_STATUS, A.D' +
        'T_AGENDA, A.TI_HORARIO, S.NM_SERVICO'
      '  FROM AGENDA A'
      
        '    LEFT JOIN SERVICO S ON (S.CO_SERVICO = A.CO_SERVICO AND S.CO' +
        '_EMPRESA = A.CO_EMPRESA)'
      '  WHERE A.CO_EMPRESA = :CO_EMPRESA AND'
      '        A.CO_PROFISSIONAL = :CO_PROFISSIONAL AND'
      '        A.DT_AGENDA = :DT_AGENDA;')
    Left = 344
    Top = 637
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
      end
      item
        Name = 'DT_AGENDA'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsAgenda: TDataSource
    DataSet = FDQAgenda
    Left = 376
    Top = 637
  end
  object popUpAgenda: TPopupMenu
    Left = 486
    Top = 345
    object Agendar1: TMenuItem
      Caption = 'Agendar'
      OnClick = Agendar1Click
    end
    object Cancelaragendamento1: TMenuItem
      Caption = 'Cancelar agendamento'
      OnClick = Cancelaragendamento1Click
    end
    object Liberarmarcao1: TMenuItem
      Caption = 'Liberar marca'#231#227'o'
      OnClick = Liberarmarcao1Click
    end
    object ransferiragendamento: TMenuItem
      Caption = 'Transferir agendamento'
      OnClick = ransferiragendamentoClick
    end
  end
end
