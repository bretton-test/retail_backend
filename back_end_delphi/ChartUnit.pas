unit ChartUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart;

type
  TChartForm = class(TForm)
    Chart1: TChart;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChartForm: TChartForm;

implementation

uses dmunit;

{$R *.dfm}

end.
