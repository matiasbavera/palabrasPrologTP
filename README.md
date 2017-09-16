Instrucciones de Uso

Para obtener la solución es necesario tener en la base de conocimiento todas las pistas. Una vez cargadas las pistas, se debe ejecutar el siguiente predicado: 

?- fin(R).
Con lo cual se calculará la solución al problema, y de encontrarse, se asignará a R. 

Predicados

resolver
Toma todas las pistas disponibles, tanto las letras como los números de letras que tienen que coincidir con la palabra oculta.
Lo primero que hace es tomar las palabras y colocar todas las letras que están en la misma posición y se las colocan en una lista. 
Luego a cada lista se le quitan las letras repetidas, con las que a continuación se irá iterando y validando para generar la nueva palabra.

resolver2
Actúa de la misma forma que resolver pero en este caso se le envía una matriz con las 5 palabras que se encontraron con resolver.

comparar
Toma cada palabra de cada bloque de pista y la cantidad de números de letras que tienen que coincidir y la compara con la palabra que se generó al iterar las letras para ver si cumple con los requisitos.

cantidad_pistas_palabra
Son los números que nos indican cuántas letras tienen que coincidir de cada palabra que se nos da como pista en la palabra oculta.

lista_pistas_palabra
Crea una lista de listas donde se guardan las palabras de cada bloque.

asignar_letra
Asigna un elemento de una lista a una variable. En nuestro caso asigna letras de una lista a una variable para poder tomar distintos valores para realizar las validaciones.

distinct
Convierte una lista con elementos, a una lista sin elementos repetidos.
