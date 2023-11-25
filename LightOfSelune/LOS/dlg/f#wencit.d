// f#wencit.d



BEGIN ~F#WENCIT~

IF WEIGHT #6 
~NumTimesTalkedTo(0)~ THEN BEGIN A0
  SAY @1 /* ~Ah, you're finally here.  Welcome to Kuldahar, <CHARNAME>.  I've been expecting you.~  */
  IF ~~ THEN 
    REPLY @2   /* ~You've been expecting me?  How did you even know that I was coming?  And who are you?~  */ 
    GOTO A1
END

IF ~~ THEN BEGIN A1
  SAY @3 /* ~Oh, I'm sorry.  My name is Wencit.  As for how I knew you were coming, well ... mages are supposed to know things.~  */
  IF ~!ClassEx(Protagonist,WIZARD)
  !ClassEx(Protagonist,SORCERER)~ THEN
    REPLY @4 /* ~Too many things for my liking, mage.~ */ 
    GOTO A2

  IF ~ClassEx(Protagonist,WIZARD)
  !ClassEx(Protagonist,SORCERER)~ THEN 
    REPLY @5 /* ~Yes, I suppose we are.~ */ 
    GOTO A2

  IF ~!ClassEx(Protagonist,WIZARD)
  ClassEx(Protagonist,SORCERER)~ THEN 
    REPLY @5   /* ~Yes, I suppose we are.~ */ 
    GOTO A2
  
END

IF ~~ THEN BEGIN A2
  SAY @6   /* ~Well, now that you've arrived, I suppose I should tell you why I'm here.~  */
    =
      @7   /* ~As I said, my name is Wencit and I'm a merchant of all things arcane.~  */
    =
      @8   /* ~I became aware of your coming to Kuldahar not long after I learned of the threat the Legion posed to the Ten-Towns.~  */
    =
      @9   /* ~And since I also foresaw your potential need for my goods, I decided to close up my shop in Silverymoon and travel here.~ */
    =
      @10  /* ~I've only just arrived in Kuldahar and desperately needed to rest.~ */
  IF ~~ THEN 
    REPLY @11  /* ~Couldn't you have arrived sooner?  The help would have been appreciated.~  */ 
    GOTO A3
END

IF ~~ THEN BEGIN A3
  SAY @12  /* ~I arrived as quickly as these tired old bones could travel.  Besides, I'm too old now to be getting involved in battles.~  */
    =
      @13  /* ~When I was your age, I would have gladly stood at your side to defend Kuldahar.  But now I'm just a merchant of arcane goods.~ */
  IF ~~ THEN 
    REPLY @14  /* ~Alright, merchant of all things arcane, let's see what you've got!~  */
    DO ~StartStore("f#wencit", Protagonist)~
    EXIT

  IF ~~ THEN 
    REPLY @15  /* ~I don't have time to shop right this moment, Wencit.  Maybe later.~ */ 
    EXIT
END


//
// Begin Block "B"
//
IF WEIGHT #3 
~NumTimesTalkedToGT(0)~ THEN BEGIN B1
  SAY @16  /* ~Welcome back, adventurer.  How may I help you?~ */

  IF ~~ THEN 
    REPLY @17  /* ~I'd like look at your stuff, Wencit.~ */
    DO ~StartStore("f#wencit", Protagonist)~
    EXIT

  IF ~~ THEN
    REPLY @18  /* ~Just checking in, Wencit.  See ya later.~ */ 
    EXIT
END



