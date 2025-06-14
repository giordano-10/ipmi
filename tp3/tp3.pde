PImage img;
float t = 0;
float tamcelda = 75;
float posX = 450;
float posY = 50;
boolean animar = false;

void setup() {
  size(800, 400);
  img = loadImage("obra.jpg");
  noStroke();
}

void draw() {
  background(#2C2C2C);
  image(img, 0, 0, 400, 400);

  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 4; x++) {
      float cx = x * tamcelda + posX + tamcelda / 2;
      float cy = y * tamcelda + posY + tamcelda / 2;

      //colores similares a la obra
      int colorIndex = x + y;
      color fondo;
      if (colorIndex == 0)       fondo = #423CCB;
      else if (colorIndex == 1)  fondo = #3C5ACE;
      else if (colorIndex == 2)  fondo = #2D84C4;
      else if (colorIndex == 3)  fondo = #17AD92;
      else if (colorIndex == 4)  fondo = #76D827;
      else if (colorIndex == 5)  fondo = #D2FF3C;
      else if (colorIndex == 6)  fondo = #F5FF82;
      else                       fondo = #FFFFFF;

      // Solo aplicar interactividad si animar está activo
      if (animar && mouseX > cx - tamcelda / 2 && mouseX < cx + tamcelda / 2 &&
          mouseY > cy - tamcelda / 2 && mouseY < cy + tamcelda / 2) {
        fondo = #ECD6FF;
      }

      // Tamaño animado del cuadrado (función que retorna)
      float phase = (x + y * 4) * 0.3;
      float animatedSize = animar ? tamañoAnimado(t, phase, tamcelda) : tamcelda;

      // Dibujo del cuadrado (función que no retorna)
      dibujarCelda(cx, cy, animatedSize, fondo);

      // Círculo con interacción solo si animar está activo
      float tam = tamcelda * 0.65;
      if (animar) {
        float d = dist(mouseX, mouseY, cx, cy);
        tam = map(d, 0, 200, 5, tamcelda * 0.65);
        tam = constrain(tam, 5, tamcelda * 0.65);
      }

      fill(#CD6699);
      ellipse(cx, cy, tam, tam);
    }
  }

  if (animar) {
    t += 0.05;
  }
}

// Función que NO retorna
void dibujarCelda(float cx, float cy, float tam, color fondo) {
  fill(fondo);
  rectMode(CENTER);
  rect(cx, cy, tam, tam);
}

// Función que SÍ retorna
float tamañoAnimado(float tiempo, float fase, float base) {
  float escala = map(sin(tiempo + fase), -1, 1, 0.8, 1.2);
  return base * escala;
}

// Reiniciar animación con tecla R
void keyPressed() {
  if (key == 'r' || key == 'R') {
    t = 0;
    animar = false; // También desactiva la animación
  }
}

// Activar animación con clic
void mousePressed() {
  animar = true;
}
