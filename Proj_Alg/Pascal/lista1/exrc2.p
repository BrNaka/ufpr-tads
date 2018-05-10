// FUP que, tendo como entrada o preço e o código de origem de um produto, mostre
// o preço junto com a sua procedência. Caso o código não seja nenhum dos especificados
// indicar que o produto é importado.

Program Exercicio2;

var
  valor : real;
  code : integer;
  proc : string[15];

BEGIN

  // Recebe o valor do produto e o atribui à variável 'valor'
    write('Informe o preço do produto: ');
    readln(valor);

  // Recebe o código do produto e o atribui à variável 'code'
    write('Informe o código do produto: ');
    readln(code);

  // Aqui são feitas comparações para saber a procedência do produto
    if(code = 1) then
      proc := 'Sul'
    else if((code > 1) and (code < 5)) then
      proc := 'Norte'
    else if((code > 4) and (code < 10)) then
      proc := 'Sudeste'
    else if((code > 9) and (code < 14)) then
      proc := 'Norte'
    else
      proc := 'Importado';

  // Imprime o preço + procedência
    writeln('O produto custa R$', valor:2, ' e sua procedência é: ', proc);

END.
