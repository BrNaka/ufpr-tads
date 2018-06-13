{ FUP que atualize os campos CLAS_GER (classificação geral), 
  CLAS_CAR (classificação no cargo) e CAR_CLA (cardo de classificação)
  no arquivo CAND.IND }

Program T09T05;
uses MODULOS;

var
    criterio                        :           vetor;
    candIND                         :           file of regis;
    reg                             :           regis;
    indx, posFIS, cont, e, a, class :           integer;
    C1, C2, C3, C4, C5, C6, C7, C8  :           integer;
    vagas                           :           integer;
    data_num                        :           real;
    strings                         :           string;
    arr_of_reg                      :           Array[1..5] of integer;

procedure ordeCre(var vet:vetor; t:integer);
    var aux:cc;
        tot,a,jt:integer;
        tro:boolean;
    begin
        tot := t;
        jt := 1;
        repeat
            tro := True;
            tot := tot - jt;
            for a := 1 to tot do
            if(vet[a].c_chave < vet[a+1].c_chave) then
                begin
                    aux := vet[a];
                    vet[a] := vet[a+1];
                    vet[a+1] := aux;
                    tro := false;
                    jt := 1;
                end
            else
                jt := jt+1;
        until tro;
    end;

BEGIN

    indx := 1;
    posFIS := 0;
    e := 0;
    C1 := 0;
    C2 := 0;
    C3 := 0;
    C4 := 0;
    C5 := 0;
    C6 := 0;
    C7 := 0;
    C8 := 0;

    assign(candIND, 'CAND.IND');
    reset(candIND);

    while not eof(candIND) do
        begin
            read(candIND, reg);
            arr_of_reg[1] := reg.so;
            arr_of_reg[2] := reg.n3;
            arr_of_reg[3] := reg.n4;
            arr_of_reg[4] := reg.n2;
            arr_of_reg[5] := reg.n1; 

            for cont := 1 to 5 do
                begin
                    str(arr_of_reg[cont], strings);
                    a := length(strings);
                    for e := 1 to 3 - a do
                        insert('0', strings, 1); 
                    criterio[indx].c_chave := criterio[indx].c_chave + strings;
                end;
            
            val(reg.data, data_num, e);
            data_num := 20200101 - data_num;
            str(data_num:0:0, strings); 

            criterio[indx].c_chave := criterio[indx].c_chave + strings; 
            criterio[indx].pf := posFIS; 

            indx := indx + 1;
            posFIS := posFIS + 1;
        end;

    writeln('posFIS = ', posFIS);

    ordeCre(criterio, posFIS);

    e := 1;

    while (e <= posFIS) do
        begin
            seek(candIND, criterio[e].pf);
            read(candIND, reg);
            
            class := e; 
            reg.clg := class;
            
            case reg.car of
                1: begin C1 := C1 + 1; reg.clc := C1; vagas := 20; end;
                2: begin C2 := C2 + 1; reg.clc := C2; vagas := 25; end;
                3: begin C3 := C3 + 1; reg.clc := C3; vagas := 26; end;
                4: begin C4 := C4 + 1; reg.clc := C4; vagas := 25; end;
                5: begin C5 := C5 + 1; reg.clc := C5; vagas := 30; end;
                6: begin C6 := C6 + 1; reg.clc := C6; vagas := 22; end;
                7: begin C7 := C7 + 1; reg.clc := C7; vagas := 20; end;
                8: begin C8 := C8 + 1; reg.clc := C8; vagas := 10; end;
            end;
            
            if (reg.clc <= vagas) then
                reg.ccl := reg.car;
            
           // writeln('e = ', e,' ',  'reg.clg = ', reg.clg, ' ',  'reg.clc = ', reg.clc, ' ',  'reg.ccl = ', reg.ccl);

            seek(candIND, criterio[e].pf);
            write(candIND, reg);
            e := e + 1;
        end;

    close(candIND);

END.







