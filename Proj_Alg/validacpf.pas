Program Pzim ;
var cpf:string[11];
    nn:real;
    vet:array[1..11] of integer;
    dvs:array[1..2] of integer;
    som,a,b,e,f,m,r:integer;
    aux:boolean;
begin
 repeat
  write('cpf:');
  readln(cpf);
  val(cpf,nn,e);
 until(e=0);
 while NN > 0. do
 begin
//inicio da validacao do cpf
  aux:=true;
  for a:=1 to 11 do
   val(CPF[a],vet[a],e);{o string "num" já vem validado}
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
//fim da validacao
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
