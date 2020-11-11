function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	
    [M N] = Prelucrare_Date(nume);
  
    % Initializez vectorul R
    R = zeros(N, 1);
    % v_unu va fi vectorul coloana de 1
    v_unu = ones(N, 1);
    I = eye(N);
    
    % Calculez inversa cu Gram-Schmidt
    inversa = PR_Inv(I - d * M);
    % Calculez R cu formula din enunt
    R = inversa * (((1 - d) / N) * v_unu);
    
endfunction
  