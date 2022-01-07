void rysowanie()
{ 
  boolean opcje = false;
  boolean kolory = false;
  if(!(okno[0].wyswietlanie))
  {
    opcje = true;
  }
  else if(najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc) == false)
  {
    opcje = true;
  }
  if(!(okno[1].wyswietlanie))
  {
    kolory = true;
  }
  else if(najechanieIKlik(okno[1].pozycjaX,okno[1].pozycjaY,okno[1].szerokosc,okno[1].wysokosc) == false)
  {
    kolory = true;
  }
  ramka.noStroke();
  if(przycisk(0, 100, ramkaSzerokosc, ramkaWysokosc) && naEkranie == false && opcje == true && kolory == true)
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
      //wypelnienie(mouseX,mouseY - wysokoscPaska);
    }
    else if(krztalt == 4)
    {
      spray();
    }
    else if(krztalt == 5)
    {
      if(najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc)==false)
      {
        zaznaczeniePola();
      }
    }
    else if(krztalt == 6)
    {
      if(!najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc))
      {
        dowolneZaznaczeniePola();
      }
    }
    else if(krztalt == 7)
    {
      pobieranieKoloru();
    }
  }
}
void kursor()
{
  boolean kolory = false;
  boolean opcje = false;
  if(!(okno[1].wyswietlanie))
  {
    kolory = true;
  }
  else if(najechanieIKlik(okno[1].pozycjaX,okno[1].pozycjaY,okno[1].szerokosc,okno[1].wysokosc) == false)
  {
    kolory = true;
  }
  if(!(okno[0].wyswietlanie))
  {
    opcje = true;
  }
  else if(najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc) == false)
  {
    opcje = true;
  }
  if(najechanieIKlik(0, wysokoscPaska, ramkaSzerokosc, ramkaWysokosc) && opcje && kolory)
  {
      ramka2.beginDraw();
      ramka2.rectMode(CENTER);
      ramka2.stroke(czerwony,zielony,niebieski);
      ramka2.fill(kolor);
      ramka2.clear();
      if(krztalt == 1)
      {
        ramka2.rect(mouseX, mouseY - wysokoscPaska, wielkosc, wielkosc);
        //noCursor();
      }
      else if(krztalt == 2)
      {
        ramka2.ellipse(mouseX, mouseY - wysokoscPaska, wielkosc, wielkosc);
        noCursor();
      }
      else if(krztalt == 4)
      {
        ramka2.noFill();
        ramka2.ellipse(mouseX, mouseY - wysokoscPaska, wielkosc, wielkosc);
        noCursor();
      }
      else if(krztalt == 3 || krztalt == 5 || krztalt == 6)
      {
        cursor();
      }
      ramka2.endDraw();
  }
  else
  {
    cursor();
  }
  
  
}


void zmianawielkosci()
{
  ramka = createGraphics(ramkaSzerokosc, ramkaWysokosc);
  ramka2 = createGraphics(ramkaSzerokosc, ramkaWysokosc);
  szachownica = createGraphics(ramkaSzerokosc, ramkaWysokosc);
  szachownica.beginDraw();
  szachownica.rectMode(CORNER);
  szachownica.fill(255, 255, 255);
  szachownica.rect(0, 0, ramkaSzerokosc, ramkaWysokosc);
  szachownica.fill(0);
  /*for(float w = 0; w*10 <= ramkaWysokosc; w++)
  {
   for(int s = 0; s <= ramkaSzerokosc; s += 20)
   {
     if(w/2 > int(w)/2)
     {
       szachownica.rect(s, w*10, 10, 10);
     }
     else
     {
       szachownica.rect(s+10, w*10, 10, 10);
     }
   }
  }*/
  szachownica.endDraw();
  
}
void odswierzanieRamki2()
{
  if(krztalt == 6 && naEkranie == false || krztalt == 3 && naEkranie == false)
  {
    odswierzanieRamki2 = false;
  }
  else if(zaznaczenieX != 0 && zaznaczenieY != 0 && krztalt == 5 && klik == false)
  {
    odswierzanieRamki2 = false;
  }
  
 if(odswierzanieRamki2 && !najechanieIKlik(okno[0].pozycjaX,okno[0].pozycjaY,okno[0].szerokosc,okno[0].wysokosc))
 {
  ramka2.beginDraw();
  ramka2.clear();
  ramka2.endDraw();
 }
 else if (!(odswierzanieRamki2) && klik == true || krztalt != 6 || naEkranie == true)
 {
   odswierzanieRamki2 = true;
 }
}
void interfejs()
{
     background(50);
     noStroke();
     rectMode(CORNER);
     textAlign(CENTER);
     fill(motyw);
     rect(0,0, width, wysokoscPaska);             //pasek narzędzi
     
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
     
     stroke(red(motyw)-100, green(motyw)-100, blue(motyw)-100);
     line(200, 5, 200, 95);
     line(390, 5, 390, 95);
     line(540, 5, 540, 95);
     noStroke();                                              //linie paska zadań
     
     fill(230);
     for(int i = 0; i <= 4; i++)
     {
       rect(550 + 90*i,10, 80, 80);
     }
     for(int i = 0; i <= 3; i++)
     {
      rect(i*45+210, 10, 35, 35);
     }                                                      // przyciski narzędzi
     for(int i = 0; i <= 3; i++)
     {
      rect(i*45+210, 55, 35, 35);
     }
     textSize(15);
     fill(0);
     text("Wyczyść", 590, 50);             // przyciski
     text("Zapisz",  680, 50);
     text("Wczytaj", 770, 50);
     text("Kolory",  860, 50);
     text("Filtry",  950, 50);

  fill(230);
  text(ramkaSzerokosc + " X " + ramkaWysokosc + "p", 1060, 50);
 
  rectMode(CENTER);
  ellipseMode(CENTER);
  stroke(red(motyw)-100, green(motyw)-100, blue(motyw)-100);
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
  
  line(1010, 70, 1110, 70);
  //text("Przezroczystość",450,60);
  //text(int(100-przezroczystosc)+"%", 520, 75);
  ellipse(przyblizenie*50 + 1010, 70, 10, 10);
  
  noStroke();
  
  fill(0, 0, 0);
  rect(227, 28, 22, 22);
  ellipse(273, 28, 22, 22);
  
  fill(230);
  rect(ramkaSzerokosc*przyblizenie + 10, ramkaWysokosc/2*przyblizenie + wysokoscPaska, 10,10);
  rect(ramkaSzerokosc*przyblizenie/2, ramkaWysokosc*przyblizenie + 10 + wysokoscPaska, 10,10);
  rect(ramkaSzerokosc*przyblizenie + 10, ramkaWysokosc*przyblizenie + 10 + wysokoscPaska, 10,10);
}
