unit CHILDWIN;

interface

uses Windows, SysUtils,Classes, Graphics, Forms, Controls, StdCtrls, ExtCtrls,
  Grids, DBGrids, OracleNavigator, Mask, ComCtrls,sunit,db,variants, Menus;

type
  TMDIChild = class(TSForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    OracleNavigator1: TOracleNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pbegin: TDateTimePicker;
    pend: TDateTimePicker;
    Shape1: TShape;
    edreport: TCheckBox;
    Tree: TTreeView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pbeginChange(Sender: TObject);
    procedure edreportClick(Sender: TObject);
    procedure RebuildTree;
     Procedure ExpandLevel( Node : TTreeNode);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure TreeExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure TreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure edit;
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    { Private declarations }
   parent:variant;
   child:variant;
  public
    { Public declarations }
  end;
var MDIchild: TMDIChild;
implementation

uses dmunit;


{$R *.dfm}

procedure TMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin


  Action := caFree;
end;

procedure TMDIChild.FormDestroy(Sender: TObject);
begin
 MDIChild:=nil;
end;

procedure TMDIChild.Button1Click(Sender: TObject);
begin
MDIchild.Close;
end;

procedure TMDIChild.FormCreate(Sender: TObject);
begin

pbegin.DateTime:=dmunit.pbegin;
pend.DateTime:=dmunit.pend;
edreport.Checked:=dmunit.repedit;
dm.setperiod(DateToStr(pbegin.date),DateToStr(pend.date));
dm.RefreshJournal;
RebuildTree;
end;

procedure TMDIChild.pbeginChange(Sender: TObject);

begin
dmunit.pbegin:=pbegin.Date;
dmunit.pend:=pend.Date;
dm.setperiod(DateToStr(pbegin.date),DateToStr(pend.date));
end;

procedure TMDIChild.edreportClick(Sender: TObject);
begin
dmunit.repedit:=edreport.Checked;
end;
//---------------------------------------

 procedure TMDIChild.RebuildTree;
 begin
       Tree.Items.Clear;

    // ѕринудительное раскрытие самого верхнего уровн€
    ExpandLevel(nil);
    Tree.Selected:=Tree.Items[0];

 end;

//------------------------------------------------------
 Procedure TMDIChild.ExpandLevel( Node : TTreeNode);
Var ID , i   : Integer;
    TreeNode : TTreeNode;

 Begin

  IF Node = nil Then ID:=0
    Else ID:=Node.Level+1;
if id=0 then
begin
  dm.Qrazdel.Open;
  dm.Qrazdel.Filtered:=false;
  dm.Qrazdel.First;
  Tree.Items.BeginUpdate;

     For i:=1 To dm.Qrazdel.RecordCount Do
        Begin
             // «апишем в поле Data ветки ее идентификационный номер(ID) в таблице
      if  DM.QrazdelPARENT.AsString =''
         then begin
            TreeNode:=Tree.Items.AddChildObject(Node ,
                                  dm.QrazdelNAME.AsString ,
                                  Pointer(dm.QrazdelKAT.AsInteger));
           treenode.ImageIndex:=0;
            TreeNode.SelectedIndex:=0;
           // ƒобавим фиктивную (пустую) дочернюю ветвь только дл€ того,
           // чтобы был отрисован [+] на ветке и ее можно было бы раскрыть
           Tree.Items.AddChildObject(TreeNode , '' , nil);
           end;
       dm.Qrazdel.Next;

        end;

   Tree.Items.EndUpdate;

  end;

 if id=1 then
begin
  dm.Qrazdel.Open;
  dm.Qrazdel.Filtered:=false;
  dm.Qrazdel.Filter:='parent='+inttostr(integer(node.Data));
  dm.Qrazdel.Filtered:=True;
  dm.Qrazdel.First;

  Tree.Items.BeginUpdate;

     For i:=1 To dm.Qrazdel.RecordCount Do
        Begin
             TreeNode:=Tree.Items.AddChildObject(Node ,
                               dm.QrazdelNAME.AsString ,
                               Pointer(dm.QrazdelKAT.AsInteger));
           treenode.ImageIndex:=0;
            TreeNode.SelectedIndex:=0;

       dm.Qrazdel.Next;

        end;
   dm.Qrazdel.Filtered:=false;
   Tree.Items.EndUpdate;

  end;




  end;
  //----------------------------------------------------------


procedure TMDIChild.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
if (Button=nbPost) or (button=nbRefresh) then RebuildTree;
end;

procedure TMDIChild.TreeExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  IF Node = nil Then Exit;

  // ≈сли перва€ дочерн€€ ветвь той, которую мы хотим раскрыть, пуста€
  // значит это фиктивна€ ветвь, дерево еще не достраивалось по этой ветви.
  // ”дал€ем фиктивную ветвь и "разворачиваем" дерево вглубь той ветки,
  // на которой стоим
  IF Node.getFirstChild.Data = nil
  Then Begin
          Node.DeleteChildren;
          ExpandLevel(Node);
       End;

end;
//----------------------------------------------------------------




procedure TMDIChild.TreeStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var temp:integer;
  begin
temp:=integer(dm.ExecuteSQL('select count(1) from tmp.tkat where parent='+inttostr(
                    integer(TTreeView(sender).Selected.Data))));
if temp=0 then
            child:=integer(TTreeView(sender).Selected.Data)
                  else child:=null;

end;

procedure TMDIChild.TreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);

