PImage img;

void setup() {
  img = loadImage("besoreferencia.jpg");

  size(800, 400);
  background(#B4852C);
  img = loadImage("beso.jpg");
}

void draw() {
  background(#B4852C);
  image(img, 0, 0, 400, 400);
  
  noStroke(); //desaparece el borde
  fill(#3C986C);
  quad(400, 350, 400, 400, 750, 400, 730, 330); //pasto
  fill(#F2CB2E);
  ellipse(580, 85, 250, 140); //manto
  quad(670, 250, 710, 190, 670, 100, 630, 110);
  quad(640, 350, 720, 330, 700, 200, 600, 130);

  fill(#FFF703);
  quad(490,395,580,400,590,70,500,60); //cuerpo del chabon
  ellipse(490,227,90,335); //cuerpo del chabon
  triangle(475,67,510,42,550,70); //hombro del chabon
  fill(#E39F80);//cuello
  arc(565,25,120,100,0,radians(160),OPEN);// radians() convierte grados a radianes

  fill(#B46B21);
  ellipse(640, 90, 110, 80); //pelo de la mina
  fill(#4A6F2C);
  arc(640, 90, 110, 90, HALF_PI, PI + HALF_PI); //flores de la cabeza
  fill(#F0E13A);
  quad(580, 140, 660, 140, 630, 320, 570, 400); //cuerpo de la mina
  ellipse(615, 270, 60, 80); //culo de la mina
  quad(570, 400, 630, 380, 665, 330, 620, 290); //piso el vestido de la chica

  fill(#EAC780);
  ellipse(640, 90, 70, 50); //cabeza de la mina
  fill(#B46B21);
  quad(670, 70, 660, 110, 670, 110, 690, 80); //flequillo
  fill(#CE8455);
  ellipse(610, 60, 70, 50); //cabeza del chabon

  fill(#EBB390);
  quad(550, 35, 532, 62, 560, 50, 570, 30); //mano de la chica
  
  fill(0);
  /*ellipse(580,50,70,50);
   ellipse(610,40,60,30); */
  quad(560, 30, 580, 70, 650, 50, 620, 25); //pelo del chabon

  fill(#D1985F);
  quad(665, 100, 642, 110, 660, 132, 680, 120); //mano derecha de la chabon
  quad(600, 100, 630, 105, 630, 120, 590, 120); //mano izquierda
  quad(590, 135, 580, 120, 590, 98, 620, 103); //mano izquierda

  //chica

  fill(#EBB390);
  ellipse(630, 135, 55, 42); //hombro de la mina
  quad(580, 125, 565, 125, 585, 95, 595, 100); //mano derecha 
  quad(580, 125, 600, 115, 597, 110, 570, 115); //dedo 
  quad(582, 208, 570, 210, 550, 160, 570, 160); //antebrazo de la mina
  quad(580, 210, 620, 160, 590, 155, 570, 200); //brazo de la mina
  quad(655, 330, 730, 335, 720, 345, 640, 365); //pierna de arriba de la chica
  quad(690, 335, 740, 370, 745, 360, 720, 325); //pie de la chica

  fill(#CBA77F);
  quad(655, 340, 720, 335, 720, 345, 640, 365); //pierna de abajo de la chica
  quad(700, 340, 740, 370, 745, 360, 730, 325); //pie de la chica

  fill(#C4B04D);
  quad(580, 165, 655, 175, 660, 140, 590, 130); //manga de la ropa de la mina


  /* //partes de las lineas
   stroke(0);
   noFill(); //desaparece el relleno de la figura
   line(450,70,450,370); //espalda del chavon
   line(450,70,500,40); //hombro
   line(500,40,550,30); //cuello
   bezier(500,40,510,75,550,70,570,70);//cuello de la ropa
   line(570,80,565,100); //linea que esta entre la cabeza del chico y la mano de la chica
   bezier(450,370,550,375,590,375,650,350);//piso de la ropa
   */

  //detalles
   
  fill(#FAC7E1); //flores del pelo 
  ellipse(670, 65, 5, 5);
  ellipse(685, 75, 5, 5);
  ellipse(685, 85, 5, 5);
  ellipse(680, 95, 5, 5);
  ellipse(685, 100, 5, 5);

  //rectangulos
  fill(0); //negro
  quad(525, 70, 500, 75, 510, 115, 530, 110);
  quad(470, 370, 482, 372, 482, 342, 470, 340);
  quad(555, 380, 570, 380, 570, 340, 555, 340);
  quad(535, 365, 540, 365, 540, 340, 535, 340);
  quad(520, 385, 525, 385, 525, 370, 520, 370);
  rect(475, 375, 4, 10);
  rect(560, 320, 4, 10);
  rect(560, 320, 4, 10);
  rect(510, 310, 10, 10);
  rect(530, 310, 4, 10);
  rect(524, 295, 6, 10);
  rect(518, 280, 6, 12);
  rect(555, 265, 15, 30);
  rect(455, 300, 8, 25);
  rect(470, 300, 4, 25);
  rect(470, 240, 10, 25);
  rect(570, 75, 7, 15);
  rect(560, 95, 4, 20);
  rect(470, 50, 4, 10);
  rect(560, 320, 4, 10);

  

  fill(255); //blanco
  quad(525, 397, 530, 397, 530, 387, 525, 387);

  fill(#298E21);//detalles del vestido en verde
  ellipse(622, 195, 55, 40);
  ellipse(595, 240, 30, 20);
  ellipse(630, 275, 30, 25);
  ellipse(597, 152, 35, 28);

  fill(#E02D2D); //detalles del vestido parte media en rojo
  ellipse(607, 145, 12, 7);
  ellipse(607, 155, 12, 7);
  
  fill(#FA1C1C); //detalles del vestido parte arriba en rojo
  ellipse(595, 160, 15, 10);
  ellipse(587, 160, 10, 10);
  ellipse(590, 154, 15, 10);
  ellipse(600, 150, 15, 10);
  ellipse(595, 142, 12, 7);
  ellipse(650, 150, 12, 7);
  ellipse(645, 157, 12, 7);
  ellipse(650, 165, 12, 7);

  fill(#E02D2D); //detalles del vestido parte media en rojo
  ellipse(622, 273, 13, 8); //la del culo
  ellipse(610, 205, 15, 10);
  ellipse(600, 195, 12, 9);
  ellipse(615, 194, 15, 10);
  ellipse(640, 190, 15, 10);
  ellipse(628, 183, 12, 8);
  ellipse(635, 202, 15, 10);
  
  ellipse(580, 214, 8, 8);  
  ellipse(580, 220, 10, 10);  

  fill(#FA1C1C); //detalles del vestido parte baja en rojo
  ellipse(600, 350, 15, 10);
  ellipse(595, 345, 15, 10);
  ellipse(605, 340, 15, 10);
  ellipse(593, 355, 15, 10);
  ellipse(615, 340, 15, 10);
  ellipse(615, 348, 15, 10);
  ellipse(625, 350, 15, 10);
  ellipse(620, 360, 15, 10);
  ellipse(600, 360, 15, 10);
  ellipse(587, 360, 15, 10);


  fill(#FA1C1C); //flores rojo
  ellipse(420, 380, 5, 5);
  ellipse(425, 385, 5, 5);
  ellipse(4, 3, 5, 5);
 

  fill(255);
  textSize(20);
  text((400+mouseX)+"-"+mouseY, mouseX, mouseY);
}
