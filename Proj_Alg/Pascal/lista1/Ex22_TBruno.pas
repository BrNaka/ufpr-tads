Program TBRUNO;  
//ALUNO: BRUNO NAKAYABU, TADS TARDE

uses Crt;

var 
  dia, mes, ano, c: integer;
  validate, bis: boolean;

BEGIN

  c := 0;

  REPEAT
    if(c = 1) then
      begin
        writeln();
        writeln('==============================================================');
        writeln(' Você informou uma data inválida! Por favor, tente novamente.'); 
        writeln('==============================================================');
        writeln();
      end;

    write('Informe o DIA, MÊS e ANO separados por espaço. Em seguida, Pressione ENTER: ');
    readln(dia, mes, ano);

    validate := (ano >= 1) and (dia >= 1) and (dia <= 31) and (mes >= 1) and (mes <= 12);
    bis := ((ano mod 4 = 0) and (ano mod 100 <> 0)) or ((ano mod 100 = 0) and (ano mod 400 = 0));

    if (dia = 31) and (mes mod 2 = 0) then
      validate := not(validate)
    else if(dia = 29) and (mes = 2) and not(bis) then
      validate := not(validate);

    c := 1;
    clrscr;
  UNTIL (validate);

  writeln();
  writeln('==============================================================');
  writeln('       DATA VÁLIDA! A DATA INFORMADA FOI: ', dia,'/',mes,'/',ano); 
  writeln('==============================================================');
  writeln();

  readln;

END.
