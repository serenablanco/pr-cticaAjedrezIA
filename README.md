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





