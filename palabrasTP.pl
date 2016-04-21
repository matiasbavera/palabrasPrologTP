:- use_module(library(clpfd), except([transpose/2])).

pista(2,['c','o','r','t','e'],1).
pista(1,['m','a','n','d','e'],2).
pista(1,['c','o','n','d','e'],2).
pista(1,['m','e','l','l','o'],2).
pista(1,['s','a','l','t','o'],3).

/*--------DEFINICIONES--------*/
% list_transpose Transponer la matriz para que se obtener las columnas

/*-----------MAIN-----------------*/
palabras:- lista_pistas_palabra(1,R), clpfd:lists_transpose(R,Trans), print(Trans), ocurre(c,Trans,L), print(L).

/*----------MANEJO DE LISTAS ----------------*/
% Determina si lo que recibe es una lista
lista([]):-!.
lista([X|Y]):-lista(Y).

% Cuenta la cantidad de ocurrencias de un valor en una lista
ocurre(X,[],0):-!.
ocurre(X,[X|L],S):-ocurre(X,L,T),!,S is T+1.
ocurre(X,[Z|L],S):-lista(Z),ocurre(X,Z,T),ocurre(X,L,R),!,S is R+T.
ocurre(X,[Z|L],S):-X\=Z,ocurre(X,L,S),!.

%agrupar por cantidad de letras necesarias 
cantidad_pistas_palabra(Bloque,R):-bagof(R, B^pista(Bloque, B, R), R).

%agrupar por palabras
lista_pistas_palabra(Bloque,R):-bagof(R, C^pista(Bloque, R, C), R).

/*-------------------------- ASIG -------------------*/

%palabra:- lista_pistas_palabra(1,R), X = [A,B,C,D,E], clpfd:lists_transpose(R, Transp), assign_digits(X,Transp), write(X).

%Ejemplo sendmoremoney
/*smm :-
        X = [A,B,C,D,E],
        Digits = [0,1,2,3,4,5,6,7,8,9],
        assign_digits(X, Digits),
        M > 0, 
        S > 0,
                  1000*S + 100*E + 10*N + D +
                  1000*M + 100*O + 10*R + E =:=
        10000*M + 1000*O + 100*N + 10*E + Y,
        write(X).
*/


select(X, [X|R], R).
select(X, [Y|Xs], [Y|Ys]):- select(X, Xs, Ys).

assign_digits([], _List).
assign_digits([D|Ds], List):-
        select(D, List, NewList),
        assign_digits(Ds, NewList).



