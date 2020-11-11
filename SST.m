function y = SST(A, b)
  
   % Aflu dimensiunile lui A
   [n m] = size(A); 
   
    % Initializez y - vectorul solutie 
    y = zeros(n, 1);
    
    % Calculez elementul de pe ultima pozitie
    y(n) = b(n) / A(n, n);
    
    % Pentru fiecare linie (ecuatie) din A de jos in sus calculez solutia
    for i = (n - 1) : (-1) : 1
      y(i)=(b(i) - A(i, (i + 1):n) * y((i + 1) : n)) / A(i, i);
    endfor
endfunction
    