program T09T03;
uses crt, MODULOS;

type a30 = string[30];

var 
    reg2                                              :   regis;
    arq2                                              :   file of regis;
    e, t, PAG, pfc, op, vagas                         :   integer;
    vet2                                              :   vetor;
    strings, curso                                    :   string;
    NI1, NI2, NI3, NI4, NI5, NI6, NI7, NI8, NI        :   integer;

PROCEDURE CABECA(option : integer; course : a30); {MODULO ESPECIFICO PARA ESTE PROGRAMA}
    BEGIN
        case op of 
            1: 
                begin 
                    WRITELN('    CURSO: ', course); 
                    writeln; 
                    writeln('  ORD  NUM NOME                                 NASCIMENTO  CAR'); 
                end;
            2: 
                begin 
                    WRITELN('    CURSO: ', course); 
                    writeln; 
                    writeln('  ORD INSC NOME                                 SOM  N3  N4  N2  N1 NASCIMENTO  CAR OBSERVACAO'); 
                end;
            3: 
                begin 
                    WRITELN('  RELACAO ORDEM DE CLASSIFICACAO GERAL', course); 
                    writeln('  ORD INSC NOME                                 SOM  N3  N4  N2  N1 NASCIMENTO  CAR OBSERVACAO'); 
                end;
        end;
    END;

FUNCTION MENU():integer;
    var 
        option : integer; 
    begin
        writeln();
        writeln('    RESULTADO DAS PROVAS');
        writeln(' VEJA A LISTA DOS APROVADOS! ');
        writeln();
        writeln('| 1 | CLASSIFICADOS NAS VAGAS EM ORDEM ALFABETICA');
        writeln('| 2 | CLASSIFICAÇÃO POR CARGO GERAL');
        writeln('| 3 | CLASSIFICAÇÃO GERAL');
        writeln();
        write('Selecionar a opcao: ');
        read(option);
        MENU := option; 
    end;
 
begin

    e := 1;
    pfc := 0;
    t := 0;

    op := MENU();
    clrscr;

    assign(arq2,'CAND.IND');
    reset(arq2);

    while not(eof(arq2)) do
        begin
            read(arq2, reg2);
            case op of 
                1: 
                    begin
                        str(reg2.car:1, strings);
                        vet2[pfc + 1].c_chave := strings + reg2.nome;
                    end;
                2: 
                    begin
                        str(reg2.car:1, strings);
                        vet2[pfc + 1].c_chave := vet2[pfc + 1].c_chave + strings;
                        str(reg2.clg:3, strings);
                        vet2[pfc + 1].c_chave := vet2[pfc + 1].c_chave + strings;
                    end;
                3: 
                    begin
                        str(reg2.clg:3, vet2[pfc + 1].c_chave); 
                    end;
            end;

            if (op = 2) then
                case reg2.car of
                    1: NI1 := NI1 + 1;
                    2: NI2 := NI2 + 1;
                    3: NI3 := NI3 + 1;
                    4: NI4 := NI4 + 1;
                    5: NI5 := NI5 + 1;
                    6: NI6 := NI6 + 1;
                    7: NI7 := NI7 + 1;
                    8: NI8 := NI8 + 1;
                end;

            vet2[pfc + 1].pf := pfc;
            pfc := pfc + 1;
        end;
    
    ordem(vet2, pfc);
    e := 1;

    if (op = 3) then
        CABECA(op, ' '); 

    // INICIO DO OUTPUT
    while (e <= pfc) do
        begin
            seek(arq2, vet2[e].pf);
            read(arq2, reg2);

            e := e + 1;

            if (op = 1)  and (reg2.ccl = 0) then 
                continue;

            t := t + 1;
            
            if (op = 1) or (op = 2) then
                begin
                    case reg2.car of 
                        1: begin curso := '1 ARQUITETO'; vagas := 20; NI := NI1; end; 
                        2: begin curso := '2 ENGENHEIRO ELETRICO'; vagas := 25; NI := NI2; end;
                        3: begin curso := '3 ENGENHEIRO CIVIL'; vagas := 26; NI := NI3; end;
                        4: begin curso := '4 ANALISTA DE SISTEMAS'; vagas := 25; NI := NI4; end;
                        5: begin curso := '5 ENGENHEIRO MECANICO'; vagas := 30; NI := NI5; end;
                        6: begin curso := '6 TECNICO EM REDES'; vagas := 22; NI := NI6; end;
                        7: begin curso := '7 ADMNISTRADOR'; vagas := 20; NI := NI7; end;
                        8: begin curso := '8 SECRETARIO EXECUTIVO'; vagas := 10; NI := NI8; end;
                    end;
                end;

            if (op = 1) then 
                begin
                    if ((vagas+1) - t = vagas) then
                        begin
                            readln;
                            clrscr;
                            CABECA(op, curso);
                        end;
                    if (t <= vagas) then
                        begin
                            write(t:5, reg2.num:5, ' ', reg2.nome, ' ', copy(reg2.data,7,2), '/', copy(reg2.data,5,2));
                            writeln('/', copy(reg2.data, 1, 4), ' ', reg2.car:3);
                            if(t = vagas) then
                                t := 0;
                        end;
                end
            else if (op = 2) then
                begin
                    if ((NI+1) - t = NI) then
                        begin
                            readln;
                            clrscr;
                            CABECA(op, curso);
                        end;

                    if (t <= NI) then
                        begin
                            write(t:5, reg2.num:5, ' ', reg2.nome, ' ', reg2.so:3, ' ', reg2.n3:3, ' ', reg2.n4:3, ' ', reg2.n2:3);
                            write(' ', reg2.n1:3);
                            write(' ', copy(reg2.data,7,2), '/', copy(reg2.data,5,2), '/', copy(reg2.data, 1, 4), ' ', reg2.car:3);

                            if (t <= vagas) then
                                writeln('  CLAS CAR=', reg2.car)
                            else
                                writeln; 

                            if (t mod 40 = 0) then
                                begin
                                    readln;
                                    clrscr;
                                    CABECA(op, curso);
                                end;

                            if (t = NI) then
                                t := 0;
                        end;                 
                end
            else
                begin
                    write(t:5, reg2.num:5, ' ', reg2.nome, ' ', reg2.so:3, ' ', reg2.n3:3, ' ', reg2.n4:3, ' ', reg2.n2:3);
                    write(' ', reg2.n1:3);
                    write(' ', copy(reg2.data,7,2), '/', copy(reg2.data,5,2), '/', copy(reg2.data, 1, 4), ' ', reg2.car:3);

                    case reg2.car of 
                        1: begin vagas := 20; NI1 := NI1 + 1; NI := NI1; end; 
                        2: begin vagas := 25; NI2 := NI2 + 1; NI := NI2; end;
                        3: begin vagas := 26; NI3 := NI3 + 1; NI := NI3; end;
                        4: begin vagas := 25; NI4 := NI4 + 1; NI := NI4; end;
                        5: begin vagas := 30; NI5 := NI5 + 1; NI := NI5; end;
                        6: begin vagas := 22; NI6 := NI6 + 1; NI := NI6; end;
                        7: begin vagas := 20; NI7 := NI7 + 1; NI := NI7; end;
                        8: begin vagas := 10; NI8 := NI8 + 1; NI := NI8; end;
                    end;

                    if (NI <= vagas) then
                        writeln('  CLAS CAR=', reg2.car)
                    else
                        writeln; 

                    if (t mod 40 = 0) then
                        begin
                            readln;
                            clrscr;
                            CABECA(op, ' ');
                        end;
                end;
        end;

    readln; 
    close(arq2);
end. 
