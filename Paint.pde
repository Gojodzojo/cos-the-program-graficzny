int krztalt = 1;
int wielkosc = 50;
float przezroczystosc = 100;
color kolor = color(0, 0, 0, 255);
float czerwony = 0;
float zielony = 0;
float niebieski = 0;
boolean klik = false;
int ramkaSzerokosc = 1920;
int ramkaWysokosc = 980;
PGraphics ramka;
void setup()
{
 size (1920, 1080);
 ramka = createGraphics(ramkaSzerokosc, ramkaWysokosc);
 ramka.beginDraw();
 ramka.clear();
 ramka.endDraw();
}
void draw()
{
 background(50);
 noStroke();
 fill(63,72, 204);
 rect(0,0, width, 100);             //pasek narzędzi
 
 fill(255, 0, 0);
 rect(10, 10, 35, 35);
 
 fill(0, 255, 0);
 rect(55, 10, 35, 35);
 
 fill(0, 0, 255);
 rect(105, 10, 35, 35);
 
 fill(255, 255, 255);
 rect(155, 10, 35, 35);
 
 fill(255, 255, 0);
 rect(10, 55, 35, 35);
 
 fill(255, 0, 255);
 rect(55, 55, 35, 35);
 
 fill(0, 255, 255);
 rect(105, 55, 35, 35);
 
 fill(0, 0, 0);
 rect(155, 55, 35, 35);            //kolory
 
 stroke(35, 43, 131);
 line(200, 5, 200, 95);
 line(390, 5, 390, 95);
 line(510, 5, 510, 95);
 noStroke();                        //linie paska zadań
 
 fill(230, 230, 230);
 rect(680, 10, 80, 80);
 fill(0, 0,0);
 textSize(15);
 text("Wyczyść", 690, 50);          // przycisk czyszczenia
 
 
 fill(230, 230, 230);
 for(int i = 0; i <= 1; i++)
 {
  rect(i*90+210, 10, 80, 80);
 }                                  // przyciski narzędzi
 
  rectMode(CENTER);
  ellipseMode(CENTER);
  stroke(35, 43, 131);
  strokeWeight(2);
  
  line(400, 30, 500, 30);
  text("Wielkość: "+int(wielkosc),400,20);
  ellipse(wielkosc + 400, 30, 10, 10);                //suwak wielkości
  
  line(400, 70, 500, 70);
  text("Przezroczystość: "+int(100-przezroczystosc)+"%",400,60);
  ellipse(przezroczystosc + 400, 70, 10, 10);    //suwak przezroczystości
  
  noStroke();
  
  fill(0, 0, 0);
  rect(250, 50, 50, 50);
  ellipse(340, 50, 50, 50);
  
  rectMode(CORNER);
  fill(255, 255, 255);
  rect(0, 100, ramkaSzerokosc, ramkaWysokosc);
  fill(0, 0, 0);                                //tylna ramka

  image(ramka, 0, 100);
  ramka.noStroke();
  
 
  ramka.rectMode(CENTER);
  ramka.ellipseMode(CENTER);
  
  if(mouseX >= 0 && mouseX < ramkaSzerokosc && mouseY >= 100 && mouseY < ramkaWysokosc + 100 && klik == true)
  {
    if(krztalt == 1)
    {
      ramka.fill(kolor);
      ramka.beginDraw();
      ramka.rect(mouseX, mouseY - 100, wielkosc, wielkosc); 
      ramka.endDraw();
      image(ramka, 0, 100);
    }
    else
    {
      ramka.fill(kolor);
      ramka.beginDraw();
      ramka.ellipse(mouseX, mouseY - 100, wielkosc, wielkosc); 
      ramka.endDraw();
      image(ramka, 0, 100);
    }
  }
  else if(mouseX >= 10 && mouseX < 45 && mouseY >= 10 && mouseY < 45 && klik == true ||
  
  mouseX >= 55 && mouseX < 90 && mouseY >= 10 && mouseY < 45 && klik == true ||
  
  mouseX >= 105 && mouseX < 140 && mouseY >= 10 && mouseY < 45 && klik == true ||
  
  mouseX >= 155 && mouseX < 190 && mouseY >= 10 && mouseY < 45 && klik == true ||
 
  mouseX >= 10 && mouseX < 45 && mouseY >= 55 && mouseY < 90 && klik == true ||
  
  mouseX >= 55 && mouseX < 90 && mouseY >= 55 && mouseY < 90 && klik == true ||
  
  mouseX >= 105 && mouseX < 140 && mouseY >= 55 && mouseY < 90 && klik == true ||
 
  mouseX >= 155 && mouseX < 190 && mouseY >= 55 && mouseY < 90 && klik == true)
  {
    czerwony = red(get(mouseX, mouseY));
    zielony = green(get(mouseX, mouseY));
    niebieski = blue(get(mouseX, mouseY));
    kolor = color(czerwony, zielony, niebieski, przezroczystosc);
  }
  
  else if(mouseX >= 210 && mouseX < 290 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    krztalt = 1;
  }
  else if(mouseX >= 300 && mouseX < 380 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    krztalt = 0;
  }
  else if(mouseX >= 390 && mouseX < 510 && mouseY >= 20 && mouseY < 40 && klik == true)
  {
   wielkosc = mouseX - 400;
   if(wielkosc <= 0)
   {
    wielkosc=1; 
   }
   else if(wielkosc >= 100)
   {
    wielkosc=100; 
   }
  }
  else if(mouseX >= 390 && mouseX < 510 && mouseY >= 60 && mouseY < 80 && klik == true)
  {
    
   przezroczystosc = mouseX - 400;
   if(przezroczystosc >=100)
   {
    przezroczystosc = 100; 
   }
   else if (przezroczystosc <= 0)
   {
    przezroczystosc = 1; 
   }
   kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
  }
  else if(mouseX >= 680 && mouseX < 760 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    ramka.beginDraw();
    ramka.clear();
    ramka.endDraw();
  }
  rectMode(CORNER);
  println(przezroczystosc*2.55);
}




void mousePressed()
{
 klik = true; 
}
void mouseReleased()
{
 klik = false; 
}
