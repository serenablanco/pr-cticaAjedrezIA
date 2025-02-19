%REGLAS DEL AJEDREZ


casillaValida(Columna, Fila) :- %casillas del tablero
    Columna > 0,
    Columna < 9,
    Fila >0,
    Fila < 9.

%distancia entre dos casillas de la misma columna
distancia(Col, FilaO, Col, FilaD, DistanciaOrigenDestino) :-
    DistanciaOrigenDestino is abs(FilaO - FilaD).

%distancia entre dos casillas de la misma fila
distancia(ColO, Fila, ColD, Fila, DistanciaOrigenDestino) :-
    numero(ColO, NumColO),
    numero(ColD, NumColD),
    DistanciaOrigenDestino is abs(NumColO - NumColD).

%distancia entre casillas en diagonal
distancia(ColO, FilaO, ColD, FilaD, DistanciaOrigenDestino) :-
    numero(ColO, NumColO),
    numero(ColD, NumColD),
    DistCol is abs(NumColO - NumColD),
    DistFila is abs(FilaO - FilaD),
    DistCol = DistFila,
    DistanciaOrigenDestino = DistCol.


% ver si hay un obst�culo hasta destino misma columna o misma fila
hayObstaculo(ColumnaOrigen, FilaOrigen, ColumnaDestino, FilaDestino) :-
    casilla(_Obstaculo, ColumnaObs, FilaObs),
    \+ (ColumnaOrigen = ColumnaObs,
        FilaOrigen = FilaObs),
    distancia(ColumnaOrigen, FilaOrigen, ColumnaObs, FilaObs, DistOrigObst),
    distancia(ColumnaOrigen, FilaOrigen, ColumnaDestino, FilaDestino, DistOrigDest),
    distancia(ColumnaObs, FilaObs, ColumnaDestino, FilaDestino, DistObsDest),
    DistObsDest < DistOrigDest,
    DistOrigObst < DistOrigDest,
    (   (ColumnaOrigen = ColumnaObs,
         ColumnaObs = ColumnaDestino);
    (   FilaOrigen = FilaObs,
        FilaObs = FilaDestino)).

%ver si hay obst�culo hasta destino en diagonal
hayObstaculo(ColOr, FilaOr, ColD, FilaD) :-
    casilla(_Obstaculo, ColObs, FilaObs),
    \+ (ColOr = ColObs,
        FilaOr = FilaObs),
    \+ (ColObs = ColD,
        FilaObs = FilaD),
    distancia(ColOr, FilaOr, ColObs, FilaObs, DistOrObs),
    distancia(ColOr, FilaOr, ColD, FilaD, DistOrD),
    distancia(ColObs, FilaObs, ColD, FilaD, DistObsD),
    DistObsD < DistOrD,
    DistOrObs < DistOrD.


%movimiento rey en la misma fila (hacia los lados)
movimientoValido(Pieza, ColumnaDestino, Fila) :-
    rey(Pieza),                                              %la pieza a mover es realmente un rey
    color(Pieza, Color),                                     %guardamos su color para m�s adelante
    casilla(Pieza, ColumnaOrigen, Fila),                     %vemos en qu� casilla est� actualmente el rey
    numero(ColumnaOrigen, NumColOrig),                       %Vemos el n�mero de la columna es la que est�
    numero(ColumnaDestino, NumColDest),                      %Vemos el n�mero de la columna a la que quiere ir
    abs(NumColDest - NumColOrig) =:= 1,                      %valor absoluto de la diferencia de columnas debe ser 1 (rey solo se mueve 1 casilla)
    casillaValida(NumColDest, Fila),
    \+ (casilla(Pieza2, ColumnaDestino, Fila),               %comprobar que no hay ninguna pieza del mismo color en la casilla destino
        color(Pieza2, Color)).


%movimiento rey en la misma columna (arriba, abajo)
movimientoValido(Pieza, Columna, FilaDestino) :-
    rey(Pieza),
    color(Pieza, Color),
    casilla(Pieza, Columna, FilaOrigen),
    abs(FilaDestino - FilaOrigen) =:= 1,
    numero(Columna, NumCol),
    casillaValida(NumCol, FilaDestino),
    \+ (casilla(Pieza2, Columna, FilaDestino),
        color(Pieza2, Color)).

