unit dialunit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tdialform = class(TForm)
    Fbutton: TButton;
    setButton: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dialform: Tdialform;

implementation

{$R *.dfm}

end.
