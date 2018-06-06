Program T09T04;
uses MODULOS, sysutils, crt;

type a50 = string[50];
     a15 = string[15];
var
    provaTXT                             :       text;
    reg                                  :       regis;       
    candIND                              :       file of regis;
    candNUM                              :       vetor;
    indx, posFIS, op, pos, x, e, beg     :       integer;
    CE1, BR1, ER1, CE2, BR2, ER2, PAG    :       integer;
    soma1, soma2                         :       real;
    gabarito, respostas                  :       a50;
    line                                 :       string;
    letra                                :       char;
    ext                                  :       a36;

function option ():integer;
    var op : integer;
    Begin
        Repeat
            writeln('-- CORRIGIR -- ');
            writeln('| 1 | Prova 1');
            writeln('| 2 | Prova 2');
            writeln();
            writeln('ESCOLHA SUA OPCAO (1 ou 2): ');
            readln(op);
            option := op;
            writeln();
        until ((op > 0) and (op < 3));  
    End;

procedure readGab (var vetor : a50; op : integer);
    var beg : integer;
        validation : boolean;
    Begin
        for beg:=1 to 50 do
            begin
                repeat
                    case op of
                        1: write('Prova 1 - ', 'Questão ', beg, ' - Resp: ');
                        2: write('Prova 2 - ', 'Questão ', beg, ' - Resp: ');
                    end;
                    readln(vetor[beg]);
                    letra := UpCase(vetor[beg]);
                    vetor := vetor + letra;
                    validation := (letra = 'A') or (letra = 'B') or (letra = 'C') or (letra = 'D') or (letra = 'E'); 
                    if(not validation) then
                        writeln('VOCE INFORMOU UMA RESPOSTA INVALIDA');
                        writeln('-----------------------------------');
                until(validation); 
            end;
    End;

procedure cabecalho(ord : a15; disc1 : a15; disc2 : a15);
    Begin
        PAG := PAG + 1;
        writeln('                      RELATORIO CORRECAO - ORDEM ', ord, '              PAGINA:',PAG:3);
        writeln;
        writeln('                                                    ', disc1,'                ',disc2);
        writeln('  NUM N O M E                                 CE    ER    BR    NOT    CE    ER    BR   NOT ');
    end; 
        
BEGIN
    indx := 1;
    posFIS := 0;
    beg := 1;
    PAG := 0;

    assign(candIND, 'CAND.IND');
    reset(candIND);
    
    while not eof(candIND) do 
        begin
            read(candIND, reg);
            str(reg.num:4, candNUM[indx].c_chave);
            candNUM[indx].pf := posFIS;
            indx := indx+1;
            posFIS := posFIS+1;
        end;

    ordem(candNUM, posFIS);

    op := option();

    case op of
        1: 
            begin
                assign(provaTXT, 'prova1.txt');
                reset(provaTXT);
            end;
        2:
            begin
                assign(provaTXT, 'prova2.txt');
                reset(provaTXT);
            end;
    end;

    readGab(gabarito, op);
    beg := 0;
    soma1 := 0;
    soma2 := 0;

    case op of
        1: cabecalho('INSCRICAO', 'PORTUGUES', 'MATEMATICA');
        2: cabecalho('INSCRICAO', 'CON. ESPE.', 'INFORMATICA');
    end;

    while not eof(provaTXT) do
        begin
            CE1 := 0;
            BR1 := 0;
            ER1 := 0;
            CE2 := 0;
            BR2 := 0;
            ER2 := 0;
            beg := beg + 1;

            readln(provaTXT, line);
            respostas := copy(line, 5, 50);

            ext := copy(line, 1, 4);
            val(ext, pos, e);
            str(pos:4, ext); 
            pebin1(candNUM, ext, posFIS, x);

            seek(candIND, candNUM[x].pf);
            read(candIND, reg);

            for indx:=1 to 25 do
                if (upCase(gabarito[indx]) = respostas[indx]) then
                    CE1 := CE1 + 1
                else if (respostas[indx] = ' ') then
                    BR1 := BR1 + 1
                else
                    ER1 := ER1 + 1;
            
            for indx:=26 to 50 do
                if (upCase(gabarito[indx]) = respostas[indx]) then
                    CE2 := CE2 + 1
                else if (respostas[indx] = ' ') then
                    BR2 := BR2 + 1
                else
                    ER2 := ER2 + 1;

            case op of
                1: 
                    Begin
                        reg.n1 := CE1*4;
                        reg.n2 := CE2*4;
                    end;
                2: 
                    Begin
                        reg.n3 := CE1*4;
                        reg.n4 := CE2*4;
                    end;
            end;

            soma1 := soma1 + (CE1*4);
            soma2 := soma2 + (CE2*4);
            
            writeln(reg.num:5, ' ', reg.nome, ' ', CE1:5, ' ',  ER1:5, ' ',  BR1:5, ' ',  CE1*4:6, ' ',  CE2:5, ' ', ER2:5, ' ', BR2:5, ' ', CE2*4:5);
            if(beg mod 40 = 0) then
                begin
                    readln;
                    case op of
                        1: cabecalho('INSCRICAO', 'PORTUGUES', 'MATEMATICA');
                        2: cabecalho('INSCRICAO', 'CON. ESPE.', 'INFORMATICA');
                    end;
                end;

            reg.so := reg.n1 + reg.n2 + reg.n3 + reg.n4;            

            seek(candIND, candNUM[x].pf);
            write(candIND, reg);
        end;

        writeln;
        writeln;
        writeln('                    RELATORIO CORRECAO - MEDIAS       PAGINA: ', PAG+1);
        writeln;

        case op of
        1: 
            Begin
                writeln('                               PORTUGUES ===    ', soma1/posFIS:0:2);
                writeln;
                writeln('                              MATEMÁTICA ===    ', soma2/posFIS:0:2);
            end;
        2:
            Begin
                writeln('                        CONHECIMENTOS ESPECÍFICOS === ', soma1/posFIS:0:2);
                writeln;   
                writeln('                               INFORMÁTICA        === ', soma2/posFIS:0:2);
            end;
        end;

        writeln;
        readln; 

    close(candIND);
END. 
