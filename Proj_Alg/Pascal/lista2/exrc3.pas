// FUP que leia uma lista de 30 números, colocando-os em um vetor,
// após o térmmino da leitura, mostre apenas os elementos maior ou igual a 15.

Program exrc3;

var
  arr : array[1..30] of integer;
  cont : integer;

BEGIN
  for cont:=1 to 30 do
    begin
      write('Insira o número ', cont, ': ');
      readln(arr[cont]);
    end;

  for cont:=1 to 30 do
    begin
      if (arr[cont] >= 15) then
        write(arr[cont], ' ');
    end;

  writeln();
END.
