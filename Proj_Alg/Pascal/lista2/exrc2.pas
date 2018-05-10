// FUP que leia uma lista de 30 números, colocando-os em um vetor,
// após o térmmino da leitura, mostre apenas os elementos com índice
// maior ou igual a 15.

Program exrc2;

var
  arr : array[1..30] of integer;
  cont : integer;

BEGIN
  for cont:=1 to 30 do
    begin
      write('Insira o número ', cont, ': ');
      readln(arr[cont]);
    end;

  for cont:=15 to 30 do
    write(arr[cont], ' ');

  writeln();
END.
