function [R1 R2] = PageRank(nume, d, eps)
  
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  % Formez numele fiserului de iesire
  name_out = strcat(nume, '.out');
  
  % Deschid fisierul in care trebui sa scriu datele de iesire 
  g = fopen(name_out, 'w');
  % Deschid fisierul 'nume', cu datele de intrare
  f = fopen(nume, 'r');
  
  % Memorez N = numarul de noduri
  N = fscanf(f, '%d\n', 1);
  
  % Citesc liniile cu datele despre noduri si nu le memorez pentru ca
  % nu am nevoie de ele
  for i = 1 : N
    line = fgets(f);
  endfor
  
  % Memorez val1 si val2, aflandu-se pe ultimele 2 linii din fisier
  line = fgets(f);
  val1 = str2double(line);
  line = fgets(f);
  val2 = str2double(line);
  
  % Inchid fisierul de intrare
  fclose(f);
  
  % Scriu in fisierul de iesire numarul de noduri 
  fprintf(g, '%d\n\n', N);
    
  % Calculez vectorul PR de la primul algoritm
  R1 = Iterative(nume, d, eps);
  % Scriu R1 in fisierul out
  Print_Array(R1, N, g);
  
  % Calculez vectorul PR de la al doilea algoritm
  R2 = Algebraic(nume, d);
  % Scriu R2 in fisierul out
  Print_Array(R2, N, g);
  
  % Sortez cel de-al doilea vector descrescator
  PR2 = Sort_Descr(R2);
  
  % Pentru fiecare nod
  for i = 1 : N
    
    % Scriu indicele i al lui PR2
    fprintf(g, '%d ', i);
    
    % Calculez F
    F = Apartenenta(PR2(i), val1, val2);
    
    % Caut pe ce pozitie din vectorul R2 se afla elementul PR2(i)
    index = Find_Index(R2, PR2(i));
    
    % Scriu in fisier index si F cu o precizie de 6 zecimale
    fprintf(g, '%d %.6f\n', index, F);
    
  endfor
  
  % Inchid fisierul
  fclose(g);
  
endfunction
