:-use_module(library(clpfd), except([transpose/2])).

pista(1, ['c', 'o', 'r', 't', 'e'], 1).
pista(1, ['m', 'a', 'n', 'd', 'e'], 2).
pista(1, ['c', 'o', 'n', 'd', 'e'], 2).
pista(1, ['m', 'e', 'l', 'l', 'o'], 2).
pista(1, ['s', 'a', 'l', 't', 'o'], 3).

pista(2, ['p', 'a', 's', 't', 'a'], 1).
pista(2, ['c', 'a', 'n', 't', 'a'], 2).
pista(2, ['p', 'a', 'r', 'd', 'o'], 2).
pista(2, ['p', 'e', 'n', 'd', 'e'], 2).
pista(2, ['c', 'e', 'r', 'r', 'o'], 3).

pista(3, ['c', 'o', 'r', 't', 'e'], 1).
pista(3, ['c', 'a', 'l', 'm', 'a'], 2).
pista(3, ['c', 'e', 'l', 'd', 'a'], 2).
pista(3, ['b', 'a', 's', 't', 'a'], 2).
pista(3, ['b', 'a', 'n', 'd', 'a'], 3).

pista(4, ['t', 'a', 'b', 'l', 'a'], 1).
pista(4, ['c', 'e', 'l', 'd', 'a'], 2).
pista(4, ['m', 'a', 'l', 'l', 'a'], 2).
pista(4, ['c', 'e', 'n', 's', 'o'], 2).
pista(4, ['s', 'a', 'l', 't', 'o'], 3).

pista(5, ['c', 'a', 'b', 'l', 'e'], 1).
pista(5, ['b', 'a', 'r', 'r', 'e'], 2).
pista(5, ['b', 'a', 's', 't', 'a'], 2).
pista(5, ['c', 'o', 'r', 't', 'e'], 2).
pista(5, ['c', 'o', 'p', 'l', 'a'], 3).

pista(6, [], 1).
pista(6, [], 2).
pista(6, [], 2).
pista(6, [], 3).
pista(6, [], 3).



% Cargar pistas
cantidad_pistas_palabra(Bloque, R):-bagof(R, B^pista(Bloque, B, R), R).
lista_pistas_palabra(Bloque, R):-bagof(R, C^pista(Bloque, R, C), R).


distinct([],[]).
distinct([H|T],C) :- member1(H,T),!, distinct(T,C).
distinct([H|T],[H|C]) :- distinct(T,C).

member1(X,[H|_]) :- X==H,!.
member1(X,[_|T]) :- member1(X,T).

% Iteradores de pistas
asignar_letra([], _):-false.
asignar_letra([H|_], H):-true.
asignar_letra([_|T], R):-asignar_letra(T, R).

% Validaci�n de letras
comparar([],[],0):-!.
comparar([X|L],[X|N], R):-
	comparar(L,N,T),
	!,
	R is T+1.
comparar([_|L],[_|N], R):-
	comparar(L,N,R),
	!.



resolver(X,M):-
	lista_pistas_palabra(X, P),
	cantidad_pistas_palabra(X, K),
	clpfd:transpose(P, T),
	% Pistas
	P = [F1, F2, F3, F4, F5],
	% Pistas transpuestas
	T = [T1, T2, T3, T4, T5],
	% Cantidad por fila
	K = [K1, K2, K3, K4, K5],

	distinct(T1,Rec1),
	distinct(T2,Rec2),
	distinct(T3,Rec3),
	distinct(T4,Rec4),
	distinct(T5,Rec5),

%	Recortado = [Rec1, Rec2, Rec3, Rec4, Rec5],
	% Iterar sobre las letras correspondientes
	asignar_letra(Rec1, A),
	asignar_letra(Rec2, B),
	asignar_letra(Rec3, C),
	asignar_letra(Rec4, D),
	asignar_letra(Rec5, E),
	M=[A, B, C, D, E],


	% Validar que las letras son correctas
	comparar(M, F1, K1),
	comparar(M, F2, K2),
	comparar(M, F3, K3),
	comparar(M, F4, K4),
	comparar(M, F5, K5).


resolver2(X,Z,M):-
	%lista_pistas_palabra(X, P),
	%write(Z),
	cantidad_pistas_palabra(X, K),
	clpfd:transpose(Z, T),
	% Pistas
	Z = [F1, F2, F3, F4, F5],
	% Pistas transpuestas
	T = [T1, T2, T3, T4, T5],
	% Cantidad por fila
	K = [K1, K2, K3, K4, K5],

	distinct(T1,Rec1),
	distinct(T2,Rec2),
	distinct(T3,Rec3),
	distinct(T4,Rec4),
	distinct(T5,Rec5),

%	Recortado = [Rec1, Rec2, Rec3, Rec4, Rec5],
	% Iterar sobre las letras correspondientes
	asignar_letra(Rec1, A),
	asignar_letra(Rec2, B),
	asignar_letra(Rec3, C),
	asignar_letra(Rec4, D),
	asignar_letra(Rec5, E),
	M=[A, B, C, D, E],

	%write(M),write("\n"),
	% Validar que las letras son correctas
	comparar(M, F1, K1),
	comparar(M, F2, K2),
	comparar(M, F3, K3),
	comparar(M, F4, K4),
	comparar(M, F5, K5).


fin(R):-
	resolver(1,N1),
	resolver(2,N2),
	resolver(3,N3),
	resolver(4,N4),
	resolver(5,N5),
	N = [N1,N2,N3,N4,N5],
 write(N),
	resolver2(6,N,R),!.
