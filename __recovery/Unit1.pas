unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure CalcPrices(InputPriceWithNDS: Double; ProcNDS: TProcNDS;
out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: Double);
begin
// Есть правило:
// [Цена с НДС] = [Цена без НДС] * (1 + [Процент НДС] / 100)
// Или запишем иначе
// CorrectedPriceWithNDS = CorrectedPriceWithoutNDS * (1 + ProcNDS / 100)
// Входные параметры процедуры:
// 1. Внешняя система рассчитывает и передает нам рекомендованную
// цену с НДС - InputPriceWithNDS, содержащую до 10 знаков после зарпятой
// 2. Процент НДС - TProcNDS: 0..99
// ЗАДАЧА: Процедура должна рассчитать такие цены с НДС и без НДС(CorrectedPriceWithNDS,
// CorrectedPriceWithoutNDS), чтобы они имели максимум 2 знака после запятой и не
// требовали округлений, и чтобы рассчитаная цена с НДС была максимально приближена к
// вводимой цене InputPriceWithNDS.
// 3. Сделать пользовательский интерфейс для проверки корректности вашего решения,
// консольный тоже ок. Используем только стандартные библиотеки.
// 4. Прислать в архиве все файлы проекта. В случае проблем с отправкой
// установить пароль 321.
end;


procedure TForm1.Button1Click(Sender: TObject);
begin

end;

end.
