program T09T03;
uses crt, MODULOS;

type a15 = string[15];

var 
    reg2                                 :   regis;
    arq2                                 :   file of regis;
    e, t, PAG, pfc, op                   :   integer;
    vet2                                 :   vetor;
    strings                              :   string;

PROCEDURE CABECA(option : integer); {MODULO ESPECIFICO PARA ESTE PROGRAMA}
    BEGIN
        PAG := PAG + 1;
        case op of 
            1: WRITELN('                 CLASSIFICADOS NAS VAGAS EM ORDEM ALFABETICA                 PAGINA:',PAG:3);
            2: WRITELN('                             CLASSIFICACAO GERAL                             PAGINA:',PAG:3);
            3: WRITELN('                           CLASSIFICACAO POR CARGO                           PAGINA:',PAG:3);
        end;
        WRITELN;
        write('  ORD  NUM N O M E                              ===C P F=== NASCIMENTO CS  N1');
        WRITELN('  N2  N3  N4  SO  CLASS_GERAL CLASS_CARGO CLASS_VAGA');
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
        writeln('| 2 | CLASSIFICAÇÃO GERAL');
        writeln('| 3 | CLASSIFICAÇÃO POR CARGO');
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

    assign(arq2,'CAND.IND');
    reset(arq2);

    while not(eof(arq2)) do
        begin
            read(arq2, reg2);
            case op of 
                1: vet2[pfc + 1].c_chave := reg2.nome;
                2: str(reg2.clg:4, vet2[pfc + 1].c_chave);
                3: 
                    begin
                        str(reg2.car:1, strings); 
                        vet2[pfc + 1].c_chave := vet2[pfc + 1].c_chave + strings;
                        str(reg2.clc:3, strings); 
                        vet2[pfc + 1].c_chave := vet2[pfc + 1].c_chave + strings;
                    end;
            end;
            vet2[pfc + 1].pf := pfc;
            pfc := pfc + 1;
        end;

    CABECA(op);
    ordem(vet2, pfc);
    e := 1;

    while (e <= pfc) do
        begin
            seek(arq2, vet2[e].pf);
            read(arq2, reg2);

            e := e + 1;

            if (op = 1)  and (reg2.ccl = 0) then 
                continue;
            t := t + 1;
            if (t MOD 15 = 0) then
                begin
                    readln;
                    CABECA(op);
                end;
            writeln(t:5,reg2.num:5,' ',REG2.nome,' ',reg2.cpf,' ',copy(reg2.data,7,2),'/',copy(reg2.data,5,2),'/',copy(reg2.data,1,4),reg2.car:3,reg2.n1:4,reg2.n2:4,REG2.N3:4,REG2.N4:4,reg2.so:4,reg2.clg:9,reg2.clc:12,reg2.ccl:11);  
        end; 

    close(arq2);
    writeln('lidos=',t:5);
end.
