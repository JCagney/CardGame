public class Card
{
  
  //the cards are rectangles on the screen so the coords will place them 
  private float xCoord;
  private float yCoord;
  
  //this field store whether or not the card is currently turned 
  private boolean turned; 
  
  //this field stores whether or not the card has been dropped / eliminated 
  private boolean dropped;
  
  //this fields stores the number assigned to the card 
  private int number; 
  
  //Constructor for thhe card 
  public Card(){
  }
  public Card(float xCoord, float yCoord){
    this.xCoord = xCoord; 
    this.yCoord = yCoord;
    
  }
  
  //Getter methods 
  
  public float getxCoord()
  {
    return xCoord; 
  }
  
  public float getyCoord()
  {
    return yCoord;
  }
  
  public boolean isTurned()
  { 
    return turned;
  } 
  
    public boolean isDropped()
  { 
    return dropped;
  } 
  
  public int getNumber()
  {
    return number;
  }
  
  // Setter methods 
  
 public void setxCoord(float xCoord){
   if ((xCoord >= 0) && (xCoord <= width)){
     this.xCoord = xCoord; 
   } 
   else 
   this.xCoord = 0;
 }
 
  public void setyCoord(float yCoord){
   if ((yCoord >= 0) && (yCoord <= height)){
     this.yCoord = yCoord; 
   } 
   else 
   this.yCoord = 0;
 }
 
 public void setTurned(boolean turned){
   this.turned = turned;
 }
 
  public void setDropped(boolean dropped){
   this.dropped = dropped;
 }
 
 public void setNumber(int number){ 
   
   this.number = number;
 }
 

   
   
 
  
  //this method is used to display the card on the screen. If the card has been dropped then is filled with white to hide it 
  public void displayCard(){ 
    noStroke();
    if (dropped == true){
      fill(255);
    }
    else{
      fill(0);
    }
    rect(xCoord, yCoord, 60, 80);
  }
  
  //this method is used to display the number on the card 
  public void displayNumber(){
    fill(255); 
    textSize(30); 
    text(number, (xCoord+20), (yCoord+40));
  }  
}
