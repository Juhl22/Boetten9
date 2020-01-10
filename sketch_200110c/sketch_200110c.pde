//SPØRGSMÅL

//1.Hvad er forskellen på de tre programmer?
//I Program 1 placerer man bare fluer uden at de bevæger sig.
//I Program 2 placerer man fluer der bevæger sig i en random retning indtil man placerer en ny flue, hvor den gamle så stopper.
//I Program 3 placerer man fluer der bevæger sig i en random retning, dette bliver de ved med selvom man placerer en ny flue.

//2.Start Flue1: Tryk fire gange på skærmen, hvor mange objekter tegnes nu hvert frame og hvorfor?
//Der bliver tegnet 1 objekt hver gang den kører igennem draw, fordi de ikke bliver gemt i en arrayliste, så programmet kan kun håndtere 1 flue af gangen.

//3.Start Flue2move: Tryk fire gange på skærmen, hvor mange objekter bevæges nu hvert frame og hvorfor?
//Der bliver stadig kun tegnet 1 objekt hver gang den kører igennem draw, igen fordi de ikke bliver gemt i en arrayliste.

//4.Hvis du fjerner pushMatrix og popMatrix i de tre programmer, har det så nogen betydning og hvorfor?
//Hvis man fjerner dem i program 1 og 2 har det ingen betydning, men hvis du fjerner dem i program 3 har det en betydning, dette er fordi at pushMatrix og popMatrix sørger at man kun rykker origum for det specificerede objekt.

//5.I Flue3moveAll bruges ArrayList. Nævn nogle vigtige forskelle på ArrayList og almindelige arrays?
//I ArrayList har mange flere funktioner og er generelt nemmere at arbejde med.

ArrayList<Flue> flueListe = new ArrayList<Flue>();

//Her opretter man en arrayliste for objektet Flue

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
    f.edges();
//Denne kode sørger for at alle fluer bliver tegnet og flyttet før vi gentager drawet
  }
}

void keyPressed(){
  if (key == 'e' || key == 'E'){
    flueListe.add(new Flue(random(width),random(height),2));
  } else {
  flueListe.add(new Flue());
  }
  
//Denne kode tilføjer en ny flue hvis vi trykker på en knap som bliver specificeret lige under her.
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY, random(0.8,1.5)));
//Denne kode sørger for tilføje en ny flue når man trykke på musen ved musens akutelle placering.
  
}

/////////////////////////////////////////////////////////
class Flue{
  
  float distanceFlyttetX;
  float XmovementSpeed = random(0.5,1);
  float YmovementSpeed = random(0.5,1);
  float distanceFlyttetY;
 
  float scaleFactor = 1;
  
  Flue(){
    distanceFlyttetX  = random(0,height);
    distanceFlyttetY  = random(0,width);
//Denne kode sørger for at når vi tilføjer en ny flue flyver den i en random retninge indenfor programvinduet
  }
  
  Flue(float a, float b, float s){
    distanceFlyttetX = a;
    distanceFlyttetY = b;
    scaleFactor = s;
  }
  
  void flyt(){
    distanceFlyttetY = distanceFlyttetY + YmovementSpeed;
    distanceFlyttetX = distanceFlyttetX - XmovementSpeed;
//Denne kode sørger for hvor hurtigt fluen flyver
  }

  void tegnFlue(){
    pushMatrix();
      translate(distanceFlyttetX,distanceFlyttetY);
      PVector Pos = new PVector(XmovementSpeed,YmovementSpeed);
      rotate(Pos.heading()+HALF_PI);
      scale(scaleFactor);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
//Denne kode sørger for hvordan selve fluen skal se ud
  }
  
  void edges(){
    if ((distanceFlyttetX > width) || (distanceFlyttetX < 0)){
      XmovementSpeed = XmovementSpeed* -1;
    }
    if ((distanceFlyttetY > height) || (distanceFlyttetY < 0)){
       YmovementSpeed  = YmovementSpeed* -1;
    }
  }
}
//////////////////////////////////////////////////////
