program testeOpenREG;
uses MODULOS;

var
    F   :   file of regis;
    reg :   regis;
    name : string;

BEGIN
    assign(F, 'CAND.IND');
    reset(F);

    while not eof(F) do
        begin
            read(F, reg);
            writeln(reg.nome);
        end;

    close(F);
end.
