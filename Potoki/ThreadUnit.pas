unit ThreadUnit;

interface

uses
  Classes, SysUtils;//, MainForm;

type
  potok = class(TThread)
  private
    { Private declarations }
    index:integer;
    procedure UpdateLabel;
  protected
    procedure Execute; override;
  end;

implementation

uses MainForm;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure potok.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ potok }

procedure potok.Execute;
begin
  index:=1;
  while index>0 do
  begin

     Synchronize(UpdateLabel);
     inc(index);
     if index>100000 then
        index:=0;
     // stream stop then exit
     if terminated then exit;
  end;

  { Place thread code here }
end;

procedure potok.UpdateLabel;
begin
  Form1.Label1.Caption:=Inttostr(index);
end;

end.
