Program TBRUNO;
//ALUNO: BRUNO NAKAYABU, TADS TARDE

var dia, mes, ano : integer;
    x,y : string;
    bis : boolean;

BEGIN

  x := 'Data válida';
  y := 'Data inválida';

  write('Informe o dia, mês e ano (separados por espaço): ');
  read(dia, mes, ano);

  bis := ((ano mod 4 = 0) and (ano mod 100 <> 0)) or ((ano mod 100 = 0) and (ano mod 400 = 0));

  if not((ano >= 1) and (dia >= 1) and (dia <= 31) and (mes >= 1) and (mes <= 12)) then
    x := y
  else if(dia = 31) and (mes mod 2 = 0) then
    x := y
  else if(dia > 29) and (mes = 2) then
    x := y
  else if(dia = 29) and (mes = 2) and (not bis) then
    x := y;

  writeln(x);

END. .
