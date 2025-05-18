//Sofia Giordano
//tp2 com5
//Legajo 119042/3
float posx = 0; 
float posy = 0;
float posyNeg= 180;
float posxNeg = 600;
int move = 0;
int diapo = 1;
boolean reinicio = false;
int startTime;
int duracion = 0;

PImage diapo1, diapo2, diapo3, diapo4, diapo5, diapo6, diapo7, diapo8, intro, viaje, prota, fiesta, reina, juicio, regreso;
PFont fuenteTitulo;
PFont fuenteTexto;
int fadeAlpha = 0;

void setup() {
  size(640, 480);
  noStroke();

  diapo1 = loadImage("inicio.jpg");
  diapo2 = loadImage("fondo1.jpg");
  diapo3 = loadImage("fondo2.jpg");
  diapo4 = loadImage("fondo3.jpg");
  diapo5 = loadImage("fondo5.jpg");
  diapo6 = loadImage("fondo6.jpg");
  diapo7 = loadImage("fondo7.jpg");
  diapo8 = loadImage("fondo8.jpg");

  intro = loadImage("intro.jpg");
  viaje = loadImage("principio.jpg");
  prota = loadImage("alicia.jpg");
  fiesta = loadImage("fiesta-del-te.jpg");
  reina = loadImage("reina-roja.jpg");
  juicio = loadImage("juicio.jpg");
  regreso = loadImage("regreso.jpg");

  fuenteTitulo = loadFont("MonotypeCorsiva-30.vlw");
  fuenteTexto = loadFont("MonotypeCorsiva-20.vlw");
}

void draw() {
  if (diapo == 1) {
    duracion = 5000; // 5 segundos
  } else if ((diapo == 5) || (diapo == 6)){
    duracion = 8000; // 8 segundos
  }
  else {
    duracion = 14000; // 14 segundos
  }

  if ((millis() - startTime >= duracion) && (diapo < 8)) {
    diapo = diapo + 1;
    posx = 0;
    posy = 0;
    posxNeg = 600;
    posyNeg = 180;
    fadeAlpha = 0;
    startTime = millis(); // Reiniciar temporizador
  } else if ((diapo == 8) && (reinicio == true)) {
    diapo = 1;
    fadeAlpha = 0;
    reinicio = false;
    startTime = millis(); 
  }

  if (diapo == 1) {
    diapo1();
  } else if (diapo == 2) {
    diapo2();
  } else if (diapo == 3) {
    diapo3();
  } else if (diapo == 4) {
    diapo4();
  } else if (diapo == 5) {
    diapo5();
  } else if (diapo == 6) {
    diapo6();
  } else if (diapo == 7) {
    diapo7();
  } else if (diapo == 8) {
    diapo8();
  }
  println(diapo);
}

// DIAPOSITIVAS

void diapo1() {
  image(diapo1, 0, 0, 640, 480);
  if (fadeAlpha < 255) fadeAlpha += 4;
  fill(255, fadeAlpha);
  textFont(fuenteTitulo);
  text("Alicia en el País de las Maravillas", 80, 100);
  text("\nAutor: Lewis Carroll \nPublicado en 1865", 80, 100);
}

