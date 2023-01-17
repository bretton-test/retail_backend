unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit3, ExtCtrls;

type
  TForm4 = class(TForm)
    Frame31: TFrame3;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
form1.myframe:=frame31;
form4.Show;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
//
end;

end.
