class okno
{
  int pozycjaX;
  int pozycjaY;
  int szerokosc;
  int wysokosc;
  String nazwa;
  color kolorTla;
  boolean wyswietlanie;
   PImage obraz;
  okno(int x,int y,int s,int w, color k, String n)
  {
    pozycjaX = x;
    pozycjaY = y;
    szerokosc = s;
    wysokosc = w;
    kolorTla = k;
    nazwa = n;
  }
  void wyswietl()
  {
    rectMode(CORNER);
    fill(kolorTla);
    stroke(red(kolorTla)-100, green(kolorTla)-100, blue(kolorTla)-100);
    strokeWeight(3);
    rect(pozycjaX,pozycjaY,szerokosc,wysokosc);
    line(pozycjaX,pozycjaY + 30,pozycjaX + szerokosc,pozycjaY + 30);
    line(pozycjaX + szerokosc - 30,pozycjaY, pozycjaX + szerokosc - 30,pozycjaY + 30);
    line(pozycjaX + szerokosc - 25,pozycjaY + 5, pozycjaX + szerokosc - 5,pozycjaY + 25);
    line(pozycjaX + szerokosc - 5,pozycjaY + 5, pozycjaX + szerokosc - 25,pozycjaY + 25);
    fill(red(kolorTla)-100, green(kolorTla)-100, blue(kolorTla)-100);
    textAlign(LEFT);
    textSize(20);
    text(nazwa, pozycjaX + 10,pozycjaY + 22);
    this.obraz();
    if(przycisk(pozycjaX, pozycjaY, szerokosc - 30, 30))
    {
      pozycjaX += (starapozycjamyszyX - mouseX)*-1;
      pozycjaY += (starapozycjamyszyY - mouseY)*-1;
    }
    else if(przycisk(pozycjaX + szerokosc - 30,pozycjaY,25,25))
    {
      wyswietlanie = false;
    }
  }
  void transformacjaKoloru(){}
  void obraz(){}
}

class paletaKolorow extends okno
{
  color tymczasowyKolor = color(0);
  int jasnosc = 127;
  paletaKolorow(int x,int y,int s,int w, color k, String n)
  {
    super(x,y,s,w,k,n);
  }
  
