PImage img;
int tamañoCelda = 75;
int origenX = 450;
int origenY = 50;
boolean estaAnimando = false;

void setup() {
  size(800, 400);
  img = loadImage("obra.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(#2C2C2C); // color gris
  image(img, 0, 0, 400, 400);
  dibujarGrilla();
}

void dibujarGrilla() {  // cuadricula de 4x4
  for (int fila = 0; fila < 4; fila++) {
    for (int columna = 0; columna < 4; columna++) {

      int centroX = calcularCentroX(columna);
      int centroY = calcularCentroY(fila);

      // Color de fondo según columna + fila
      color colorFondo = obtenerColorFondo(columna + fila);

      float tamañoActual;
      if (estaAnimando) {
        float distancia = dist(mouseX, mouseY, centroX, centroY);
        tamañoActual = map(distancia, 10, 200, tamañoCelda * 1.0, tamañoCelda * 0.8);
      } else {
        tamañoActual = tamañoCelda;
      }

      dibujarCelda(centroX, centroY, tamañoActual, colorFondo);
      dibujarCirculo(centroX, centroY);
    }
  }
}

void dibujarCelda(float centroX, float centroY, float tamaño, color fondo) {
  fill(fondo);
  rect(centroX, centroY, tamaño, tamaño);
}

void dibujarCirculo(float centroX, float centroY) {
  float tamañoCirculo;

  if (estaAnimando) {
    float distancia = dist(mouseX, mouseY, centroX, centroY);
    tamañoCirculo = map(distancia, 0, 200, 15, tamañoCelda * 0.45);
  } else {
    tamañoCirculo = tamañoCelda * 0.65;
  }

  fill(#CD6699); // Rosa
  ellipse(centroX, centroY, tamañoCirculo, tamañoCirculo);
}

int calcularCentroX(int columna) {
  return columna * tamañoCelda + origenX + tamañoCelda / 2;
}

int calcularCentroY(int fila) {
  return fila * tamañoCelda + origenY + tamañoCelda / 2;
}

color obtenerColorFondo(int indiceColor) {
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

void keyPressed() {
  if (key == 'r' || key == 'R') {
    estaAnimando = false;
  }
}

void mousePressed() {
  estaAnimando = true;
}
