




BEGIN ~F#SKALLA~



IF WEIGHT #6 
~NumTimesTalkedTo(0)~ THEN BEGIN A0
  SAY @101 /* ~Who are ye, stranger?  And what brings ye to Targos?~  */
  IF ~~ THEN 
    REPLY @102 /* ~My name is <CHARNAME> and I'm here to help defend the town from the goblin hordes.~  */ 
    GOTO A1
  IF ~~ THEN 
    REPLY @103 /* ~My name is <CHARNAME> and I'm a sell-sword looking to fill my purse and kill a few goblins.  After that, who's to say?~  */ 
    GOTO B1
END

IF ~~ THEN BEGIN A1
  SAY @104 /* ~Well met, <CHARNAME>!  I be Skalla Ironaxe of Mirabar.~  */
  IF ~~ THEN 
    REPLY @105 /* ~Mirabar?  That's a great distance from Targos.  How'd you come to be here, Master Ironaxe?~ */ 
    GOTO A2
END

IF ~~ THEN BEGIN A2
  SAY @106 /* ~Aye, I'm a fair distance from home.  That I am.~  */
  IF ~~ THEN 
    GOTO A3
END

IF ~~ THEN BEGIN A3
  SAY @107 /* ~As it so happened, I was in Bremen, selling me wares to the locals not so long before the thrice-damned goblins attacked.~  */
  IF ~~ THEN 
    GOTO A4
END

IF ~~ THEN BEGIN A4
  SAY @108 /* ~For better or worse, the boat that got me out of Bremen came straight here ta poor Targos, not so long before yer boat arrived from Luskan.~  */
  IF ~~ THEN 
    GOTO A5
END

IF ~~ THEN BEGIN A5
  SAY @109 /* ~Luckily, I was able to get out with me inventory.  So if ye want ta look at me wares, just say so.~  */
  IF ~~ THEN 
    REPLY @110 /* ~Show me what ya got, Master Ironaxe.~ */ 
    DO ~StartStore("F#Skalla",Protagonist)~
    EXIT
  IF ~~ THEN 
    REPLY @111 /* ~Maybe some other time, Skalla.~ */ 
    EXIT
END




IF ~~ THEN BEGIN B1
  SAY @112 /* ~Mercenaries, are ye?  Well, there naught wrong with bein' a sell-sword, so long as y're careful who ye be takin' yer gold from.~  */
  IF ~~ THEN GOTO B2
END


IF ~~ THEN BEGIN B2
  SAY @113 /* ~But enuffa that.  I be Skalla Ironaxe of Mirabar.  And if ye be lookin' for weapons and such, I be sellin' the finest ye'll find north of Waterdeep!~  */
  IF ~~ THEN 
    REPLY @105 /* ~Mirabar?  That's a great distance from Targos.  How'd you come to be here, Master Ironaxe? ~ */ 
    GOTO A2

  IF ~~ THEN 
    REPLY @110 /* ~Show me what ya got, Master Ironaxe.~ */ 
    DO ~StartStore("F#Skalla",Protagonist)~
    EXIT
  IF ~~ THEN 
    REPLY @111 /* ~Maybe some other time, Skalla.~ */ 
    EXIT
END


IF WEIGHT #1 ~Global("Dock_Goblin_Quest", "GLOBAL", 0)~ THEN BEGIN D0
  SAY @114 /* ~What're ye sell-swords doin' here?  Get yersells down ta da dockyard and defend the town!!!~ */
  IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
END


IF WEIGHT #4
~!NumTimesTalkedTo(0)~ THEN BEGIN C0
  SAY @115  /* ~What brings ye back, <CHARNAME>?~  */
  IF ~~ THEN 
    REPLY @116 /* ~Let me look at yer stuff, Skalla.~ */ 
    DO ~StartStore("F#Skalla",Protagonist)~
    EXIT
  IF ~~ THEN 
    REPLY @117 /* ~Just checking in, Skalla. Catch ya later.~ */ 
    EXIT
END


