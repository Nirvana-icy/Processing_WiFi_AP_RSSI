
float sin45 = 0.70710678;
String[] valueOfRSSIFromCsv; 

void setup()
{
  size(1280, 1024);
  background(0,0,0); 
  valueOfRSSIFromCsv = loadStrings("input.csv"); 
//  frameRate(1);
}

void renderEachRSSIPoint(int i)
{
  noStroke();
  String line = valueOfRSSIFromCsv[i-1];
  println(line);
  String[] eightPointRSSIValueInOneR = split(line, ',');
  
  fill(0,0,100);   //Set the color or the RSSI circle 
  //Draw the 8 circles as the sequence East..Noth East..Noth... 
  ellipse(width/2 + 45*i,height/2,90 - int(eightPointRSSIValueInOneR[0]),90 - int(eightPointRSSIValueInOneR[0]));  //E
  ellipse(width/2 + 45*i*sin45,height/2 + 45*i*sin45,90 - int(eightPointRSSIValueInOneR[1]),90 - int(eightPointRSSIValueInOneR[1]));  //E-S
  ellipse(width/2,height/2 + 45*i,90 - int(eightPointRSSIValueInOneR[2]),90 - int(eightPointRSSIValueInOneR[2]));  //S
  ellipse(width/2 - 45*i*sin45,height/2 + 45*i*sin45,90 - int(eightPointRSSIValueInOneR[3]),90 - int(eightPointRSSIValueInOneR[3]));  //W-S
  ellipse(width/2 - 45*i,height/2,90 - int(eightPointRSSIValueInOneR[4]),90 - int(eightPointRSSIValueInOneR[4]));  //W
  ellipse(width/2 - 45*i*sin45,height/2 - 45*i*sin45,90 - int(eightPointRSSIValueInOneR[5]),90 - int(eightPointRSSIValueInOneR[5]));  //W-N
  ellipse(width/2,height/2 - 45*i,90 - int(eightPointRSSIValueInOneR[6]),90 - int(eightPointRSSIValueInOneR[6]));  //N
  ellipse(width/2 + 45*i*sin45,height/2 - 45*i*sin45,90 - int(eightPointRSSIValueInOneR[7]),90 - int(eightPointRSSIValueInOneR[7]));  //E-N
}

//The main draw function
void draw()
{
  println("~~~~~~~~~~~Start~~~~~~~~~~~~~");
  for(int i = 1; i <= 10; i++)
  {
    noFill();
    stroke(100,100,100);  //Set the circle's color
    ellipse(width/2,height/2,90*i,90*i);
    renderEachRSSIPoint(i);
  }  
}
