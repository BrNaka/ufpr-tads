program T09T03;
uses crt, MODULOS;

type a15 = string[15];

var 
    reg2                                 :   regis;
    arq2                                 :   file of regis;
    a, b, c, p, e, t, PAG, pfc, op       :   integer;
    vet2                                 :   vetor;
    sn                                   :   char;

PROCEDURE CABECA(ord : a15; option : integer);{MODULO ESPECIFICO PARA ESTE PROGRAMA}
    BEGIN
        PAG := PAG + 1;
        WRITELN('                         RELATORIO GERAL - ORDEM ',ord,'              PAGINA:',PAG:3);
        case option of
            1 : write('              #');
            2 : write('        #'); 
            3 : write('                                                     #');
            4 : write('                                                                ##');
        end;
        WRITELN;
        write('  ORD  NUM N O M E                              ===C P F=== NASCIMENTO CS  N1');
        WRITELN('  N2  N3  N4  SO  CG CC CV');
    END;

FUNCTION MENU():integer;
    var 
        option : integer; 
    begin
        writeln();
        writeln('    MENU DE ORDENAÇÃO');
        writeln('       ORDENAR POR:  '); 
        writeln();
        writeln('| 1 | NOME (ORDEM ALFABÉTICA)');
        writeln('| 2 | INSCRIÇÃO');
        writeln('| 3 | CPF');
        writeln('| 4 | DATA DE NASCIMENTO');
        writeln();
        write('Qual operação deseja realizar? ');
        read(option);
        MENU := option; 
     end;

  
begin

   sn := 's';
   repeat 
        e := 1;
        pfc := 0;
        t := 0;

        op := MENU();
        assign(arq2,'CAND.IND');

        CABECA('GRAVACAO', op);
        reset(arq2);

        while not(eof(arq2)) do
            begin
                read(arq2, reg2);
                case op of 
                    1: vet2[pfc + 1].c_chave := reg2.nome;
                    2: str(reg2.num:4, vet2[pfc + 1].c_chave);
                    3: vet2[pfc + 1].c_chave := reg2.cpf;
                    4: vet2[pfc + 1].c_chave := reg2.data;
                end;
                vet2[pfc + 1].pf := pfc;
                pfc := pfc + 1;
            end;

        ordem(vet2, pfc);
        e := 1;

        while (e <= pfc) do
            begin
                seek(arq2, vet2[t+1].pf);
                read(arq2, reg2);
                t := t+1;
                writeln(t:5,reg2.num:5,' ',REG2.nome,' ',reg2.cpf,' ',copy(reg2.data,7,2),'/',copy(reg2.data,5,2),'/',copy(reg2.data,1,4),reg2.car:3,reg2.n1:4,reg2.n2:4,REG2.N3:4,REG2.N4:4,reg2.so:4,reg2.clg:4,reg2.clc:3,reg2.ccl:3 );  
                if(t MOD 40 = 0) THEN
                    BEGIN
                        readln;
                        CABECA('GRAVACAO', op);
                    end;
                e := e + 1;
        end; 

        close(arq2);
        writeln('lidos=',t:5);
        writeln();
        write('Deseja fazer outra operação? (s/n): '); 
        read(sn);
    until(sn = 'n');
end.
