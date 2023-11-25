


EXTEND_BOTTOM ~50CARYNA~ 3 
  IF ~Global("50_BowyerNeedsString","GLOBAL",2)~ THEN 
    REPLY @1 /* ~You are a friend of the bowyer, Kanno, from the village?~  */
    GOTO FoundCarynara
END 

APPEND ~50CARYNA~

IF ~~ THEN BEGIN FoundCarynara
  SAY @2 /* ~Yes, Kanno is my friend.  He worships the Forest Queen.  He is a good person.  Would not harm the forest.  Would not harm Carynara.~ */
  IF ~~ THEN 
    REPLY @3 /* ~Kanno asked me to retrieve a special bow string that you were going to make for him.  Do you have it?~ */
    GOTO HaveBowstring
END

IF ~~ THEN BEGIN HaveBowstring
  SAY @4 /* ~Yes, I do.  Here it is.~ */
  IF ~~ THEN 
    REPLY @5 /* ~Thank you, Carynara.  Kanno will be so happy to get this bowstring.~ */
    DO ~GiveItemCreate("F#BOWSTR", Protagonist, 1, 0, 0)~ 
    GOTO HaveBowstring2
END

IF ~~ THEN BEGIN HaveBowstring2
  SAY @6 /* ~Carynara is happy that Kanno will be happy.~ */
  IF ~PartyHasItem("F#ACORNS")~ THEN 
    REPLY @7 /* ~Yes, he will be.  And as a token of his appreciation, he asked me to give you these acorns.~ */
    DO ~TakePartyItem("F#ACORNS") 
        AddXpVar("Level_9_Easy",@10)~ /* ~You have retrieved the bowstring for Kanno.~ */
    GOTO GiveAcorns
  IF ~!PartyHasItem("F#ACORNS")~ THEN 
    REPLY @8 /* ~Yes, he will be.  I'm sure that he'll want to thank you personally when it's safe for him to see you.~ */
    EXIT   
END

IF ~~ THEN BEGIN GiveAcorns
  SAY @9  /* ~Acorns!  Oh, thank you, thank you, thank you!!!  Acorns, wonderful acorns!  Thank Kanno for this wonderful gift!~ */
  IF ~~ THEN EXIT
END

END


