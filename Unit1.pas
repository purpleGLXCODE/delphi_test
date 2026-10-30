unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TProcNDS = 0..99;

  TForm1 = class(TForm)
    LabelTitle: TLabel;
    LabelInputPrice: TLabel;
    LabelNDS: TLabel;
    LabelResultWithNDS: TLabel;
    LabelResultWithoutNDS: TLabel;
    EditInputPrice: TEdit;
    EditNDS: TEdit;
    EditResultWithNDS: TEdit;
    EditResultWithoutNDS: TEdit;
    ButtonCalc: TButton;
    procedure ButtonCalcClick(Sender: TObject);
  end;

var
  Form1: TForm1;

procedure CalcPrices(InputPriceWithNDS: Double; ProcNDS: TProcNDS;
  out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: Double);

implementation

{$R *.dfm}

function GreatestCommonDivisor(A, B: Integer): Integer;
var
  R: Integer;
begin
  while B <> 0 do
  begin
    R := A mod B;
    A := B;
    B := R;
  end;
  Result := A;
end;

procedure CalcPrices(InputPriceWithNDS: Double; ProcNDS: TProcNDS;
  out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: Double);
var
  Divisor: Integer;
  StepWithNDS: Int64;
  StepWithoutNDS: Int64;
  MaxMultiplier: Int64;
  Multiplier: Int64;
  TargetMultiplier: Extended;
  PriceWithNDSInCents: Int64;
  PriceWithoutNDSInCents: Int64;
begin
  CorrectedPriceWithNDS := 0;
  CorrectedPriceWithoutNDS := 0;

  if InputPriceWithNDS <> InputPriceWithNDS then
    raise EArgumentException.Create('Цена должна быть числом.');

  if InputPriceWithNDS < 0 then
    raise EArgumentOutOfRangeException.Create('Цена не может быть отрицательной.');

  Divisor := GreatestCommonDivisor(100, Integer(ProcNDS));

  { All valid prices are integer multiples of these cent steps. }
  StepWithoutNDS := 100 div Divisor;
  StepWithNDS := (100 + Integer(ProcNDS)) div Divisor;

  MaxMultiplier := High(Int64) div StepWithNDS;
  TargetMultiplier := (Extended(InputPriceWithNDS) * 100.0) /
    Extended(StepWithNDS);

  if TargetMultiplier > Extended(MaxMultiplier) + 0.5 then
    raise EArgumentOutOfRangeException.Create('Цена слишком велика для расчёта.');

  { Round to the nearest valid price. Exact ties are rounded upward. }
  Multiplier := Trunc(TargetMultiplier + 0.5);

  if Multiplier > MaxMultiplier then
    raise EArgumentOutOfRangeException.Create('Результат выходит за допустимый диапазон.');

  PriceWithNDSInCents := Multiplier * StepWithNDS;
  PriceWithoutNDSInCents := Multiplier * StepWithoutNDS;

  CorrectedPriceWithNDS := PriceWithNDSInCents / 100.0;
  CorrectedPriceWithoutNDS := PriceWithoutNDSInCents / 100.0;
end;

procedure TForm1.ButtonCalcClick(Sender: TObject);
var
  InputPrice: Double;
  NDSValue: Integer;
  NDS: TProcNDS;
  CorrectedWithNDS: Double;
  CorrectedWithoutNDS: Double;
  FormatSettings: TFormatSettings;
  InputText: string;
begin
  FormatSettings := TFormatSettings.Create;
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := #0;

  InputText := StringReplace(Trim(EditInputPrice.Text), ',', '.',
    [rfReplaceAll]);

  if not TryStrToFloat(InputText, InputPrice, FormatSettings) then
  begin
    MessageDlg('Введите корректную цену.', mtError, [mbOK], 0);
    EditInputPrice.SetFocus;
    Exit;
  end;

  if not TryStrToInt(Trim(EditNDS.Text), NDSValue) then
  begin
    MessageDlg('Ставка НДС должна быть целым числом от 0 до 99.',
      mtError, [mbOK], 0);
    EditNDS.SetFocus;
    Exit;
  end;

  if (NDSValue < 0) or (NDSValue > 99) then
  begin
    MessageDlg('Ставка НДС должна быть целым числом от 0 до 99.',
      mtError, [mbOK], 0);
    EditNDS.SetFocus;
    Exit;
  end;

  NDS := NDSValue;

  try
    CalcPrices(InputPrice, NDS, CorrectedWithNDS, CorrectedWithoutNDS);
    EditResultWithNDS.Text := FormatFloat('0.00', CorrectedWithNDS,
      FormatSettings);
    EditResultWithoutNDS.Text := FormatFloat('0.00', CorrectedWithoutNDS,
      FormatSettings);
  except
    on E: Exception do
      MessageDlg(E.Message, mtError, [mbOK], 0);
  end;
end;

end.
