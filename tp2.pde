float posx = 0;
float posy = 0;
int move = 0;
int diapo = 1;
int framesPerDiapo = 300; // 5 seg
boolean reinicio = false;
PImage diapo1, diapo2, diapo3, diapo4, diapo5, diapo6, diapo7, diapo8, diapo9, intro, viaje, prota, pers1, pers2, pers3, fiesta, reina, juicio, regreso;
PFont fuenteTitulo;
PFont fuenteTexto;
int fadeAlpha = 0; // Para el fade-in

void setup() {
  size(640, 480);
  diapo1 = loadImage("inicio.jpg");
  diapo2 = loadImage("fondo1.jpg");
  diapo3 = loadImage("fondo2.jpg");
  diapo4 = loadImage("fondo3.jpg");
  diapo5 = loadImage("fondo4.jpg");
  diapo6 = loadImage("fondo5.jpg");
  diapo7 = loadImage("fondo6.jpg");
  diapo8 = loadImage("fondo7.jpg");
  diapo9 = loadImage("fondo8.jpg");
  
  intro = loadImage("intro.jpg");
  viaje = loadImage("principio.jpg");
  prota = loadImage("alicia.jpg");
  pers1 = loadImage("gato-sonriente.jpg");
  pers2 = loadImage("oruga.jpg");
  pers3 = loadImage("sombrerero.jpg");
  fiesta = loadImage("fiesta-del-te.jpg");
  reina = loadImage("reina-roja.jpg");
  juicio = loadImage("juicio.jpg");
  regreso = loadImage("regreso.jpg");

  fuenteTitulo = loadFont("MonotypeCorsiva-30.vlw");
  fuenteTexto = loadFont("MonotypeCorsiva-20.vlw");
}

void draw() {
  
  if ((frameCount % framesPerDiapo == 0) && (diapo < 9)) {
    diapo = diapo + 1;
    fadeAlpha = 0; // reiniciar fade cuando cambia
  } else if ((diapo == 9) && (reinicio == true)) {
    diapo = 1;
    reinicio = false;
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
  } else if (diapo == 9) {
    diapo9();
  }
  println(diapo);
}

// DIAPOSITIVAS

