object FrmFeriado: TFrmFeriado
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Feriados'
  ClientHeight = 431
  ClientWidth = 394
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
    Width = 394
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Feriados'
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
    Top = 385
    Width = 394
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    Color = 4934475
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      394
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
      TabOrder = 0
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
      TabOrder = 1
      TabStop = True
      PictureCenter = True
      Style = bsSecondary
    end
    object btnExcluir: TPraButtonStyle
      Left = 227
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
      TabOrder = 2
      TabStop = True
      PictureCenter = True
      Style = bsDanger
    end
    object btnGravar: TPraButtonStyle
      Left = 115
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
      TabOrder = 3
      TabStop = True
      PictureCenter = True
      Style = bsSuccess
    end
    object btnCancelar: TPraButtonStyle
      Left = 171
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
      TabOrder = 4
      TabStop = True
      PictureCenter = True
      Style = bsWarning
    end
    object btnFechar: TPraButtonStyle
      Left = 337
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
      TabOrder = 5
      TabStop = True
      PictureCenter = True
      Style = bsInfo
      ExplicitLeft = 484
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 394
    Height = 106
    Align = alTop
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 2
    object Label5: TLabel
      Left = 8
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 88
      Top = 6
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
    object Label2: TLabel
      Left = 8
      Top = 54
      Width = 24
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DT_FERIADO: TDBEdit
      Left = 8
      Top = 23
      Width = 75
      Height = 21
      DataField = 'DT_FERIADO'
      DataSource = dtsFeriado
      TabOrder = 0
    end
    object TX_DESCRICAO: TDBEdit
      Left = 88
      Top = 23
      Width = 297
      Height = 21
      DataField = 'TX_DESCRICAO'
      DataSource = dtsFeriado
      TabOrder = 1
    end
    object comboIN_TIPO: TDBLookupComboBox
      Left = 8
      Top = 70
      Width = 104
      Height = 21
      DataField = 'IN_TIPO'
      DataSource = dtsFeriado
      KeyField = 'CO_TIPO'
      ListField = 'TX_TIPO'
      ListSource = dtsTipo
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 137
    Width = 394
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    Color = 8618883
    ParentBackground = False
    TabOrder = 3
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 394
      Height = 248
      Align = alClient
      DataSource = dtsFeriado
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
          FieldName = 'DT_FERIADO'
          Title.Caption = 'Data'
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
          FieldName = 'TX_DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end>
    end
  end
  object FDMTipo: TFDMemTable
    Active = True
    CachedUpdates = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 192
    Top = 95
    Content = {
      414442530F00052DA3010000FF00010001FF02FF03040016000000460044004D
      0065006D005400610062006C006500310005000A0000005400610062006C0065
      00060000000000070000080032000000090000FF0AFF0B04000E00000043004F
      005F005400490050004F0005000E00000043004F005F005400490050004F000C
      00010000000E000D000F00010000001000011100011200011300011400011500
      0116000E00000043004F005F005400490050004F00170001000000FEFF0B0400
      0E000000540058005F005400490050004F0005000E000000540058005F005400
      490050004F000C00020000000E000D000F003C00000010000111000112000113
      000114000115000116000E000000540058005F005400490050004F0017003C00
      0000FEFEFF18FEFF19FEFF1AFF1B1C0000000000FF1D00000100000045010008
      000000457374616475616CFEFEFF1B1C0001000000FF1D0000010000004D0100
      090000004D756E69636970616CFEFEFF1B1C0002000000FF1D0000010000004E
      0100080000004E6163696F6E616CFEFEFEFEFEFF1EFEFF1F200003000000FF21
      FEFEFE0E004D0061006E0061006700650072001E005500700064006100740065
      0073005200650067006900730074007200790012005400610062006C0065004C
      006900730074000A005400610062006C00650008004E0061006D006500140053
      006F0075007200630065004E0061006D0065000A005400610062004900440024
      0045006E0066006F0072006300650043006F006E00730074007200610069006E
      00740073001E004D0069006E0069006D0075006D004300610070006100630069
      0074007900180043006800650063006B004E006F0074004E0075006C006C0014
      0043006F006C0075006D006E004C006900730074000C0043006F006C0075006D
      006E00100053006F0075007200630065004900440018006400740041006E0073
      00690053007400720069006E0067001000440061007400610054007900700065
      000800530069007A0065001400530065006100720063006800610062006C0065
      00120041006C006C006F0077004E0075006C006C000800420061007300650014
      004F0041006C006C006F0077004E0075006C006C0012004F0049006E00550070
      00640061007400650010004F0049006E00570068006500720065001A004F0072
      006900670069006E0043006F006C004E0061006D006500140053006F00750072
      0063006500530069007A0065001C0043006F006E00730074007200610069006E
      0074004C00690073007400100056006900650077004C006900730074000E0052
      006F0077004C00690073007400060052006F0077000A0052006F007700490044
      0010004F0072006900670069006E0061006C001800520065006C006100740069
      006F006E004C006900730074001C0055007000640061007400650073004A006F
      00750072006E0061006C001200530061007600650050006F0069006E0074000E
      004300680061006E00670065007300}
    object FDMTipoCO_TIPO: TStringField
      FieldName = 'CO_TIPO'
      Size = 1
    end
    object FDMTipoTX_TIPO: TStringField
      FieldName = 'TX_TIPO'
      Size = 60
    end
  end
  object dtsTipo: TDataSource
    AutoEdit = False
    DataSet = FDMTipo
    Left = 160
    Top = 96
  end
  object FDDFeriado: TFDQuery
    AfterEdit = FDDFeriadoAfterEdit
    BeforePost = FDDFeriadoBeforePost
    OnNewRecord = FDDFeriadoNewRecord
    CachedUpdates = True
    Connection = DMConexao.FDConexao
    SQL.Strings = (
      'SELECT DT_FERIADO, '
      '       CO_EMPRESA, '
      '       TX_DESCRICAO, '
      '       IN_TIPO, '
      '       IN_SISTEMA, '
      '       DT_ALTERACAO, '
      '       CO_USUARIO'
      '  FROM FERIADO'
      '  WHERE CO_EMPRESA = :CO_EMPRESA'
      '  ORDER BY DT_FERIADO;')
    Left = 240
    Top = 95
    ParamData = <
      item
        Name = 'CO_EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDDFeriadoDT_FERIADO: TDateField
      FieldName = 'DT_FERIADO'
      Origin = 'DT_FERIADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      EditMask = '99/99/9999;1;_'
    end
    object FDDFeriadoCO_EMPRESA: TIntegerField
      FieldName = 'CO_EMPRESA'
      Origin = 'CO_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDDFeriadoTX_DESCRICAO: TStringField
      FieldName = 'TX_DESCRICAO'
      Origin = 'TX_DESCRICAO'
      Required = True
      Size = 60
    end
    object FDDFeriadoIN_TIPO: TStringField
      FieldName = 'IN_TIPO'
      Origin = 'IN_TIPO'
      Size = 1
    end
    object FDDFeriadoIN_SISTEMA: TStringField
      FieldName = 'IN_SISTEMA'
      Origin = 'IN_SISTEMA'
      Required = True
      Size = 1
    end
    object FDDFeriadoDT_ALTERACAO: TSQLTimeStampField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DT_ALTERACAO'
    end
    object FDDFeriadoCO_USUARIO: TIntegerField
      FieldName = 'CO_USUARIO'
      Origin = 'CO_USUARIO'
    end
  end
  object dtsFeriado: TDataSource
    AutoEdit = False
    DataSet = FDDFeriado
    OnStateChange = dtsFeriadoStateChange
    Left = 280
    Top = 95
  end
end
