unit uDMRelatorios;

interface

uses
  System.SysUtils, System.Classes, frxClass, frxDCtrl, frxExportRTF,
  frxExportHTML, frxExportPDF, frxExportSVG, frxExportHTMLDiv, frxExportHelpers,
  frxExportXLSX, frxExportPPTX, frxExportDOCX, frxExportDBF, frxExportODF,
  frxExportXML, frxExportBaseDialog, frxExportXLS;

type
  TDMRelatorios = class(TDataModule)
    Rep: TfrxReport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxODSExport1: TfrxODSExport;
    frxODTExport1: TfrxODTExport;
    frxDBFExport1: TfrxDBFExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxPPTXExport1: TfrxPPTXExport;
    frxXLSXExport1: TfrxXLSXExport;
    frxHTML5DivExport1: TfrxHTML5DivExport;
    frxHTML4DivExport1: TfrxHTML4DivExport;
    frxSVGExport1: TfrxSVGExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    procedure RepGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorios: TDMRelatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  uDMConexao, Parametros;

{$R *.dfm}

procedure TDMRelatorios.RepGetValue(const VarName: string; var Value: Variant);
begin
  if VarName = 'Empresa' then
    Value := TParametro.co_empresa;
end;

end.
