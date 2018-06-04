program T09T02;
uses MODULOS;
var
    candTXT                                 :   Text;
    Line                                    :   String;
    num, name, cpftxt, datatxt, cargo       :   string;
    a, numint, e                            :   integer;
    registro                                :   regis;
    candIND                                 :   file of regis;

begin
    assign(candIND, 'CAND.IND');
    rewrite(candIND);

    assign(candTXT, 'cand.txt');
    reset(candTXT);

    num := '';
    name := '';
    cpftxt := '';
    datatxt := '';
    cargo := '';
    e := 0;

    while not eof(candTXT) do 
        begin
            Readln(candTXT, Line);

            for a := 1 to 4 do
                num := num + line[a];
            val(num, numint, e);
            registro.num :=  numint;
            num := '';

            for a := 5 to 40 do
                name := name + line[a];
            registro.nome := name;
            name := '';

            for a := 41 to 51 do
                cpftxt := cpftxt + line[a];
            registro.cpf := cpftxt;
            cpftxt := '';

            for a := 56 to 59 do
                datatxt := datatxt + line[a];
            for a := 54 to 55 do
                datatxt := datatxt + line[a];
            for a:= 52 to 53 do
                datatxt := datatxt + line[a];
            registro.data := datatxt;
            datatxt := '';

            cargo := line[60];
            val(cargo, numint, e);
            registro.car := numint;
            cargo := '';

            registro.n4 := 0;
            registro.n2 := 0;
            registro.n3 := 0;
            registro.n4 := 0;
            registro.so := 0;
            registro.clg := 0;
            registro.clc := 0;
            registro.ccl := 0;

            write(candIND, registro);
    end;
    close(candIND);
end.

