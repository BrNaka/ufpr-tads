// FUP que leia linha a linha os elementos de uma matriz 5 x 20
// e mostre-os coluna a coluna.

Program exrc4;

var
  arr : array[1..5, 1..20] of integer;
  contcol, contlin : integer;

BEGIN
  for contlin:=1 to 5 do
    for contcol:=1 to 20 do
      begin
        write('Insira o número da posição arr[', contlin,', ', contcol,']: ' );
        readln(arr[contlin,contcol]);
      end;

  for contcol:=1 to 20 do
    begin
      write('Coluna ', contcol,': ');
      for contlin:=1 to 5 do
        begin
          write(arr[contlin, contcol], ' ');
          if(contlin = 5) then
            writeln();
        end;
    end;
END.
