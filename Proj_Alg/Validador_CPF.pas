Program CPF_Validator;
var cpfs : array[1..100] of String;
		validation : array[1..100] of String;
		i, x, indx, number, code, somaD1, somaD2, D1, D2, digito1, digito2, N1, N2 : integer;

Begin

	writeln('Informe uma sequência de CPFs. Digite o número zero para encerrar o programa!');
	
  for i := 1 to 100 do
  begin
    write('CPF: ');
    readln(cpfs[i]);
    if(cpfs[i] = '0') then
    break;
    indx := i;
  end;
  
  code := 0;
  
  for i := 1 to indx do
  	begin
    	D1 := 10;
    	D2 := 11;
    	somaD1 := 0;
    	somaD2 := 0;
    	writeln();
    
    	for x := 1 to 9 do
    		begin
      		val(cpfs[i][x], number, code);
      		somaD1 := somaD1 + (number * D1);
      		somaD2 := somaD2 + (number * D2);
      		D1 := D1 - 1;
      		D2 := D2 - 1;
    		end;
    
    	val(cpfs[i][10], N1, code);
    	val(cpfs[i][11], N2, code);
    
    	digito1 := somaD1 mod 11;
    
    	if(digito1 = 1) or (digito1 = 0) then
    		digito1 := 0
    	else
    		digito1:= 11 - digito1;
    
    	digito2 := (somaD2 + (digito1 * 2)) mod 11;
    
    	if(digito2 = 1) or (digito2 = 0) then
    		digito2 := 0
    	else
    		digito2 := 11 - digito2;
    
    	if(digito1 <> N1) or (digito2 <> N2) then
    		validation[i] := 'Inválido'
    	else
    		validation[i] := 'Válido';
  end;
  
  for i := 1 to indx do
  	writeln('CPF: ', cpfs[i], ' | ', validation[i]);
  
  readln();
  	
End.