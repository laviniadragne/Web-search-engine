function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt 
  
  % Aflu dimensiunile lui A
  [n m] = size(A);
  % Initializez R si Q
  R = zeros(m, m);
  Q = A;
  
  % Parcurg coloanele din A
  for k = 1 : m
    
    % r va fi linia k din R
    r = zeros(1, m);
    % q va fi coloana k din Q
    q = Q(:, k);
    
    % Calculez elementul R(k, k) si a k-a coloana din Q
    r(k) = norm(q);
    q = q / r(k);
    
    for i = (k + 1) : m
        
        % q1 este a i-a coloana din Q
        q1 = Q(:, i);
        r(i) = q' * q1;
        q1 = q1 - q * r(i);
        Q(:, i) = q1;
    endfor
    
    % Actualizez matricile Q si R
    R(k, :) = r;
    Q(:, k) = q;
  endfor
  
    % Calculez inversa matricei A,
    % rezolvand n sisteme superior triunghiulare
    B = zeros(m, m);
    I = eye(m);
    
    for j = 1 : m
        B(:, j) = SST(R, Q'(:, j));
    endfor
    
endfunction 