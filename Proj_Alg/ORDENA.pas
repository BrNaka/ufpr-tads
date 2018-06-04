//criar um vetor com no maximo 2000 nomes e mostra-los em ordem alfabetica
Program ordena ;
TYPE A36=STRING[36];
var vet:array[1..2000] of A36;
    aux:a36;
    totaux,T,tot,a,jt:integer;
    tro:boolean;
begin
//cria o vetor
 write('NOME',T+1:4,'=>');
 READLN(AUX);
 AUX:=UPCASE(AUX);
 WHILE (AUX<>'FIM') AND (T<=2000) DO
  BEGIN
   T:=T+1;
   VET[T]:=AUX;
   write('NOME',T+1:4,'=>');
   READLN(AUX);
   AUX:=UPCASE(AUX);
  END;
//FIM DA CRIACAO COM "T" ELEMENTOS
//INICIO DA ORDENACAO 
 tot:=T;
 TOTAUX:=TOT;
 jt:=1;
 repeat
  tro:=true;
  tot:=tot-jt;
  for a:=1 to tot do
   if(vet[a] > vet[a+1]) then
    begin
     aux:=vet[a];
     vet[a]:=vet[a+1];
     vet[a+1]:=aux;
     tro:=false;
     jt:=1;
    end
   else
    jt:=jt+1;
 until tro;
//FIM DA ORDENACAO
 FOR A:=1 TO TOTAUX DO
  WRITELN(VET[A]);
 write('enter para encerrar');
 readln;
end.