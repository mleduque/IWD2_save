

// 10_KnowSmarmyFence values
//   0 = know nothing and suspect nothing about Smarmy being a fence
//   1 = suspect that Smarmy might be a fence, but not certain
//   2 = KNOW that Smarmy is a fence



BEGIN ~F#SMARM~


IF WEIGHT #6 
~NumTimesTalkedTo(0)~ THEN BEGIN A0
  SAY @101 /* ~New faces in Targos?  Well, this is your lucky day!  Yes, it is!~  */

  IF ~~ THEN 
    REPLY @102 /* ~And why's that?  And who are you?~  */ 
    GOTO A1
    
  IF ~CheckStatGT(Protagonist,10,INT)
  Or(2)
  ClassEx(Protagonist,BARD)
  ClassEx(Protagonist,ROGUE)~ 
  THEN 
    REPLY @103 /* ~Hold on.  Don't I know you from somewhere?~  */ 
    GOTO B1
END


IF ~~ THEN BEGIN A1
  SAY @104 /* ~Who am I?  Who am *I*?  Why, I am Govan Trevayne, merchant extraordinaire!  I've sold my wares in Luskan, Neverwinter, Waterdeep, and points beyond!~  */
  IF ~~ THEN 
    REPLY @105 /* ~Uh-huh.  So, Govan Trevayne, what brings you this far north?  Surely, there more profit to be made in a larger city such as Neverwinter or Waterdeep.~ */ 
    GOTO A2

  IF ~CheckStatGT(Protagonist,10,INT)
  Or(2)
  ClassEx(Protagonist,BARD)
  ClassEx(Protagonist,ROGUE)~ 
  THEN 
    REPLY @140 /* ~Luskan!  That's it.  I heard about you in Luskan, Tremayne.  There were rumors that you'd ... headed north from Luskan.  In a bit of a hurry, if I remember correctly.~ */ 
    GOTO B2

END

IF ~~ THEN BEGIN A2
  SAY @106 /* ~Well ... not everyone appreciates my talents.~  */
  IF ~~ THEN 
    REPLY @107 /* ~And why would that be?~ */ 
    GOTO A3
END

IF ~~ THEN BEGIN A3
  SAY @108 /* ~Well ...~  */
  IF ~~ THEN 
    REPLY @109 /* ~Go on ...~ */ 
    GOTO A4
END

IF ~~ THEN BEGIN A4
  SAY @110 /* ~I suppose that some people might not be as open-minded as I am when it comes to who you'll purchase goods from.  I am a very open-minded person.  I'll purchase anything I can sell from anybody.~  */
  IF ~CheckStatGT(Protagonist,12,INT)
  !ClassEx(Protagonist,PALADIN)
  Or(2)
  ClassEx(Protagonist,BARD)
  ClassEx(Protagonist,ROGUE)~ THEN 
    REPLY @111 /* ~I see.  And I suppose that you have some of those open-minded items to sell?~ */ 
    DO ~SetGlobal("10_KnowSmarmyFence","GLOBAL",2)~  /* KNOW that Smarmy is a fence  */  
    GOTO A5
  IF ~~ THEN 
    REPLY @112 /* ~Riiiiiight.  Well then, let's see what you have to sell.~ */ 
    DO ~SetGlobal("10_KnowSmarmyFence","GLOBAL",1)  /*  suspect that Smarmy might be a fence, but not certain */
      StartStore("F#Smarmy",Protagonist)~
    EXIT
END



IF ~~ THEN BEGIN A5
  SAY @113 /* ~And if it so happened that I did have some of those ... open-minded items?~  */
  IF ~~ THEN 
    REPLY @114 /* ~Why should I care how such an obviously honest merchant came by the wares in his inventory?~ */ 
    GOTO A6

  IF ~~ THEN 
    REPLY @115 /* ~Well, I can't say that I approve of your methods, but I suppose that under the current circumstances, beggars can't be choosers.~ */ 
    GOTO A7
END



IF ~~ THEN BEGIN A6
  SAY @116 /* ~Well said, my <LADYLORD>!  Well said, indeed.~  */
  IF ~~ THEN GOTO A8
END


IF ~~ THEN BEGIN A7
  SAY @117 /* ~Indeed, these are grim times.~  */
  IF ~~ THEN GOTO A8
END



IF ~~ THEN BEGIN A8
  SAY @118 /* ~So, would you be interested in seeing what I have to offer?~  */
   
  IF ~~ THEN 
    REPLY @119 /* ~I'd like to see your normal wares.~ */ 
    DO ~StartStore("F#Smarmy",Protagonist)~
    EXIT
    
  IF ~Global("10_KnowSmarmyFence","GLOBAL",2)
    !ClassEx(Protagonist,PALADIN)~ THEN 
    REPLY @120 /* ~I think that I'd like to check out those special items of yours, Merchant Trevayne.~ */ 
    DO ~StartStore("F#Smarm2",Protagonist)~
    EXIT
    
  IF ~~ THEN 
    REPLY @121 /* ~Not right now.  Maybe later.~ */ 
    EXIT
END


