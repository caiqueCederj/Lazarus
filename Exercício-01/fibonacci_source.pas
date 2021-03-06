unit Fibonacci_source;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnGerarSequencia: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    listFibn: TListBox;
    ListSmart: TListBox;
    ListDumb: TListBox;
    listElemento: TListBox;
    txtIndice: TEdit;

    procedure btnGerarSequenciaClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;
  c, n, i, k, t, r1:integer;
  r, fib, smart, Elemento:string;
  j:integer=1;
  m:integer=0;
  cont:integer=0;
  f, g:array [0..999] of integer;
implementation

{ TForm1 }
procedure TForm1.btnGerarSequenciaClick(Sender: TObject);
procedure algoritmo_Dumb(n:integer);
 function calcular(m:integer):integer;
  begin
 {Algoritmo_Dumb}
  cont:=cont+1;
  if m<1 then
   begin
    calcular:=0;
   end
  else
   begin
  if m<2 then
   begin
    calcular:=1;
   end
  else
   begin
    calcular:=calcular(m-1)+calcular(m-2); //gera a sequencia alg.fib(n)
   end;
 end;
end;
 begin
  if n>-1 then
   begin
   calcular(m);
   r:=intTostr(cont);
   Listdumb.Items.Add(r);// exibe o n° de chamadas de alg.Dumb
   inc(m);
   n:=n-1;
   cont:=0;
   algoritmo_dumb(n);
   end;
 end;

 procedure algoritmo_smart(n:integer);
 begin
 {Algoritmo Smart}
    f[0]:=0;
    f[1]:=1;
    if j <= n then//gera a sequencia fibonacci
        begin
         inc(j);
         f[j]:=f[j-2]+f[j-1];
         g[j-1]:=i+1;
         inc(i);
         algoritmo_smart(n);
        end
    else
        begin
         for k:=0 to n do//exibe a sequencia e n° de chamadas de agl.smart
          begin
          c:=f[k];
          t:=g[k];
          Fib:=inttostr(c);
          Smart:=inttostr(t);
          Elemento:=inttostr(k);
          ListFibn.items.Add(fib);
          ListSmart.items.add(smart);
          ListElemento.Items.Add(Elemento);
          end;
        end;
    i:=0;
    j:=1;
    c:=0;
 end;
begin
 listFibn.items.Clear;
 ListSmart.items.Clear;
 ListDumb.items.clear;
 listElemento.items.Clear;
 n:=strtoint(txtindice.text);
 algoritmo_smart(n);
 algoritmo_Dumb(n);
 m:=0;
end;

initialization
  {$I fibonacci_source.lrs}

end.