void diapo1() {
  image(diapo1, 0, 0, 640, 480);
  
  posx = 80;
  posy = 100;
  if (fadeAlpha < 255) {
    fadeAlpha += 3; // velocidad del fade
  }
  fill(255, fadeAlpha); // texto con opacidad
  
  textFont(fuenteTitulo);
  text("Alicia en el País de las Maravillas", posx, posy);
  text("\nAutor: Lewis Carroll \nPublicado en 1865", posx, posy);
}
void diapo2() {
  image(diapo2, 0, 0, 640, 480);
  image(intro, 60, 100, 200, 280);

  posx = 300;
  posy = 90;
  if (fadeAlpha < 255) {
    fadeAlpha += 3; // velocidad del fade
  }

  fill(255, fadeAlpha); // texto con opacidad
  
  fill(#EAAAAA); rect(290, 60, 300, 320, 20);
  noStroke();
  fill(255);
  textFont(fuenteTitulo);
  text("Introducción", posx, posy);
  textFont(fuenteTexto);
  text("La historia comienza cuando \nAlicia, ve pasar a un Conejo \nBlanco que parece tener mucha \nprisa. Movida por su curiosidad, \nlo sigue y cae por una \nmadriguera que la lleva a un \nmundo totalmente extraño, lleno \nde criaturas fantásticas y reglas \nilógicas.", posx, posy + 40);
  fill(255); // restaurar a opaco para otros usos
}

void diapo3() {
  image(diapo3, 0, 0, 640, 480);
  image(prota, 60, 100, 160, 300);

  posx = 290;
  posy = 90;
  
  fill(#6FB7F0); rect(280, 55, 310, 330, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("Personaje principal", posx, posy);
  textFont(fuenteTexto);
  text("Alicia es una niña inteligente,\nimaginativa y valiente. A lo \nlargo del cuento, se enfrenta \na situaciones absurdas, personajes \nextraños y desafíos que la hacen \ncrecer. Aunque a veces se siente \nconfundida o frustrada, siempre \ntrata de comprender lo que ocurre \na su alrededor usando la lógica.", posx, posy + 40);
}

void diapo4() {
  image(diapo4, 0, 0, 640, 480);
  image(viaje,60, 110, 210, 280);
  
  posx = 300;
  posy = 90;
    
  fill(#E5C09B); rect(290, 50, 300, 340, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El inicio del viaje", posx, posy);
  textFont(fuenteTexto);
  text("Al caer por la madriguera, Alicia \nentra a un mundo surrealista \ndonde nada es como parece. Allí \nse encuentra puertas mágicas, \npociones que cambian su tamaño \ny animales que hablan.\nComienza así un viaje en el que \nse mezcla el sueño con la\nrealidad.", posx, posy + 40);
}

void diapo5() {
  image(diapo5, 0, 0, 640, 480);

  image(pers1, 60, 140, 120, 180);
  image(pers2, 250, 140, 120, 180);
  image(pers3, 430, 140, 120, 180);
  
  posx = 35;
  posy = 70;
  
  fill(#6FB7F0); rect(20, 40, 590, 90, 20);
  rect(35, 340, 180, 120, 20); //personaje 1
  rect(250, 340, 180, 120, 20); //personaje 2
  rect(430, 340, 180, 120, 20); //personaje 3
  fill(255);
  textFont(fuenteTitulo);  
  text("Encuentros curiosos", posx, posy);
  textFont(fuenteTexto, 19);
  text("A lo largo de su aventura, Alicia conoce personajes muy peculiares los cuales son:", posx, posy + 40);
  text("El Gato de Cheshire \nAparece y desaparece, \ndejando solo su sonrisa.", posx + 20, posy + 300);
  text("La Oruga Azul \nHabla en acertijos.", posx + 220, posy + 300);
  text("El Sombrerero Loco y la \nLiebre de Marzo \nSon compañeros de una \nmerienda interminable.", posx + 390, posy + 300);

}

void diapo6() {
  image(diapo6, 0, 0, 640, 480);
  image(fiesta, 120, 240, 400, 200); 
   
  posx = 60;
  posy = 90;  
    
  fill(#6FB7F0); rect(40, 50, 560, 160, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El té de locos", posx, posy);
  textFont(fuenteTexto);
  text("En una de las escenas más famosas, Alicia participa de una \nmerienda con el Sombrerero y la Liebre. La conversación no \ntiene sentido y el tiempo parece haberse detenido.", posx, posy + 40);
}

void diapo7() {
  image(diapo7, 0, 0, 640, 480);
  image(reina, 50, 100, 210, 280);
  
  posx = 300;
  posy = 90;
  
  fill(#E5C09B); rect(290, 50, 310, 260, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("La Reina de Corazones", posx, posy);
  textFont(fuenteTexto);
  text("Alicia llega al castillo de la \nReina de Corazones, una monarca \nautoritaria que ordena ejecuciones \npor capricho, diciendo:", posx, posy + 40);
  text("¡Que le corten la cabeza!", posx, posy + 160);
}

void diapo8() {
  image(diapo8, 0, 0, 640, 480);
  image(juicio, 50, 100, 210, 280);

  posx = 300;
  posy = 90;
  
  fill(#C173E0); rect(290, 55, 310, 330, 20);
  fill(255);
  textFont(fuenteTitulo);
  text("El juicio absurdo", posx, posy);
  textFont(fuenteTexto);
  text("Alicia asiste a un juicio absurdo \ndonde todo parece ridículo. Ella \nya no se deja llevar por la \nconfusión del lugar y defiende \nsu propio criterio. Este momento \nmarca un punto de madurez, donde \nAlicia comienza a confiar en sí \nmisma y en su razonamiento.", posx, posy + 40);
}

void diapo9() {
  image(diapo9, 0, 0, 640, 480);
  image(regreso, 60, 110, 210, 280);
  
  posx = 320;
  posy = 90;
  
  fill(#C173E0); rect(300, 50, 290, 300, 20);
  fill(255);
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

// Detecta clic en botón de reinicio
void mousePressed() {
  if (diapo == 9) {
    if (mouseX > 500 && mouseX < 600 && mouseY > 400 && mouseY < 440) {
      reinicio = true;
    }
  }
}
