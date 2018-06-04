//Equipe 09
//Bruno Nakayabu, Ygor Limeira da Silva

unit TP09P01;

interface

	TYPE A36=STRING[36];
    vet=array[1..2000] of A36;
    type A11=string[11];
	procedure ordena(var v:vet; T:integer);
	procedure pesquisa(var v:vet; var ext:A36; T:integer);
	function validacpf(cpf:A11):boolean;
	function valdata(D,M,A:integer):boolean;

Implementation

///////////////////////ORDENAÇÃO/////////////////////////////////////////////

procedure ordena(var v:vet; T:integer);

var 
    aux:A36;
    tot,a,jt:integer;
    tro:boolean;
begin
 tot:=T;
 jt:=1;
 repeat
  tro:=true;
  tot:=tot-jt;
  for a:=1 to tot do
   if(v[a] > v[a+1]) then
    begin
     aux:=v[a];
     v[a]:=v[a+1];
     v[a+1]:=aux;
     tro:=false;
     jt:=1;
    end
   else
    jt:=jt+1;
 until tro;
END;

//////////////////////PESQUISA BINÁRIA//////////////////////////////////////////
procedure pesquisa(var v:vet; var ext:A36; T:integer);

var ii,i9,meio:integer;
    achou:boolean;
begin
   achou:=false;
   ii:=1;
   i9:=T;
   repeat
    meio:=(ii+i9) div 2;
    if(ext = v[meio])then
	    achou:=true
    else
     if(ext > v[meio])then
      ii:=meio+1
     else
      i9:=meio-1;
   until ((achou) OR (ii > i9));
   if( achou ) then
    WRITELN(EXT,' NA POSICAO',MEIO:5,' DO VETOR')
   else
    WRITELN(EXT,' NAO ENCONTRADO');
   write('NOME=>');
   READLN(EXT);
   EXT:=UPCASE(EXT);
end;

///////////////////////VALIDAÇÃO DE CPF/////////////////////////////////////////////////

function validacpf(cpf:A11):boolean;

var 
    vet:array[1..11] of integer;
    dvs:array[1..2] of integer;
    som,a,b,e,f,m,r:integer;
    aux:boolean;
begin
  aux:=true;
  for a:=1 to 11 do
   val(CPF[a],vet[a],e);
  f:=8;
  m:=10;
  a:=0;
  repeat
   som:=0;
   a:=a+1;
	 f:=f+1;
	 m:=m+1;
	 for b:=1 to f do
	  som:=som+vet[b]*(m-b);
   r:=som mod 11;
   dvs[a]:=11-r;
   if(r<2)then
    dvs[a]:=0;
   if(vet[m-1] <> dvs[a])then
    aux:=false;
  until ((a=2) or (not aux));
  validacpf:=aux;
END;
//////////////////////VALIDAÇÃO DE DATAS//////////////////////////////////////////////////

function valdata(D,M,A:integer):boolean;
var
     aux:string[4];
     DAT:boolean;
     DM : integer; 
begin
   DAT:=TRUE;
   IF(A<1900)THEN  //ano
        DAT:=FALSE
   ELSE
        IF(M<1) OR (M>12) THEN  //mes
            DAT:=FALSE
   ELSE
        BEGIN //dia
            DM:=31;
            IF(M=4) OR (M=6) OR (M=9) OR (M=11) THEN  //meses com 30 dias
                DM:=30;
            IF(M=2) THEN //fevereiro
                BEGIN
                    DM:=28;
                    IF(A MOD 4) = 0 THEN  //bissesto
                        DM:=29;
                end;
            IF(D<1) OR (D>DM) THEN
                DAT:=FALSE
        END;
   valdata := DAT;
END;

End.
