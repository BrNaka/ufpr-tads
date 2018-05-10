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

    
    
