program test2;

var nome1, nome2, nome3, nome4 : String[30];

BEGIN
  writeln('Digite 3 nomes:');
  readln(nome1);
  readln(nome2);
  readln(nome3);
  nome4:=nome1;

  repeat 
  nome1:=nome2;
  nome2:=nome3;
  nome3:=nome4;
  nome4:=nome1;
  until (nome1<nome2) and (nome2<nome3);

  writeln(nome1, ' ', nome2, ' ', nome3);
END. 
