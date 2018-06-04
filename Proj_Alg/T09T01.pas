Program arqtxt ;
uses TP09P01, Crt;
     var regt   :   string[60];
     arqt       :   text;
     num,ano    :   string[4];
     nome       :   string[36];
     cpf        :   string[11];
     dia,mes    :   string[2];
     car        :   string[1];
     cpfn       :   real; 
     dian, mesn, anon       :   integer;
     a, b, c, e             :   integer;

Begin
    assign(arqt,'cand.txt');
    append(arqt);
    repeat
        repeat
          write('Numero = ');
          readln(num)  ;  
          val(num, a, e);
        until(e = 0);

        a := length(num);  //devolve o total de caracteres na string

        for b := 1 to 4 - a do
            insert('0', num, 1);

     
        write('Nome = ');
        read(nome);
        a := length(nome);
        
        for b:=a+1 to 36 do
            insert(' ', nome, b);     
        nome := upcase(nome); 

        repeat
            write('CPF = ');
            readln(cpf);
            val(cpf, cpfn, e); 
        until((e = 0) and validacpf(cpf));

        repeat
            repeat
                write('Dia = ');
                readln(dia);
                val(dia, dian, e);
            until(e = 0);
            repeat 
                write('Mes = ');
                readln(mes);
                val(mes, mesn, e); 
            until(e = 0);
            repeat
                write('Ano = ');
                readln(ano);
                val(ano, anon, e);
            until(e = 0);
        until(valdata(dian, mesn, anon));

        a := length(dia);
        for b := 1 to 2 - a do
            insert('0', dia, 1);

        a := length(mes);
        for b := 1 to 2 - a do
            insert('0', mes, 1);
            
        repeat
            write('Cargo = ');
            readln(car);
            val(car,a,e)
        until((e = 0) and (a > 0) and (a < 9));
        
        // insert(car,regt,1);
        // insert(nome,regt,1);
        // insert(num,regt,1);

        //ou 
        regt := num + nome + cpf + dia + mes + ano + car;
        writeln(regt);
        writeln(arqt,regt);
    until(readkey = '0');

        close(arqt);
        readln;
End.


