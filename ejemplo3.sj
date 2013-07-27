setForeground(31,31,31);

var contador = 0;
while (contador < 20) {
setBackground(contador+1, contador+5, contador+1);
contador = contador + 5;

showAt("Cargando Espere.", 10, 23);
pause(0.5);
showAt(".", 26, 23);
pause(0.1);
showAt(".", 27, 23);
pause(0.1);
showAt(".", 28, 23);
pause(0.1);
showAt(".", 29, 23);
pause(0.1);
showAt(".", 30, 23);
pause(0.1);
showAt(".", 31, 23);
pause(0.1);
clear();
}
setBackground(1,5,1);
showAt("Bienvenido a", 1, 10);
showAt("Creacion de VideoJuegos", 1, 12);

pause(5);
clear();

/* Constantes para los tiles del personaje, la comida y
   el espacio en blanco */
final PERSONAJE = 20;
final COMIDA = 43;
final ESPACIO = 32;

/* Constantes para los "botones" de las flechas */
final BOTON_ARRIBA = 1;
final BOTON_ABAJO = 2;
final BOTON_IZQUIERDA = 4;
final BOTON_DERECHA = 8;
final BOTON_ENTER = 16;

/* Constantes para los limites de la pantalla */
final MIN_X = 0;
final MAX_X = 31;
final MIN_Y = 1;
final MAX_Y = 23;

/* La posicion del personaje en la pantalla */
var xPersonaje = 16;   // posicion horizontal
var yPersonaje = 12;   // posicion vertical

/* La posicion de la comida en la pantalla */
var xComida;   // posicion horizontal
var yComida;   // posicion vertical

/* La puntuacion del jugador */
var puntos = 0;

dibujaPersonaje() {
  putAt(PERSONAJE, xPersonaje, yPersonaje);
}

borraPersonaje() {
  putAt(ESPACIO, xPersonaje, yPersonaje);
}

muevePersonaje(boton) {
  if (boton == BOTON_ARRIBA && yPersonaje > MIN_Y)
    yPersonaje = yPersonaje - 1;
  if (boton == BOTON_ABAJO && yPersonaje < MAX_Y)
    yPersonaje = yPersonaje + 1;
  if (boton == BOTON_IZQUIERDA && xPersonaje > MIN_X)
    xPersonaje = xPersonaje - 1;
  if (boton == BOTON_DERECHA && xPersonaje < MAX_X)
    xPersonaje = xPersonaje + 1;
}

personajeComioComida() {
  return xPersonaje == xComida && yPersonaje == yComida;
}

dibujaComida() {
  putAt(COMIDA, xComida, yComida);
}

nuevaPosicionComida() {
  xComida = random(32);
  yComida = random(MAX_Y - MIN_Y) + MIN_Y;
}

muestraPuntos() {
  showAt("Puntos: " + puntos, 20, 0);
}

// Ponemos el fondo de color negro
setBackground(1,5,1);

// Mostramos las instrucciones
showAt("Usa las flechas del teclado", 1, 4);
showAt("para mover a tu personaje", 1, 5);
showAt("por la pantalla.", 1, 6);
showAt("Cada vez que te comes la", 1, 8);
showAt("comida te da un punto.", 1, 9);
showAt("Personaje:", 5, 13);
putAt(PERSONAJE, 17, 13);
showAt("Comida:", 8, 15);
putAt(COMIDA, 17, 15);
showAt("Presiona el boton de", 10, 20);
showAt("enter para empezar", 10, 21);

while (readCtrlOne() != BOTON_ENTER);

clear();
nuevaPosicionComida();
dibujaComida();
muestraPuntos();
// Para "siempre"


while ((true) && (puntos < 5)){
  dibujaPersonaje();
  pause(0.1);
  borraPersonaje();
  var boton = readCtrlOne();
  muevePersonaje(boton);
  if (personajeComioComida()) {
    nuevaPosicionComida();
    dibujaComida();
    puntos = puntos + 1;


    muestraPuntos();
    note("C6");
    pause(0.2);
    note("C3");
    pause(0.2);
    note("E3");
    pause(0.2);
  }
}
pause(2);
clear();
showAt("Eres Ganador", 1, 10);
showAt("Ganaste tus 5 Puntos", 1, 12);
