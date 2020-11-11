function [poz] = Find_Index (X, a)
  % Functia cauta elementul a in vectorul a si returneaza pozitia pe care se afla acesta
  % in vector
  
  % Aflu dimensiunea lui X
  n = length(X);
  % Initializez pozitia din vector cu -1
  poz = -1;
  
  % Parcurg vectorul si caut elementul a
  for i = 1 : n
    if(a == X(i)) 
      poz = i;
      break;
    endif
  endfor
  
endfunction

