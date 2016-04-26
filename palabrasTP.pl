:-use_module(library(clpfd), except([transpose/2])).

pista(1, ['c', 'o', 'r', 't', 'e'], 1).
pista(1, ['m', 'a', 'n', 'd', 'e'], 2).
pista(1, ['c', 'o', 'n', 'd', 'e'], 2).
pista(1, ['m', 'e', 'l', 'l', 'o'], 2).
pista(1, ['s', 'a', 'l', 't', 'o'], 3).

% Cargar pistas
cantidad_pistas_palabra(Bloque, R):-bagof(R, B^pista(Bloque, B, R), R).
lista_pistas_palabra(Bloque, R):-bagof(R, C^pista(Bloque, R, C), R).

% Iteradores de pistas
asignar_letra([], _):-false.
asignar_letra([H|T], H):-true.
asignar_letra([H|T], R):-asignar_letra(T, R).

% Validaci�n de letras
comparar([],[],0):-!.
comparar([X|L],[X|N], R):-
	comparar(L,N,T),
	!,
	R is T+1.
comparar([X|L],[M|N], R):-
	comparar(L,N,R),
	!.
comparar([X|L],[M|N], R):-
	comparar(L,N,R),!.


resolver(M):-
	lista_pistas_palabra(1, P),
	cantidad_pistas_palabra(1, K),
	clpfd:transpose(P, T),

	% Pistas
	P = [F1, F2, F3, F4, F5],
	% Pistas transpuestas
	T = [T1, T2, T3, T4, T5],
	% Cantidad por fila
	K = [K1, K2, K3, K4, K5],

	% Iterar sobre las letras correspondientes
	asignar_letra(T1, A),
	asignar_letra(T2, B),
	asignar_letra(T3, C),
	asignar_letra(T4, D),
	asignar_letra(T5, E),
	M=[A, B, C, D, E],

	% Validar que las letras son correctas
	comparar(M, F1, K1),
	comparar(M, F2, K2),
	comparar(M, F3, K3),
	comparar(M, F4, K4),
	comparar(M, F5, K5).
