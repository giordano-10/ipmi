float posx = 0; 
float posy = 0;
float posyNeg= 180;
float posxNeg = 600;
int move = 0;
int diapo = 1;
boolean reinicio = false;
int startTime;
int duracion = 0;

PImage diapo1, diapo2, diapo3, diapo4, diapo5, sombrerero, teatro, oruga, reina;
PFont fuenteTitulo;
PFont fuenteTexto;
int fadeAlpha = 0; // Para el fade-in

void setup() {
  size(640, 480);

  diapo1 = loadImage("fondo1.jpg");
  diapo2 = loadImage("fondo2.jpg");
  diapo3 = loadImage("fondo3.jpg");
  diapo4 = loadImage("fondo4.jpg");
  diapo5 = loadImage("fondo5.jpg");  

  sombrerero = loadImage("sombrerero1.jpg");
  teatro = loadImage("carpintero1.jpg");
  oruga = loadImage("oriente1.jpg");
  reina = loadImage("reina1.jpg");
  
  fuenteTitulo = loadFont("Bison-Bold-40.vlw");
  fuenteTexto = loadFont("Amiri-BoldItalic-20.vlw");
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

  // Cambiar de diapositiva según tiempo transcurrido
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
    startTime = millis(); // Reiniciar temporizador
  }

  // Mostrar diapositiva actual
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
  }
}

// === DIAPOSITIVAS ===

void diapo1() {
  image(diapo1, 0, 0, 640, 480);
  if (fadeAlpha < 255) fadeAlpha += 4;
  fill(255, fadeAlpha);
  textFont(fuenteTitulo);
  textSize(60);
  text("Alice: Madness Returns", 90, 220);
  textSize(30);
  text("Locura, trauma y la reconstrucción de la mente", 80, 280);
}

void diapo2() {
  image(diapo2, 0, 0, 640, 480);
  if (fadeAlpha < 255) fadeAlpha += 5;
  if (posy < 110) posy+=2;

  fill(255, fadeAlpha);
  textFont(fuenteTitulo);
  text("La Mente de Alicia", 60, posy);
  textFont(fuenteTexto);
  text("El comienzo: \nAlicia lucha contra la culpa tras \nel trágico incendio de su infancia.", 60, posy + 40);
  text("Su Refugio: \nSe adentra en el País de las \nMaravillas para recuperar sus \nrecuerdos perdidos y sanar su \npsique fragmentada.", 60, posy + 130);
}

void diapo3() {
  image(diapo3, 0, 0, 640, 480);
  posx = 60;
  if (posyNeg > 110) posyNeg -= 5;

  fill(255);
  textFont(fuenteTitulo);
  text("El Sendero del Trauma", posx, posyNeg);
  textFont(fuenteTexto);
  text("Un viaje a través de mundos que simbolizan su deterioro mental", posx, posyNeg + 40);
  text("Desde el dominio mecánico del Sombrerero hasta el Laberinto de \nla Reina de Corazones, enfrentando la verdad de su pasado.", posx, posyNeg + 80);

  image(sombrerero, posx + 30, posyNeg + 130, 110, 150);
  image(teatro, posx + 150, posyNeg + 130, 110, 150);
  image(oruga, posx + 270, posyNeg + 130, 110, 150);
  image(reina, posx + 390, posyNeg + 130, 110, 150);

}

void diapo4() {
  image(diapo4, 0, 0, 640, 480);
  if (posx < 60) posx += 5;
  posy = 110;

  fill(255);
  textFont(fuenteTitulo);
  text("Estética de la Locura", posx, posy);
  textFont(fuenteTexto);
  text("Dualidad Visual: \nEl contraste definitivo entre la deprimente realidad de un \nLondres victoriano gris y un País de las Maravillas distorsionado, \ncolorido pero decrépito.", posx, posy + 40);
  text("Escenarios del Trauma: \nCada paisaje actúa como un espejo físico de la fragmentación y \nel colapso de la psique de Alicia.", posx, posy + 150);
}

void diapo5() {
  image(diapo5, 0, 0, 640, 480);
  if (posxNeg>60) posxNeg -= 5;
  posy = 110;
  
  fill(255);
  textFont(fuenteTitulo);
  text("El Despertar", posxNeg, posy);
  textFont(fuenteTexto);
  text("Un viaje psicológico de superación donde la fantasía es la \núnica herramienta para confrontar el dolor y reconstruir \nla propia mente.", posxNeg, posy + 40);
  text("Spicy Horse Games (2011) | Dirección de American McGee.", posxNeg, posy + 140);

  // Botón de reinicio
  fill(#9117BF);
  rect(60, 290, 120, 40, 30);
  fill(255);
  textFont(fuenteTitulo);
  textSize(20);
  text("Reiniciar", 90, 316);
}

void mousePressed() {
  if (diapo == 8) {
    if (mouseX > 60 && mouseX < 160 && mouseY > 290 && mouseY < 330) {
      reinicio = true;
    }
  }
}
