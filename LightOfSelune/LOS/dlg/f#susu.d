


BEGIN ~F#SUSU~

IF WEIGHT #6 
~NumTimesTalkedTo(0)~ THEN BEGIN A0
  SAY @101 /* ~Heya!~  */
  IF ~~ THEN 
    REPLY @102 /* ~Heya yourself, little one.  And who might you be?~  */ 
    GOTO A1
END

IF ~~ THEN BEGIN A1
  SAY @103 /* ~My name is Susu.  What's yours?~  */
  IF ~~ THEN 
    REPLY @104 /* ~I'm called <CHARNAME>.~ */ 
    GOTO A2
END

IF ~~ THEN BEGIN A2
  SAY @105 /* ~Hi, <CHARNAME>.  Betcha didn't know that my Da is the bow ... bower ...~  */
  IF ~~ THEN 
    REPLY @106 /* ~Bowyer.  You're right.  I didn't.~ */ 
    GOTO A3
END

IF ~~ THEN BEGIN A3
  SAY @107 /* ~And betcha didn't know that my Da likes the forest lady.  Ya know, Me ... Meel ... Melicky?~  */
  IF ~~ THEN 
    REPLY @108 /* ~Mielikki?~ */ 
    GOTO A4
END

IF ~~ THEN BEGIN A4
  SAY @109 /* ~That's her.  Da really likes Melicky rangers.  He really, really does.  So if you got a Melicky ranger in yer number, let her do the dickerin' with Da.  He'll never do ya wrong if yer a good ranger.~ */
  IF ~~ THEN 
    GOTO A5
END

IF ~~ THEN BEGIN A5
  SAY @110 /* ~But don't tell him I told ya so.~ */
  IF ~~ THEN 
    REPLY @111 /* ~Not a word.  I promise, Susu.~ */ 
    EXIT
END


IF WEIGHT #3 
~NumTimesTalkedToGT(0)~ THEN BEGIN B1
  SAY @112 /* ~Heya, <CHARNAME>.  Have ya talked to my Da yet?  'Member, a Melicky ranger will get ya the best dicker with my Da.  Gotta go now.  Bye-bye.~ */
  IF ~~ THEN 
    EXIT
END


IF WEIGHT #0 ~See([ENEMY], FALSE)~ THEN BEGIN E1
  SAY @113 /* ~There are bad men in da village!  HELP!!!  DA!!!~ */
  IF ~~ THEN EXIT
END






