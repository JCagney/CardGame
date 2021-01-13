//Declare the array of cards and the IntList to be used for assigning numbers to them
import javax.swing.*;

//create an array of cards 
Card cardsOne[]= new Card[18];

//declare an array of numbers which will be assigned to the cards each time the game is played 
int[] numbers;

//declare an array of the numbers on the cards which have been turned by the player 

int[] turnedNumbers;

//declare an array which keeps track of the number of cards which have been turned 
int turncount = 0;

//declare a player 
Player player;


void setup()
{
  size(1000,800);
  
  //construct the player 
  player = new Player();
  
  //construct the array of numbers. This will be 9 pairs of numbers, number of each pair is randomly selected   
  numbers = new int[18];
  for (int n = 0; n<9; n++){
numbers[n]= int(random(1,9)); 

  }


  //construct the array of the numbers on the cards which have been turned. Only 2 cards will be turned at a time  
  turnedNumbers = new int[2];
  
  
  //construct the array of cards 
  for(int i=0; i<18; i++)
    {
    cardsOne[i] = new Card();
    }
    
    //Use JOptionPane to take in the player's name 
player.setname(JOptionPane.showInputDialog("Welcome to Card Match! \n Please enter your name:"));  
JOptionPane.showMessageDialog(null, "OK "+player.getname()+".\n Match the cards with as few turns as possible!");  
}

void draw()
{
  background(255);
  
  //slow the frame rate so that cars will be briefly visible to the player to give therm time to momorize them  
  frameRate(4);
  
  //Show the name of the game and the number of pairs the player has turned so far   
  showText();
  
 //End the game once all the cards are eliminiated 
  if ((cardsOne[0].isDropped() == true) && (cardsOne[1].isDropped() == true) && (cardsOne[2].isDropped() == true) && (cardsOne[3].isDropped() == true) && 
  (cardsOne[4].isDropped() == true) && (cardsOne[5].isDropped() == true) && (cardsOne[6].isDropped() == true) && (cardsOne[7].isDropped() == true) && 
  (cardsOne[8].isDropped() == true) && (cardsOne[9].isDropped() == true) && (cardsOne[10].isDropped() == true) && (cardsOne[11].isDropped() == true) && 
  (cardsOne[12].isDropped() == true) && (cardsOne[13].isDropped() == true) && (cardsOne[14].isDropped() == true) && (cardsOne[15].isDropped() == true) && 
  (cardsOne[16].isDropped() == true) && (cardsOne[17].isDropped() == true)){
    endGame();
  }
  
  //Start a loop to display the cards on the screen 
  for(int i=0; i<18; i++)
    {    
    if (i<6)
      { 
      cardsOne[i].setxCoord(50+(150*i));
      cardsOne[i].setyCoord(100);
      }
    
    if ((i>=6) && (i<12))
      { 
      cardsOne[i].setxCoord(50+(150*(i-6)));
      cardsOne[i].setyCoord(300);
      }    
    if (i>=12)
      { 
      cardsOne[i].setxCoord(50+(150*(i-12)));
      cardsOne[i].setyCoord(500);
      }    
      
    //A nested loop to assign the numbers from the numbers array to the cards 
    for (int n=0;n<9;n++){
        cardsOne[n].setNumber(numbers[n]);   
        cardsOne[n+9].setNumber(numbers[n]); 
          }   
    //Display all the cards (still using same loop)       
    cardsOne[i].displayCard();
     
    //This conditional will display the number of the card if it has been turned   
    if (cardsOne[i].isTurned() == true) 
      {
      cardsOne[i].displayNumber();
      }
    
    //This conditional will drop / eliminate the cards if two cards have been turned and if the numbers of the two turned cards are matching. 
    // It will then turn the "turned" cards back over and reset the turncount and the turned numbers array so the player can go again   
    if (turncount>1){
      if (turnedNumbers[0] == turnedNumbers[1]){
        for(int b = 0; b<18; b++){
          if (cardsOne[b].isTurned() == true){
            cardsOne[b].setDropped(true);
            }
          }
        }
        
        // This nested loop will now turn back the cards after they have been turned over by the player. Any matching cards have already been eliminated        
        for (int c = 0; c<18; c++){
           cardsOne[c].setTurned(false);  
        }
        
        //Now that the cards are turned back we need to set the turn count back to 0 
        turncount = 0; 
        
        // The player will go again so we need to set the second turned number to 0 otherwise it will still be the number of the previous pair and we could get a false match 
        turnedNumbers[1] = 0;
      
    }     
 }    
}

//the mouse pressed method is used to identify whern the player clicks on one of the cards which has not yet been dropped / eliminated, 
// and add to the click count (the player's score)display the number, and add one to the turn count to set the turned field of that card to true


void mousePressed(){

  for (int i = 0; i<18; i++){
   if (mouseX>cardsOne[i].xCoord && mouseX<(cardsOne[i].xCoord+60) && mouseY>cardsOne[i].yCoord && mouseY<(cardsOne[i].yCoord+80) && (cardsOne[i].isDropped() == false) ){
       
     turnedNumbers[turncount] = (cardsOne[i].number);
     cardsOne[i].setTurned(true);
     cardsOne[i].displayNumber();
     turncount++;
     player.setclickCount(player.getclickCount()+1);
     
    }
  }
}

//the show text method is used to show the name of the game and also show howe many pairs of cards the player has turned over so far (keep score) 
public void showText()
  {
  fill(0);
  textSize(40);
  text("Match!!", 400,50);   

  textSize(20);
  //I want to show half of the click count because this indicates the amount of pairs turned. Because click count is an int it won't show decimals which works perfectly 
  text("Pairs Turned: "+(player.getclickCount()/2), width-200,50);

}

//the end game method is used to finish up the game once all the cards are eliminated. The player is given their score. The % scrore approaches 100 the better the player has played 
// if the player has matched all the cards with the minimum number of pairs of turns (9) the ywill socre 100% 
public void endGame(){
  JOptionPane.showMessageDialog(null,"Well done "+player.getname()+". You matched them with "+player.getclickCount()/2+" pair turns. That gives you a score of "+player.score()+"%!");
  exit();
}
