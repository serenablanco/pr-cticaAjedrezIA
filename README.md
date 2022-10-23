# PRÁCTICA 1: REGLAS DEL AJEDREZ

#### Esta práctica consiste en el desarrollo de las reglas de ajedrez, en concreto, los movimientos posibles para cada pieza.

## HECHOS
#### Los hechos son datos que ya vienen definidos, como pueden ser las piezas que hay en el tablero, sus posiciones iniciales y el color de cada pieza (blancas o negras)

### Números correspondientes a las columnas
#### Las columnas del tablero de ajedrez se representan con letras de la A a la H, pero para poder hacer las reglas del ajedrez necesitamos que esas letras sean números, por lo que los pirmeros hechos son los números que corresponden a cada letra del tablero.
![numColHechos](https://user-images.githubusercontent.com/72817265/197282861-e8fb9a5f-4f84-4d22-a534-25be6c304e3e.png)

### Piezas en el tablero
#### Van a estra presentes en el tablero todas las piezas menos los peones. Para cada color habrá: un rey, una reina, dos alfiles, dos caballos y dos torres.
![piezasHechos](https://user-images.githubusercontent.com/72817265/197284038-3b4b3f10-68d7-495d-bf2a-f4d4e4b62a01.png)

### Color de cada pieza 
#### Dividimos las piezas que hay en el tablero en blancas y negras.
![colorPiezasHechos](https://user-images.githubusercontent.com/72817265/197326140-c41b9787-7de7-40b7-a317-d9899aa0d351.png)

### Asignamos una casilla a cada pieza
#### Las piezas tendrán asignada una posición en el tablero inicial. A lo largo de la ejecuciñon de las reglas esta posición puede cambiar, por lo que tendremos que indicar que son hechos dinámicos (dynamic).
![casillasPiezasHechos](https://user-images.githubusercontent.com/72817265/197326202-fe68fc7f-ab1f-4a7f-aad4-a259891d6550.png)


## REGLAS
#### Estas reglas condicionarán los movimientos que pueden realizar las piezas en el tablero.

### Casillas Válidas
#### Esta regla define las casillas válidas por las que se pueden mover las piezas, es decir, define las casillas del tablero.
![casillaValida](https://user-images.githubusercontent.com/72817265/197326352-8a5b2221-bfe0-4241-9f7f-1fb7bab179d6.png)

#### Las columnas y filas deben estar comprendidas entre el 0 y el 9, es decir, hay 8 filas y 8 columnas. Las columnas se representan con letras, pero para poder saber si la casilla es válida necesitamos el número correspondiente a la columna, por lo que tendremos que calcular primero el número de la columna y luego ver si la casilla es válida.
#### Comprobamos que la casilla (a, 3) es válida y que la casilla (e, 9) no lo es:
![compCasillaVal](https://user-images.githubusercontent.com/72817265/197326496-59897bc3-dff9-4d61-aeac-d8ecb231cd00.png)

### Distancia entre casillas
#### Vamos a hacer uso también de la distancia entre casillas. Para ello necesitamos 3 formas de calcular la distancia: distancia entre piezas de la misma columna, distancia entre piezas de la misma fila, distancia entre piezas en diagonal.
![distanciaEntreCasillas](https://user-images.githubusercontent.com/72817265/197326849-4bb57167-5034-45a6-9e10-e77e66e8dfed.png)
#### Para calcular la distancia entre piezas de la misma fila o en diagonal, tenemos que recurrir de nuevo al uso de los numeros correspondientes a las columnas, para poder calcular la diferencia entre las columnas.

#### Comprobamos que se calculan bien las distancias:
![compDistancia](https://user-images.githubusercontent.com/72817265/197326975-18dd4dc3-6293-4bd6-80ed-432341fd8fe3.png)

### Obstáculos entre piezas
#### Una regla muy importante es que las piezas (excepto el caballo) no pueden saltar a otras piezas al moverse, por lo que tenemos que ver si hay obstáculos entre una pieza y su destino. Para ello necesitamos dos cláusulas: una para ver si hay obstáculos si la piezas se mueve en una misma columna o en una misma fila, y otra para ver si hay obstáculos cuando la pieza se mueve en diagonal.
![hayObstaculo](https://user-images.githubusercontent.com/72817265/197327187-9f584e44-e68f-4372-992e-64a9be2c14a0.png)
#### Es cierto que hay un obstáculo si se cumple lo siguiente:
- Debe haber una casilla ocupada por cualquier pieza (obstáculo)
- La casilla anterior no puede ser la misma casilla de origen, es decir, la pieza que se quiere mover no es el obstáculo.
- El obstáculo debe estar entre el origen y el destino: calculamos distancias y, el obstáculo debe estar más cerca del origen y del destino, mientras que el origen y el destino deben estar más lejos entre ellos.
- Para un obstáculo en la misma columna o fila, debe cumplirse que el origen, el obstáculo y el destino estén alineados: los tres están en la misma columna o los tres están en la misma fila.
- Para un obstáculo en diagonal se debe cumplir que el obstáculo nunca sea igual al origen o igual al destino.

#### Comprobamos que se detectan correctamente los obstáculos:
- Obstáculo en la misma columna:

![obstMismaColFalse](https://user-images.githubusercontent.com/72817265/197328126-b0027de7-ee2a-4659-9c32-cb9dab8574fe.png)

- Obstáculo misma fila:

![obsMismaFilaFalse](https://user-images.githubusercontent.com/72817265/197328138-b93dd9d3-308c-4e40-8da8-62adfa439c06.png)

- Obstáculo misma fila con el caballo en medio

![obsMismaFilaTrue](https://user-images.githubusercontent.com/72817265/197328158-e27c860b-882b-4bce-a7a9-058e6fe68ae8.png)

- Obstáculo en diagonal:

![obsDiagonalFalse](https://user-images.githubusercontent.com/72817265/197328435-d095fd27-bdc2-46a1-ad2a-3eb880e41a9c.png)

- Obstáculo en diagonal con la reina en medio:

![obsDiagonalTrue](https://user-images.githubusercontent.com/72817265/197328451-eea82eb8-f6bf-44ca-ad56-00dfa9449393.png)


### Movimientos válidos del rey
#### El rey se puede mover en todas las direcciones pero solo 1 casilla.
#### Para definir los distintos movimietnos del rey, he definido 3 cláusulas: una para su movimiento en la misma columna, otra para su movimiento en la misma fila y otra para su movimiento en diagonal.
![movRey](https://user-images.githubusercontent.com/72817265/197328929-35860d91-24ac-4f7a-9130-b79af5730534.png)

#### Para que un movimiento sea válido para el rey, se debe cumplir que:
- la pieza que queremos mover es un rey
- vemos el color y la posición actual del rey
- comprobamos que la diferencia entre columnas y/o filas es 1 (solo se mueve una casilla)
- comprobamos que la casilla destino es válida (está en el tablero)
- comprobamos que la casilla a la que quiere moverse no está ocupada por una pieza del mismo color


#### Comprobamos que el rey se puede mover en todas las direcciones (solo 1 casilla), que se detectan las casillas válidas y no válidas, y que no puede moverse a una casilla ocupada por una pieza del mismo color:
![compMovRey](https://user-images.githubusercontent.com/72817265/197329724-9e056aa8-e936-4a68-834a-4ef7ca1afe4a.png)


### Movimientos válidos de la torre
#### La torre se puede mover en la misma columna (hacia arriba y hacia abajo) o en la misma fila (hacia los lados) el número de casillas que quiera, pero no se puede mover en diagonal.
#### Para definir estos movimientos, he definido 2 cláusulas: una para el movimiento en la misma columna y otro para el movimiento en la misma fila.
![movTorre](https://user-images.githubusercontent.com/72817265/197329968-036ed71e-3a51-45b9-942e-cf141bc60511.png)

#### Para que un movimiento sea válido para una torre, se debe cumplir que:
- la pieza que queremos mover es una torre
- vemos el color y la posición inicial de la torre
- comprobamos que o bien la columna origen y la del destino son distintas (me muevo en la misma fila), o que las filas origen y destino son distintas (me muevo por la misma columna)
- comprobamos que la casilla destino es válida (está en el tablero)
- comprobamos que no hay ningún obstáculo entre el origen y el destino
- comprobamos que la casilla no está ocupada por una pieza del mismo color de la torre o, que está ocupada por una pieza de distinto color (la torre puede eliminar a esa pieza).

#### Comprobamos que la torre solo se puede mover de arriba a abajo o de lado a lado, no en diagonal, y que detecta obstáculos.
![movTorre1](https://user-images.githubusercontent.com/72817265/197389359-c70d6e63-3cfa-435d-a444-bb455e979cb8.png)
![movTorre2](https://user-images.githubusercontent.com/72817265/197389366-238091bc-df5b-4dde-b5e2-0adde28ae255.png)

### Movimientos válidos del caballo
#### El caballo se puede mover dos casillas en dirección horizontal o vertical y después una casilla más en ángulo recto (movimiento en 'L'). Es la única pieza que puede saltar a otras piezas para llegar a su casilla destino.
![movCaballo](https://user-images.githubusercontent.com/72817265/197389640-b6a77124-cc5b-4f8e-b732-96415952e43d.png)

#### Para que un movimiento sea válido para un caballo, se debe cumplir que:
- la pieza a mover es un caballo
- vemos el color y la posición inicial del caballo
- comprobamos que la casilla destino es una casilla válida (dentro del tablero)
- Se debe cumplir que la diferencia entre columnas origen y destino es 2 y entre las filas origen y destino es 1, o que la diferencia entre columnas es 1 y entre filas es 2.
- la casilla no puede estar ocupada por una pieza del mismo color, pero sí puede estar ocupada por una pieza del otro color (el caballo la puede eliminar)

#### Comprobamos que el caballo solo se puede mover en forma de 'L', que puede saltar a otras piezas (no detecta obstáculos) y que detecta las casillas no válidas.
![compMovCab](https://user-images.githubusercontent.com/72817265/197390011-a9174410-8a8d-444f-8a60-d4455cefaf4b.png)


### Movimientos válidos de la reina
#### La reina se puede mover en todas las direcciones, las casillas que desee, pero no puede saltar a otras piezas.
![movReina](https://user-images.githubusercontent.com/72817265/197390084-e0fd8f1a-a6bf-4de2-9c96-308a96899887.png)

#### Para que un movimiento sea válido para una reina, se debe cumplir que:
- la pieza a mover es una reina
- vemos el color y la casilla inicial de la reina
- el destino es una casilla válida (pertenece al tablero)
- la casilla destino no es la misma que la casilla origen
- no hay ningún obstáculo
- no hay ninguna pieza del mismo color en la casilla destino o puede hav¡ber una pieza de distinto color en la casilla destino

#### Comprobamos que la reina se puede mover en todas las direcciones tantas casillas como quiera, pero no puede moverse a casillas no válidas o saltar otras piezas:
![compMovReina](https://user-images.githubusercontent.com/72817265/197390441-fab76413-b6c2-4645-b2df-549c0d67e548.png)


### Movimientos válidos del alfil
#### El alfil se puede mover tantas casillas como quiera en diagonal, sin saltar a otras piezas.
![movAlfil](https://user-images.githubusercontent.com/72817265/197390563-3621d305-b4f7-43a8-bec2-916f6a6e5da4.png)

#### Para que un movimeinto sea válido para un alfil, se debe cumplir que:
- la pieza a mover es un alfil
- vemos el color y la casilla inicial del alfil
- la columna destino no es igual a la columna origen
- la fila destino no es igual a la fila origen 
- la casilla destino debe ser válida (pertenece al tablero)
- la diferencia entre las columnas destino y origen y la diferencia entre las filas destino y origen debe ser igual, ya que para que se mueva en diagonal, la pieza debe moverse el mismo número de columnas que de filas
- no puede haber obstáculos
- la casilla destino no puede estar ocupada por una pieza del mismo color que el alfil, pero sí puede estar ocupada por una pieza de distinto color

#### Comprobamos que el alfil solo se puede mover en diagonal, que detecta los obstáculos y que no puede moverse a casillas no válidas:
![compMovAlfil](https://user-images.githubusercontent.com/72817265/197391014-a8403f85-bd18-4ec5-826c-eeca91faa741.png)




