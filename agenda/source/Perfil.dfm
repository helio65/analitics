object FrmPerfil: TFrmPerfil
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Perfil de Usu'#225'rio'
  ClientHeight = 495
  ClientWidth = 426
  Color = 4934475
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 449
    Width = 426
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      426
      46)
    object btnNovo: TPraButtonStyle
      Left = 3
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Incluir um novo registro'
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
    object btnEditar: TPraButtonStyle
      Left = 59
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Editar o registro corrente'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEditarClick
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
        00180806000000E0773DF8000000017352474200AECE1CE9000000DC49444154
        78DABD958B0DC2300C449B4960036002C406300130098CC00865838E92113A02
        1B8433A4A8A4F9B8C6C19265B58EEF459748314DE5307F0738E7F62817E4BA30
        DB1A63CE12408FB2606EB0088901DCAB81480D0D6B38100D4016A20548423401
        51883660322702E4A0B501778C9D6A01DA509C05C8F9CDD9882A004B6F285BE4
        0EBF1FDA162D513AE40A6931BE510390FF5EF8E02176380F9145812D247EF49F
        962068F7BF9CC1E72A06E25F3D36A0604B565C0CE08AA700E4DFE4C11959C616
        4F01E8C9BC36EF5B110338AE7814508A11A0282E02CC8D27B521BC195517C1FF
        0000000049454E44AE426082}
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
    object btnExcluir: TPraButtonStyle
      Left = 115
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Excluir o registro corrente'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExcluirClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 10722284
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 4667354
      BrushDown.Color = 3548870
      BrushFocused.Color = 3548870
      BrushDisabled.Color = 11117294
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE90000006249444154
        78DA6364A031601C1916FC0702AC9A8180640B701946B48BD12CA5BF05C89610
        130484D40F0E0B48E58F5A306AC1A805645840080C4A0B1E002979620C470217
        81E61B106B4100906A00627D220D7F08C405400B3610650135C1D0B70000A381
        C719350768760000000049454E44AE426082}
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
      TabOrder = 3
      TabStop = True
      PictureCenter = True
      Style = bsDanger
    end
    object btnGravar: TPraButtonStyle
      Left = 172
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Gravar as altera'#231#245'es do registro corrente'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGravarClick
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
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE9000000BF49444154
        78DA6364A031601C5E16FCFFFFDF0148AD07620112CD59C0C8C898488C051F80
        143F998EC56A09BA05FFC1824040ACA9402D09406A3E2E4B705A0063E3033087
        E0B3842A16A05B822C4E350B7005F1C05940C8706C60F05A00140665BC7A200E
        800A81524A23352D9800A4F2D1CC9B085456402D0BB0E5F00740658AB4B4E021
        509902B52C6880C6013268042A6BA08A0548F1801CC90D58D40C7C32A5A4B886
        0194B8C156E12C006279720D07E204A00507B05A400B30F42D00006BCDB519EC
        2B0E9D0000000049454E44AE426082}
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
      TabOrder = 4
      TabStop = True
      PictureCenter = True
      Style = bsSuccess
    end
    object btnCancelar: TPraButtonStyle
      Left = 228
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Cancelar a opera'#231#227'o corrente'
      Anchors = [akLeft]
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 9102078
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 1492476
      BrushDown.Color = 1027294
      BrushFocused.Color = 1027294
      BrushDisabled.Color = 8773886
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
        00180806000000E0773DF8000000017352474200AECE1CE90000015349444154
        78DAB5948151C3300C45ED0968376003DA090813D00D0813B44C409880320161
        026002CA04ED08DD003A81796A9C3B93732C071ADFE9D4D8D67FAA6CD99A9187
        1D1AE09CABADB5E598008713C8ED9800930B5101E8CD70D75881C9EF49B0AC42
        9200C457B8C7C49617ED3C7A0188BFF9CC8F42922DB6C3BE72C57B0141E6076C
        81D02658733171A627CC7DAB005FF3ADFFBC0AC5FD7A1D1197980F6CCEDA5E03
        54B8FBDC12B450DC4D2C2606908C2F63D9270085FF073B62E61A40EA78864D63
        354D408EFD41CC2F4D9BBB511197DE90DB75202CEC939397E893984203AC714B
        EC89CDAB4C406D9A437E20A6D200E73869B2A27B06AC95CCD53DD94BCFCCD46B
        9AC8B2C43D8767E3C55F4DF33EDDB1B4EEC665015A71FF39C52EB0D29B8C77C4
        17B1D89CD73414EF0E294B15CBFC3F001195476F639AE77A9F8A1F5CA221FD91
        0D0821A3015A48F79A9E14F097F1031B06AF19B3FC4E310000000049454E44AE
        426082}
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
      FontDisabled.Color = 9737364
      FontDisabled.Height = -13
      FontDisabled.Name = 'Tahoma'
      FontDisabled.Style = [fsBold]
      Caption = ''
      TabOrder = 5
      TabStop = True
      PictureCenter = True
      Style = bsWarning
    end
    object btnFechar: TPraButtonStyle
      Left = 369
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
      TabOrder = 6
      TabStop = True
      PictureCenter = True
      Style = bsInfo
      ExplicitLeft = 484
    end
    object btnAlternar: TPraButtonStyle
      Left = 294
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Voltar para pesquisa'
      Anchors = []
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAlternarClick
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
        00180806000000E0773DF8000000017352474200AECE1CE9000000F649444154
        78DA6364A031601CB5606858E0EDED6DB575EBD66334B10064F8BF7FFFE2B76F
        DF9E4E750B608683D854B700D970AA5B806E3808FCFFFFFF2D2323E363207D81
        9595F5E2E6CD9BBF91650136C3B1806F40CB8E3333336F2164118A05441A8EE2
        2BA0FAE9BB76ED7A4C130B60BEF9FBF76F1F2E4BC80D22A22D213A9209015002
        D8B66D5B0B511660B304964C030303857FFEFC290C641A8030301E84616A9898
        9816A2E7788A339A9B9B9B2C303525009932A048DFB1634715D116205B4228A3
        797878380383290C88A70383EA02D116C02C21A6B003A903FA420D68C102922C
        2005787979812CB845330BD0C1A80504010064069F195F597C82000000004945
        4E44AE426082}
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
      ExplicitLeft = 317
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 426
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
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 426
    Height = 418
    Align = alClient
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 2
    object pcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 426
      Height = 418
      ActivePage = tabCadastro
      Align = alClient
      OwnerDraw = True
      TabOrder = 0
      OnChange = pcPrincipalChange
      object tabConsulta: TTabSheet
        Caption = 'tabConsulta'
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 418
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = 4934475
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            418
            45)
          object Label1: TLabel
            Left = 8
            Top = 1
            Width = 39
            Height = 13
            Caption = 'Campo'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label2: TLabel
            Left = 120
            Top = 1
            Width = 51
            Height = 13
            Caption = 'Condi'#231#227'o'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object Label3: TLabel
            Left = 234
            Top = 1
            Width = 29
            Height = 13
            Caption = 'Valor'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object btnPesquisa: TPraButtonStyle
            Left = 357
            Top = 9
            Width = 53
            Height = 32
            Hint = 'Pesquisar'
            Anchors = []
            Constraints.MaxWidth = 53
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPesquisaClick
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Pen.Style = psClear
            PenDown.Color = 10460313
            PenDown.Width = 3
            PenFocused.Style = psClear
            PenDisabled.Style = psClear
            Brush.Color = 4209204
            BrushDown.Color = 2828067
            BrushFocused.Color = 2828067
            BrushDisabled.Color = 9734010
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000180000
              00180806000000E0773DF8000000017352474200AECE1CE9000000FC49444154
              78DAED94ED0D82301086E904BA8138813A81B80123E8066E204C221B881BE006
              B0016C8013D4F7F030D02010AEFCE3923725D7E69EDE4751CECCA616C06880D6
              DAC372875C61CC1CBA28A51213401B1B4B17CF01D89A005D396092C8669C5100
              6C05588E10953185621C0BAD00E0A680BB8E58298E1E4400BEF90D7A43676CC5
              F0F9F88EA01514C2174800F5ED4FF554B09F200FE805BF2701F4F5E55F49AD66
              90C1BFB7D183927BF0E4E0F420D7E21E0C4C5135499C5D3919D0C8849A496F21
              8362C867700B3209D065384E254A18F22B95354003726DF6A10F4029AEC6061F
              B002F15D1340358E1CF91FB570BE1397B40073D90218B40FF576CA1914716DEC
              0000000049454E44AE426082}
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
            TabOrder = 3
            TabStop = True
            PictureCenter = True
            Style = bsDark
            ExplicitLeft = 462
          end
          object comboCampo: TComboBox
            Left = 8
            Top = 16
            Width = 92
            Height = 21
            Style = csDropDownList
            TabOrder = 0
          end
          object comboCondicao: TComboBox
            Left = 120
            Top = 16
            Width = 97
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            Items.Strings = (
              'Contendo'
              'Iniciado por')
          end
          object edtValor: TEdit
            Left = 234
            Top = 16
            Width = 113
            Height = 21
            TabOrder = 2
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 45
          Width = 418
          Height = 363
          Align = alClient
          BevelOuter = bvNone
          Color = 4934475
          ParentBackground = False
          TabOrder = 1
          object Grid: TDBGrid
            Left = 0
            Top = 0
            Width = 418
            Height = 363
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = dtsPerfil
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = GridDblClick
            Columns = <
              item
                Expanded = False
                FieldName = 'CO_PERFIL'
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NM_PERFIL'
                Title.Caption = 'Nome'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 337
                Visible = True
              end>
          end
        end
      end
      object tabCadastro: TTabSheet
        Caption = 'tabCadastro'
        ImageIndex = 1
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 418
          Height = 408
          Align = alClient
          BevelOuter = bvNone
          Color = 8618883
          ParentBackground = False
          TabOrder = 0
          object Label4: TLabel
            Left = 29
            Top = 15
            Width = 38
            Height = 13
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 93
            Top = 15
            Width = 32
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CO_PERFIL: TDBEdit
            Left = 29
            Top = 32
            Width = 60
            Height = 21
            TabStop = False
            Color = 15263976
            DataField = 'CO_PERFIL'
            DataSource = dtsPerfil
            ReadOnly = True
            TabOrder = 0
          end
          object NM_PERFIL: TDBEdit
            Left = 93
            Top = 32
            Width = 298
            Height = 21
            DataField = 'NM_PERFIL'
            DataSource = dtsPerfil
            TabOrder = 1
          end
          object gbAcessos: TGroupBox
            Left = 29
            Top = 68
            Width = 362
            Height = 332
            Caption = 'Acessos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            Visible = False
            DesignSize = (
              362
              332)
            object btnExpandirArvore: TPraButtonStyle
              Left = 9
              Top = 297
              Width = 90
              Height = 32
              Anchors = [akLeft]
              ParentShowHint = False
              ShowHint = True
              OnClick = btnExpandirArvoreClick
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
              Caption = 'Expandir '#193'rvore'
              TabOrder = 1
              TabStop = True
              PictureCenter = True
              Style = bsSecondary
            end
            object btnMarcarTodos: TPraButtonStyle
              Left = 248
              Top = 298
              Width = 90
              Height = 32
              Anchors = [akLeft]
              ParentShowHint = False
              ShowHint = True
              OnClick = btnMarcarTodosClick
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
              Caption = 'Marcar todos'
              TabOrder = 2
              TabStop = True
              PictureCenter = True
              Style = bsSecondary
            end
            object btnAtualizarAcessos: TPraButtonStyle
              Left = 127
              Top = 298
              Width = 90
              Height = 32
              Anchors = [akLeft]
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = btnAtualizarAcessosClick
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
              Caption = 'Atualizar Acessos'
              TabOrder = 3
              TabStop = True
              PictureCenter = True
              Style = bsSuccess
            end
            object tvAcessos: TTreeView
              Left = 9
              Top = 18
              Width = 344
              Height = 274
              DoubleBuffered = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Indent = 19
              ParentDoubleBuffered = False
              ParentFont = False
              TabOrder = 0
              OnClick = tvAcessosClick
            end
          end
        end
      end
    end
  end
  object dtsPerfil: TDataSource
    AutoEdit = False
    DataSet = FDDPerfil
    OnStateChange = dtsPerfilStateChange
    Left = 196
    Top = 3
  end
  object FDDPerfil: TFDQuery
    AfterEdit = FDDPerfilAfterEdit
    BeforePost = FDDPerfilBeforePost
    AfterPost = FDDPerfilAfterPost
    OnNewRecord = FDDPerfilNewRecord
    CachedUpdates = True
    Connection = DMConexao.FDConexao
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'INC_CO_PERFIL'
    UpdateOptions.UpdateTableName = 'UC_PERFIL'
    UpdateOptions.KeyFields = 'CO_PERFIL'
    UpdateOptions.AutoIncFields = 'CO_PERFIL'
    SQL.Strings = (
      'SELECT CO_PERFIL, '
      '       CO_USUARIO, '
      '       CO_EMPRESA, '
      '       NM_PERFIL, '
      '       DT_ALTERACAO'
      '  FROM UC_PERFIL'
      '  WHERE (CO_EMPRESA = :CO_EMPRESA or :CO_EMPRESA = 0);')
    Left = 226
    Top = 3
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDDPerfilCO_PERFIL: TIntegerField
      FieldName = 'CO_PERFIL'
      Origin = 'CO_PERFIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDDPerfilCO_USUARIO: TIntegerField
      FieldName = 'CO_USUARIO'
      Origin = 'CO_USUARIO'
    end
    object FDDPerfilCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      Required = True
    end
    object FDDPerfilNM_PERFIL: TStringField
      FieldName = 'NM_PERFIL'
      Origin = 'NM_PERFIL'
      Required = True
      Size = 60
    end
    object FDDPerfilDT_ALTERACAO: TSQLTimeStampField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DT_ALTERACAO'
    end
  end
end
