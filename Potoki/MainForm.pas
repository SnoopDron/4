unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ThreadUnit;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    co:potok;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  prov:boolean;

implementation



{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  if prov=false then   // if stream not create
  begin
    co:=potok.Create(true);
     Button2.Enabled:=true;
  end;
  co.Resume;
  co.Priority:=tpLower;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  co.Suspend;   //pause
  prov:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   co.Terminate;
   co.Free;
   prov:=False;
   Button2.Enabled:=false; //нельзя нажать на паузу
   //Label1.Caption:='0';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   prov:=false;   //stream not create
   Button2.Enabled:=false;
end;

end.
