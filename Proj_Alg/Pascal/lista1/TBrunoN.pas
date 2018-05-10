// EXERCICIO 22

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




// EXERCICIO 23

Program TBRUNO; 
// ALUNO: BRUNO NAKAYABU, TADS TARDE 

var diaAtual, mesAtual, anoAtual: integer;
    diaNasc, mesNasc, anoNasc: integer; 
    dia, mes, ano: integer; 
    bis : boolean; 

BEGIN

  write('INFORME A DATA ATUAL (DIA, MÊS E ANO SEPARADOS POR ESPAÇO): ');
  readln(diaAtual, mesAtual, anoAtual); 

  writeln();

  write('INFORME A DATA DO SEU NASCIMENTO (DIA, MÊS E ANO SEPARADOS POR ESPAÇO): ');
  readln(diaNasc, mesNasc, anoNasc);

  writeln();
  
  dia := diaAtual - diaNasc;
  mes := mesAtual - mesNasc;
  ano := anoAtual - anoNasc;

  // VERIFICA SE É ANO BISSEXTO OU NÃO.
  bis := ((anoAtual mod 4 = 0) and (anoAtual mod 100 <> 0)) or ((anoAtual mod 100 = 0) and (anoAtual mod 400 = 0));

  if(dia < 0) then
    begin
      mesAtual := mesAtual - 1;
      mes := mesAtual - mesNasc;
      if(mesAtual + 1 = 2) and not(bis) then
          dia := dia + 28
      else if(mesAtual + 1 = 2) and bis then 
          dia := dia + 29
      else if((mesAtual + 1) mod 2 = 0) then
          dia := dia + 30
      else if((mesAtual + 1) mod 2 <> 0) then
          dia := dia + 31  
    end;
  
  if(mes < 0) then
    begin
     anoAtual := anoAtual - 1;
     mes := mes + 12;
     ano := anoAtual - anoNasc;
   end;
  
  writeln('Você tem ', ano, ' anos, ', mes, ' mes(es) e ', dia, ' dias!');
  readln;

END.  
      


// EXERCICIO 25

Program TBRUNO;
// ALUNO: BRUNO NAKAYABU, TADS TARDE 
uses Crt;

var A, B : integer;
    ponto : string; 
    endMatch : boolean;

BEGIN
  A := 0;
  B := 0;

  REPEAT
    writeln();
    writeln();
    writeln('                     =================================');
    writeln('                            PARTIDA EM ANDAMENTO          ');
    writeln('                        TIME A       X       TIME B ');
    writeln('                          ',A,'                    ',B,'');
    writeln('                     =================================');
    writeln();
    writeln();
  
    write('PONTO DO TIME(digite A ou B): ');
    readln(ponto);
    
    if(ponto = 'A') then
      A := A + 1
    else if(ponto = 'B') then
      B := B + 1;
   
    endMatch := ((A >= 25) or (B >= 25)) and ((A-B >= 2) or (B-A >= 2));

    clrscr;
  UNTIL(endMatch);

  writeln();
  writeln();
  writeln('                    ================================');
  writeln('                       PARTIDA FINALIZADA. PLACAR:   ');
  writeln('                         Time A    x    Time B     ');
  writeln('                           ',A,'              ',B,'       ');
  writeln('                    ================================');
  writeln();
  writeln();

  if(A > B) then
    writeln('                            VENCEDOR: TIME A')
  else
    writeln('                            VENCEDOR: TIME B');
    
  readln;
END.

    
    
