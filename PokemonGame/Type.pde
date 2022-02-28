class Type
{
   String name;
   String[] weakness;
   String[] resistance;
   String[] immune;
   PImage pic;
   
   Type()
   {
       name = "None";
       weakness = new String[1];
       resistance = new String[1];
       immune = new String[1];
       pic=null;
   }
   
   Type(String tempName, String[] tempWeakness, String[] tempResistance, PImage picTemp)
   {
       name = tempName;
       immune = new String[1];
       immune[0] = "Nothing";
       weakness = tempWeakness;
       resistance = tempResistance;
       pic = picTemp;
   }
   
   Type(String tempName, String[] tempWeakness, String[] tempResistance, String[] tempImmune, PImage picTemp)
   {
       name = tempName;
       immune = tempImmune;
       weakness = tempWeakness;
       resistance = tempResistance;
       pic = picTemp;
   }
   
   void render(int x,int y)
   {
     if(pic!=null)
       image(pic,x,y);  
   }
}
