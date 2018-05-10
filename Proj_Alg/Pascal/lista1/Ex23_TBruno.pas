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
      


