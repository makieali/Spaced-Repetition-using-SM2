# Spaced-Repetition-using-SM2
Anki like algorithm which helps to schedule cards for better learning.

Anki uses Spaced Repeition algorithm sm2 with their modifications to schedule the cards.
So in this algorithm the card have two phases.
1)Learning Phase
2)Review Phase

The quality of card is divided in three 
1) 2 for hard.
2) 3 for good.
3 5 for easy.

How this algorithm works?

Suppose we have a single card which have three buttons hard , good and easy.

and there are two phases of card learning and review phase.

Every card which is not reviewed will be in learning phase. How the card will change it's phase ?
If a user is seeing a card first time and presses easy(quality 5) then the card will graduated and will be in review phase. 

Learning card graduation:
  Pressing hard everytime will never graduate a card means the card will not be in review mode.
  Pressing good(quality 3) 2 times will graduate a card and the card will be sent to future which will be displayed after one day.
  Pressing easy(quality 5) 1 time will graduate a card and will send the card to 3 days in future so it will be displayed after three days.
  

Learning phase next repetitions:
Pressing hard will always add a minute  into card's next repetition time.
Pressing good will in learning phase will add 10 minutes into card's next repetition time.
Pressing easy will graduate the card which will be in review phase and will add three days into card's next repetition time.

Review phase next repetitions:
Press hard will reduce a day from card's next repetition
Pressing good will send the card in future based on multiplier 
Pressing hard 7 times on a card will change the card to learning phase again. 

The Program works like anki algorithm.
