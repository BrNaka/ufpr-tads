Program validacpfmod ;
uses TP09P01;
var cpf:string[11];
    nn:real;
    a,b,e,f,m,r:integer;
    aux:boolean;
begin
 repeat
  write('cpf:');
  readln(cpf);
  val(cpf,nn,e);
 until(e=0);
 while NN > 0. do
 begin
//chama modulo
  aux:=validacpf(cpf);
  if(aux) then
	 begin
	  E:=1;
	  FOR M:=1 TO 3 DO
		 BEGIN
		  for a:=e to e+2 do
	     write(CPF[A]);
	    IF(M<3) THEN
			 WRITE('.');
	    E:=E+3;
	   END;
	  WRITELN('-',CPF[10],CPF[11]);
	 END
	ELSE
	 WRITELN(CPF,'<== INVALIDO');
	repeat
   write('cpf:');
   readln(cpf);
   val(cpf,nn,e);
  until(e=0);
 end;
 WRITE('ENTER PARA ENCERRAR');
END.
