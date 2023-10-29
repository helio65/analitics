object FrmHorario: TFrmHorario
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Hor'#225'rio'
  ClientHeight = 418
  ClientWidth = 400
  Color = 4934475
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
  object pnlBotoes: TPanel
    Left = 0
    Top = 372
    Width = 400
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      400
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
      Left = 56
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Editar o registro corrente'
      Anchors = [akLeft]
      Enabled = False
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
      Left = 110
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Excluir o registro corrente'
      Anchors = [akLeft]
      Enabled = False
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
      Left = 163
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Gravar as altera'#231#245'es do registro corrente'
      Anchors = [akLeft]
      Enabled = False
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
      Left = 216
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Cancelar a opera'#231#227'o corrente'
      Anchors = [akLeft]
      Enabled = False
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
      Left = 343
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
      Left = 283
      Top = 9
      Width = 53
      Height = 32
      Hint = 'Voltar para tela anterior'
      Anchors = []
      Enabled = False
      Constraints.MaxWidth = 53
      ParentShowHint = False
      ShowHint = True
      Visible = False
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
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 400
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
    Width = 400
    Height = 341
    Align = alClient
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 2
    object pcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 400
      Height = 341
      ActivePage = tabConsulta
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
          Width = 392
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = 4934475
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            392
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
            Left = 112
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
            Left = 200
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
            Left = 333
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
            Width = 89
            Height = 21
            Style = csDropDownList
            TabOrder = 0
          end
          object comboCondicao: TComboBox
            Left = 112
            Top = 16
            Width = 73
            Height = 21
            Style = csDropDownList
            TabOrder = 1
            Items.Strings = (
              'Contendo'
              'Iniciado por')
          end
          object edtValor: TEdit
            Left = 200
            Top = 16
            Width = 104
            Height = 21
            TabOrder = 2
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 45
          Width = 392
          Height = 286
          Align = alClient
          BevelOuter = bvNone
          Color = 4934475
          ParentBackground = False
          TabOrder = 1
          object Grid: TDBGrid
            Left = 0
            Top = 0
            Width = 392
            Height = 286
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            DataSource = dtsHorario
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
                FieldName = 'CO_HORARIO'
                Title.Caption = 'C'#243'digo'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TX_DESCRICAO'
                Title.Caption = 'Descri'#231#227'o'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Tahoma'
                Title.Font.Style = [fsBold]
                Width = 327
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
          Width = 392
          Height = 331
          Align = alClient
          BevelOuter = bvNone
          Color = 8618883
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            392
            331)
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
            Width = 55
            Height = 13
            Caption = 'Descri'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnHorarios: TPraButtonStyle
            Left = 115
            Top = 97
            Width = 90
            Height = 32
            Anchors = [akRight]
            Constraints.MaxHeight = 48
            Constraints.MaxWidth = 138
            ParentShowHint = False
            ShowHint = True
            OnClick = btnHorariosClick
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
            Caption = 'Hor'#225'rios diario'
            TabOrder = 2
            TabStop = True
            PictureCenter = True
            Style = bsDark
          end
          object CO_HORARIO: TDBEdit
            Left = 29
            Top = 32
            Width = 60
            Height = 21
            TabStop = False
            Color = 15263976
            DataField = 'CO_HORARIO'
            DataSource = dtsHorario
            ReadOnly = True
            TabOrder = 0
          end
          object TX_DESCRICAO: TDBEdit
            Left = 93
            Top = 32
            Width = 273
            Height = 21
            DataField = 'TX_DESCRICAO'
            DataSource = dtsHorario
            TabOrder = 1
          end
        end
      end
      object tabHorarios: TTabSheet
        Caption = 'tabHorarios'
        ImageIndex = 2
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 392
          Height = 331
          Align = alClient
          BevelOuter = bvNone
          Color = 8618883
          ParentBackground = False
          TabOrder = 0
          object Label7: TLabel
            Left = 154
            Top = 11
            Width = 54
            Height = 13
            Caption = 'Entrada 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 214
            Top = 11
            Width = 31
            Height = 13
            Caption = 'Sa'#237'da'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 274
            Top = 11
            Width = 54
            Height = 13
            Caption = 'Entrada 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 334
            Top = 11
            Width = 41
            Height = 13
            Caption = 'Sa'#237'da 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 4
            Top = 11
            Width = 83
            Height = 13
            Caption = 'Dia da semana'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object TI_ENTRADA01: TDBEdit
            Left = 154
            Top = 28
            Width = 54
            Height = 21
            DataField = 'TI_ENTRADA01'
            DataSource = dtsHorarioDiario
            TabOrder = 1
          end
          object TI_SAIDA01: TDBEdit
            Left = 214
            Top = 28
            Width = 54
            Height = 21
            DataField = 'TI_SAIDA01'
            DataSource = dtsHorarioDiario
            TabOrder = 2
          end
          object TI_ENDRADA02: TDBEdit
            Left = 274
            Top = 28
            Width = 54
            Height = 21
            DataField = 'TI_ENDRADA02'
            DataSource = dtsHorarioDiario
            TabOrder = 3
          end
          object TI_SAIDA02: TDBEdit
            Left = 334
            Top = 28
            Width = 54
            Height = 21
            DataField = 'TI_SAIDA02'
            DataSource = dtsHorarioDiario
            TabOrder = 4
          end
          object Panel6: TPanel
            Left = 0
            Top = 65
            Width = 392
            Height = 266
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 5
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 392
              Height = 266
              Align = alClient
              BorderStyle = bsNone
              DataSource = dtsHorarioDiario
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CO_DIA_SEMANA'
                  Title.Caption = 'Dia da semana'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Width = 115
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'TI_ENTRADA01'
                  Title.Caption = 'Entrada 1'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'TI_SAIDA01'
                  Title.Caption = 'Sa'#237'da 1'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'TI_ENDRADA02'
                  Title.Caption = 'Entrada 2'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'TI_SAIDA02'
                  Title.Caption = 'Sa'#237'da 2'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end>
            end
          end
          object CO_DIA_SEMANA: TDBLookupComboBox
            Left = 4
            Top = 28
            Width = 139
            Height = 21
            DataField = 'CO_DIA_SEMANA'
            DataSource = dtsHorarioDiario
            KeyField = 'CO_DIA'
            ListField = 'NM_DIA'
            ListSource = dtsDiasDaSemana
            TabOrder = 0
          end
        end
      end
    end
  end
  object dtsHorario: TDataSource
    AutoEdit = False
    DataSet = FDDHorario
    OnStateChange = dtsHorarioStateChange
    Left = 61
    Top = 3
  end
  object FDDHorario: TFDQuery
    AfterEdit = FDDHorarioAfterEdit
    BeforePost = FDDHorarioBeforePost
    AfterScroll = FDDHorarioAfterScroll
    OnNewRecord = FDDHorarioNewRecord
    CachedUpdates = True
    Connection = DMConexao.FDConexao
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'IN_CO_HORARIO'
    UpdateOptions.UpdateTableName = 'HORARIO'
    UpdateOptions.KeyFields = 'CO_HORARIO'
    UpdateOptions.AutoIncFields = 'CO_HORARIO'
    SQL.Strings = (
      'SELECT CO_HORARIO, '
      '       CO_EMPRESA, '
      '       TX_DESCRICAO, '
      '       DT_ALTERACAO, '
      '       CO_USUARIO'
      '  FROM HORARIO'
      '  WHERE CO_HORARIO = :CO_HORARIO AND'
      '        CO_EMPRESA = :CO_EMPRESA;')
    Left = 93
    Top = 3
    ParamData = <
      item
        Name = 'CO_HORARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDDHorarioCO_HORARIO: TIntegerField
      FieldName = 'CO_HORARIO'
      Origin = 'CO_HORARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDDHorarioCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      Required = True
    end
    object FDDHorarioTX_DESCRICAO: TStringField
      FieldName = 'TX_DESCRICAO'
      Origin = 'TX_DESCRICAO'
      Required = True
      Size = 60
    end
    object FDDHorarioDT_ALTERACAO: TSQLTimeStampField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DT_ALTERACAO'
    end
    object FDDHorarioCO_USUARIO: TIntegerField
      FieldName = 'CO_USUARIO'
      Origin = 'CO_USUARIO'
    end
  end
  object FDDHorarioDiario: TFDQuery
    OnNewRecord = FDDHorarioDiarioNewRecord
    CachedUpdates = True
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT CO_HORARIO, '
      '       CO_DIA_SEMANA, '
      '       TI_ENTRADA01, '
      '       TI_SAIDA01, '
      '       TI_ENDRADA02, '
      '       TI_SAIDA02'
      '  FROM HORARIO_DIARIO'
      '  WHERE CO_HORARIO = :CO_HORARIO;')
    Left = 144
    Top = 4
    ParamData = <
      item
        Name = 'CO_HORARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDDHorarioDiarioCO_HORARIO: TIntegerField
      FieldName = 'CO_HORARIO'
      Origin = 'CO_HORARIO'
      Required = True
    end
    object FDDHorarioDiarioCO_DIA_SEMANA: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'CO_DIA_SEMANA'
      Origin = 'CO_DIA_SEMANA'
      Required = True
      OnGetText = FDDHorarioDiarioCO_DIA_SEMANAGetText
    end
    object FDDHorarioDiarioTI_ENTRADA01: TTimeField
      FieldName = 'TI_ENTRADA01'
      Origin = 'TI_ENTRADA01'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1;_'
    end
    object FDDHorarioDiarioTI_SAIDA01: TTimeField
      FieldName = 'TI_SAIDA01'
      Origin = 'TI_SAIDA01'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1;_'
    end
    object FDDHorarioDiarioTI_ENDRADA02: TTimeField
      FieldName = 'TI_ENDRADA02'
      Origin = 'TI_ENDRADA02'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1;_'
    end
    object FDDHorarioDiarioTI_SAIDA02: TTimeField
      FieldName = 'TI_SAIDA02'
      Origin = 'TI_SAIDA02'
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1;_'
    end
  end
  object dtsHorarioDiario: TDataSource
    AutoEdit = False
    DataSet = FDDHorarioDiario
    OnStateChange = dtsHorarioDiarioStateChange
    Left = 176
    Top = 5
  end
  object FDMDiasDaSemana: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 240
    Top = 2
    Content = {
      414442530F000D2F23020000FF00010001FF02FF0304001E000000460044004D
      00440069006100730044006100530065006D0061006E00610005000A00000054
      00610062006C006500060000000000070000080032000000090000FF0AFF0B04
      000C00000043004F005F0044004900410005000C00000043004F005F00440049
      0041000C00010000000E000D000F000110000111000112000113000114000115
      000C00000043004F005F00440049004100FEFF0B04000C0000004E004D005F00
      44004900410005000C0000004E004D005F004400490041000C00020000000E00
      160017003C0000000F000110000111000112000113000114000115000C000000
      4E004D005F0044004900410018003C000000FEFEFF19FEFF1AFEFF1BFF1C1D00
      00000000FF1E000001000000010007000000446F6D696E676FFEFEFF1C1D0001
      000000FF1E00000200000001000D000000536567756E64612D6665697261FEFE
      FF1C1D0002000000FF1E00000300000001000B000000546572E7612D66656972
      61FEFEFF1C1D0003000000FF1E00000400000001000C0000005175617274612D
      6665697261FEFEFF1C1D0004000000FF1E00000500000001000C000000517569
      6E74612D6665697261FEFEFF1C1D0005000000FF1E00000600000001000B0000
      0053657874612D6665697261FEFEFF1C1D000600000020001F00FF1E00000700
      000001000600000053E16261646FFEFEFEFEFEFF21FEFF22230008000000FF24
      FEFEFE0E004D0061006E0061006700650072001E005500700064006100740065
      0073005200650067006900730074007200790012005400610062006C0065004C
      006900730074000A005400610062006C00650008004E0061006D006500140053
      006F0075007200630065004E0061006D0065000A005400610062004900440024
      0045006E0066006F0072006300650043006F006E00730074007200610069006E
      00740073001E004D0069006E0069006D0075006D004300610070006100630069
      0074007900180043006800650063006B004E006F0074004E0075006C006C0014
      0043006F006C0075006D006E004C006900730074000C0043006F006C0075006D
      006E00100053006F007500720063006500490044000E006400740049006E0074
      0033003200100044006100740061005400790070006500140053006500610072
      0063006800610062006C006500120041006C006C006F0077004E0075006C006C
      000800420061007300650014004F0041006C006C006F0077004E0075006C006C
      0012004F0049006E0055007000640061007400650010004F0049006E00570068
      006500720065001A004F0072006900670069006E0043006F006C004E0061006D
      00650018006400740041006E007300690053007400720069006E006700080053
      0069007A006500140053006F007500720063006500530069007A0065001C0043
      006F006E00730074007200610069006E0074004C006900730074001000560069
      00650077004C006900730074000E0052006F0077004C00690073007400060052
      006F0077000A0052006F0077004900440010004F0072006900670069006E0061
      006C0016007200730055006E006300680061006E006700650064001A0052006F
      0077005000720069006F007200530074006100740065001800520065006C0061
      00740069006F006E004C006900730074001C0055007000640061007400650073
      004A006F00750072006E0061006C001200530061007600650050006F0069006E
      0074000E004300680061006E00670065007300}
    object FDMDiasDaSemanaCO_DIA: TIntegerField
      FieldName = 'CO_DIA'
    end
    object FDMDiasDaSemanaNM_DIA: TStringField
      FieldName = 'NM_DIA'
      Size = 60
    end
  end
  object dtsDiasDaSemana: TDataSource
    DataSet = FDMDiasDaSemana
    Left = 273
    Top = 3
  end
end