begin
Accept:= dm.Qrazdel.State=dsBrowse;
if TTreeView(sender).GetNodeAt(x,y)<>nil then
begin
 tree.Selected   :=TTreeView(sender).GetNodeAt(x,y) ;

 end;
 end;

procedure TMDIChild.TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var i:integer;
begin
if TTreeView(sender).DropTarget.Level=0 then
parent:=integer(TTreeView(sender).DropTarget.Data)
else exit;

edit;

end;

procedure TMDIChild.Panel1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);

  begin
if state=dsDragEnter then
begin

 tree.Selected:=tree.Items[0];
end;
end;
//-------------------------------------------------------------------
procedure TMDIChild.N1Click(Sender: TObject);
var temp:integer;
begin
temp:=integer(dm.ExecuteSQL('select count(1) from tmp.tkat where parent='+inttostr(
                    integer(tree.Selected.Data))));
if temp=0 then
                  begin
                  child:=integer(tree.Selected.Data);
                   n2.Enabled:=true;
                  end
                  else child:=null;

  end;
//-------------------------------------------------------------------
procedure TMDIChild.N2Click(Sender: TObject);
begin
 if tree.Selected.Level=0 then
parent:=integer(Tree.Selected.Data)
else exit;
edit;

end;



procedure TMDIChild.edit;
var i:integer;
begin
if not varisnull(child) then
  begin


   if parent=child then exit;
   dm.Qrazdel.Filtered:=false;
   if dm.Qrazdel.Locate('kat',child,[loCaseInsensitive])
        then begin
               dm.Qrazdel.Edit;


               dm.QrazdelPARENT.AsVariant:=parent;
               dm.Qrazdel.Post;

             end;
     RebuildTree;
 for i:=0 TO tree.Items.Count-1 do

   if integer(tree.Items.Item[i].Data)=parent
       then begin
           // tree.Selected:=tree.Items.Item[i];
            tree.Items.Item[i].Expand(false);

            end;
for i:=0 TO tree.Items.Count-1 do

   if integer(tree.Items.Item[i].Data)=child
       then begin
            tree.Selected:=tree.Items.Item[i];
           // tree.Items.Item[i].Expand(false);

            end;





  end;

end;



procedure TMDIChild.N3Click(Sender: TObject);
begin
if tree.Selected.Level=1 then
  begin
    child:=integer(tree.Selected.Data);
    parent:=null;
    edit;
  end;
end;

procedure TMDIChild.PopupMenu1Popup(Sender: TObject);
begin
n3.Enabled:=tree.Selected.Level=1
end;

end .
