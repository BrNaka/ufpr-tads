//CRIAR UM VETOR COM NO MAXIMO 2000 NOMES, ENCERRADA POR NOE - FIM. ORDENAR O VETOR E APOS, LER
//UMA SERIE DE NOMES ENCERRADA POR FIM, PARA CADA NOME LIDO, INFORMAR A POSICAO DO MESMO NO
//VETOR OU A MENSAGEM NAO ENCONTRADO. USAR PESQUISA BINARIA
Program PESQBINAR;
TYPE A36=STRING[36];
var ii,i9,meio:integer;
    achou:boolean;
    vet:array[1..2000] of A36;
    aux,EXT:a36;
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
for a:=1 to totaux do
 writeln(a:3,' ',vet[a]);
 write('NOME=>');
 READLN(EXT);
 EXT:=UPCASE(EXT);
 WHILE (EXT <> 'FIM') DO
  BEGIN
//INICIO PESQ BINARIA
   achou:=false;
   ii:=1;
   i9:=TOTAUX;
   repeat
    meio:=(ii+i9) div 2;
    if(ext = vet[meio])then
	    achou:=true
    else
     if(ext > vet[meio])then
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
  END;
end.