public class Player{
  
  //the clickCount field stores the amount of times the player has clicked on a card that is not dropped 
  private int clickCount; 
  
  //player's name 
  private String name;

  
  public Player(){
  }
  
  //Getters 
    public int getclickCount()
  {
    return clickCount; 
  }
  
    public String getname()
  {
    return name; 
  }
  
  //Setters 
  public void setclickCount(int clickCount){
    this.clickCount = clickCount;
  }
  
  public void setname(String name){
     this.name = name;
  }
  
  //This method is used to return a % scrore for the player. 
  //The best score for the game is achieved with 18 clicks so that gives 100%. As the click count goes up, the % score will go down 
  public int score(){
    float score = ((18/float(player.clickCount))*100);
  
    return int(score);
  }
}
