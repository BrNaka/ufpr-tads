Program TBRUNO;  
//ALUNO: BRUNO NAKAYABU, TADS TARDE

var 
  dia, mes, ano: integer;

BEGIN
  
  writeln('======================================');
  writeln();

  repeat
    write('Informe o ano: ');
    readln(ano);
  until (ano > 0);

  // Apenas separa as seções
  writeln();
  writeln('=======================================');
  writeln();

  repeat
    write('Informe o mês: ');
    readln(mes);
  until (mes >= 1) and (mes <= 12);

  // Apenas separa as seções
  writeln();
  writeln('=======================================');
  writeln();

  // Avalia se o ano é BISSEXTO ou não.
  if ((ano mod 4 = 0) and (ano mod 100 <> 0)) or ((ano mod 100 = 0) and (ano mod 400 = 0)) then
    begin
      if(mes = 2) then
        begin
          repeat
            writeln('O ano ', ano, ' é BISSEXTO!');
            writeln('Dessa forma, o mês de fevereiro possui 29 dias!');
            writeln('O dia informado deve estar entre 1 e 29');
            writeln();
            write('Informe o dia: ');
            readln(dia);
            writeln();
          until (dia >= 1) and (dia <= 29);
        end;
    end

  else
   begin 
      if(mes = 2) then
        begin
          repeat
            writeln('O ano ', ano, ' não é BISSEXTO!');
            writeln('Dessa forma, o mês de fevereiro possui apenas 28 dias!');
            writeln('O dia informado deve estar entre 1 e 28');
            writeln();
            write('Informe o dia: ');
            readln(dia);
            writeln();
          until (dia >= 1) and (dia < 29);
        end;
    end;
 
  // Avalia se o mês é diferente de 2 (Fevereiro) e se possui 30 ou 31 dias
  if(mes <> 2) then
    begin
      if(mes mod 2 = 0) then
        begin
          repeat
            writeln('O mês informado é par. Dessa forma, possui 30 dias apenas!');
            writeln();
            write('Informe o dia: ');
            readln(dia);
            writeln();
          until (dia >= 1) and (dia <= 30);
        end
   
      else
        begin
          repeat
            writeln('O mês informado é ímpar. Dessa forma, possui 31 dias!');
            writeln();
            write('Informe o dia: ');
            readln(dia);
            writeln();
          until (dia >= 1) and (dia <= 31);
        end;
    end; 

  writeln('A data informada foi: ', dia, '/', mes, '/', ano, '.');

END.
