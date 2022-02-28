class Dialogue
{
   String message;
   String[] words;
   String[] states;
   
   Dialogue(String aMessage)
   {
      int i = 0;
      int j = 0;
      int h = 0;
      message = aMessage;
      words = split(message,' ');
      for(String word : words)
        if(word.equals("{"))
          h++;
      states = new String[(message.length() / 60) + 10 + h];
      for(int k = 0; k < states.length;k++)
        states[k] = "";
      
      while(i < words.length)
      {
           if(states[j].length() > 60)
             j++;
           if(words[i].equals("{"))
           {
             j++;
             i++;
           }
           states[j] = states[j] + " " + (words[i]);
           i++;
      }
   }
   
   boolean render(int i)
   {
     
      //if(i >= states.length)
      //  return true;
      if(states[i] == "")
        return true;
      PImage box = loadImage("TextBox.png");
      image(box,60,528);
      fill(0);
      textSize(30);
      text(states[i],80,550,1000,80);
      return false;
   }
}
