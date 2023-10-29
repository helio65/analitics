object DMRelatorios: TDMRelatorios
  OldCreateOrder = False
  Height = 395
  Width = 548
  object Rep: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45074.509223171300000000
    ReportOptions.LastChange = 45076.835413518520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Page1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  Profissionais.Close;'
      '  Profissionais.ParamByName('#39'CO_EMPRESA'#39').Value := <Empresa>;'
      '  Profissionais.Open;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnGetValue = RepGetValue
    Left = 40
    Top = 32
    Datasets = <
      item
        DataSet = Rep.Profissionais
        DataSetName = 'Profissionais'
      end>
    Variables = <
      item
        Name = ' New Category1'
        Value = Null
      end
      item
        Name = 'Empresa'
        Value = '1'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
      object Profissionais: TfrxFDQuery
        UserName = 'Profissionais'
        CloseDataSource = True
        BCDToCurrency = False
        IgnoreDupParams = False
        Params = <
          item
            Name = 'CO_EMPRESA'
            DataType = ftUnknown
          end>
        SQL.Strings = (
          
            'SELECT P.CO_PROFISSIONAL, P.NM_PROFISSIONAL, P.DT_NASCIMENTO, P.' +
            'NU_CELULAR'
          '  FROM PROFISSIONAL P'
          '  WHERE P.IN_SITUACAO = '#39'A'#39' AND'
          
            '        P.CO_EMPRESA = :CO_EMPRESA                              ' +
            '                                                                ' +
            '                                                                ' +
            '     '
          '  ORDER BY P.NM_PROFISSIONAL;  ')
        pLeft = 248
        pTop = 96
        Parameters = <
          item
            Name = 'CO_EMPRESA'
            DataType = ftUnknown
          end>
      end
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.496060550000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = Rep.Profissionais
        DataSetName = 'Profissionais'
        RowCount = 0
        object ProfissionaisCO_PROFISSIONAL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.708720000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          DataSet = Rep.Profissionais
          DataSetName = 'Profissionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[FormatFloat('#39'0000'#39', <Profissionais."CO_PROFISSIONAL">)]')
          ParentFont = False
          WordWrap = False
        end
        object ProfissionaisNM_PROFISSIONAL: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 147.181200000000000000
          Width = 317.480520000000000000
          Height = 15.118120000000000000
          DataSet = Rep.Profissionais
          DataSetName = 'Profissionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Profissionais."NM_PROFISSIONAL"]')
          ParentFont = False
          WordWrap = False
        end
        object ProfissionaisDT_NASCIMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 464.882190000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataField = 'DT_NASCIMENTO'
          DataSet = Rep.Profissionais
          DataSetName = 'Profissionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Profissionais."DT_NASCIMENTO"]')
          ParentFont = False
          WordWrap = False
        end
        object ProfissionaisNU_CELULAR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 544.252320000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = Rep.Profissionais
          DataSetName = 'Profissionais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              '[FormatMaskText('#39'(99) 99999-99999;0; '#39', <Profissionais."NU_CELUL' +
              'AR">)]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 20.000000000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina: [Page#] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 453.543600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            'Relat'#243'rio emitido em: [Date] as [Time]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Rela'#231#227'o de Profissionais')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 49.574830000000000000
          Width = 56.692913390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 147.401670000000000000
          Top = 49.574830000000000000
          Width = 317.480483390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 464.882190000000000000
          Top = 49.574830000000000000
          Width = 79.370093390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            'Nascimento')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 544.252320000000000000
          Top = 49.574830000000000000
          Width = 86.929153390000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8W = (
            'N'#186' do Celular')
          ParentFont = False
        end
      end
    end
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 256
    Top = 184
  end
  object frxXMLExport1: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    RowsCount = 0
    Split = ssNotSplit
    Left = 264
    Top = 192
  end
  object frxODSExport1: TfrxODSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 0.000000000000000000
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Background = True
    Creator = 'FastReport'
    SingleSheet = False
    Language = 'en'
    SuppressPageHeadersFooters = False
    Left = 272
    Top = 200
  end
  object frxODTExport1: TfrxODTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 0.000000000000000000
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Background = True
    Creator = 'FastReport'
    SingleSheet = False
    Language = 'en'
    SuppressPageHeadersFooters = False
    Left = 280
    Top = 208
  end
  object frxDBFExport1: TfrxDBFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OEMCodepage = False
    Left = 288
    Top = 216
  end
  object frxDOCXExport1: TfrxDOCXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 296
    Top = 224
  end
  object frxPPTXExport1: TfrxPPTXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 304
    Top = 232
  end
  object frxXLSXExport1: TfrxXLSXExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ChunkSize = 0
    OpenAfterExport = False
    PictureType = gpPNG
    Left = 312
    Top = 240
  end
  object frxHTML5DivExport1: TfrxHTML5DivExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    UnifiedPictures = True
    Navigation = True
    EmbeddedPictures = True
    EmbeddedCSS = True
    HTML5 = True
    AllPictures = False
    ExportAnchors = True
    PictureTag = 0
    Left = 320
    Top = 248
  end
  object frxHTML4DivExport1: TfrxHTML4DivExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    UnifiedPictures = True
    Navigation = False
    EmbeddedPictures = False
    EmbeddedCSS = False
    HTML5 = False
    AllPictures = False
    ExportAnchors = True
    PictureTag = 0
    Left = 328
    Top = 256
  end
  object frxSVGExport1: TfrxSVGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    MultiPage = False
    Formatted = False
    PictureFormat = pfPNG
    UnifiedPictures = True
    Navigation = False
    EmbeddedPictures = True
    EmbeddedCSS = True
    Left = 336
    Top = 264
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 344
    Top = 272
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 352
    Top = 280
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    OpenAfterExport = False
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 360
    Top = 288
  end
end
