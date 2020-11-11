function [x_sort] = Sort_Descr(x)
  
  % Functia sorteaza descrescator un vector primit ca si parametru
  
  % Aflu dimensiunea vectorului
  n = length(x);
  
  % x_sort va fi vectorul sortat
  x_sort = x;
  
  % Il sortez
  for i = 1 : (n - 1)
    for j = (i + 1) : n
      if(x_sort(i) < x_sort(j))
        aux = x_sort(i);
        x_sort(i) = x_sort(j);
        x_sort(j) = aux;
      endif
    endfor
  endfor
  
endfunction
