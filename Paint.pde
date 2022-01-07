//włościwości rysowania
int krztalt = 1;
float wielkosc = 50;
float przezroczystosc = 100;
color kolor = color(0, 0, 0, 255);
float czerwony = 0;
float zielony = 0;
float niebieski = 0;
float silaSprayu = 1;
//właściwości ramki
int ramkaSzerokosc = 500;
int ramkaWysokosc = 500;
int wysokoscPaska = 100;
float przyblizenie = 1;
PGraphics ramka;
PGraphics ramka2;
PGraphics szachownica;
PImage schowek;
PImage schowek2;
String nazwaProjektu = "Bez tytułu";
boolean odswierzanieRamki2 = true;

//właściwości myszy
boolean klik = false;
int starapozycjamyszyY;
int starapozycjamyszyX;
int zaznaczenieX;
int zaznaczenieY;
int wysokoscZaznaczenia;
int szerokoscZaznaczenia;
int poczatekLiniiX;
int poczatekLiniiY;

//narzędzia
boolean naEkranie = false;
int wklejenieX;
int wklejenieY;
int wklejenieSzerokosc;
int wklejenieWysokosc;
float wklejenieObrot=0;
//obiekty
okno[] okno = new okno[2];
void setup()
{
  //frameRate(120);
 size (1090, 900);
 surface.setResizable(true);
 surface.setTitle("Costam the Program Graficzny - "+ nazwaProjektu + ".png");
 kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
 okno[0] = new opcje(width/2,height/2,500,500,color(63,72,204),"Opcje");
 okno[1] = new paletaKolorow(width/2,height/2,400,300,color(63,72,204),"Paleta Kolorów");
 zmianawielkosci();
  ramka.beginDraw();
 ramka.noStroke();
 ramka.endDraw();
 textAlign(CENTER);
}
void draw()
{
  odswierzanieRamki2();
  interfejs();
  rysowanie();
  przyciskiAktywne();
  
  
  image(szachownica,0,wysokoscPaska);
  image(ramka, 0, wysokoscPaska);
  kursor();
  if(naEkranie)
  {
    wklejanieRamka2();
  }
  image(ramka2, 0, wysokoscPaska);
  for(int i = 1; i <= okno.length; i++)
{
  if(okno[i-1].wyswietlanie)
  {
    okno[i-1].wyswietl();
  }
}
/*int transX = 100;
int transY = 100;
float m00 = (cos(wklejenieObrot)*mouseX + sin(wklejenieObrot)*1);
float m01 = (-sin(wklejenieObrot)*mouseX + cos(wklejenieObrot)*1);
float m10 = (cos(wklejenieObrot)*mouseY + sin(wklejenieObrot)*1);
float m11 = (-sin(wklejenieObrot)*mouseY + cos(wklejenieObrot)*1);
float nowyX = m00*m01;
float nowyY = m10*m11;
 pushMatrix();
 rotate(wklejenieObrot);
 //translate(transX,transY);
 fill(255);
 rect(nowyX,nowyY,50,50);
 popMatrix();*/
  starapozycjamyszyX = mouseX;
  starapozycjamyszyY = mouseY;
}

void keyPressed()
{
  if(key == 19)
  {
    selectOutput("Zapisz:", "zapis");
  }
  else if(key == 15)
  {
    selectInput("Wczytaj:", "wczytanie");
  }
  if(key == 3)
  {
    kopiowanie();
    ramka2.clear();
    
  }
  if(key == 22)
  {
    if(schowek != null)
    {
      wklejenieX = mouseX;
      wklejenieY = mouseY;
      wklejenieSzerokosc = schowek.width;
      wklejenieWysokosc = schowek.height;
      wklejenieObrot = int(PI/3);
      naEkranie = true;
      wklejanieRamka2();
    }
  }
  if(key == 24)
  {
    wycinanie();
  }
  
}

void mousePressed()
{
 klik = true;
 if(krztalt == 5 || krztalt == 6)
 {
   zaznaczenieX = mouseX;
   zaznaczenieY = mouseY;
 }
 if(krztalt == 6)
 {
   poczatekLiniiX = mouseX;
   poczatekLiniiY = mouseY;
   ramka2.clear();
   szerokoscZaznaczenia = 0;
   wysokoscZaznaczenia = 0;
 }
 if(schowek != null)
 {
   pushMatrix();
   translate(wklejenieX,wklejenieY);
   rotate(wklejenieObrot);
   if(!(najechanieIKlikMatrix(schowek.width/-2,schowek.height/-2,wklejenieSzerokosc + 30, wklejenieWysokosc + 30,wklejenieX,wklejenieY,wklejenieObrot)) && naEkranie == true)
      {
        naEkranie = false;
        ramka.beginDraw();
        ramka.pushMatrix();
        ramka.translate(wklejenieX,wklejenieY-wysokoscPaska);
        ramka.rotate(wklejenieObrot);
        ramka.image(schowek,schowek.width/-2,schowek.height/-2,wklejenieSzerokosc,wklejenieWysokosc);
        ramka.popMatrix();
        ramka.endDraw();
        ramka2.clear();
      }
   popMatrix();
 }
}
void mouseReleased()
{
  if(okno[0].wyswietlanie)
  {
    okno[0].transformacjaKoloru();
  }
  przyciskiPasywne();
  klik = false;
  if(krztalt == 6)
  {
    ramka2.beginDraw();
    ramka2.stroke(0,0,255);
    ramka2.strokeWeight(1);
    ramka2.line(poczatekLiniiX, poczatekLiniiY - wysokoscPaska, mouseX, mouseY - wysokoscPaska);
    ramka2.stroke(0);
    ramka2.noFill();
    ramka2.rectMode(CORNER);
    szerokoscZaznaczenia-=zaznaczenieX;
    wysokoscZaznaczenia-=zaznaczenieY;
    ramka2.endDraw();
  }
}
