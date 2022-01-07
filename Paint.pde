
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
color motyw = color(63,72,204);
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
color domyslnykolor;


//obiekty
okno[] okno = new okno[2];
void setup()
{
  //frameRate(120);
 size (1130, 900);
 surface.setResizable(true);
 surface.setTitle("Costam the Program Graficzny - "+ nazwaProjektu + ".png");
 kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
 okno[0] = new opcje(width/2,height/2,500,500,motyw,"Opcje");
 okno[1] = new paletaKolorow(width/2,height/2,400,300,motyw,"Paleta Kolorów");
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
  
  image(szachownica,0,wysokoscPaska,ramkaSzerokosc*przyblizenie,ramkaWysokosc*przyblizenie);
  image(ramka, 0, wysokoscPaska,ramkaSzerokosc*przyblizenie,ramkaWysokosc*przyblizenie);
  kursor();
  if(naEkranie)
  {
    wklejanieRamka2();
  }
  image(ramka2, 0, wysokoscPaska,ramkaSzerokosc*przyblizenie,ramkaWysokosc*przyblizenie);
  for(int i = 1; i <= okno.length; i++)
  {
    if(okno[i-1].wyswietlanie)
    {
      okno[i-1].wyswietl();
    }
  }
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
      wklejenieObrot = 0;
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
 if(krztalt == 3)
    {
      wypelnienie(mouseX,mouseY - wysokoscPaska);
    }
 if(!najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc) && !najechanieIKlik(okno[1].pozycjaX,okno[1].pozycjaY,okno[1].szerokosc,okno[1].wysokosc))
 {
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
 }
 if(okno[0].wyswietlanie)
  {
    okno[0].transformacjaKoloru();
  }
 if(schowek != null)
 {
   pushMatrix();
   translate(wklejenieX,wklejenieY);
   rotate(wklejenieObrot);
   if(!(najechanieIKlik(wklejenieX,wklejenieY,wklejenieSzerokosc + 30, wklejenieWysokosc + 30)) && naEkranie == true)
      {
      naEkranie = false;
      ramka.beginDraw();
      ramka.image(schowek,wklejenieX,wklejenieY-wysokoscPaska,wklejenieSzerokosc,wklejenieWysokosc);
      ramka.endDraw();
      ramka2.clear();
      }
   popMatrix();
 }
}
void mouseReleased()
{
  przyciskiPasywne();
  klik = false;
  if(krztalt == 6 && !najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc) && !najechanieIKlik(okno[1].pozycjaX,okno[1].pozycjaY,okno[1].szerokosc,okno[1].wysokosc))
  {
    ramka2.beginDraw();
    ramka2.stroke(0,0,255);
    ramka2.strokeWeight(1);
    ramka2.line(poczatekLiniiX, poczatekLiniiY - wysokoscPaska, mouseX, mouseY - wysokoscPaska);
    ramka2.stroke(0);
    ramka2.noFill();
    ramka2.rectMode(CORNER);

    ramka2.endDraw();
  }
}
