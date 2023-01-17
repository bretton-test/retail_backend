unit Timeunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons;

type
  TTimeForm = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    datep: TDateTimePicker;
    Label2: TLabel;
    timeed: TMaskEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimeForm: TTimeForm;

implementation

uses dmunit;

{$R *.dfm}

procedure TTimeForm.FormCreate(Sender: TObject);
begin
try
Timeed.Text:=formatdatetime('hh:mm',time{dmunit.datadok});
//datep.MinDate:=dmunit.pbegin;
//datep.MaxDate:=dmunit.pend;
datep.Date:=dmunit.datadok;
datep.Time:=0;
except
datep.DateTime:=now;
end;
end;

procedure TTimeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TTimeForm.FormDestroy(Sender: TObject);
begin
TimeForm:=nil;
end;

end.
