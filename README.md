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