  void obraz()
  {
    if(obraz == null)
    {
      int r = 256;
      int g = 0;
      int b = 0;
      int tryb = 5;
      stroke(0);
      strokeWeight(2);
      pushMatrix();
      translate(pozycjaX+150,pozycjaY+165);
      for(int i = 1; i <= 765; i ++)
      {
        if(r == 256 && g == 0 && b == 0){tryb = 1;}
        else if(r == 256 && g == 256 && b == 0){tryb = 2;}
        else if(r == 0 && g == 256 && b == 0){tryb = 3;}
        else if(r == 0 && g == 256 && b == 256){tryb = 4;}
        else if(r == 0 && g == 0 && b == 256){tryb = 5;}
        else if(r == 256 && g == 0 && b == 256){tryb = 6;}
        switch(tryb)
        {
          case 1:
            g += 2;
            break;
          case 2:
            r -= 2;
            break;
          case 3:
            b += 2;
            break;
          case 4:
            g -= 2;
            break;
          case 5:
            r += 2;
            break;
          case 6:
            b -= 2;
            break;
        }
        stroke(r,g,b);
        line(0,0,765/PI/2,0);
        rotate(TWO_PI/765);
      }
      ellipseMode(RADIUS);
      fill(czerwony,zielony,niebieski);
      noStroke();
      ellipse(0,0,50,50);
      popMatrix();
      obraz = get(pozycjaX,pozycjaY,szerokosc,wysokosc);
    }
    else
  {
    image(obraz,pozycjaX,pozycjaY);
    ellipseMode(RADIUS);
    fill(czerwony,zielony,niebieski);
    noStroke();
    ellipse(pozycjaX+150,pozycjaY+165,50,50);
    if(dist(mouseX,mouseY,pozycjaX+150,pozycjaY+165) <= 765/PI/2 && dist(mouseX,mouseY,pozycjaX+150,pozycjaY+165) >= 50 && klik == true)
    {
      czerwony = red(get(mouseX, mouseY));
      zielony = green(get(mouseX, mouseY));
      niebieski = blue(get(mouseX, mouseY));
      kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
      tymczasowyKolor = kolor;
      }
      strokeWeight(1);
      colorMode(HSB);
      if(tymczasowyKolor != color(0))
      {
        for(int i = 1; i <= 255; i+=2)
        {
          stroke(hue(tymczasowyKolor),saturation(tymczasowyKolor),i);
          line(pozycjaX + 300, pozycjaY + 295 - i/2,pozycjaX + 350, pozycjaY + 295 - i/2);
        }
        for(int i = 1; i <= 255; i+=2)
        {
          stroke(hue(tymczasowyKolor),255-i,brightness(tymczasowyKolor));
          line(pozycjaX + 300, pozycjaY + 167 - i/2,pozycjaX + 350, pozycjaY + 167 - i/2);
        }
      }
      else
      {
        for(int i = 1; i <= 255; i++)
         {
           stroke(hue(tymczasowyKolor),saturation(tymczasowyKolor),i);
           line(pozycjaX + 300, pozycjaY + 295 - i,pozycjaX + 350, pozycjaY + 295 - i);
         }
      }
      colorMode(RGB);
      stroke(255);
      triangle(pozycjaX + 351,jasnosc + pozycjaY + 40,pozycjaX + 361,jasnosc + pozycjaY + 45,pozycjaX + 361,jasnosc + pozycjaY + 35);
      czerwony = red(get(pozycjaX + 325, jasnosc + pozycjaY + 40));
      zielony = green(get(pozycjaX + 325, jasnosc + pozycjaY + 40));
      niebieski = blue(get(pozycjaX + 325, jasnosc + pozycjaY + 40));
      kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
      if(przycisk(pozycjaX + 300, pozycjaY + 40, 50,255))
      {
      czerwony = red(get(mouseX, mouseY));
      zielony = green(get(mouseX, mouseY));
      niebieski = blue(get(mouseX, mouseY));
      kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
      jasnosc = mouseY - pozycjaY - 40;
      }
    }
  }
}
class opcje extends okno
{
  opcje(int x,int y,int s,int w, color k, String n)
  {
    super(x,y,s,w,k,n);
  }
  void obraz()
  {
    textSize(15);
    fill(230);
    text("Modulacja kolorów",pozycjaX + 10, pozycjaY + 53);
    noStroke();
    for(int i = 0; i <= 3; i++)
    {
      rect(pozycjaX + 10, pozycjaY + 35 + i*60, 230, 50);
    }
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Negatyw", pozycjaX + 125, pozycjaY + 65);
    text("Czarno-biały", pozycjaX + 125, pozycjaY + 125);
    text("Szarość", pozycjaX + 125, pozycjaY + 185);
    text("Rozmycie", pozycjaX + 125, pozycjaY + 245);
  }
  void transformacjaKoloru()
  {
    if(przycisk(pozycjaX + 10, pozycjaY + 35, 230, 50))
    {
      ramka.beginDraw();
      ramka.filter(INVERT);
      ramka.endDraw();
    }
    if(przycisk(pozycjaX + 10, pozycjaY + 95, 230, 50))
    {
      ramka.beginDraw();
      ramka.filter(THRESHOLD);
      ramka.endDraw();
    }
    if(przycisk(pozycjaX + 10, pozycjaY + 155, 230, 50))
    {
      ramka.beginDraw();
      ramka.filter(GRAY);
      ramka.endDraw();
    }
    if(przycisk(pozycjaX + 10, pozycjaY + 215, 230, 50))
    {
      ramka.beginDraw();
      ramka.filter(BLUR, 6);
      ramka.endDraw();
    }
  }
}
