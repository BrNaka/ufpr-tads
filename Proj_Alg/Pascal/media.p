PROGRAM MEDIA;
  Var 
    valor,cont:integer; 
    soma:real; 
Begin 
    soma:=0; 
    cont:=0; 
    writeln('Digite um valor positivo(negativo pra terminar)'); 
    read(valor); 
    while(valor>=0)do 
        begin 
            soma:=soma+valor; 
            cont:=cont+1; 
            writeln('Digite um valor positivo(neg.para terminar)'); 
            read(valor); 
        end; 
    if cont>0 
        then writeln('Media=',soma/cont) 
        else writeln('Nenhum valor positivo foi digitado'); 
End. 