%movimiento rey diagonal
movimientoValido(Pieza, ColumnaDestino, FilaDestino) :-
    rey(Pieza),
    color(Pieza, Color),
    casilla(Pieza, ColumnaOrigen, FilaOrigen),
    numero(ColumnaOrigen, NumColOrig),
    numero(ColumnaDestino, NumColDest),
    abs(NumColDest - NumColOrig) =:= 1,
    abs(FilaDestino - FilaOrigen) =:= 1,
    casillaValida(NumColDest, FilaDestino),
    \+ (casilla(Pieza2, ColumnaDestino, FilaDestino),
        color(Pieza2, Color)).

%movimiento torre en una misma fila - hacia los lados
movimientoValido(Pieza, ColumnaDestino, Fila) :-
    torre(Pieza),                                                %comprobar que la pieza es una torre
    color(Pieza, Color),                                         %ver su color
    casilla(Pieza, Columna, Fila),                               %ver su posici�n actual
    Columna \= ColumnaDestino,                                   %comprobar que la columna destino es distinta a la columna en la que est� (se tiene que mover)
    numero(ColumnaDestino, NumColDest),                          %numero de la columna destino
    casillaValida(NumColDest, Fila),                             %comprobar que la casilla destino es v�lida (est� en el tablero)
    \+ hayObstaculo(Columna, Fila, ColumnaDestino, Fila),
    (   (\+ (casilla(Pieza2, ColumnaDestino, Fila),              %comprobar que la casilla est� vac�a o que hay una pieza del otro color
        color(Pieza2, Color)));
    (   casilla(Pieza2, ColumnaDestino, Fila),                   %si hay una pieza del otro color en la casilla destino, se elimina
        \+ color(Pieza2, Color))).


%movimiento torre en una misma columna - arriba y abajo
movimientoValido(Pieza, Columna, FilaDestino) :-
    torre(Pieza),
    color(Pieza, Color),
    casilla(Pieza, Columna, Fila),
    Fila \= FilaDestino,
    numero(Columna, NumCol),
    casillaValida(NumCol, FilaDestino),
    \+ hayObstaculo(Columna, Fila, Columna, FilaDestino),
    (   (\+ (casilla(Pieza2, Columna, FilaDestino),
        color(Pieza2, Color)));
    (   casilla(Pieza2, Columna, FilaDestino),
    \+ color(Pieza2, Color))).

%movimiento caballo
movimientoValido(Pieza, ColD, FilaD) :-
    caballo(Pieza),
    color(Pieza, Color),
    casilla(Pieza, ColO, FilaO),
    numero(ColO, NumColO),
    numero(ColD, NumColD),
    casillaValida(NumColD, FilaD),
    (   (abs(NumColD - NumColO) =:= 2,
         abs(FilaD - FilaO) =:= 1);
    (   abs(NumColD - NumColO) =:= 1,
        abs(FilaD - FilaO) =:= 2)),
    (   (\+ (casilla(Pieza2, ColD, FilaD),
             color(Pieza2, Color)));
    (   casilla(Pieza2, ColD, FilaD),
        \+ color(Pieza2, Color))).

%movimiento reina
movimientoValido(Pieza, ColD, FilaD) :-
    reina(Pieza),
    color(Pieza, Color),
    casilla(Pieza, ColO, FilaO),
    numero(ColD, NumColD),
    casillaValida(NumColD, FilaD),
    \+ (   ColO = ColD,
    FilaO = FilaD),
    \+ hayObstaculo(ColO, FilaO, ColD, FilaD),
    (   (\+ (casilla(Pieza2, ColD, FilaD),
             color(Pieza2, Color)));
    (   casilla(Pieza2, ColD, FilaD),
        \+ color(Pieza2, Color))).

%movimiento alfil
movimientoValido(Pieza, ColD, FilaD) :-
    alfil(Pieza),
    color(Pieza, Color),
    casilla(Pieza, ColO, FilaO),
    \+ ColO = ColD,
    \+ FilaO = FilaD,
    numero(ColO, NumColO),
    numero(ColD, NumColD),
    casillaValida(NumColD, FilaD),
    abs(NumColO - NumColD) =:= abs(FilaO - FilaD),
    \+ hayObstaculo(ColO, FilaO, ColD, FilaD),
    (   (\+ (casilla(Pieza2, ColD, FilaD),
             color(Pieza2, Color)));
    (   casilla(Pieza2, ColD, FilaD),
        \+ color(Pieza2, Color))).

