//le debo el video de nuevo 😢

PImage img;
int tamañoCelda = 75;
int origenX = 450;
int origenY = 50;
boolean estaAnimando = false;

void setup() {
  size(800, 400);
  img = loadImage("obra.jpg");
  noStroke(); //quito los bordes de las figuras
  rectMode(CENTER);
}

void draw() {
  background(#2C2C2C); // gris
  image(img, 0, 0, 400, 400);
  dibujarGrilla();
}

void dibujarGrilla() {  // cuadricula de 4x4
  for (int fila = 0; fila < 4; fila++) {
    for (int columna = 0; columna < 4; columna++) {

      //calculo la posicion central de cada celda
      int centroX = calcularCentroX(columna);
      int centroY = calcularCentroY(fila);

      // Color según el valor de columna + fila
      color colorFondo = obtenerColorFondo(columna + fila);

      float tamañoActual;
      if (estaAnimando) {
        float distancia = dist(mouseX, mouseY, centroX, centroY); // calculo la distancia que hay entre el mouse y el centro de la celda
        tamañoActual = map(distancia, 10, 200, tamañoCelda * 1, tamañoCelda * 0.8); // apartir de disc() cuando el mouse se acerque (10, tamañoCelda * 1) el cuadrado se agranda y cuando se aleje (200, tamañoCelda * 0.8) se achica el cuadrado  
      } else {
        tamañoActual = tamañoCelda; // se mantiene sin alteraciones (animacion inactiva)
      }

      dibujarCelda(centroX, centroY, tamañoActual, colorFondo); //dibuja los cuadrados con el color "correspodiente" *
      dibujarCirculo(centroX, centroY); //dibuja los circulos por encima de los cuadrados // *
    }
  }
}

void dibujarCelda(float centroX, float centroY, float tamaño, color fondo) { // *
  fill(fondo);
  rect(centroX, centroY, tamaño, tamaño); // *
}

void dibujarCirculo(float centroX, float centroY) {
  float tamañoCirculo;

// lo mismo que la animacion de los cuadrados 
  if (estaAnimando) {
    float distancia = dist(mouseX, mouseY, centroX, centroY);
    tamañoCirculo = map(distancia, 0, 200, 15, tamañoCelda * 0.45);
  } else {
    tamañoCirculo = tamañoCelda * 0.65;
  }

  fill(#CD6699); // Rosa
  ellipse(centroX, centroY, tamañoCirculo, tamañoCirculo);
}

// devuelven las coordenadas del centro de cada cuadrado
int calcularCentroX(int columna) {
  return columna * tamañoCelda + origenX + tamañoCelda / 2;
}
int calcularCentroY(int fila) {
  return fila * tamañoCelda + origenY + tamañoCelda / 2;
}

color obtenerColorFondo(int indiceColor) { // devuelve un color especifico dependiendo de que columna o fila sea (entre 0 y 6)
  if (indiceColor == 0) {
    return #3332B7;  // azul oscuro
  } else if (indiceColor == 1) {
    return #3D52D1; // azul
  } else if (indiceColor == 2) {
    return #2D84C4; // celeste
  } else if (indiceColor == 3) {
    return #17AD92; // verde pastel
  } else if (indiceColor == 4) {
    return #76D827; // verde claro
  } else if (indiceColor == 5) {
    return #D2FF3C; // amarillo
  } else {
    return #F5FF82; // amarillo pastel
  }
}

void keyPressed() { //reinicio con la tecla r
  if (key == 'r' || key == 'R') {
    estaAnimando = false;
  }
}

void mousePressed() { // 
  estaAnimando = true;
}
