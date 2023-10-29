unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.StdCtrls, Vcl.Controls, Vcl.Graphics,
  System.Classes, System.NetEncoding, Vcl.Imaging.pngimage;

const
  icon_check =
    'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAA0klEQVR42mOcPXt2SUnJx48fGQgB'#13+
    'fn7+vr4+RiBFjGq4HkYilcIBURpCQ0O/f/++ZcsWojQAVa9avQrI4OXh/fLlCwENwcHBa9auATIs'#13+
    'zC1OnjyJsIGVlZWZmfnHjx9Yzba0sDxx4gTCD0DVq1atEhQU9PLy+vbtGy6z0TUEBAYcPHAQogeX'#13+
    'ahQnrVmzxs/fb9fOXUuWLFm0eBGaS7AEK9weCBfTbCzxANeDSzWWeADqUVNTu3r1KkUxjaKBpMQn'#13+
    'ICDAOHfu3KKiImL0AFX39/cDALaZZyK2+3ITAAAAAElFTkSuQmCC';

  icon_grayed =
    'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACx'#13+
    'jwv8YQUAAAAJcEhZcwAADsQAAA7EAZUrDhsAAACJSURBVHjaxZMxCsQgEEX/FKZINuhZxXPoAcRD'#13+
    'CmIRi0kiBLLFwmoS8otxGP2PsfjkvWdjDGKMaJGUEtZa0NZwq/kMoe1k1MJNZqpWPAA4Ln7peDd/'#13+
    'ZqSU+gGXN/gCCCGwlKUOpnFCzrkf8M4XbgUMYkAppR/wr+4DXAmTUgoUQmCtdXOcd7NzDiuJeVkS'#13+
    'hja/3QAAAABJRU5ErkJggg==';

  icon_uncheck =
    'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAIAAACQkWg2AAAAW0lEQVR42mOcPXt2SUnJx48fGQgB'#13+
    'fn7+vr4+RiD1+/dvDQ0Nghpu3LjBysrKCGRZWFgcP3GcoAZLC8sTJ06MahjVgEsDSYmPjY2Nce7c'#13+
    'uUVFRcQkbwEBgf7+fgBd42QiU7TPjwAAAABJRU5ErkJggg==';

type
  TCheckBox = class(Vcl.StdCtrls.TCheckBox)
  protected
    procedure Click; override;
  private
    FImageList: TImageList;
    function GetIcon(ABase64Icon: String): TBitmap;
    procedure WMErase(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMPaint (var Message: TWMPaint); message WM_PAINT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{ TCheckBox }

procedure TCheckBox.Click;
begin
  inherited Click;
  Repaint;
end;

constructor TCheckBox.Create(AOwner: TComponent);
var
  bmp: TBitmap;
begin
  inherited Create(AOwner);
  FImageList := TImageList.Create(nil);

  bmp := GetIcon(icon_check);
  FImageList.AddMasked(bmp, clFuchsia);
  bmp.Free;

  bmp := GetIcon(icon_uncheck);
  FImageList.AddMasked(bmp, clFuchsia);
  bmp.Free;

  bmp := GetIcon(icon_grayed);
  FImageList.AddMasked(bmp, clFuchsia);
  bmp.Free;
end;

destructor TCheckBox.Destroy;
begin
  FImageList.Free;
  inherited Destroy;
end;

function TCheckBox.GetIcon(ABase64Icon: String): TBitmap;
var
  png: TPngImage;
  input: TStringStream;
  output: TMemoryStream;
begin
  output := TMemoryStream.Create;
  try
    input := TStringStream.Create(ABase64Icon);
    input.Position := 0;
    TBase64Encoding.Base64.Decode(input, output);
    output.Position := 0;
    png := TPngImage.Create;
    Result := TBitmap.Create;
    png.LoadFromStream(output);
    Result.Assign(png);
  finally
    png.Free;
    input.Free;
    output.Free;
  end;
end;

procedure TCheckBox.WMErase(var Message: TWMEraseBkgnd);
var
  canv: TControlCanvas;
begin
  canv := TControlCanvas.Create;
  canv.Control := Self;
  canv.Brush.Color := Self.Color;
  canv.FillRect(canv.ClipRect);
  canv.free;
end;

procedure TCheckBox.WMPaint(var Message: TWMPaint);
const
  SPACE: Integer = 6;
var
  txtW, txtH, txtX, BtnWidth: Integer;
  canv: TControlCanvas;
begin
  //inherited;
  BtnWidth := GetSystemMetrics(SM_CXMENUCHECK);
  canv := TControlCanvas.Create;
  try
    canv.Control := Self;
    canv.Font := Font;
    canv.Brush.Color := Self.Color;
    txtW:= canv.TextWidth(Caption);
    txtH:= canv.TextHeight(Caption);
    if BiDiMode in [bdRightToLeft, bdRightToLeftReadingOnly] then
      txtX:= Width - BtnWidth - SPACE - txtW
    else
      txtX:= BtnWidth + SPACE;
    canv.FillRect(TRect.Empty);
    FImageList.Draw(canv,0,0,Ord(Self.Checked)); // checkbox
    canv.TextOut(txtX, (Height - txtH) div 2, Caption);
  finally
    canv.Free;
  end;
end;

end.