%mover pieza a una casilla vac�a
mover(Pieza, ColumnaDestino, FilaDestino) :-
    \+ casilla(_Pieza2, ColumnaDestino, FilaDestino),
    movimientoValido(Pieza, ColumnaDestino, FilaDestino),
    casilla(Pieza, ColumnaOrigen, FilaOrigen),
    retractall(casilla(Pieza, ColumnaOrigen, FilaOrigen)),
    assert(casilla(Pieza, ColumnaDestino, FilaDestino)).

%mover pieza a casilla ocupada por pieza de distinto color
mover(Pieza, ColumnaDestino, FilaDestino) :-
    casilla(Pieza2, ColumnaDestino, FilaDestino),
    color(Pieza, Color1),
    color(Pieza2, Color2),
    Color1 \= Color2,
    movimientoValido(Pieza, ColumnaDestino, FilaDestino),
    casilla(Pieza, ColumnaOrigen, FilaOrigen),
    retractall(casilla(Pieza2, ColumnaDestino, FilaDestino)),
    retractall(casilla(Pieza, ColumnaOrigen, FilaOrigen)),
    assert(casilla(Pieza, ColumnaDestino, FilaDestino)).

/*
%el rey est� amenazado
jaque(Pieza1, Pieza2, Columna, Fila) :-
    rey(Pieza2),
    color(Pieza1, Color1),
    color(Pieza2, Color2),
    Color1 \= Color2,
    movimientoValido(Pieza1, Columna, Fila).

%fin del juego
jaqueMate(Pieza1, Pieza2) :-
    jaque(Pieza1, Pieza2).
    %retirar todas las piezas del tablero
*/



%HECHOS

numero(a, 1).
numero(b, 2).
numero(c, 3).
numero(d, 4).
numero(e, 5).
numero(f, 6).
numero(g, 7).
numero(h, 8).

rey(reyBlanco).
rey(reyNegro).
torre(torreBlanca1).
torre(torreBlanca2).
torre(torreNegra1).
torre(torreNegra2).
caballo(caballoBlanco1).
caballo(caballoBlanco2).
caballo(caballoNegro1).
caballo(caballoNegro2).
reina(reinaBlanca).
reina(reinaNegra).
alfil(alfilBlanco1).
alfil(alfilBlanco2).
alfil(alfilNegro1).
alfil(alfilNegro2).

color(reyBlanco, blancas).
color(torreBlanca1, blancas).
color(torreBlanca2, blancas).
color(reyNegro, negras).
color(torreNegra1, negras).
color(torreNegra2, negras).
color(caballoBlanco1, blancas).
color(caballoBlanco2, blancas).
color(caballoNegro1, negras).
color(caballoNegro2, negras).
color(reinaBlanca, blancas).
color(reinaNegra, negras).
color(alfilBlanco1, blancas).
color(alfilBlanco2, blancas).
color(alfilNegro1, negras).
color(alfilNegro2, negras).

casilla(torreBlanca1, a, 1) :- dynamic casilla/3.
casilla(caballoBlanco1, b, 1) :- dynamic casilla/3.
casilla(alfilBlanco1, c, 1) :- dynamic casilla/3.
casilla(reinaBlanca, d, 1) :- dynamic casilla/3.
casilla(reyBlanco, e, 1) :- dynamic casilla/3.
casilla(alfilBlanco2, f, 1) :- dynamic casilla/3.
casilla(caballoBlanco2, g, 1) :- dynamic casilla/3.
casilla(torreBlanca2, h, 1) :- dynamic casilla/3.

casilla(torreNegra1, a, 8) :- dynamic casilla/3.
casilla(caballoNegro1, b, 8) :- dynamic casilla/3.
casilla(alfilNegro1, c, 8) :- dynamic casilla/3.
casilla(reinaNegra, d, 8) :- dynamic casilla/3.
casilla(reyNegro, e, 8) :- dynamic casilla/3.
casilla(alfilNegro2, f, 8) :- dynamic casilla/3.
casilla(caballoNegro2, g, 8) :- dynamic casilla/3.
casilla(torreNegra2, h, 8) :- dynamic casilla/3.





