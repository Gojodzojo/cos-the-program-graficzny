int krztalt = 1;
float wielkosc = 50;
float przezroczystosc = 100;
color kolor = color(0, 0, 0, 255);
float czerwony = 0;
float zielony = 0;
float niebieski = 0;
boolean klik = false;
int ramkaSzerokosc = 500;
int ramkaWysokosc = 500;
PGraphics ramka;
int starapozycjamyszyX;
int starapozycjamyszyY;
PImage schowek1;
PImage schowek2;
PImage szachownica;
float przyblizenie = 1;
String nazwaProjektu = "Obraz";
void setup()
{
 size (1000, 900);
 surface.setResizable(true);
 surface.setTitle("Costam the Program Graficzny - "+ nazwaProjektu);
 kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
 zmianawielkosci();
 
 textAlign(CENTER);
}
void draw()
{
 background(50);
 noStroke();
 rectMode(CORNER);
 
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
 line(540, 5, 540, 95);
 noStroke();                                              //linie paska zadań
 
 fill(230, 230, 230);
 rect(550, 10, 80, 80);
 fill(0, 0,0);
 textSize(15);
 text("Wyczyść", 590, 50);             // przycisk czyszczenia
 
 fill(230, 230, 230);
 rect(640, 10, 80, 80);
 fill(0, 0,0);
 text("Zapisz", 680, 50);
 
 fill(230, 230, 230);
 rect(730, 10, 80, 80);
 fill(0, 0,0);
 text("Wczytaj", 770, 50);
 
 fill(230, 230, 230);
 text(ramkaSzerokosc + " X " + ramkaWysokosc + "p", 880, 50);
 
 fill(230);
 for(int i = 0; i <= 3; i++)
 {
  rect(i*45+210, 10, 35, 35);
 }                                                      // przyciski narzędzi
 
  rectMode(CENTER);
  ellipseMode(CENTER);
  stroke(35, 43, 131);
  strokeWeight(2);
  textSize(13);
  
  line(400, 30, 500, 30);
  text("Wielkość",450,20);
  text(int(wielkosc), 520, 35);
  ellipse(wielkosc + 400, 30, 10, 10);                  //suwak wielkości
  
  line(400, 70, 500, 70);
  text("Przezroczystość",450,60);
  text(int(100-przezroczystosc)+"%", 520, 75);
  ellipse(100 - przezroczystosc + 400, 70, 10, 10);      //suwak przezroczystości
  
  
  noStroke();
  
  fill(0, 0, 0);
  rect(227, 28, 22, 22);
  ellipse(273, 28, 22, 22);
  
  fill(230);
  rect(ramkaSzerokosc + 10, ramkaWysokosc/2 + 100, 10,10);
  rect(ramkaSzerokosc/2, ramkaWysokosc + 110, 10,10);
  rect(ramkaSzerokosc + 10, ramkaWysokosc + 110, 10,10);
  
  image(szachownica,0,100);                                //tylna ramka

  image(ramka, 0, 100);
  ramka.noStroke();
  
 
  
  
  
  if( przycisk(0, 100, ramkaSzerokosc, ramkaWysokosc))
  {
    if(krztalt == 1)
    {
      kwadrat();
    }
    else if(krztalt == 2)
    {
      kolo();
    }
    else if(krztalt == 3)
    {
      wypelnienie1(mouseX,mouseY - 100);
    }
    else if(krztalt == 4)
    {
      spray();
    }
  }
  else if(przycisk(10,10,35,35) ||
  
          przycisk(55,10,35,35)||
  
          przycisk(105,10,35,35)||
  
          przycisk(155,10,35,35)||
 
          przycisk(10,55,35,35)||
  
          przycisk(55,55,35,35)||
  
          przycisk(105,55,35,35)||
 
          przycisk(155,55,35,35))
  {
    czerwony = red(get(mouseX, mouseY));
    zielony = green(get(mouseX, mouseY));
    niebieski = blue(get(mouseX, mouseY));
    kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
  }
  
  else if(przycisk(210, 10, 35, 35))
  {
    krztalt = 1;
  }
  else if(przycisk(255, 10, 35, 35))
  {
    krztalt = 2;
  }
  else if(przycisk(300, 10, 35, 35))
  {
    krztalt = 3;
  }
  else if(przycisk(345, 10, 35, 35))
  {
    krztalt = 4;
  }
  else if(przycisk(390, 20, 120, 20))
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
  else if(przycisk(390,60,120,20))
  {
    
   przezroczystosc = 100-(mouseX - 400);
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
  else if(przycisk(550, 10, 80, 80))
  {
    ramka.beginDraw();
    ramka.clear();
    ramka.endDraw();
  }
  else if(przycisk(ramkaSzerokosc, ramkaWysokosc/2 + 90, 40, 30))
  {
    ramkaSzerokosc = mouseX-15;
    if(ramkaSzerokosc<=10)
    {
      ramkaSzerokosc = 10;
    }
    zmianawielkosci();
    ramka.beginDraw();
    ramka.image(schowek2,0,0);
    ramka.endDraw();
  }
  else if(przycisk(ramkaSzerokosc, ramkaWysokosc + 90, 40, 40))
  {
    ramkaSzerokosc = mouseX-15;
    ramkaWysokosc = mouseY-115;
    if(ramkaSzerokosc<=10)
    {
      ramkaSzerokosc = 10;
    }
    if(ramkaWysokosc<=10)
    {
      ramkaSzerokosc = 10;
    }
    zmianawielkosci();
    ramka.beginDraw();
    ramka.image(schowek2,0,0);
    ramka.endDraw();
  }
  else if(przycisk(ramkaSzerokosc/2 - 10, ramkaWysokosc + 90, 30, 40))
  {
    ramkaWysokosc = mouseY-115;
    if(ramkaWysokosc<=10)
    {
      ramkaWysokosc = 10;
    }
    zmianawielkosci();
    ramka.beginDraw();
    ramka.image(schowek2,0,0);
    ramka.endDraw();
  }
  else if(najechanie(ramkaSzerokosc, ramkaWysokosc/2 + 90, 30, 30) ||
          najechanie(ramkaSzerokosc, ramkaWysokosc + 90, 30, 30)   ||
          najechanie(ramkaSzerokosc/2, ramkaWysokosc + 90, 30, 30))
          {
            ramka.beginDraw();
            schowek2 = ramka.get(0,0,ramkaSzerokosc, ramkaWysokosc);
            ramka.endDraw();
          }
  else if(przycisk(640, 10, 80, 80))
  {
    
  }
  
  starapozycjamyszyX = mouseX;
  starapozycjamyszyY = mouseY;
}
boolean przycisk(int odX, int odY, int szerokosc, int wysokosc)
{
  boolean stan;
  if(mouseX >= odX && mouseX < odX + szerokosc && mouseY >= odY && mouseY < odY + wysokosc && klik == true)
  {stan = true;}
  else
  {stan = false;}
  return stan;
}

boolean najechanie(int odX, int odY, int szerokosc, int wysokosc)
{
  boolean stan;
  if(mouseX >= odX && mouseX < odX + szerokosc && mouseY >= odY && mouseY < odY + wysokosc && klik == false)
  {stan = true;}
  else
  {stan = false;}
  return stan;
}




void zmianawielkosci()
{
  ramka = createGraphics(ramkaSzerokosc, ramkaWysokosc);
  rectMode(CORNER);
  fill(255, 255, 255);
  rect(0, 100, ramkaSzerokosc, ramkaWysokosc);
  fill(0);
  for(float w = 0; w*10 <= ramkaWysokosc; w++)
  {
   for(int s = 0; s <= ramkaSzerokosc; s += 20)
   {
     if(w/2 > int(w)/2)
     {
       rect(s, w*10 + 100, 10, 10);
     }
     else
     {
       rect(s+10, w*10 + 100, 10, 10);
     }
   }
  }
  szachownica = get(0,100,ramkaSzerokosc, ramkaWysokosc);
}



void wypelnienie(int x, int y)
{
  
  ramka.loadPixels();
  color domyslnykolor = ramka.pixels[y*ramkaSzerokosc+x];
  ramka.pixels[y*ramkaSzerokosc+x] = kolor;
  /*if(ramka.pixels[y*ramkaSzerokosc+x-1] == domyslnykolor && x-1 >= 0)
  {
    wypelnienie(x-1,y);
    
  }*/
  if(ramka.pixels[(x+1)+y*ramkaSzerokosc] == domyslnykolor && x+1 >= ramkaSzerokosc)
  {
    wypelnienie(x+1,y);
  }
  ramka.updatePixels();
  
}



void wypelnienie1(int x, int y)
{
  ramka.beginDraw();
  color domyslnykolor = ramka.get(x,y);
  ramka.set(x,y,kolor);
  if(x-1 >= 0 && ramka.get(x-1,y) == domyslnykolor)
  {
    wypelnienie1(x-1,y);
  }
  if(y-1 >= 0 && ramka.get(x,y-1) == domyslnykolor)
  {
    wypelnienie1(x,y-1);
  }
  if(x+1 >= 0 && ramka.get(x+1,y) == domyslnykolor)
  {
    wypelnienie1(x+1,y);
  }
  if(y+1 >= 0 && ramka.get(x,y+1) == domyslnykolor)
  {
    wypelnienie1(x,y+1);
  }
  
  ramka.endDraw();
}

void kwadrat()
{
  ramka.beginDraw();
      ramka.rectMode(CENTER);
      ramka.fill(kolor);
      ramka.rect(mouseX, mouseY - 100, wielkosc, wielkosc); 
      ramka.endDraw();
      image(ramka, 0, 100);
}

void kolo()
{
      ramka.beginDraw();
      ramka.ellipseMode(CENTER);
      ramka.stroke(kolor);
      ramka.strokeWeight(wielkosc);
      ramka.strokeJoin(ROUND);
      ramka.strokeCap(ROUND);
      ramka.line(starapozycjamyszyX, starapozycjamyszyY - 100, mouseX, mouseY - 100); 
      ramka.endDraw();
      image(ramka, 0, 100);
}

void spray()
{
    float promien;
    float x;
    float y;
    for(int i = 0; i <= 14; i++)
    {
    promien = random(-wielkosc/2,wielkosc/2);
    x = random(-promien, promien);
    y = sq(promien) - sq(x);
    ramka.beginDraw();
    ramka.fill(kolor);
    ramka.rect(x*random(-1,1)*random(0,1)+mouseX,sqrt(y)*random(-1,1)+mouseY-100, 1,1);
    ramka.endDraw();
    }
}

void folderSelected(File selection)
{
  if (selection == null)
  {
    println("Window was closed or the user hit cancel.");
  }
  else
  {
    String sciezka = selection.getAbsolutePath()+"\\";
    ramka.save(sciezka + nazwaProjektu + ".png");
  }
}

void fileSelected(File selection)
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else 
  {
    schowek2 = loadImage(selection.getAbsolutePath());
    nazwaProjektu = selection.getName();
    surface.setTitle("Costam the Program Graficzny - "+ nazwaProjektu);
    ramkaSzerokosc = schowek2.width;
    ramkaWysokosc = schowek2.height;
    zmianawielkosci();
    fill(255, 255, 255);
    rect(0, 100, ramkaSzerokosc, ramkaWysokosc);
    fill(0);
    for(float w = 0; w*10 <= ramkaWysokosc; w++)
    {
     for(int s = 0; s <= ramkaSzerokosc; s += 20)
     {
     if(w/2 > int(w)/2)
       {
         rect(s, w*10 + 100, 10, 10);
       }
     else
       {
         rect(s+10, w*10 + 100, 10, 10);
       }
     }
    }
    szachownica = get(0,100,ramkaSzerokosc, ramkaWysokosc);
    image(szachownica,0,100);
    ramka.beginDraw();
    ramka.image(schowek2,0,0);
    ramka.endDraw();
  }
}
void keyPressed()
{
  if(key == 's')
  {
    selectFolder("Select a folder to process:", "folderSelected");
  }
  else if(key == 'l')
  {
    selectInput("Select a file to process:", "fileSelected");
  }
}

void mousePressed()
{
 klik = true; 
}
void mouseReleased()
{
 klik = false; 
}
