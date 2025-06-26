PImage img;
float tiempo = 0;// Tiempo de animación (se incrementa si estaAnimando es verdadero)
int tamañoCelda = 75; // Tamaño de cada celda del patrón

// Posiciónes iniciales de la grilla animada
int origenX = 450;
int origenY = 50;
boolean estaAnimando = false; // Controla si la animación está activada

void setup() {
  size(800, 400);
  img = loadImage("obra.jpg");
  noStroke(); // Sin contorno en figuras
  rectMode(CENTER); // Dibujar rectángulos desde el centro
}

void draw() {
  background(#2C2C2C);
  image(img, 0, 0, 400, 400);
  dibujarGrilla();

  if (estaAnimando) tiempo += 0.1; // Si la animación está activa, avanzar el tiempo
}


// Recorre la grilla de 4x4 y dibuja cada celda animada
void dibujarGrilla() {
  for (int fila = 0; fila < 4; fila++) {
    for (int columna = 0; columna < 4; columna++) {

      // Coordenadas del centro de cada celda
      int centroX = calcularCentroX(columna);
      int centroY = calcularCentroY(fila);

      color colorFondo = obtenerColorFondo(columna + fila); // Determina el color del fondo según la suma de columna + fila

      // Calcula el tamaño animado (si está activo) o el tamaño fijo
      float tamañoActual;
      if (estaAnimando) {
        float fase = (columna + fila * 4) * 0.3;
        tamañoActual = tamañoAnimado(tiempo, fase, tamañoCelda);
      } else {
        tamañoActual = tamañoCelda;
      }


      dibujarCelda(centroX, centroY, tamañoActual, colorFondo); // Dibuja el cuadrado de fondo

      dibujarCirculo(centroX, centroY); // Dibuja el círculo encima
    }
  }
}

// Calcula la posición X del centro de una celda, según la columna
int calcularCentroX(int columna) {
  return columna * tamañoCelda + origenX + tamañoCelda / 2;
}

// Calcula la posición Y del centro de una celda, según la fila
int calcularCentroY(int fila) {
  return fila * tamañoCelda + origenY + tamañoCelda / 2;
}

// Devuelve un color según un índice (usado para combinar columnas y filas)
color obtenerColorFondo(int indiceColor) {
  if (indiceColor == 0) return #423CCB; // azul oscuro
  else if (indiceColor == 1) return #3C5ACE; // azul
  else if (indiceColor == 2) return #2D84C4; // celeste
  else if (indiceColor == 3) return #17AD92; // verde pastel
  else if (indiceColor == 4) return #76D827; // verde claro 
  else if (indiceColor == 5) return #D2FF3C; // amarillo
  else return #F5FF82; // amarillo pastel (cuando indiceColor == 6)
}


// Dibuja un cuadrado de color fondo, centrado en X, Y
void dibujarCelda(float centroX, float centroY, float tamaño, color fondo) {
  fill(fondo);
  rect(centroX, centroY, tamaño, tamaño);
}

// el tamaño del circulo varía con la distancia del mouse (si hay animación)
void dibujarCirculo(float centroX, float centroY) {
  float tamañoCirculo;

  if (estaAnimando) {
    // Calcula distancia del mouse al centro del círculo
    float distancia = dist(mouseX, mouseY, centroX, centroY);

    // Cuanto más cerca el mouse, más grande el círculo
    tamañoCirculo = map(distancia, 0, 200, 5, tamañoCelda * 0.65);
    tamañoCirculo = constrain(tamañoCirculo, 5, tamañoCelda * 0.65);
  } else {
    // Tamaño fijo si no hay animación
    tamañoCirculo = tamañoCelda * 0.65;
  }

  fill(#CD6699); // Rosa
  ellipse(centroX, centroY, tamañoCirculo, tamañoCirculo);
}

// Calcula el tamaño animado de la celda usando una onda senoidal
float tamañoAnimado(float tiempo, float fase, float base) {
  // El seno varía entre -1 y 1, lo mapeamos a un rango entre 0.8 y 1.2
  float escala = map(sin(tiempo + fase), -1, 1, 0.8, 1.2);
  return base * escala;
}

// Si se presiona la tecla 'R', reiniciar la animación
void keyPressed() {
  if (key == 'r' || key == 'R') {
    tiempo = 0;
    estaAnimando = false;
  }
}

// Al hacer clic con el mouse, se activa la animación
void mousePressed() {
  estaAnimando = true;
}
