void przyciskiPasywne()
{
  if(przycisk(10,10,35,35) ||
  
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
  else if(przycisk(210, 55, 35, 35))
  {
    krztalt = 5;
  }
  else if(przycisk(255, 55, 35, 35))
  {
    krztalt = 6;
  }
  else if(przycisk(300, 55, 35, 35))
  {
    krztalt = 7;
  }
  else if(przycisk(550, 10, 80, 80))
  {
    ramka.beginDraw();
    ramka.clear();
    ramka.endDraw();
  }
  else if(przycisk(640, 10, 80, 80))
  {
    selectOutput("Zapisz plik", "zapis");
  }
  else if(przycisk(730, 10, 80, 80))
  {
    selectInput("Wczytaj plik", "wczytanie");
  }
  else if(przycisk(820, 10, 80, 80))
  {
    okno[1].wyswietlanie = true;
  }
  else if(przycisk(910, 10, 80, 80))
  {
    okno[0].wyswietlanie = true;
  }
}

void przyciskiAktywne()
{
  //zmiana wielkości rysowania
  if(przycisk(390, 20, 120, 20))
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
  //zmiana przezroczystosci
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
  else if(przycisk(1000, 60, 120, 20))
  {
    przyblizenie = (mouseX - 1010)/50.0;
    if(przyblizenie >=2)
   {
    przyblizenie = 2; 
   }
   else if (przyblizenie <= 0)
   {
    przyblizenie = 0.01; 
   }
  }
  //najechanie na przycisk zmiany wielkosci
  else if(najechanie(ramkaSzerokosc, ramkaWysokosc/2 + 90, 40, 40) ||
          najechanie(ramkaSzerokosc, ramkaWysokosc + 90, 40, 40)   ||
          najechanie(ramkaSzerokosc/2, ramkaWysokosc + 90, 40, 40))
  {
   ramka.beginDraw();
   schowek2 = ramka.get(0,0,ramkaSzerokosc, ramkaWysokosc);
   ramka.endDraw();
  }
  else if(przycisk(ramkaSzerokosc, ramkaWysokosc/2 + 90, 40, 30) && schowek2 != null)
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
  else if(przycisk(ramkaSzerokosc, ramkaWysokosc + 90, 40, 40) && schowek2 != null)
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
  else if(przycisk(ramkaSzerokosc/2 - 10, ramkaWysokosc + 90, 30, 40) && schowek2 != null)
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
          
  
}

void zapis(File selection)
{
  if (selection == null)
  {
    println("Window was closed or the user hit cancel.");
  }
  else
  {
    String sciezka = selection.getPath();
    nazwaProjektu = selection.getName();
    ramka.save(sciezka + ".png");
  }
}

void wczytanie(File selection)
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
    ramka.beginDraw();
    ramka.image(schowek2,0,0);
    ramka.endDraw();
  }
}

boolean przycisk(int odX, int odY, float szerokosc, float wysokosc)
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

boolean najechanieIKlik(int odX, int odY, int szerokosc, int wysokosc)
{
  boolean stan;
  if(mouseX >= odX && mouseX < odX + szerokosc && mouseY >= odY && mouseY < odY + wysokosc)
  {stan = true;}
  else
  {stan = false;}
  return stan;
}
