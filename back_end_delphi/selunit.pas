unit selunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBGridEh;

type
  Tselform = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGridEh;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  selform: Tselform;

implementation

uses dmunit;

{$R *.dfm}

procedure Tselform.DBGrid1DblClick(Sender: TObject);
begin
if   DBGrid1.DataSource=dm.razdds
   then selform.ModalResult:=dm.QrazdelKAT.AsInteger+20;

 end;

procedure Tselform.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbgrid1.OnDblClick(nil); 
end;

end.
