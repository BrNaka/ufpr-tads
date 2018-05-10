// 1) FUP que leia 20 números inteiros e mostre-os na ordem inversa 
// da leitura.

Program exrc1;

var 
  arr: array[1..20] of integer;
  a : integer;

BEGIN

  for a:=1 to 20 do
    begin
      write('Insira o número ', a, ': ');
      readln(arr[a]);
    end;

  writeln();
  writeln('ORDEM INVERSA: ');
  writeln();

  for a:=20 downto 1 do 
      write(arr[a], ' ');

  writeln();
END. 
