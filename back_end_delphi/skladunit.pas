unit skladunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleNavigator, Grids, DBGrids, ExtCtrls,sunit;

type
  Tskladform = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid: TDBGrid;
    ornav: TOracleNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
   dsclose:boolean;
  public
      { Public declarations }

    procedure  setds(const ds:TDataSource;const closeds:boolean=false);


  end;

var
  skladform: Tskladform;

implementation

uses dmunit;

{$R *.dfm}

procedure Tskladform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dsclose then Tdataset(ornav.DataSource.DataSet).Close;

action:=caFree;
end;

procedure Tskladform.FormDestroy(Sender: TObject);
begin
skladform:=nil;
end;
//-------------------------------------------------------------------------

 procedure  TSkladform.setds(const ds:TDataSource;const closeds:boolean=false);
   begin
    ornav.DataSource:=ds;
    dbgrid.DataSource:=ds;
   dsclose:=closeds;
   end;
//--------------------------------------------------------------------------

 end.
