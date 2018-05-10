// 1) FUP para calcular as raízes de uma equação do segundo grau. 
// Classificar e mostrar as raízes calculadas. 

Program roots;
var ca, cb, cc, delta, x1, x2 : real;

BEGIN
  //Instruções para o usuário do programa. 
    writeln('Por favor, informe o valor dos coeficientes da equação (Ax^2 + Bx + C = 0:');
  
  //Solicita o valor do coeficiente A e atribui o valor de entrada à variável ca.
    write('Valor do coeficiente A: ');
    readln(ca);
  
  //Solicita o valor do coeficiente B e atribui o valor de entrada à variável cb.
    write('Valor do coeficiente B: ');
    readln(cb);

  //Solicita o valor do coeficiente C e atribui o valor de entrada à variável cc.
    write('Valor do coeficiente C: ');
    readln(cc);
  
  //Calcula o valor de delta (delta = (B^2) - 4*(A)*(C)). 
    delta:=(cb*cb) - 4*(ca)*(cc);

  //Avalia o valor de delta e diz o seu significado
    if(delta < 0) then
      begin
        writeln('A equação possui raízes imaginárias');
        writeln('Delta = ', delta:2);
      end
    else if(delta = 0) then
      begin
        x1:=(-cb)/(2*ca);
        writeln('A equação possui apenas uma raiz!');
        writeln('x1 = ', x1:2);
        writeln('Delta = ', delta:2);
      end
    else 
      begin
        x1 := (-cb+sqrt(delta))/(2*ca);
        x2 := (-cb-sqrt(delta))/(2*ca);
        writeln('A equação possui duas raízes!');  
        writeln('x1 = ', x1:2);
        writeln('x2 = ', x2:2);
        writeln('delta = ', delta:2);
      end
END. 

