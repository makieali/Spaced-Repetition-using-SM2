
class Card {
  String front = 'Vitamin c can be found in';
  String back = 'Lemon';
  DateTime nextrepitition = DateTime.now();
  int repititions = 0;
  double easinessFactor = 2.5;
  int interval = 1;
  int goodcount=0;
  int hardcount=0;
  int easycount=0;
  int intervalinminutes=0;
  
  bool islearning=true;

  void update(int newrepititons, double neweasenessfactor,
      DateTime newnextrepetitionDate, int newinterval) {
    repititions = newrepititons;
    easinessFactor = neweasenessfactor;
    nextrepitition = newnextrepetitionDate.add(Duration(days:newinterval));
    interval = newinterval;
  }
  
  void updatelearning(int newrepititons, double neweasenessfactor,
      DateTime newnextrepetitionDate, int newinterval) {
    repititions = newrepititons;
    easinessFactor = neweasenessfactor;
    nextrepitition = newnextrepetitionDate.add(Duration(minutes:newinterval));
    intervalinminutes = newinterval;
  }
  
  void printdata()
  {
    if(islearning==false)
    {
      print('repetitions:$repititions');
    print('Time interval: $interval');
    print('Easefactor:$easinessFactor');
    print('IsLearning:$islearning');
      print('Next date to show card $nextrepitition');
    print('--------------------------------------------');
  }else{
    print('repetitions:$repititions');
    print('Time interval: $intervalinminutes m');
    print('Easefactor:$easinessFactor');
    print('IsLearning:$islearning');
      print('Next date to show card $nextrepitition');
    print('--------------------------------------------');
  }
    
}
}




class Spacerepetition {
   
  Card CalculateRepetition(Card card, int quality) {
    
    bool flag=false;
    
    if(quality==5 && card.islearning==true)
    {
      card.hardcount=0;
      card.easycount=1;
      card.islearning=false;
      print('Card Graduated here');
    }else if(quality==3 && card.islearning==true)
    {
      card.hardcount=0;
      card.goodcount++;
      if(card.goodcount==2)
      {
        card.islearning=false;
        flag=true;
      }
      
    }else if(quality==2 && card.islearning==false)
    {
      card.hardcount++;
      if(card.hardcount>=7)
      {
        card.islearning=true;
        card.goodcount=0;
        card.interval=1;
      }
    }
    
    if(card.islearning==false)
    {
      
      
     
        print('Card in review');
       
      print('Running Graduation Function');
      double easeness = calculateEasenessFactor(card.easinessFactor, quality);
    int repetitions = calculaterepetitions(quality, card.repititions,card.islearning);
    int interval=calculateintervals(repetitions,card.interval,easeness,quality);
    card.update(repetitions,easeness,DateTime.now(),interval);
    }else{
      print('This card is still is in learning');
     double easeness = 2.5;
    int repetitions = calculaterepetitions(quality, card.repititions,card.islearning);
      int interval=0;
    if(quality==2)
    {
      interval=1;
    }else if(quality==3)
    {
      interval=10;
    }
      card.updatelearning(repetitions,easeness,DateTime.now(),interval);
    }
    
    return card;
    
  }
  
   int getinterval(Card card, int quality) {
    if (quality == 2 && card.islearning == true) {
      return -1;
    } else if (quality == 3 && card.islearning == true) {
      return -10;
    }else if(quality==5 && card.islearning == true)
    {
      return calculateintervals(0, card.interval,
          calculateEasenessFactor(card.easinessFactor, 2), quality);
    }

    if ((quality == 2 || quality == 5 || quality == 3) &&
        card.islearning == false) {
      return calculateintervals(0, card.interval,
          calculateEasenessFactor(card.easinessFactor, quality), quality);
    } 
    return 0;
  }

  double calculateEasenessFactor(double easeness, int quality) {
    //return max(1.3,easiness + 0.1 - (5.0 - quality) * (0.08 + (5.0 - quality) * 0.02));
    
    if(quality==5)
    {
      return easeness+(easeness*0.15);
    }else if(quality==2)
    {
      if(easeness-(easeness*0.20)>1.3)
      {
        return easeness-(easeness*0.20);
      }
      return 1.3;
    }
    return easeness;
  }
   

  int calculaterepetitions(int quality, int repetitions,bool islearn) {
    if (quality < 3 && islearn==true) {
      return 0;
    }
    return repetitions + 1;
  }
  
  int calculateintervals(int repetitions,int interval,double easiness,int quality)
  {
    
    /*if(repetitions<=1)
    {
      return 1;
    }
    if(repetitions==2)
    {
      return 6;
    }
    */
    
    if(quality==2)
    {
      return ((interval*1.2)*0.7).round();
    }
   
      return (interval*easiness).round();
    
    
    
    
  }
  
   int calculateintervals2(int repetitions,int interval,double easiness)
  {
    
    if(repetitions<=1)
    {
      return 1;
    }
    if(repetitions==2)
    {
      return 6;
    }
    
    
    
    return (interval*easiness).round();
    
  }
  
}

void main() {
  
  var card=Card();
  //card.upadate(1,2.5,DateTime.now(),1);
  
 
  
  final repetition=Spacerepetition();
  
    final List<int> numlist=[2,2,5,3];
  
  for(int i=0;i<numlist.length;i++)
  {
    /*print('Next Hard Interval will be ${repetition.getinterval(card,2)}');
    print('Next Good Interval will be ${repetition.getinterval(card,3)}');
    print('Next Easy Interval will be ${repetition.getinterval(card,5)}');*/
    card=repetition.CalculateRepetition(card,numlist[i]);
    if(numlist[i]==2)
    {
      print('Pressed Hard');
    }
    if(numlist[i]==3)
    {
      print('Pressed Medium');
    }
    if(numlist[i]==5)
    {
      print('Pressed Easy');
    }
  
  
  card.printdata();

    
  }
  
  
}



