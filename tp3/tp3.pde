// Link de video: 

PImage obraOpArt;

// variables de trabajo
int   cantidadLineas;    // cuántas diagonales se dibujan
int   cantidadPelitos;   // cuántos "pelitos" hay sobre cada diagonal
float anguloGlobal;      // inclinación extra de todos los pelitos

// valores originales
int   LINEAS_ORIG  = 20;
int   PELITOS_ORIG = 24;
float ANGULO_ORIG  = 0;

boolean mouseActivo = false; 

void setup() {
  size(800, 400);
  obraOpArt = loadImage("obraOpArt.jpg");
  reiniciar();
}

// Vuelve todas las variables a su estado inicial
void reiniciar() {
  cantidadLineas  = LINEAS_ORIG;
  cantidadPelitos = PELITOS_ORIG;
  anguloGlobal    = ANGULO_ORIG;
  mouseActivo     = false;
}

void draw() {
  background(255);
  image(obraOpArt, 0, 0, 400, 400);
  clip(400, 0, 400, height);
  dibujarPatron(cantidadLineas);
  noClip();
  dibujarInterfaz();
}

float calcularSeparacion(int indice, int totalLineas) { 
  return map(indice, 0, totalLineas, -400, 480); 
}

void dibujarPatron(int totalLineas) {
  for (int i = 0; i < totalLineas; i++) {
    float xStart = calcularSeparacion(i, totalLineas);
    boolean pelitoPar = (i % 2 == 0);

    float x1 = xStart + 400;
    float y1 = height + 50;
    float x2 = xStart + 250 + 400;
    float y2 = -50;

    stroke(0);
    strokeWeight(3);
    line(x1, y1, x2, y2);
    
    for (int j = 0; j <= cantidadPelitos; j++) {
      float t  = map(j, 0, cantidadPelitos, 0, 1);
      float px = lerp(x1, x2, t);
      float py = lerp(y1, y2, t);
      float angulo;
     
      if (mouseActivo) {
        angulo = atan2(mouseY - py, mouseX - px) + anguloGlobal; 
      } else {
        if (pelitoPar) { 
          angulo = 0;        // líneas pares horizontales

        } else {
          angulo = HALF_PI;  // impares verticales (90°)
        }
        angulo += anguloGlobal;
      }

      pushMatrix();
      translate(px, py);
      rotate(angulo);
      line(-14, 0, 14, 0);
      popMatrix();
    }
  }
}

// escribe las instrucciones en pantalla
void dibujarInterfaz() {
  noStroke();
  fill(255);
  rect(400, 0, 400, 16);
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(14);
  text("Click: activa mouse  |  Z/Y: inclina  |  R: reiniciar", 410, 8);
}

void mousePressed() {
  if (mouseX > 400) mouseActivo =! mouseActivo;
}

void keyPressed() {
  // radians(5) convierte 5 grados a radianes (la unidad que usa rotate)
  if (key == 'y' || key == 'Y') anguloGlobal += radians(5);   // gira hacia la derecha
  if (key == 'z' || key == 'Z') anguloGlobal -= radians(5);   // gira hacia la izquierda
  if (key == 'r' || key == 'R') reiniciar();                  // vuelve a empezar
}
