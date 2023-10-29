object FrmProfissional: TFrmProfissional
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cadastro de Profissional'
  ClientHeight = 538
  ClientWidth = 459
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
    Top = 492
    Width = 459
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      459
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
      Left = 402
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
      Left = 238
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
      ExplicitLeft = 285
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 459
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
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 459
    Height = 461
    Align = alClient
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 0
    object pcPrincipal: TPageControl
      Left = 0
      Top = 0
      Width = 459
      Height = 461
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
          Width = 451
          Height = 451
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel9: TPanel
            Left = 0
            Top = 0
            Width = 451
            Height = 451
            Align = alClient
            BevelOuter = bvNone
            Color = 4934475
            ParentBackground = False
            TabOrder = 0
            object Grid: TDBGrid
              Left = 0
              Top = 45
              Width = 451
              Height = 406
              Align = alClient
              BorderStyle = bsNone
              Color = clBtnFace
              DataSource = dtsProfissional
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
                  FieldName = 'CO_PROFISSIONAL'
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
                  FieldName = 'NM_PROFISSIONAL'
                  Title.Caption = 'Nome'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Width = 270
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NU_CPF'
                  Title.Caption = 'CPF'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NU_CELULAR'
                  Title.Caption = 'Celular'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NU_TELEFONE'
                  Title.Caption = 'Fixo'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'Tahoma'
                  Title.Font.Style = [fsBold]
                  Width = 90
                  Visible = True
                end>
            end
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 451
              Height = 45
              Align = alTop
              BevelOuter = bvNone
              Color = 4934475
              ParentBackground = False
              TabOrder = 1
              DesignSize = (
                451
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
                Left = 136
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
                Left = 224
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
                Left = 387
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
                Width = 117
                Height = 21
                Style = csDropDownList
                TabOrder = 0
              end
              object comboCondicao: TComboBox
                Left = 136
                Top = 16
                Width = 81
                Height = 21
                Style = csDropDownList
                TabOrder = 1
                Items.Strings = (
                  'Contendo'
                  'Iniciado por')
              end
              object edtValor: TEdit
                Left = 224
                Top = 16
                Width = 140
                Height = 21
                TabOrder = 2
              end
            end
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
          Width = 451
          Height = 451
          Align = alClient
          BevelOuter = bvNone
          Color = 8618883
          ParentBackground = False
          TabOrder = 0
          object Label4: TLabel
            Left = 11
            Top = 5
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
            Left = 80
            Top = 5
            Width = 20
            Height = 13
            Caption = 'CPF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 193
            Top = 5
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
          object Label8: TLabel
            Left = 144
            Top = 170
            Width = 49
            Height = 13
            Caption = 'Situa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 11
            Top = 46
            Width = 20
            Height = 13
            Caption = 'CEP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 115
            Top = 46
            Width = 65
            Height = 13
            Caption = 'Logradouro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 379
            Top = 46
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 11
            Top = 88
            Width = 34
            Height = 13
            Caption = 'Bairro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 285
            Top = 88
            Width = 82
            Height = 13
            Caption = 'Cidade/Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 11
            Top = 129
            Width = 39
            Height = 13
            Caption = 'Celular'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 103
            Top = 129
            Width = 23
            Height = 13
            Caption = 'Fixo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 193
            Top = 129
            Width = 35
            Height = 13
            Caption = 'E-mail'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 11
            Top = 170
            Width = 113
            Height = 13
            Caption = 'Data de Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 183
            Top = 88
            Width = 79
            Height = 13
            Caption = 'Complemento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 10
            Top = 213
            Width = 135
            Height = 13
            Caption = 'Hor'#225'rio de atendimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 255
            Top = 213
            Width = 132
            Height = 13
            Caption = 'Tempo de atendimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CO_PROFISSIONAL: TDBEdit
            Left = 11
            Top = 21
            Width = 64
            Height = 21
            TabStop = False
            Color = 15263976
            DataField = 'CO_PROFISSIONAL'
            DataSource = dtsProfissional
            ReadOnly = True
            TabOrder = 0
          end
          object NU_CPF: TDBEdit
            Left = 80
            Top = 21
            Width = 108
            Height = 21
            DataField = 'NU_CPF'
            DataSource = dtsProfissional
            TabOrder = 1
          end
          object NM_PROFISSIONAL: TDBEdit
            Left = 193
            Top = 21
            Width = 250
            Height = 21
            DataField = 'NM_PROFISSIONAL'
            DataSource = dtsProfissional
            TabOrder = 2
          end
          object NU_CEP: TDBEdit
            Left = 11
            Top = 62
            Width = 96
            Height = 21
            DataField = 'NU_CEP'
            DataSource = dtsProfissional
            TabOrder = 3
          end
          object TX_LOGRADOURO: TDBEdit
            Left = 115
            Top = 62
            Width = 256
            Height = 21
            DataField = 'TX_LOGRADOURO'
            DataSource = dtsProfissional
            TabOrder = 4
          end
          object NU_LOGRADOURO: TDBEdit
            Left = 379
            Top = 62
            Width = 64
            Height = 21
            DataField = 'NU_LOGRADOURO'
            DataSource = dtsProfissional
            TabOrder = 5
          end
          object TX_BAIRRO: TDBEdit
            Left = 11
            Top = 104
            Width = 169
            Height = 21
            DataField = 'TX_BAIRRO'
            DataSource = dtsProfissional
            TabOrder = 6
          end
          object comboCO_CIDADE: TDBLookupComboBox
            Left = 285
            Top = 104
            Width = 158
            Height = 21
            DataField = 'CO_CIDADE'
            DataSource = dtsProfissional
            KeyField = 'CO_CIDADE'
            ListField = 'NM_CIDADE'
            ListSource = dtsCidade
            TabOrder = 8
          end
          object NU_CELULAR: TDBEdit
            Left = 11
            Top = 143
            Width = 87
            Height = 21
            DataField = 'NU_CELULAR'
            DataSource = dtsProfissional
            TabOrder = 9
          end
          object NU_TELEFONE: TDBEdit
            Left = 103
            Top = 143
            Width = 84
            Height = 21
            DataField = 'NU_TELEFONE'
            DataSource = dtsProfissional
            TabOrder = 10
          end
          object TX_EMAIL: TDBEdit
            Left = 193
            Top = 143
            Width = 250
            Height = 21
            DataField = 'TX_EMAIL'
            DataSource = dtsProfissional
            TabOrder = 11
          end
          object DT_NASCIMENTO: TDBEdit
            Left = 11
            Top = 186
            Width = 113
            Height = 21
            DataField = 'DT_NASCIMENTO'
            DataSource = dtsProfissional
            TabOrder = 12
          end
          object TX_COMPLEMENTO: TDBEdit
            Left = 183
            Top = 104
            Width = 94
            Height = 21
            DataField = 'TX_COMPLEMENTO'
            DataSource = dtsProfissional
            TabOrder = 7
          end
          object Panel5: TPanel
            Left = 0
            Top = 261
            Width = 451
            Height = 190
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 16
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 451
              Height = 35
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Habilidades'
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
            object Panel7: TPanel
              Left = 416
              Top = 35
              Width = 35
              Height = 155
              Align = alRight
              BevelOuter = bvNone
              Color = 4934475
              ParentBackground = False
              TabOrder = 1
              object btnNovaHabilidade: TPraButtonStyle
                Left = 0
                Top = 0
                Width = 53
                Height = 32
                Hint = 'Incluir um novo registro'
                Align = alClient
                Constraints.MaxWidth = 53
                ParentShowHint = False
                ShowHint = True
                OnClick = btnNovaHabilidadeClick
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
                TabOrder = 0
                TabStop = True
                PictureCenter = True
                Style = bsDark
                ExplicitHeight = 160
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 35
              Width = 416
              Height = 155
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object DBGrid1: TDBGrid
                Left = 0
                Top = 0
                Width = 416
                Height = 155
                Align = alClient
                BorderStyle = bsNone
                DataSource = dtsProfissionalServico
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDblClick = DBGrid1DblClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NM_SERVICO'
                    Title.Caption = 'Servi'#231'o'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWindowText
                    Title.Font.Height = -11
                    Title.Font.Name = 'Tahoma'
                    Title.Font.Style = [fsBold]
                    Width = 398
                    Visible = True
                  end>
              end
            end
          end
          object comboIN_SITUACAO: TDBLookupComboBox
            Left = 144
            Top = 186
            Width = 147
            Height = 21
            DataField = 'IN_SITUACAO'
            DataSource = dtsProfissional
            KeyField = 'CO_SITUACAO'
            ListField = 'NM_SITUACAO'
            ListSource = dtsSitucao
            TabOrder = 13
          end
          object CO_HORARIO: TDBLookupComboBox
            Left = 10
            Top = 229
            Width = 231
            Height = 21
            DataField = 'CO_HORARIO'
            DataSource = dtsProfissional
            KeyField = 'CO_HORARIO'
            ListField = 'TX_DESCRICAO'
            ListSource = dtsHorario
            TabOrder = 14
          end
          object TI_INTERVALO: TDBEdit
            Left = 255
            Top = 229
            Width = 64
            Height = 21
            DataField = 'TI_INTERVALO'
            DataSource = dtsProfissional
            TabOrder = 15
          end
        end
      end
    end
  end
  object dtsProfissional: TDataSource
    AutoEdit = False
    DataSet = FDDProfissional
    OnStateChange = dtsProfissionalStateChange
    Left = 228
    Top = 3
  end
  object FDDProfissional: TFDQuery
    AfterEdit = FDDProfissionalAfterEdit
    BeforePost = FDDProfissionalBeforePost
    AfterScroll = FDDProfissionalAfterScroll
    OnNewRecord = FDDProfissionalNewRecord
    CachedUpdates = True
    Connection = DMConexao.FDConexao
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.GeneratorName = 'INC_CO_PROFISSIONAL'
    UpdateOptions.KeyFields = 'CO_PROFISSIONAL'
    UpdateOptions.AutoIncFields = 'CO_PROFISSIONAL'
    SQL.Strings = (
      'SELECT CO_PROFISSIONAL, '
      '       CO_CIDADE, '
      '       CO_EMPRESA, '
      '       CO_HORARIO,'
      '       NM_PROFISSIONAL, '
      '       DT_NASCIMENTO, '
      '       TX_LOGRADOURO, '
      '       TX_BAIRRO, '
      '       TX_COMPLEMENTO, '
      '       NU_CEP, '
      '       NU_LOGRADOURO, '
      '       NU_TELEFONE, '
      '       NU_CELULAR, '
      '       TX_EMAIL, '
      '       NU_CPF, '
      '       IN_SITUACAO,'
      '       TI_INTERVALO, '
      '       CO_USUARIO, '
      '       DT_ALTERACAO'
      '  FROM PROFISSIONAL'
      '  WHERE CO_EMPRESA = :CO_EMPRESA AND'
      '        IN_SITUACAO = '#39'A'#39';')
    Left = 188
    Top = 2
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDDProfissionalCO_PROFISSIONAL: TFDAutoIncField
      FieldName = 'CO_PROFISSIONAL'
      Origin = 'CO_PROFISSIONAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object FDDProfissionalCO_CIDADE: TIntegerField
      FieldName = 'CO_CIDADE'
      Origin = 'CO_CIDADE'
      Required = True
    end
    object FDDProfissionalCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      Required = True
    end
    object FDDProfissionalCO_HORARIO: TIntegerField
      FieldName = 'CO_HORARIO'
      Origin = 'CO_HORARIO'
      Required = True
    end
    object FDDProfissionalNM_PROFISSIONAL: TStringField
      FieldName = 'NM_PROFISSIONAL'
      Origin = 'NM_PROFISSIONAL'
      Required = True
      Size = 60
    end
    object FDDProfissionalDT_NASCIMENTO: TDateField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DT_NASCIMENTO'
      EditMask = '99/99/9999;1;_'
    end
    object FDDProfissionalTX_LOGRADOURO: TStringField
      FieldName = 'TX_LOGRADOURO'
      Origin = 'TX_LOGRADOURO'
      Size = 60
    end
    object FDDProfissionalTX_BAIRRO: TStringField
      FieldName = 'TX_BAIRRO'
      Origin = 'TX_BAIRRO'
      Size = 30
    end
    object FDDProfissionalTX_COMPLEMENTO: TStringField
      FieldName = 'TX_COMPLEMENTO'
      Origin = 'TX_COMPLEMENTO'
      Size = 30
    end
    object FDDProfissionalNU_CEP: TStringField
      FieldName = 'NU_CEP'
      Origin = 'NU_CEP'
      OnValidate = FDDProfissionalNU_CEPValidate
      EditMask = '99.999-999;0; '
      Size = 8
    end
    object FDDProfissionalNU_LOGRADOURO: TIntegerField
      FieldName = 'NU_LOGRADOURO'
      Origin = 'NU_LOGRADOURO'
    end
    object FDDProfissionalNU_TELEFONE: TStringField
      FieldName = 'NU_TELEFONE'
      Origin = 'NU_TELEFONE'
      EditMask = '(99) 99999-9999;0; '
      Size = 11
    end
    object FDDProfissionalNU_CELULAR: TStringField
      FieldName = 'NU_CELULAR'
      Origin = 'NU_CELULAR'
      EditMask = '(99) 99999-9999;0; '
      Size = 11
    end
    object FDDProfissionalTX_EMAIL: TStringField
      FieldName = 'TX_EMAIL'
      Origin = 'TX_EMAIL'
      OnValidate = FDDProfissionalTX_EMAILValidate
      Size = 60
    end
    object FDDProfissionalNU_CPF: TStringField
      FieldName = 'NU_CPF'
      Origin = 'NU_CPF'
      Required = True
      OnValidate = FDDProfissionalNU_CPFValidate
      EditMask = '999.999.999-99;0; '
      Size = 14
    end
    object FDDProfissionalIN_SITUACAO: TStringField
      FieldName = 'IN_SITUACAO'
      Origin = 'IN_SITUACAO'
      Required = True
      Size = 1
    end
    object FDDProfissionalTI_INTERVALO: TTimeField
      FieldName = 'TI_INTERVALO'
      Origin = 'TI_INTERVALO'
      Required = True
      DisplayFormat = 'HH:mm'
      EditMask = '99:99;1;_'
    end
    object FDDProfissionalCO_USUARIO: TIntegerField
      FieldName = 'CO_USUARIO'
      Origin = 'CO_USUARIO'
    end
    object FDDProfissionalDT_ALTERACAO: TSQLTimeStampField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DT_ALTERACAO'
    end
  end
  object FDQProfissionalServico: TFDQuery
    Connection = DMConexao.FDConexao
    UpdateOptions.AssignedValues = [uvGeneratorName]
    SQL.Strings = (
      'SELECT PS.CO_EMPRESA,'
      '       PS.CO_SERVICO, '
      '       PS.CO_PROFISSIONAL,'
      '       S.NM_SERVICO'
      '  FROM PROFISSIONAL_SERVICO PS'
      
        '    JOIN SERVICO S ON (S.CO_SERVICO = PS.CO_SERVICO AND S.CO_EMP' +
        'RESA = PS.CO_EMPRESA)'
      '  WHERE PS.CO_EMPRESA      = :CO_EMPRESA AND'
      '        PS.CO_PROFISSIONAL = :CO_PROFISSIONAL'
      '  ORDER BY S.NM_SERVICO;')
    Left = 12
    Top = 5
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
    object FDQProfissionalServicoCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      Required = True
    end
    object FDQProfissionalServicoCO_SERVICO: TIntegerField
      FieldName = 'CO_SERVICO'
      Origin = 'CO_SERVICO'
      Required = True
    end
    object FDQProfissionalServicoCO_PROFISSIONAL: TIntegerField
      FieldName = 'CO_PROFISSIONAL'
      Origin = 'CO_PROFISSIONAL'
      Required = True
    end
    object FDQProfissionalServicoNM_SERVICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_SERVICO'
      Origin = 'NM_SERVICO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
  end
  object dtsProfissionalServico: TDataSource
    DataSet = FDQProfissionalServico
    Left = 52
    Top = 5
  end
  object FDQCidade: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      
        'SELECT C.CO_CIDADE, (C.NM_CIDADE || '#39' - '#39' || E.TX_SIGLA) AS NM_C' +
        'IDADE'
      '  FROM CIDADE C'
      '    JOIN ESTADO E ON (E.CO_ESTADO = C.CO_ESTADO)'
      '  ORDER BY C.NM_CIDADE, E.TX_SIGLA')
    Left = 124
    Top = 3
  end
  object dtsCidade: TDataSource
    DataSet = FDQCidade
    Left = 156
    Top = 3
  end
  object dtsSitucao: TDataSource
    DataSet = FDMSituacao
    Left = 268
    Top = 5
  end
  object FDMSituacao: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 300
    Top = 5
    Content = {
      414442530F009C36AD010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C006500310005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B04001600000043004F
      005F0053004900540055004100430041004F0005001600000043004F005F0053
      004900540055004100430041004F000C00010000000E000D000F000100000010
      000111000112000113000114000115000116001600000043004F005F00530049
      00540055004100430041004F00170001000000FEFF0B0400160000004E004D00
      5F0053004900540055004100430041004F000500160000004E004D005F005300
      4900540055004100430041004F000C00020000000E000D000F003C0000001000
      011100011200011300011400011500011600160000004E004D005F0053004900
      540055004100430041004F0017003C000000FEFEFF18FEFF19FEFF1AFF1B1C00
      00000000FF1D000001000000410100050000004174697661FEFEFF1B1C000100
      0000FF1D00000100000049010007000000496E6174697661FEFEFEFEFEFF1EFE
      FF1F200004000000FF21FEFEFE0E004D0061006E0061006700650072001E0055
      0070006400610074006500730052006500670069007300740072007900120054
      00610062006C0065004C006900730074000A005400610062006C00650008004E
      0061006D006500140053006F0075007200630065004E0061006D0065000A0054
      006100620049004400240045006E0066006F0072006300650043006F006E0073
      0074007200610069006E00740073001E004D0069006E0069006D0075006D0043
      006100700061006300690074007900180043006800650063006B004E006F0074
      004E0075006C006C00140043006F006C0075006D006E004C006900730074000C
      0043006F006C0075006D006E00100053006F0075007200630065004900440018
      006400740041006E007300690053007400720069006E00670010004400610074
      00610054007900700065000800530069007A0065001400530065006100720063
      006800610062006C006500120041006C006C006F0077004E0075006C006C0008
      00420061007300650014004F0041006C006C006F0077004E0075006C006C0012
      004F0049006E0055007000640061007400650010004F0049006E005700680065
      00720065001A004F0072006900670069006E0043006F006C004E0061006D0065
      00140053006F007500720063006500530069007A0065001C0043006F006E0073
      0074007200610069006E0074004C00690073007400100056006900650077004C
      006900730074000E0052006F0077004C00690073007400060052006F0077000A
      0052006F0077004900440010004F0072006900670069006E0061006C00180052
      0065006C006100740069006F006E004C006900730074001C0055007000640061
      007400650073004A006F00750072006E0061006C001200530061007600650050
      006F0069006E0074000E004300680061006E00670065007300}
    object FDMSituacaoCO_SITUACAO: TStringField
      FieldName = 'CO_SITUACAO'
      Size = 1
    end
    object FDMSituacaoNM_SITUACAO: TStringField
      FieldName = 'NM_SITUACAO'
      Size = 60
    end
  end
  object FDQHorario: TFDQuery
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT CO_HORARIO,'
      '       TX_DESCRICAO'
      '  FROM HORARIO'
      '  WHERE CO_EMPRESA = :CO_EMPRESA')
    Left = 360
    Top = 3
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dtsHorario: TDataSource
    DataSet = FDQHorario
    Left = 400
    Top = 3
  end
end
