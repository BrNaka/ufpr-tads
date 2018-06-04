Program T09T03;
uses Crt, MODULOS; 

var
    candIND        :  file of regis; 
    reg            :  regis;
    vet2           :  vetor;
    pfCount, count :  integer;

begin
    assign(candIND, 'CAND.IND');
    reset(candIND);

    while not eof(candIND) do
        begin
            read(candIND, reg);
            vet2[pfCount+1].c_chave := reg.nome;
            vet2[pfCount+1].pf := pfCount;
            pfCount := pfCount+1;
        end;

    ordem(vet2, pfCount);

    for count := 1 to pfCount do
        writeln(vet2[count].c_chave, ' ', vet2[count].pf);

    readln;
end.



