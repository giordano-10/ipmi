PImage obraOpArt;

int   cantidadLineas;   // cuántas diagonales
int   cantidadPelitos;  // cuántos pelitos por diagonal
float anguloGlobal;     // inclinación base de los pelitos (knob principal de la ilusión)
boolean modoCaos;       // activa el jitter y los colores aleatorios con random()

// ---- Valores originales para poder reiniciar ----
int   LINEAS_ORIG  = 20;  // más líneas para cubrir bien todo el lado derecho
int   PELITOS_ORIG = 24;
float ANGULO_ORIG  = 0;

// ---- Botón de reinicio (zona circular) ----
float btnX = 765, btnY = 365, btnR = 18;
float radioMouse = 120; // radio de distorsión alrededor del mouse

void setup() {
  size(800, 400);
  obraOpArt = loadImage("obraOpArt.jpg");
  reiniciar(); // arrancamos siempre en el estado original
}

// FUNCIÓN PARA REINICIAR: vuelve las variables a su estado original
void reiniciar() {
  cantidadLineas  = LINEAS_ORIG;
  cantidadPelitos = PELITOS_ORIG;
  anguloGlobal    = ANGULO_ORIG;
  modoCaos        = false;
}

void draw() {
  background(255);
  image(obraOpArt, 0, 0, 400, 400);

  // 2. LADO DERECHO: recreación interactiva
  // RECORTAMOS el dibujo al bloque derecho (400..800) para que NADA invada la referencia
  clip(400, 0, 400, height);
  for (int i = 0; i < cantidadLineas; i++) {     // FOR externo
    float xInicio = calcularSeparacion(i, cantidadLineas);
    boolean tipoPar = (i % 2 == 0); // alterna la orientación base
    dibujarDiagonal(xInicio, tipoPar);
  }
  noClip(); // a partir de acá volvemos a dibujar sin recorte

  dibujarInterfaz();
}

// ===================================================
// FUNCIÓN QUE RETORNA VALOR (float)
// Calcula el espaciado de cada diagonal.
// Arrancamos bien a la izquierda (-400) para que NO falten
// líneas en el ángulo superior izquierdo del lado derecho.
// ===================================================
float calcularSeparacion(int indice, int totalLineas) {
  return map(indice, 0, totalLineas, -400, 480);
}

// ===================================================
// FUNCIÓN QUE NO RETORNA VALOR (void)
// Dibuja la diagonal y, con un FOR anidado, sus pelitos
// ===================================================
void dibujarDiagonal(float xStart, boolean pelitoPar) {
  float x1 = xStart + 400;
  float y1 = height + 50;
  float x2 = xStart + 250 + 400;
  float y2 = -50;

  // Línea diagonal principal (color random si está el modo caos)
  if (modoCaos) {
    stroke(random(255), random(255), random(255));
  } else {
    stroke(0);
  }
  strokeWeight(4);
  line(x1, y1, x2, y2);

  // FOR ANIDADO: recorremos la diagonal dibujando pelitos
  strokeWeight(3);
  for (int j = 0; j <= cantidadPelitos; j++) {
    float t  = map(j, 0, cantidadPelitos, 0, 1);
    float px = lerp(x1, x2, t);
    float py = lerp(y1, y2, t);

    // --- DISTORSIÓN LOCAL con dist(): los pelitos cerca del mouse giran más ---
    float d = dist(px, py, mouseX, mouseY);
    float distorsion = 0;
    if (d < radioMouse) {
      distorsion = map(d, 0, radioMouse, radians(45), 0);
    }

    // --- Orientación base (if/else): pares horizontales, impares verticales ---
    float anguloBase;
    if (pelitoPar) {
      anguloBase = 0;        // horizontal
    } else {
      anguloBase = HALF_PI;  // vertical
    }

    // Ángulo final = base + inclinación del usuario + distorsión del mouse
    float angulo = anguloBase + anguloGlobal + distorsion;

    // --- modo caos: color aleatorio + temblor aleatorio con random() ---
    if (modoCaos) {
      stroke(random(255), random(255), random(255));
      angulo += random(-2, 4);
    } else {
      stroke(0);
    }

    // ROTATE + TRANSLATE
    pushMatrix();
    translate(px, py);   // nos paramos sobre la diagonal
    rotate(angulo);      // inclinamos el pelito
    line(-14, 0, 14, 0);
    popMatrix();
  }
}

// Dibuja el texto de ayuda y el botón de reinicio
void dibujarInterfaz() {
  // Franja blanca arriba para que el texto se lea bien (no se pisa con el dibujo)
  noStroke();
  fill(255);
  rect(400, 0, 400, 16);

  // Texto de instrucciones (ya sin las flechas)
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(14);
  text("Mouse: distorsiona  |  Z/Y: inclina  |  C: caos  |  R o boton: reiniciar", 408, 8);

  // Botón circular de reset (zona de colisión)
  fill(230);
  stroke(0);
  strokeWeight(1.5);
  ellipse(btnX, btnY, btnR * 2, btnR * 2);
  fill(0);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(11);
  text("R", btnX, btnY - 1);
}

// ===================================================
// EVENTOS DE TECLADO: modifican variables (sin flechas)
// ===================================================
void keyPressed() {
  if (key == 'y' || key == 'Y') anguloGlobal += radians(5);
  if (key == 'z' || key == 'Z') anguloGlobal -= radians(5);
  if (key == 'c' || key == 'C') modoCaos = !modoCaos;
  if (key == 'r' || key == 'R') reiniciar();
}

// ===================================================
// EVENTO DE MOUSE: colisión circular con el botón de reset
// ===================================================
void mousePressed() {
  if (dist(mouseX, mouseY, btnX, btnY) < btnR) {
    reiniciar();
  }
}
