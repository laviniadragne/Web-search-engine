function [M N]  = Prelucrare_Date(nume)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
	% Deschid fisierul 'nume' pentru citire
  	f = fopen(nume, 'r');
    % Memorez N = numarul de noduri
    N = fscanf(f, '%d\n', 1);
    % Declar matricile A, M si vectorul vecini
    % Vectorul vecini contine pe pozitia i numarul de vecini pe care il are
    % elementul i
    A = zeros(N, N);
    M = zeros(N, N);
    vecini = ones(N, 1);
    
    % Parcurg graful
    for i = 1 : N
      % Citesc numarul nodului si ii memorez numarul de vecini
      nod = fscanf(f, '%d', 1);
      vecini(nod, 1) = fscanf(f, '%d', 1);
      % ok va retine daca exista nod de la i la i
      ok = 0;
      
      % Citesc fiecare vecin pentru 'nod'
      for j = 1 : vecini(nod, 1)
        nod_vecin = fscanf(f, '%d', 1);
        
        % Daca are legatura catre el insusi
        if(nod_vecin == nod) 
          ok = 1;
        else
          A(nod, nod_vecin) = 1;
        endif
      endfor
      
      % Daca avea legatura catre el insusi scad numarul de vecini
      if(ok == 1)
        vecini(nod, 1)--;
      endif
    endfor
    
    % Calculez elementele din M, conform formulei
    for i = 1 : N
     for j = 1 : N
       if(A(j, i) == 1) 
          M(i, j) = 1 / vecini(j, 1);
       endif
     endfor
   endfor
   
   %Inchid fisierul
   fclose(f);
 endfunction
 
  