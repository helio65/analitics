object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Agenda de Profissionais'
  ClientHeight = 797
  ClientWidth = 1092
  Color = 10132122
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Image5: TImage
    Left = 170
    Top = 50
    Width = 922
    Height = 728
    Align = alClient
    Stretch = True
    OnMouseEnter = Image5MouseEnter
    ExplicitWidth = 1200
    ExplicitHeight = 1200
  end
  object cbSeguranca: TCategoryButtons
    Left = 416
    Top = 450
    Width = 217
    Height = 199
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ButtonFlow = cbfVertical
    ButtonHeight = 32
    ButtonWidth = 32
    ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions]
    Categories = <
      item
        Color = clNone
        Collapsed = False
        Items = <
          item
            Action = actAlterarSenha
          end
          item
            Action = actUsuarios
          end
          item
            Action = actPerfil
          end
          item
            Action = actBackup
          end
          item
            Action = actRestaurarBackup
          end
          item
            Action = actMudarUsuario
          end>
      end>
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotButtonColor = 10132122
    RegularButtonColor = clNone
    SelectedButtonColor = clNone
    TabOrder = 6
    Visible = False
    OnMouseLeave = cbSegurancaMouseLeave
  end
  object cbRelatorios: TCategoryButtons
    Left = 709
    Top = 466
    Width = 217
    Height = 135
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ButtonFlow = cbfVertical
    ButtonHeight = 32
    ButtonWidth = 32
    ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions]
    Categories = <
      item
        Color = clNone
        Collapsed = False
        Items = <
          item
            Action = actRelAgenda
          end
          item
            Action = actRelProfissionais
          end
          item
            Action = actRelTabelaHorarios
          end
          item
            Action = actRelServicos
          end>
      end>
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotButtonColor = 10132122
    RegularButtonColor = clNone
    SelectedButtonColor = clNone
    TabOrder = 4
    Visible = False
    OnMouseLeave = cbRelatoriosMouseLeave
  end
  object cbMovimento: TCategoryButtons
    Left = 693
    Top = 202
    Width = 217
    Height = 103
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ButtonFlow = cbfVertical
    ButtonHeight = 32
    ButtonWidth = 32
    ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions]
    Categories = <
      item
        Color = clNone
        Collapsed = False
        Items = <
          item
            Action = actAgenda
          end
          item
            Action = actGerarAgenda
          end
          item
            Action = actCancelarAgenda
          end>
      end>
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotButtonColor = 10132122
    RegularButtonColor = clNone
    SelectedButtonColor = clNone
    TabOrder = 3
    Visible = False
    OnMouseLeave = cbMovimentoMouseLeave
  end
  object cbCadastro: TCategoryButtons
    Left = 416
    Top = 122
    Width = 150
    Height = 231
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ButtonFlow = cbfVertical
    ButtonHeight = 32
    ButtonWidth = 32
    ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions]
    Categories = <
      item
        Color = clNone
        Collapsed = False
        Items = <
          item
            Action = actCategoria
          end
          item
            Action = actCliente
          end
          item
            Action = actEmpresa
          end
          item
            Action = actFeriado
          end
          item
            Action = actHorario
          end
          item
            Action = actProfissional
          end
          item
            Action = actServicos
          end>
      end>
    Color = 3355443
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    HotButtonColor = 10132122
    RegularButtonColor = clNone
    SelectedButtonColor = clNone
    TabOrder = 2
    Visible = False
    OnMouseLeave = cbCadastroMouseLeave
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 778
    Width = 1092
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'By HSystem (47) 99182-9176'
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1092
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 3355443
    ParentBackground = False
    TabOrder = 0
    OnMouseEnter = Panel1MouseEnter
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 170
      Height = 50
      Align = alLeft
      BevelOuter = bvNone
      Color = 3355443
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 50
        Height = 50
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Image2: TImage
          Left = 0
          Top = 0
          Width = 50
          Height = 50
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
            00180806000000E0773DF8000000017352474200AECE1CE90000003649444154
            78DA6364A031601CB5608459307BF6ECFFD430343535156E2E7D2DA005186616
            8C46323630CC2C188D646C60D48211600100D03618198FB9C18E000000004945
            4E44AE426082}
          Stretch = True
          OnClick = Image2Click
          OnMouseLeave = Image2MouseLeave
          ExplicitLeft = 16
          ExplicitTop = 24
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 50
          Height = 50
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
            00180806000000E0773DF8000000017352474200AECE1CE90000003249444154
            78DA6364A031601CB5608459F01F08A86228100C8C05B400C3CC82D148C66AD9
            F0B2603492B15A366AC1F0B70000CA941819F4C6A98E0000000049454E44AE42
            6082}
          Stretch = True
          OnMouseEnter = Image1MouseEnter
          ExplicitLeft = 16
          ExplicitTop = 24
          ExplicitWidth = 105
          ExplicitHeight = 105
        end
      end
    end
    object Panel4: TPanel
      Left = 745
      Top = 0
      Width = 347
      Height = 50
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object Panel5: TPanel
        Left = 288
        Top = 0
        Width = 59
        Height = 50
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
      end
    end
  end
  object MenuRaiz: TSplitView
    Left = 0
    Top = 50
    Width = 170
    Height = 728
    CloseStyle = svcCompact
    Color = 3355443
    OpenedWidth = 170
    Placement = svpLeft
    TabOrder = 1
    object btnSair: TPraButtonStyle
      Left = 0
      Top = 696
      Width = 170
      Height = 32
      Align = alBottom
      OnClick = btnSairClick
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
      PictureCenter = True
      Style = bsInfo
      ExplicitLeft = 24
      ExplicitTop = 528
      ExplicitWidth = 90
    end
    object cbMenuItens: TCategoryButtons
      Left = -15
      Top = -5
      Width = 185
      Height = 133
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 32
      ButtonWidth = 32
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions, boVerticalCategoryCaptions, boBoldCaptions]
      Categories = <
        item
          Color = clNone
          Collapsed = False
          Items = <
            item
              Action = actCadastro
            end
            item
              Action = actMovimento
            end
            item
              Action = actRelatorios
            end
            item
              Action = actSeguranca
            end>
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HotButtonColor = 10132122
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 1
      OnMouseMove = cbMenuItensMouseMove
    end
  end
  object AppEvents: TApplicationEvents
    OnHint = AppEventsHint
    Left = 560
    Top = 128
  end
  object ActionList1: TActionList
    Left = 656
    Top = 272
    object actCliente: TAction
      Category = 'Cadastro'
      Caption = 'Cliente'
      OnExecute = actClienteExecute
    end
    object actEmpresa: TAction
      Category = 'Cadastro'
      Caption = 'Empresa'
      OnExecute = actEmpresaExecute
    end
    object actProfissional: TAction
      Category = 'Cadastro'
      Caption = 'Profissional'
      OnExecute = actProfissionalExecute
    end
    object actServicos: TAction
      Category = 'Cadastro'
      Caption = 'Servi'#231'os'
      OnExecute = actServicosExecute
    end
    object actAgenda: TAction
      Category = 'Movimento'
      Caption = 'Agenda'
      OnExecute = actAgendaExecute
    end
    object actAlterarSenha: TAction
      Category = 'Seguranca'
      Caption = 'Alterar Senha'
      OnExecute = actAlterarSenhaExecute
    end
    object actUsuarios: TAction
      Category = 'Seguranca'
      Caption = 'Usu'#225'rios'
      OnExecute = actUsuariosExecute
    end
    object actPerfil: TAction
      Category = 'Seguranca'
      Caption = 'Perfil de Usu'#225'rios'
      OnExecute = actPerfilExecute
    end
    object actBackup: TAction
      Category = 'Seguranca'
      Caption = 'Fazer C'#243'pia de Seguran'#231'a'
      OnExecute = actBackupExecute
    end
    object actRestaurarBackup: TAction
      Category = 'Seguranca'
      Caption = 'Restaurar C'#243'pia de Seguran'#231'a'
      OnExecute = actRestaurarBackupExecute
    end
    object actCadastro: TAction
      Caption = 'Cadastro'
      OnExecute = actCadastroExecute
    end
    object actMovimento: TAction
      Caption = 'Movimento'
      OnExecute = actMovimentoExecute
    end
    object actSeguranca: TAction
      Caption = 'Seguran'#231'a'
      OnExecute = actSegurancaExecute
    end
    object actRelatorios: TAction
      Caption = 'Relat'#243'rios'
      OnExecute = actRelatoriosExecute
    end
    object actCategoria: TAction
      Category = 'Cadastro'
      Caption = 'Categoria'
      OnExecute = actCategoriaExecute
    end
    object actFeriado: TAction
      Category = 'Cadastro'
      Caption = 'Feriado'
      OnExecute = actFeriadoExecute
    end
    object actHorario: TAction
      Category = 'Cadastro'
      Caption = 'Hor'#225'rio'
      OnExecute = actHorarioExecute
    end
    object actGerarAgenda: TAction
      Category = 'Movimento'
      Caption = 'Gerar agendas do m'#234's'
      OnExecute = actGerarAgendaExecute
    end
    object actCancelarAgenda: TAction
      Category = 'Movimento'
      Caption = 'Cancelar Agenda'
      OnExecute = actCancelarAgendaExecute
    end
    object actRelAgenda: TAction
      Category = 'Relatorios'
      Caption = 'Agenda'
      OnExecute = actRelAgendaExecute
    end
    object actRelProfissionais: TAction
      Category = 'Relatorios'
      Caption = 'Rela'#231#227'o de Profissionais'
      OnExecute = actRelProfissionaisExecute
    end
    object actRelServicos: TAction
      Category = 'Relatorios'
      Caption = 'Tabela de Servi'#231'os'
      OnExecute = actRelServicosExecute
    end
    object actRelTabelaHorarios: TAction
      Category = 'Relatorios'
      Caption = 'Tabela Hor'#225'rios'
      OnExecute = actRelTabelaHorariosExecute
    end
    object actMudarUsuario: TAction
      Category = 'Seguranca'
      Caption = 'Mudar de usu'#225'rio'
      OnExecute = actMudarUsuarioExecute
    end
  end
end
