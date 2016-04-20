:- use_module(library(clpfd), except([transpose/2])).
%:- use_module(library(clpfd)).

pista(2,['c','o','r','t','e'], 1).
pista(1,['m','a','n','d','e'],2).
pista(1,['c','o','n','d','e'],2).
pista(1,['m','e','l','l','o'],2).
pista(1,['s','a','l','t','o'],3).




% Determina si lo que recibe es una lista
lista([]):-!.
lista([X|Y]):-lista(Y).



occurrences(_, [], []).
occurrences(X, [X|Ls], [X|Rest]) :- occurrences(X, Ls, Rest).
occurrences(X, [L|Ls], Rest) :- dif(X, L), occurrences(X, Ls, Rest).


% Cuenta la cantidad de ocurrencias de un valor en una lista
ocurre(X,[],0):-!.
ocurre(X,[X|L],S):-ocurre(X,L,T),!,S is T+1.
ocurre(X,[Z|L],S):-lista(Z),ocurre(X,Z,T),ocurre(X,L,R),!,S is R+T.
ocurre(X,[Z|L],S):-X\=Z,ocurre(X,L,S),!.


%agrupar por cantidad de letras necesarias 
cantidad_pistas_palabra(Bloque,R):-bagof(R, B^pista(Bloque, B, R), R).

%agrupar por palabras
lista_pistas_palabra(Bloque,R):-bagof(R, C^pista(Bloque, R, C), R).

% Transponer la matriz para que se obtener las columnas
%clpfd:lists_transpose(M, T).

