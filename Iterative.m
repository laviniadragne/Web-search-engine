function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
    [M N] = Prelucrare_Date(nume);
  
    % Initializez vectorii R si R_initial
    R = zeros(N, 1);
    R_initial = zeros(N, 1);
    R(:, 1) = 1 / N;
    % v_unu va fi vectorul coloana de 1
    v_unu = ones(N, 1);
    
   while(1)
   % Conditia de oprire
    if(norm(R - R_initial) < eps) 
        break;
    endif
    
    R_initial = R;
    R = d * M * R_initial + ((1 - d) / N) * v_unu;
  endwhile
  
  % R ca lua valoarea de la penultima iteratie, adica R(t), nu R(t+1)
  R = R_initial;
    
endfunction
