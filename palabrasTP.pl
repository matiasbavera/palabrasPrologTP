:- use_module(library(clpfd), except([transpose/2])).

pista(1,['c','o','r','t','e'],1).
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


/* compara los elementos de cada lista por posicion, y dice los lugares donde coinciden las letras, cuenta las repeticiones*/
comparar([],[],0,0):-!.
comparar([X|L],[X|N], R, Cont):- comparar(L,N,T, Gcont),!, R is T+1, Cont is Gcont + 1, write(Gcont).
comparar([X|L],[M|N], R, Cont):- comparar(L,N,R,Gcont),!,  Cont is Gcont +1.
comparar([X|L],[M|N], R, Cont):- comparar(L,N,R,Cont),!.

/*-------------------------- ASIG -------------------*/


%palabra:- lista_pistas_palabra(1,R), X = [A,B,C,D,E], clpfd:lists_transpose(R, Transp), assign_digits(X,Transp), write(X).

%Ejemplo sendmoremoney


smm2 :-
        X = [A,B,C,D,E],
        Digits1 = [c,m,c,m,s],
        Digits2 = [o,a,o,e,a],
        Digits3 = [r,n,n,l,l],
        Digits4 = [t,d,d,l,t],
        Digits5 = [e,e,e,o,o],

        assign_digits(A, Digits1),
       /* assign_digits(B, Digits2),
        assign_digits(C, Digits3),
        assign_digits(D, Digits4),
        assign_digits(E, Digits5),*/

       %agrupar por palabras
		 write(A), ocurre(A,['c','o','r','t','e'],L), L>1, write(X).


      /*  M > 0,
        S > 0,
                  1000*S + 100*E + 10*N + D +
                  1000*M + 100*O + 10*R + E =:=
        10000*M + 1000*O + 100*N + 10*E + Y, */

/*smm :-
        X = [S,E,N,D,M,O,R,Y],
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
assign_digits([D|Ds], t):-
        select(D, List, NewList),
        assign_digits(Ds, NewList).



/*situation calculus
ejercicos de planeamiento
*/
