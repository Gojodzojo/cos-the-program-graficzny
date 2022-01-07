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
      ramka.line(starapozycjamyszyX, starapozycjamyszyY - wysokoscPaska, mouseX, mouseY - wysokoscPaska); 
      ramka.endDraw();
      image(ramka, 0, 100);
}

void spray()
{
    float promien;
    float x;
    float y;
    for(int i = 0; i <= wielkosc*silaSprayu; i++)
    {
      promien = random(1,wielkosc/2);
      x = random(1, promien);
      y = sq(promien) - sq(x);
      ramka.beginDraw();
      ramka.fill(kolor);
      ramka.rect(x*random(-1,1)+mouseX,sqrt(y)*random(-1,1)+mouseY-wysokoscPaska, 1,1);
      ramka.endDraw();
    }
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
  
  ramka.beginDraw();
}

void zaznaczeniePola()
{
    ramka2.beginDraw();
    ramka2.stroke(0,0,255);
    ramka2.strokeWeight(2);
    ramka2.noFill();
    ramka2.rectMode(CORNER);
    ramka2.rect(zaznaczenieX, zaznaczenieY-wysokoscPaska, mouseX - zaznaczenieX, mouseY-zaznaczenieY);
    szerokoscZaznaczenia = mouseX - zaznaczenieX;
    wysokoscZaznaczenia = mouseY-zaznaczenieY;
    ramka2.endDraw();
}
void dowolneZaznaczeniePola()
{
    ramka2.beginDraw();
    ramka2.stroke(0,0,255);
    ramka2.strokeWeight(1);
    ramka2.line(starapozycjamyszyX, starapozycjamyszyY - wysokoscPaska, mouseX, mouseY - wysokoscPaska);
    if(mouseX < zaznaczenieX)
    {
      zaznaczenieX = mouseX;
    }
    if(szerokoscZaznaczenia < mouseX)
    {
      szerokoscZaznaczenia = mouseX;
    }
    if(mouseY < zaznaczenieY)
    {
      zaznaczenieY = mouseY;
    }
    if(wysokoscZaznaczenia < mouseY)
    {
      wysokoscZaznaczenia = mouseY;
    }
    ramka2.endDraw();
}
void pobieranieKoloru()
{
    ramka.beginDraw();
    czerwony = red(ramka.get(mouseX, mouseY-wysokoscPaska));
    zielony = green(ramka.get(mouseX, mouseY-wysokoscPaska));
    niebieski = blue(ramka.get(mouseX, mouseY-wysokoscPaska));
    kolor = color(czerwony, zielony, niebieski, przezroczystosc*2.55);
    ramka.endDraw();
}
void kopiowanie()
{
    if(krztalt == 5)
    {
      ramka.beginDraw();
      schowek = ramka.get(zaznaczenieX, zaznaczenieY-wysokoscPaska,szerokoscZaznaczenia, wysokoscZaznaczenia);
      ramka.endDraw();
      ramka2.beginDraw();
      ramka2.clear();
      ramka2.endDraw();
    }
    else if (krztalt == 6)
    {
      
      PGraphics tymczasowyObraz = createGraphics(szerokoscZaznaczenia, wysokoscZaznaczenia);
      ramka.beginDraw();
      ramka2.beginDraw();
      tymczasowyObraz.beginDraw();
      boolean kopiowanie=false;
      for (int x = zaznaczenieX; x <= zaznaczenieX + szerokoscZaznaczenia; x++)
        {
          kopiowanie=false;
        for (int y = zaznaczenieY-wysokoscPaska; y <= zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia; y++)
          {
            if(ramka2.get(x,y) == color(0,0,0,0))
            {
                if(kopiowanie)
                {
                  tymczasowyObraz.set(x-zaznaczenieX,y-(zaznaczenieY-wysokoscPaska),ramka.get(x,y));
                }
                else
                {
                  tymczasowyObraz.set(x-zaznaczenieX,y-(zaznaczenieY-wysokoscPaska),color(0,0,0,0));
                }
            }
            else
            {
                if(ramka2.get(x,y+1) == color(0,0,0,0))
                {
                  boolean czyjest = false;
                  for(int nowey = y + 1; nowey <= zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia; nowey++)
                  {
                    if(ramka2.get(x,nowey) != color(0,0,0,0))
                    {
                      czyjest = true;
                      nowey = zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia;
                    }
                    
                  }
                  if(czyjest)
                  {
                    kopiowanie = !kopiowanie;
                  }
                  else
                  {
                    kopiowanie = false;
                  }
                }
            }
          }
        }
        tymczasowyObraz.endDraw();
        ramka.endDraw();
        ramka2.endDraw();
        
        
        tymczasowyObraz.beginDraw();
        schowek = tymczasowyObraz.get(0,0,szerokoscZaznaczenia, wysokoscZaznaczenia);
        tymczasowyObraz.endDraw();
        
        
    }
}
void wklejanieRamka2()
{
    ramka2.beginDraw();
    if(schowek != null)
    {
      ramka2.image(schowek,wklejenieX,wklejenieY-wysokoscPaska,wklejenieSzerokosc,wklejenieWysokosc);
    }
    ramka2.stroke(0,0,255);
    ramka2.strokeWeight(2);
    ramka2.noFill();
    ramka2.rectMode(CORNER);
    ramka2.rect(wklejenieX, wklejenieY-wysokoscPaska, wklejenieSzerokosc, wklejenieWysokosc);
    ramka2.strokeWeight(1);
    ramka2.stroke(0);
    ramka2.fill(255);
    ramka2.rect(wklejenieX + wklejenieSzerokosc+3, wklejenieY-wysokoscPaska + wklejenieWysokosc/2 -5, 10, 10);
    ramka2.rect(wklejenieX + wklejenieSzerokosc+2, wklejenieY-wysokoscPaska + wklejenieWysokosc + 2, 10, 10);
    ramka2.rect(wklejenieX + wklejenieSzerokosc/2 -5, wklejenieY-wysokoscPaska + wklejenieWysokosc + 3, 10, 10);
    ramka2.endDraw();
    if(przycisk(wklejenieX,wklejenieY,wklejenieSzerokosc, wklejenieWysokosc))
    {
      wklejenieX += (starapozycjamyszyX - mouseX)*-1;
      wklejenieY += (starapozycjamyszyY - mouseY)*-1;
    }
    else if(przycisk(wklejenieX + wklejenieSzerokosc+3, wklejenieY + wklejenieWysokosc/2 -5, 27, 27))
    {
      wklejenieSzerokosc += (starapozycjamyszyX - mouseX)*-1;
    }
    else if(przycisk(wklejenieX + wklejenieSzerokosc+2, wklejenieY + wklejenieWysokosc + 2, 28, 28))
    {
      wklejenieSzerokosc += (starapozycjamyszyX - mouseX)*-1;
      wklejenieWysokosc += (starapozycjamyszyY - mouseY)*-1;
    }
    else if(przycisk(wklejenieX + wklejenieSzerokosc/2 -5, wklejenieY + wklejenieWysokosc + 3, 27, 27))
    {
      wklejenieWysokosc += (starapozycjamyszyY - mouseY)*-1;
    }
}
void wycinanie()
{
  kopiowanie();
  if(krztalt == 5)
  {
    ramka.beginDraw();
    for (int x = zaznaczenieX; x <= zaznaczenieX + szerokoscZaznaczenia; x++)
    {
      for (int y = zaznaczenieY-wysokoscPaska; y <= zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia; y++)
      {
        ramka.set(x, y, color(0,0,0,0));
      }
    }
    ramka.endDraw();
    ramka2.beginDraw();
    ramka2.clear();
    ramka2.endDraw();
  }
  else if(krztalt == 6)
  {
    ramka.beginDraw();
    ramka2.beginDraw();
     boolean kopiowanie=false;
      for (int x = zaznaczenieX; x <= zaznaczenieX + szerokoscZaznaczenia; x++)
        {
          kopiowanie=false;
        for (int y = zaznaczenieY-wysokoscPaska; y <= zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia; y++)
          {
            if(ramka2.get(x,y) == color(0,0,0,0))
            {
                if(kopiowanie)
                {
                  ramka.set(x, y, color(0,0,0,0));
                  
                }
            }
            else
            {
                if(ramka2.get(x,y+1) == color(0,0,0,0))
                {
                  
                  boolean czyjest = false;
                  for(int nowey = y + 1; nowey <= zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia; nowey++)
                  {
                    if(ramka2.get(x,nowey) != color(0,0,0,0))
                    {
                      czyjest = true;
                      nowey = zaznaczenieY-wysokoscPaska + wysokoscZaznaczenia;
                    }
                    
                  }
                  if(czyjest)
                  {
                    kopiowanie = !kopiowanie;
                  }
                  else
                  {
                    kopiowanie = false;
                  }
                }
            }
          }
        }
        ramka2.clear();
        ramka.endDraw();
        ramka2.endDraw();
  }
    
}
