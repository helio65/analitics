unit CheckBox.Interpose;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.StdCtrls, Vcl.Controls, Vcl.Graphics,
  System.Classes, System.NetEncoding, Vcl.Imaging.pngimage, System.Types;

type
  TCheckBox = class(Vcl.StdCtrls.TCheckBox)
  private
    procedure WMErase(var Message: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure WMPaint (var Message: TWMPaint); message WM_PAINT;
  end;

implementation

{ TCheckBox }

procedure TCheckBox.WMErase(var Message: TWMEraseBkgnd);
var
  canv: TControlCanvas;
begin
  canv             := TControlCanvas.Create;
  canv.Control     := Self;
  canv.Brush.Color := Self.Color;
  canv.FillRect(canv.ClipRect);
  canv.free;
end;

procedure TCheckBox.WMPaint(var Message: TWMPaint);
const
  SPACE: Integer = 2;
var
  txtW, txtH, txtX, BtnWidth: Integer;
  canv: TControlCanvas;
begin
  inherited;

  BtnWidth := Self.GetSystemMetrics(SM_CXMENUCHECK);
  canv := TControlCanvas.Create;
  try
    canv.Control := Self;
    canv.Font := Self.Font;
    canv.Brush.Color := Self.Color;
    txtW:= canv.TextWidth(Self.Caption);
    txtH:= canv.TextHeight(Self.Caption);
    if Self.BiDiMode in [bdRightToLeft, bdRightToLeftReadingOnly] then
      txtX:= Self.Width - BtnWidth - SPACE - txtW
    else
      txtX:= BtnWidth + SPACE;
    canv.FillRect(TRect.Empty);
    canv.TextOut(txtX, (Height - txtH) div 2, Self.Caption);
  finally
    canv.Free;
  end;
end;

end.
