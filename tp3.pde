PImage img;
float t = 0;

void setup() {
  size(800, 400);
  img = loadImage("obra.jpg");
  noStroke();
}

void draw() {
  background(35);
  image(img, 0, 0, 400, 400);

  float tamcelda = 75;
  float offsetX = 450;
  float offsetY = 50;

  for (int y = 0; y < 4; y++) {
    for (int x = 0; x < 4; x++) {
      float cx = x * tamcelda + offsetX + tamcelda / 2;
      float cy = y * tamcelda + offsetY + tamcelda / 2;

      // Color de fondo usando condicionales
      int colorIndex = x + y;
      color fondo;
      if (colorIndex == 0)       fondo = #070073;
      else if (colorIndex == 1)  fondo = #0064B4;
      else if (colorIndex == 2)  fondo = #4487BC;
      else if (colorIndex == 3)  fondo = #00A288;
      else if (colorIndex == 4)  fondo = #90E84D;
      else if (colorIndex == 5)  fondo = #D2FF3C;
      else if (colorIndex == 6)  fondo = #F5FF82;
      else                       fondo = #000000;

      // Cambio de color al pasar el mouse
      if (mouseX > cx - tamcelda / 2 && mouseX < cx + tamcelda / 2 &&
          mouseY > cy - tamcelda / 2 && mouseY < cy + tamcelda / 2) {
        fondo = #ECD6FF;
      }

      // Tamaño animado del cuadrado (función que retorna)
      float phase = (x + y * 4) * 0.3;
      float animatedSize = tamañoAnimado(t, phase, tamcelda);

      // Dibujo del cuadrado (función que no retorna)
      dibujarCelda(cx, cy, animatedSize, fondo);

      // Círculo con interacción por distancia
      float d = dist(mouseX, mouseY, cx, cy);
      float tam = map(d, 0, 200, 5, tamcelda * 0.65);
      tam = constrain(tam, 5, tamcelda * 0.65);

      fill(#CD6699);
      ellipse(cx, cy, tam, tam);
    }
  }

  t += 0.05;
}

// ✅ Función que NO retorna
void dibujarCelda(float cx, float cy, float tam, color fondo) {
  fill(fondo);
  rectMode(CENTER);
  rect(cx, cy, tam, tam);
}

// ✅ Función que SÍ retorna
float tamañoAnimado(float tiempo, float fase, float base) {
  float escala = map(sin(tiempo + fase), -1, 1, 0.8, 1.2);
  return base * escala;
}

// ✅ Reiniciar animación con tecla R
void keyPressed() {
  if (key == 'r' || key == 'R') {
    t = 0;
  }
}