IF ~~ THEN BEGIN B1
  SAY @122 /* ~Well, ummmmmmm, I can't say that you look familiar to me.  But then again, I've been to sooooo many different places, from Waterdeep to Luskan ...~  */
  IF ~~ THEN 
    REPLY @123 /* ~Luskan!  That's it.  I heard about you in Luskan.  You're Govan Trevayne.  There were rumors that you'd ... headed north from Luskan.  In a bit of a hurry, if I remember correctly.~ */ 
    GOTO B2
END

IF ~~ THEN BEGIN B2
  SAY @124 /* ~Yes, well, the ... business climate in Luskan had taken a sudden turn for the worse.  I saw a good opportunity to turn a tidy profit in Targos, so I booked passage on the first ship, and, well, here I be.~  */
  IF ~~ THEN 
    REPLY @125 /* ~Indeed.  One must be ready to respond promptly to sudden changes in the, ummmmm, business climate.~ */ 
    GOTO B3
END

IF ~~ THEN BEGIN B3
  SAY @126 /* ~One must do what one must to survive in this harsh world.~  */
  IF ~~ THEN 
    REPLY @127 /* ~So true.  And were you able to bring your *entire* inventory with you, good sir?~ */ 
    DO ~SetGlobal("10_KnowSmarmyFence","GLOBAL",2)~  /*  KNOW that Smarmy is a fence */
    GOTO B4
END

IF ~~ THEN BEGIN B4
  SAY @128 /* ~Why yes!  Indeed I was.  Thank you for inquiring.~  */
  IF ~~ THEN GOTO A8
END



IF WEIGHT #4
~!NumTimesTalkedTo(0)~ THEN BEGIN C0
  SAY @129  /* ~Welcome back, <CHARNAME>.  Would you like to look at my wares?~  */

  IF ~~ THEN 
    REPLY @119 /* ~I'd like to see your normal wares.~ */ 
    DO ~StartStore("F#Smarmy",Protagonist)~
    EXIT
    
  IF ~Global("10_KnowSmarmyFence","GLOBAL",2)
    !ClassEx(Protagonist,PALADIN)~ THEN 
    REPLY @120 /* ~I think that I'd like to check out those special items of yours, Merchant Trevayne.~ */ 
    DO ~StartStore("F#Smarm2",Protagonist)~
    EXIT
    
  IF ~Global("10_KnowSmarmyFence","GLOBAL",1)
    CheckStatGT(Protagonist,12,INT)
    !ClassEx(Protagonist,PALADIN)~ THEN
    REPLY @130 /* ~Merchant Trevayne, I've been thinking about what you said last time we met.~ */ 
    GOTO C1
    
  IF ~Global("10_KnowSmarmyFence","GLOBAL",2)
    ClassEx(Protagonist,PALADIN)~ THEN
    REPLY @131 /* ~Merchant Trevayne, you have admitted to selling and receiving stolen goods.  I should turn you over to Lord Ulbrec and be rid of such as you!~ */ 
    GOTO C2

  IF ~~ THEN 
    REPLY @121 /* ~Not right now.  Maybe later.~ */ 
    EXIT
END



IF ~~ THEN BEGIN C1
  SAY @132 /* ~Yes?~  */
  IF ~~ THEN 
    REPLY @133 /* ~And I was wondering if you might have some of those ... open-minded items for sale?~ */ 
    DO ~SetGlobal("10_KnowSmarmyFence","GLOBAL",2)~    /*  KNOW that Smarmy is a fence */
    GOTO A5
END



IF ~~ THEN BEGIN C2
  SAY @134 /* ~And what makes you think that the good Lord Ulbrec isn't aware of my ... open-minded business practices?~  */
  IF ~~ THEN 
    REPLY @135 /* ~Are you claiming that Lord Ulbrec is corrupt?  Or that he's a part of your schemings, Trevayne?~ */ 
    GOTO C3
END

IF ~~ THEN BEGIN C3
  SAY @136 /* ~Oh heavens, no.  Your good Lord Ulbrec is simply a pragmatic leader in a dangerous situation who knows that a sword of questionable origins is better than no sword at all.~  */
  IF ~~ THEN 
    REPLY @137 /* ~Well, I don't like it.  No, not one blessed bit!~ */ 
    GOTO C4
END

IF ~~ THEN BEGIN C4
  SAY @138 /* ~Well, la-dee-da.  Then why don't you can go somewhere else to buy your equipment.~  */
  IF ~~ THEN GOTO C5
END

IF ~~ THEN BEGIN C5
  SAY @139 /* ~So, then, what'll it be?  Would you like to look at my goods or not?~  */
  IF ~~ THEN 
    REPLY @119 /* ~I'd like to see your normal wares.~ */ 
    DO ~StartStore("F#Smarmy",Protagonist)~
    EXIT
    
  IF ~Global("10_KnowSmarmyFence","GLOBAL",2)
    !ClassEx(Protagonist,PALADIN)~ THEN 
    REPLY @120 /* ~I think that I'd like to check out those special items of yours, Merchant Trevayne.~ */ 
    DO ~StartStore("F#Smarm2",Protagonist)~
    EXIT 
     
  IF ~~ THEN 
    REPLY @121 /* ~Not right now.  Maybe later.~ */ 
    EXIT
END




IF WEIGHT #1 ~Global("Dock_Goblin_Quest", "GLOBAL", 0)~ THEN BEGIN D0
  SAY @141 /* ~What're you sell-swords doin' here?  Get down t'the docks and defend the town!!!~ */
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END