void diapo2() {
  image(diapo2, 0, 0, 640, 480);
  image(intro, 60, 100, 200, 280);

  if (fadeAlpha < 255) fadeAlpha += 5;
  if (posy < 110) posy+=2;

  fill(#EAAAAA);
  rect(290, 70, 300, 340, 20);
  fill(255, fadeAlpha);
  textFont(fuenteTitulo);
  text("Introducción", 300, posy);
  textFont(fuenteTexto);
  text("La historia comienza cuando \nAlicia, ve pasar a un Conejo \nBlanco que parece tener mucha \nprisa. Movida por su curiosidad, \nlo sigue y cae por una \nmadriguera que la lleva a un \nmundo totalmente extraño, lleno \nde criaturas fantásticas y reglas \nilógicas.", 300, posy + 40);
}

void diapo3() {
  image(diapo3, 0, 0, 640, 480);
  image(prota, 60, 100, 160, 300);
  if (posx < 280) posx += 5;
  if (posy < 110) posy += 5;
  fill(#6FB7F0);
  rect(265, 70, 320, 340, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("Personaje principal", posx, posy);
  textFont(fuenteTexto);
  text("Alicia es una niña inteligente,\nimaginativa y valiente. A lo \nlargo del cuento, se enfrenta \na situaciones absurdas, personajes \nextraños y desafíos que la hacen \ncrecer. Aunque a veces se siente \nconfundida o frustrada, siempre \ntrata de comprender lo que ocurre \na su alrededor usando la lógica.", posx, posy + 40);
}

void diapo4() {
  image(diapo4, 0, 0, 640, 480);
  image(viaje, 60, 110, 200, 280);
  posx = 300;
  if (posyNeg > 110) posyNeg -= 5;
  fill(#E5C09B);
  rect(290, 65, 300, 350, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El inicio del viaje", posx, posyNeg);
  textFont(fuenteTexto);
  text("Al caer por la madriguera, Alicia \nentra a un mundo surrealista \ndonde nada es como parece. Allí \nse encuentra puertas mágicas, \npociones que cambian su tamaño \ny animales que hablan.\nComienza así un viaje en el que \nse mezcla el sueño con la\nrealidad.", posx, posyNeg + 40);
}

void diapo5() {
  image(diapo5, 0, 0, 640, 480);
  image(fiesta, 120, 240, 400, 200);
  posx=60;
  if (posy < 90) posy+=5;
  fill(#4DBFBE);
  rect(40, 50, 560, 160, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El té de locos", posx, posy);
  textFont(fuenteTexto);
  text("En una de las escenas más famosas, Alicia participa de una \nmerienda con el Sombrerero y la Liebre. La conversación no \ntiene sentido y el tiempo parece haberse detenido.", posx, posy + 40);
}

void diapo6() {
  image(diapo6, 0, 0, 640, 480);
  image(reina, 50, 100, 210, 280);
  if (posx < 300) posx += 5;
  posy = 140;
  fill(#E57496);
  rect(290, 100, 310, 260, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("La Reina de Corazones", posx, posy);
  textFont(fuenteTexto);
  text("Alicia llega al castillo de la \nReina de Corazones, una \nmonarca autoritaria que ordena \nejecuciones por capricho, \ndiciendo:", posx, posy + 40);
  text("¡Que le corten la cabeza!", posx, posy + 190);
}

void diapo7() {
  image(diapo7, 0, 0, 640, 480);
  image(juicio, 50, 100, 210, 280);
  if (posxNeg>300) posxNeg -= 5;
  posy = 110;
  fill(#F0DBA7);
  rect(290, 75, 300, 330, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El juicio absurdo", posxNeg, posy);
  textFont(fuenteTexto);
  text("Alicia asiste a un juicio absurdo \ndonde todo parece ridículo. Ella \nya no se deja llevar por la \nconfusión del lugar y defiende \nsu propio criterio. Este momento \nmarca un punto de madurez, \ndonde Alicia comienza a confiar \nen sí misma y en su \nrazonamiento.", posxNeg, posy + 40);
}

void diapo8() {
  image(diapo8, 0, 0, 640, 480);
  image(regreso, 60, 110, 200, 280);
  posx = 320;
  posy = 130;
  if (fadeAlpha < 255) fadeAlpha += 5;
  fill(#C173E0);
  rect(305, 90, 280, 280, 20);
  fill(255, fadeAlpha);
  textFont(fuenteTitulo);
  text("Regreso al mundo real", posx, posy);
  textFont(fuenteTexto);
  text("Alicia se despierta y se da \ncuenta de que todo fue un \nsueño. Sin embargo, el viaje \nha dejado huellas: ha \naprendido a cuestionar, a \nobservar con atención y \na valorar su imaginación.", posx, posy + 40);

  // Botón de reinicio
  fill(#D073F2);
  rect(490, 400, 100, 40, 30);
  fill(255);
  text("Reiniciar", 500, 425);
}

void mousePressed() {
  if (diapo == 8) {
    if (mouseX > 500 && mouseX < 600 && mouseY > 400 && mouseY < 440) {
      reinicio = true;
    }
  }
}
