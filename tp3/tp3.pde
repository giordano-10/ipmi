PImage obraOpArt;

// Variables de trabajo
int   cantidadLineas;      // cuántas diagonales se dibujan
int   cantidadPelitos;     // cuántos "pelitos" hay sobre cada diagonal
float anguloGlobal;        // inclinación extra que se suma a todos los pelitos

// Valores originales
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
  // funciona como una máscara: a partir de ahí, todo lo que dibuje queda recortado a la mitad derecha, así la trama no invade la imagen.
  clip(400, 0, 400, height);
  dibujarPatron(cantidadLineas);

  // sacar la máscara y poder dibujar la interfaz encima.
  noClip();
  dibujarInterfaz();
}

// Recibe el índice de una línea y el total, y con map reparte de forma proporcional dónde arranca cada línea a lo ancho.
float calcularSeparacion(int indice, int totalLineas) {
  // es la función que retorna un valor, y ese valor se usa para posicionar las líneas.
  return map(indice, 0, totalLineas, -400, 480);
}

void dibujarPatron(int totalLineas) {
  // El for externo recorre las líneas: para cada una calcula su posición con calcularSeparacion, define si es par o impar, y dibuja la diagonal como una línea gruesa.
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
    //el for interno recorre los pelitos de esa línea. Con lerp calculo puntos a lo largo de la diagonalel parámetro t va de cero a uno y me da la posición de cada pelito entre el inicio y el fin.
    for (int j = 0; j <= cantidadPelitos; j++) {
      float t  = map(j, 0, cantidadPelitos, 0, 1);
      float px = lerp(x1, x2, t);
      float py = lerp(y1, y2, t);
      float angulo;
      //Para cada pelito calculo un ángulo, y hay dos modos.

      //Si el mouse está activo, uso atan2 con la diferencia entre la posición del mouse y la del pelito,y eso lo orienta hacia el cursor.
      if (mouseActivo) {
        angulo = atan2(mouseY - py, mouseX - px) + anguloGlobal;
      } else {
        //Si no está activo, entra el modo patron: los pelitos de las líneas pares quedan horizontales
        if (pelitoPar) {
          angulo = 0;
        } else {
          // y los de las impares verticales, y esa alternancia es la que genera el efecto óptico.
          angulo = HALF_PI;
        }
        // En los dos casos sumo anguloGlobal, la inclinación general que controlo con el teclado.
        angulo += anguloGlobal;
      }

      // Con el ángulo ya listo, uso translate para llevar el origen de coordenadas al pelito,rotate para girarlo, y dibujo un segmento corto centrado en cero.pushMatrix y popMatrix aíslan esa transformación para que no arrastre a los pelitos siguientes.
      stroke(0);
      pushMatrix();
      translate(px, py);
      rotate(angulo);
      line(-14, 0, 14, 0);
      popMatrix();
    }
  }
}

// creo un recuadro blanco y escribe las instrucciones encima
void dibujarInterfaz() {
  noStroke();
  fill(255);
  rect(400, 0, 400, 16);
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(14);
  text("Click: activa mouse  |  Z/Y: inclina  |  R: reiniciar", 410, 8);
}

// y por parte de las interacciones. mousePressed: si el clickeo, invierto mouseActivo,prendiendo o apagando el seguimiento del mouse.

// keyPressed: Z e Y cambian anguloGlobal de a cinco grados para inclinar toda la trama,
// y R llama a reiniciar, que devuelve las variables a sus valores originales."
void mousePressed() {
  if (mouseX > 400) mouseActivo =! mouseActivo;
}

void keyPressed() {
  // radians(5) convierte 5 grados a radianes (la unidad que usa rotate)
  if (key == 'y' || key == 'Y') anguloGlobal += radians(5);   // gira hacia la derecha
  if (key == 'z' || key == 'Z') anguloGlobal -= radians(5);   // gira hacia la izquierda
  if (key == 'r' || key == 'R') reiniciar();                  // vuelve a empezar
}
