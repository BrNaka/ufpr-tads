//leia uma serie de datas encerrada por dia = 0 e informe se eh valida ou nao
Program validata ;
 var a,m,d,e,dm:integer;
     aux:string[4];
       DAT:BOOLEAN;
BEGIN
 repeat
	  write('dia:');
    readln(aux);
    val(aux,d,e);
 until(e=0);
 while(d>0) do
	BEGIN 
   repeat
	  write('mes:');
    readln(aux);
    val(aux,m,e);
   until(e=0);
   repeat
	  write('ano:');
    readln(aux);
    val(aux,a,e);
   until(e=0);
//inicio da validacao da data	
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
//fim da validacao
     if(dat) then
		  writeln(d:2,'/',m:2,'/',a:4)
		 else
		  writeln('data invalida');
     repeat
	    write('dia:');
      readln(aux);
      val(aux,d,e);
     until(e=0);
  END;
  write('enter para encerar');
  readln;
end.