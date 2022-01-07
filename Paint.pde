int krztalt = 1;
int wielkosc = 3;
int kolor = 8;
boolean klik = false;
void setup()
{
 size (960, 540);
 background(50);
 noStroke();
 fill(63,72, 204);
 rect(0,0, width, 100);
 
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
 rect(155, 55, 35, 35);
 
 stroke(35, 43, 131);
 line(200, 5, 200, 95);
 line(390, 5, 390, 95);
 line(670, 5, 670, 95);
 noStroke();
 
 fill(230, 230, 230);
 rect(210, 10, 80, 80);
 rect(300, 10, 80, 80);
 rect(400, 10, 80, 80);
 rect(490, 10, 80, 80);
 rect(580, 10, 80, 80);
 fill(255, 255, 255);
 rect(680, 10, 80, 80);
 
 /*
 for(int i = 0; i < 3; i = i++)
 {
  rect(i*90+400, 10, 80, 80);
 }
  */
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  fill(0, 0, 0);
  rect(250, 50, 50, 50);
  ellipse(340, 50, 50, 50);
  rect(440, 50, 3, 3);
  rect(530, 50, 25, 25);
  rect(620, 50, 60, 60);
  
  fill(255, 255, 255);
  rect(480, 320, 704, 396);
  fill(0, 0, 0);
}
void draw()
{
  
  println(mouseX);
  println(mouseY);
  println(klik);
  
  rectMode(CORNER);
  fill(50);
  rect(0, 100, 128, 440);
  rect(832, 100, 128, 440);
  rect(128, 100, 832, 22);
  rect(128, 518, 832, 22);
  rectMode(CENTER);
  
  switch(kolor)
  {
    case 1:
    fill(255, 0, 0);
    break;
    case 2:
    fill(0, 255, 0);
    break;
    case 3:
    fill(0, 0, 255);
    break;
    case 4:
    fill(255, 255, 255);
    break;
    case 5:
    fill(255, 255, 0);
    break;
    case 6:
    fill(255, 0, 255);
    break;
    case 7:
    fill(0, 255, 255);
    break;
    case 8:
    fill(0, 0, 0);
    break;
  }
  
  if(mouseX >= 128 && mouseX < 832 && mouseY >= 122 && mouseY < 518 && klik == true)
  {
    if(krztalt == 1)
    {
     rect(mouseX, mouseY, wielkosc, wielkosc); 
    }
    else
    {
     ellipse(mouseX, mouseY, wielkosc, wielkosc); 
    }
  }
  else if(mouseX >= 10 && mouseX < 45 && mouseY >= 10 && mouseY < 45 && klik == true)
  {
    kolor = 1;
  }
  else if(mouseX >= 55 && mouseX < 90 && mouseY >= 10 && mouseY < 45 && klik == true)
  {
    kolor = 2;
  }
  else if(mouseX >= 105 && mouseX < 140 && mouseY >= 10 && mouseY < 45 && klik == true)
  {
    kolor = 3;
  }
  else if(mouseX >= 155 && mouseX < 190 && mouseY >= 10 && mouseY < 45 && klik == true)
  {
    kolor = 4;
  }
   
  else if(mouseX >= 10 && mouseX < 45 && mouseY >= 55 && mouseY < 90 && klik == true)
  {
    kolor = 5;
  }
  else if(mouseX >= 55 && mouseX < 90 && mouseY >= 55 && mouseY < 90 && klik == true)
  {
    kolor = 6;
  }
  else if(mouseX >= 105 && mouseX < 140 && mouseY >= 55 && mouseY < 90 && klik == true)
  {
    kolor = 7;
  }
  else if(mouseX >= 155 && mouseX < 190 && mouseY >= 55 && mouseY < 90 && klik == true)
  {
    kolor = 8;
  }
  else if(mouseX >= 210 && mouseX < 290 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    krztalt = 1;
  }
  else if(mouseX >= 300 && mouseX < 380 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    krztalt = 0;
  }
  else if(mouseX >= 400 && mouseX < 480 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    wielkosc = 3;
  }
  else if(mouseX >= 490 && mouseX < 570 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    wielkosc = 25;
  }
  else if(mouseX >= 580 && mouseX < 660 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    wielkosc = 50;
  }
  else if(mouseX >= 680 && mouseX < 760 && mouseY >= 10 && mouseY < 90 && klik == true)
  {
    fill(255, 255, 255);
    rect(480, 320, 704, 396);
    fill(0, 0, 0);
   
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
