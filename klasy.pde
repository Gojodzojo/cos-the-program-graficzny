class okno
{
  int pozycjaX;
  int pozycjaY;
  int szerokosc;
  int wysokosc;
  String nazwa;
  color kolorTla;
  boolean wyswietlanie;
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
  
  void obraz(){}
}

class paletaKolorow extends okno
{
  paletaKolorow(int x,int y,int s,int w, color k, String n)
  {
    super(x,y,s,w,k,n);
  }
  
    
  
  void obraz()
  {
    int r = 256;
    int g = 0;
    int b = 0;
    int tryb = 5;
    int odcien;
    int nasycenie;
    int jasnosc;
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
    strokeWeight(1);
    colorMode(HSB);
    for(int i = 1; i <= 255; i++)
    {
      stroke(hue(kolor),saturation(kolor),i);
      line(pozycjaX + 300, pozycjaY + 295 - i,pozycjaX + 350, pozycjaY + 295 - i);
    }
    for(int i = 1; i <= 255; i++)
    {
      stroke(hue(kolor),255-i,brightness(kolor));
      line(pozycjaX + 300, pozycjaY + 40 - i,pozycjaX + 350, pozycjaY + 40 - i);
    }
    colorMode(RGB);
    if(dist(mouseX,mouseY,pozycjaX+150,pozycjaY+165) <= 765/PI/2 && klik == true)
    {
    czerwony = red(get(mouseX, mouseY));
    zielony = green(get(mouseX, mouseY));
    niebieski = blue(get(mouseX, mouseY));
    kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
    }
    else if(przycisk(pozycjaX + 300, pozycjaY + 40, 50,255))
    {
      /*jasnosc = 255 - (mouseY - pozycjaY - 40);
      colorMode(HSB);
      kolor = color(hue(kolor),saturation(kolor),jasnosc);
      println(jasnosc);
      colorMode(RGB);*/
      czerwony = red(get(mouseX, mouseY));
    zielony = green(get(mouseX, mouseY));
    niebieski = blue(get(mouseX, mouseY));
    kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
    }
  }
}
