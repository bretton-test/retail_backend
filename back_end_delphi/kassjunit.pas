unit kassjunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls,db,sunit;

type
  Tkassjform = class(TSForm)
    Panel1: TPanel;
    DBGrid: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kassjform: Tkassjform;

implementation

uses dmunit;

{$R *.dfm}

procedure Tkassjform.FormClose(Sender: TObject; var Action: TCloseAction);
begin

Tdatasource(dbgrid.DataSource).DataSet.close;
action:=cafree;

end;

procedure Tkassjform.FormDestroy(Sender: TObject);
begin
kassjform:=nil;
end;

procedure Tkassjform.FormCreate(Sender: TObject);
begin

Tdatasource(dbgrid.DataSource).DataSet.Open;
end;

procedure Tkassjform.DBGridDblClick(Sender: TObject);
begin
 dm.openkassprih(Tdatasource(dbgrid.DataSource).DataSet.Fields[4].AsInteger);
end;

end.
