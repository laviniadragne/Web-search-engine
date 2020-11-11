function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  
  % Calculez a si b
  a = (double) (1 / (double) (val2 - val1));
  b = (-a) * val1;
  
  % Daca nu exista intervalul val1, val2, interschimb val1 cu val2
  if(val1 > val2)
    aux = val2;
    val2 = val1;
    val1 = aux;
  endif
  
  % Verific pe care din ramurile functiei u trebuie calculat u(x)
  % tinand cont de intervalul in care se afla x
  if((x < val1) && (x >= 0)) 
    y = 0;
  else 
    if((x >= val1) && (x <= val2))
      y = a * x + b;
    else
      if((x > val2) && (x <= 1))
        y = 1;
      endif
    endif
  endif
  
endfunction

	