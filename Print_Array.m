function [] = Print_Array(R, N, g)
  
   % Scriu R in fisierul g element cu element
  for i = 1 : N
    fprintf(g, '%.6f\n', R(i, 1));
  endfor
  
   % Un rand liber dupa R
  fprintf(g, '\n');
endfunction
