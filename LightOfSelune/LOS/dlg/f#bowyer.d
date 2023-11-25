
BEGIN ~F#BOWYER~

IF WEIGHT #6 
~NumTimesTalkedTo(0)~ THEN BEGIN A0
  SAY @1 /* ~Greetings, stranger.  My name is Kanno.  And you are ... ?~  */

  IF ~~ THEN 
    REPLY @2 /* ~My name is <CHARNAME>.~  */ 
    GOTO A1generic

  IF ~ClassEx(Protagonist,RANGER)
  Alignment(Protagonist, MASK_GOOD)
  LevelInClassGT(Protagonist, 3, RANGER)~ THEN
    REPLY @3 /* ~I am <CHARNAME>, ranger of Our Lady of the Forest, Mielikki.~ */
    DO ~ChangeStoreMarkup("F#Bowyer",110,90,20)~
    GOTO A1goodranger
END

IF ~~ THEN BEGIN A1generic
  SAY @4 /* ~Well met, <CHARNAME>.  I see that you've met my daughter, Susu.~  */
  IF ~~ THEN 
    REPLY @5 /* ~Yes, I have.  She told me that you're a bowyer.~ */ 
    GOTO A2bowyer
END

//
// Good Ranger subthread
//
IF ~~ THEN BEGIN A1goodranger
  SAY @6 /* ~Well met, great ranger.  You've obviously met my precocious little girl.~  */
  IF ~~ THEN 
    REPLY @7 /* ~Yes, I have.  She told me that you're a bowyer ...~ */ 
    GOTO A2goodranger
END

IF ~~ THEN BEGIN A2goodranger
  SAY @8 /* ~... and follower of Mielikki.~  */
  IF ~~ THEN 
    REPLY @9 /* ~'Melicky', I believe she said.~ */ 
    GOTO A2bowyer
END

//
// Bowyer subthread
//
IF ~~ THEN BEGIN A2bowyer
  SAY @10 /* ~That's my Susu.  Yes, I'm the bowyer in these parts.  I make wondrous bows, extraordinary bows!  And crossbows, too, when the mood strikes me.~  */
  IF ~~ THEN 
    GOTO A3bowyer
END

IF ~~ THEN BEGIN A3bowyer
  SAY @11 /* ~Mielikki has blessed me this wondrous ability to make bows. Every so often, the Forest Queen will bless me with an inspiration for some new bow or crossbow.~  */
  IF ~~ THEN 
    GOTO A4bowyer
END

IF ~~ THEN BEGIN A4bowyer
  SAY @12 /* ~For example, not long ago, I had a vision of a strange land where warriors fought with a crossbow that could be fired at incredible speed, but with amazing simplicity.  I have created my version of that wondrous crossbow and named it ... Shukonu.~  */
  IF ~~ THEN 
    GOTO A5bowyer
END

IF ~~ THEN BEGIN A5bowyer
  SAY @13 /* ~The longbow that I am currently working on will be my greatest creation, my masterpiece, if only ...~  */
  IF ~~ THEN 
    REPLY @14 /* ~... If only?~ */ 
    DO ~SetGlobal("50_BowyerNeedsString","GLOBAL",1)~  /* KNOW that the Bowyer needs a bowstring  */
    GOTO A6bowyer
END

IF ~~ THEN BEGIN A6bowyer
  SAY @15 /* ~My lastest project is a composite longbow that I think I'll name the Greenbow or maybe the Emerald Bow.  However, I've been unable to complete it because of the current problems in the Fell Wood.~  */
  IF ~~ THEN 
    REPLY @16 /* ~What does the Fell Wood have to do with you not being able to finish your bow?~ */ 
    GOTO A7bowyer
END

IF ~~ THEN BEGIN A7bowyer
  SAY @17 /* ~A dear friend of mine, the dryad Carynara, was going to make the bowstring for me weeks ago.  But with all the trouble in the Fell Wood, I've been unable to find her and retrieve the bowstring.~  */
  IF ~~ THEN 
    REPLY @18 /* ~And I suppose that you'd like for me to see if I can find this dryad for you and get your bowstring?~ */ 
    GOTO A8bowyer
END

IF ~~ THEN BEGIN A8bowyer
  SAY @19 /* ~I truly don't mean to impose on you.  But since you're going to have to pass through the Fell Wood on your journey, perhaps you could look for Carynara and retrieve my bowstring?~  */

  IF ~~ THEN 
    REPLY @20 /* ~Sure, Kanno, why not.  Like you said, I'm going that way already.~ */ 
    DO ~SetGlobal("50_BowyerNeedsString","GLOBAL",2)~  /* KNOW that dryad has the bowstring  */
    GOTO A9AcceptMission

  IF ~!ClassEx(Protagonist, Paladin)
  !ClassEx(Protagonist, Monk)~ THEN 
    REPLY @21 /* ~What's it in for me, bowyer?  I've got things to do, people to see, and supplies to buy, if you take my meaning. ~  */
    DO ~SetGlobal("50_WantsReward","GLOBAL",1)  /* Wants a reward to get the bowstring  */
        SetGlobal("50_BowyerNeedsString","GLOBAL",2)~  /* KNOW that dryad has the bowstring  */
    GOTO A9WantReward

  IF ~~ THEN 
    REPLY @22 /* ~Sorry. I'm not your errand boy, bowyer.~ */ 
    DO ~SetGlobal("50_BowyerNeedsString","GLOBAL",2)~  /* KNOW that dryad has the bowstring  */
    EXIT
END

IF ~~ THEN BEGIN A9WantReward
  SAY @23 /* ~Oh, I take your meaning, adventurer.  Worry not.  I'll reward you properly, if and when you return with my bowstring.  Fair enough?~  */

  IF ~~ THEN 
    REPLY @24 /* ~Fair enough.  I'll do it.~ */ 
    GOTO A9AcceptMission

  IF ~~ THEN 
    REPLY @22 /* ~Sorry. I'm not your errand boy, bowyer.~ */ 
    EXIT
END

IF ~~ THEN BEGIN A9AcceptMission
  SAY @25 /* ~May Mielikki bless you, <CHARNAME>.  Here, give these acorns to Carynara.  They're a gift to her for her assistance.~  */

  IF ~~ THEN 
    REPLY @26 /* ~I guess some people really do work for nuts.~ */ 
    DO ~GiveItemCreate("F#ACORNS", Protagonist, 1, 0, 0)~
    JOURNAL @27 /* ~We've agreed to find the dryad, Carynara, and ask her for Kanno's bowstring.~ */
    GOTO A10generic
END

IF ~~ THEN BEGIN A10generic
  SAY @28 /* ~*chuckles*  Very funny, my <CHARNAME>.  Very funny indeed.  In the meantime, is there anything else I can do for you?~  */

  IF ~~ THEN 
    REPLY @29 /* ~Well...  I do have some questions that need answering, Kanno.~ */ 
    GOTO A11generic

  IF ~~ THEN 
    REPLY @30 /* ~I'd like to look at your goods, Kanno.~ */ 
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN 
    REPLY @31 /* ~Maybe later, Kanno.~ */ 
    EXIT
END

IF ~~ THEN BEGIN A11generic
  SAY @32 /* ~I'm sure that you do.  But I really think that Suoma would rather you speak to her huntmaster, Tahvo.  I'm just the eccentric village bowyer.~  */

  IF ~~ THEN 
    REPLY @33 /* ~Very well.  Then perhaps I could look at your goods.~ */ 
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN 
    REPLY @31 /* ~Maybe later, Kanno.~ */ 
    EXIT
END


//
// Begin Block "B"
//
IF WEIGHT #3 
~NumTimesTalkedToGT(0)~ THEN BEGIN B1
  SAY @34 /* ~Welcome back, adventurer.  How may I help you?~ */
  
  IF ~PartyHasItem("F#BOWSTR")
  !Global("50_BowyerNeedsString","GLOBAL",3)~ THEN
    REPLY @35 /* ~I found your friend, Carynara, and she gave my the bowstring.~ */
    DO ~SetGlobal("50_BowyerNeedsString","GLOBAL",3)  
      AddXpVar("Level_9_Easy",@36)
      TakePartyItem("F#BOWSTR") 
      DestroyItem("F#BOWSTR")~
    GOTO B3MakeBow

  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  !Alignment(Protagonist, MASK_GOOD)
  !IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleNM

  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  !Alignment(Protagonist, MASK_GOOD)
  IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleHOF
  
  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  Alignment(Protagonist, MASK_GOOD)
  !ClassEx(Protagonist,RANGER)
  !IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleNM  

  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  Alignment(Protagonist, MASK_GOOD)
  !ClassEx(Protagonist,RANGER)
  IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleHOF  

  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  Alignment(Protagonist, MASK_GOOD)
  ClassEx(Protagonist,RANGER)
  !IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
    GOTO B10BowIsForSaleNM 

  IF ~Global("50_Masterpiece", "GLOBAL", 1)
  Alignment(Protagonist, MASK_GOOD)
  ClassEx(Protagonist,RANGER)
  IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
    GOTO B10BowIsForSaleHOF 

  IF ~~ THEN 
    REPLY @30 /* ~I'd like look at your goods, Kanno.~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN 
    REPLY @29 /* ~Well...  I do have some questions that need answering, Kanno.~ */ 
    GOTO B2generic

  IF ~~ THEN
    REPLY @38 /* ~I'd better be going.  Maybe I'll see you later, bowyer.~ */ 
    EXIT
END

IF ~~ THEN BEGIN B2generic
  SAY @32 /* ~I'm sure that you do.  But I really think that Suoma would rather you speak to her huntmaster, Tahvo.  I'm just the eccentric village bowyer.~  */

  IF ~PartyHasItem("F#BOWSTR")
  !Global("50_BowyerNeedsString","GLOBAL",3)~ THEN
    REPLY @35 /* ~I found your friend, Carynara, and she gave my the bowstring.~ */
    DO ~SetGlobal("50_BowyerNeedsString","GLOBAL",3)  
      AddXpVar("Level_9_Easy",@36) 
      TakePartyItem("F#BOWSTR") 
      DestroyItem("F#BOWSTR")~
    GOTO B3MakeBow
   
  IF ~~ THEN 
    REPLY @33 /* ~Very well.  Then perhaps I could look at your goods.~ */ 
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN 
    REPLY @31 /* ~Maybe later, Kanno.~ */ 
    EXIT
END

IF ~~ THEN BEGIN B3MakeBow
  SAY @39 /* ~Mielikki be praised.  Now I can finish my masterpiece!  I have but to string the bow and ...~ */

  IF ~~ THEN
    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 1)
      FadeToColor([0.0],0)
      FadeFromColor([0.0],0)~ 
    JOURNAL @40 /* ~We were able to retrieve Kanno's bowstring, so that he could finish his "masterpiece", whatever that is.~ */
    GOTO B4BowFinished
END

IF ~~ THEN BEGIN B4BowFinished
  SAY @41 /* ~There!  My most magnificent creation is complete!~ */

  IF ~Global("50_WantsReward","GLOBAL",1)  
  !ClassEx(Protagonist, Paladin)
  !ClassEx(Protagonist, Monk)~ THEN 
    REPLY @42 /* ~Now, I believe there was some mention of a reward.~ */ 
    DO ~GiveItemCreate("Misc07",Protagonist,3000,0,0)~ // Gold
    GOTO B5DemandedRewardA

  IF ~Global("50_WantsReward","GLOBAL",1) 
  OR(2) 
  ClassEx(Protagonist, Paladin)
  ClassEx(Protagonist, Monk)~ THEN 
    REPLY @43 /* ~I'm glad to be able to help.  And in spite of my greedy companion's previous demands, no reward will be necessary.~ */ 
    DO ~GiveItemCreate("Misc07",Protagonist,3000,0,0)~ // Gold
    GOTO B5DemandedRewardB

  IF ~!Global("50_WantsReward","GLOBAL",1)
  !ClassEx(Protagonist, Paladin)
  !ClassEx(Protagonist, Monk)~ THEN 
    DO ~GiveItemCreate("Misc07",Protagonist,4000,0,0)~ // Gold
    GOTO B5NoRewardDemand

  IF ~!Global("50_WantsReward","GLOBAL",1)
  OR(2)
  ClassEx(Protagonist, Paladin)
  ClassEx(Protagonist, Monk)~ THEN 
    REPLY @44 /* ~That's good news, Kanno. Now, could I see what you've got to sell?~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~!Global("50_WantsReward","GLOBAL",1)
  OR(2)
  ClassEx(Protagonist, Paladin)
  ClassEx(Protagonist, Monk)~ THEN 
    REPLY @45 /* ~I'm happy for you, Kanno.  Sorry to run, but I really have to be going.~ */
    EXIT

END





//
// The block for when the party demanded a reward...
//
IF ~~ THEN BEGIN B5DemandedRewardA
  SAY @46 /* ~And so there was, adventurer.  Here's a more than fair compensation for your efforts.~ */
  
  IF ~~ THEN 
    REPLY @47 /* ~This'll do, bowyer.  Now, let's see what you've got to sell.~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN
    REPLY @48 /* ~Thanks, bowyer.  Be seeing ya later.~ */
    EXIT
END



//
// The block for when the party demanded a reward, but a pally or monk didn't want to accept one...
//
IF ~~ THEN BEGIN B5DemandedRewardB
  SAY @49 /* ~Your vows may not allow you to accept rewards, adventurer, but it's not fair of you to speak for your companions.  Here's a more than fair compensation ... for your companions.~ */
  
  IF ~~ THEN 
    REPLY @50 /* ~*sigh*  Very well.  Now, let us see your wares, Master Kanno.~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN
    REPLY @51 /* ~That is acceptable, but I must be going now.~ */
    EXIT
END


//
// The block for when the party didn't ask for a reward, but will accept one.
//
IF ~~ THEN BEGIN B5NoRewardDemand
  SAY @52 /* ~For starters, here's some gold for your efforts, <CHARNAME>.~ */
  
  IF ~!Alignment(Protagonist, MASK_GOOD)~ THEN
    REPLY @53 /* ~You are generosity itself, Kanno. ~ */  
    GOTO B6NotGoodRanger
  
  IF ~Alignment(Protagonist, MASK_GOOD)
  !ClassEx(Protagonist,RANGER)~ THEN
    REPLY @53 /* ~You are generosity itself, Kanno. ~ */  
    GOTO B6NotGoodRanger  
  
  IF ~Alignment(Protagonist, MASK_GOOD)
  ClassEx(Protagonist,RANGER)~ THEN
    REPLY @53 /* ~You are generosity itself, Kanno. ~ */  
    GOTO B6IsGoodRanger 
END


//
// The block for when the PC isn't a good ranger (i.e. a Mielikki ranger).
//
IF ~~ THEN BEGIN B6NotGoodRanger
  SAY @54 /* ~You are too kind, <CHARNAME>.  Now, is there anything else I can do for you?~ */

  IF ~~ THEN 
    REPLY @55 /* ~May I look at your wares, Kanno?~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

/* Actually, I was wondering about that special longbow you just finished.  Is it for sale? */
  IF ~!IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleNM

  IF ~IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
//    DO ~SetGlobal("50_Masterpiece", "GLOBAL", 2)~
    GOTO B7BowNotForSaleHOF

  IF ~~ THEN
    REPLY @31 /* ~Maybe later, Kanno.~ */ 
    EXIT
END

IF ~~ THEN BEGIN B7BowNotForSaleNM
  SAY @56 /* ~I am most profoundly sorry, <CHARNAME>.  But the Greenbow is a weapon consecrated to Mielikki and only one of her rangers can wield it.  And only to one of her rangers will I sell it.  Again, my most profound apologies.~ */

  IF ~~ THEN 
    REPLY @57 /* ~Very well.  May I look at your other wares?~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN
    REPLY @58 /* ~See ya later, bowyer.~ */ 
    EXIT  
END

IF ~~ THEN BEGIN B7BowNotForSaleHOF
  SAY @59 /* ~I am most profoundly sorry, <CHARNAME>.  But the Emerald Bow is a weapon consecrated to Mielikki and only one of her rangers can wield it.  And only to one of her rangers will I sell it.  Again, my most profound apologies.~ */

  IF ~~ THEN 
    REPLY @57 /* ~Very well.  May I look at your other wares?~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~~ THEN
    REPLY @58 /* ~See ya later, bowyer.~ */ 
    EXIT  
END

//
// The block for when the PC *is* a good ranger (i.e. a Mielikki ranger).
//
IF ~~ THEN BEGIN B6IsGoodRanger
  SAY @60 /* ~You are too kind, <CHARNAME>.  Too kind.  But I would be true to my faith if I did not assist one of the Forest Queen's rangers as best I could. ~ */

  IF ~~ THEN
    GOTO B7IsGoodRanger
END


IF ~~ THEN BEGIN B7IsGoodRanger
  SAY @61 /* ~And the best way to assist you is to share some of my wisdom of archery with you.~ */

  IF ~~ THEN
    GOTO B8IsGoodRanger
END

IF ~~ THEN BEGIN B8IsGoodRanger
  SAY @62 /* ~First of all ...~ */

  IF ~~ THEN 
    DO ~FadeToColor([0.0],0)
      FadeFromColor([0.0],0)
      AddFeat(Protagonist,PRECISE_SHOT)~
    GOTO B9IsGoodRanger
END


IF ~~ THEN BEGIN B9IsGoodRanger
  SAY @63 /* ~... and that is how you safely shoot into crowds, <CHARNAME>.~ */

  IF ~~ THEN 
    REPLY @64 /* ~Thanks for the lesson, Kanno.  Now, may I look at your wares?~ */
    DO ~StartStore("F#Bowyer", Protagonist)~
    EXIT

  IF ~!IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
    GOTO B10BowIsForSaleNM

  IF ~IsHeartOfFuryModeOn()~ THEN
    REPLY @37 /* ~Actually, I was wondering about that special longbow you just finished.  Is it for sale?~ */
    GOTO B10BowIsForSaleHOF

  IF ~~ THEN
    REPLY @65 /* ~Thanks for the tips, Kanno.  I'd like to stay and chat, but I really do have to be going.~ */ 
    EXIT
END



//
// The Normal Mode "Bow is for sale" sub-tread
//
IF ~~ THEN BEGIN B10BowIsForSaleNM
  SAY @66 /* ~It most absolutely is, my good ranger.  Let me describe it for you.~ */
  IF ~~ THEN GOTO B11DescribeBowNM
END

IF ~~ THEN BEGIN B11DescribeBowNM
  SAY @67 /* ~The Greenbow is a weapon consecrated to Our Lady and will adjust itself to the strength of any user.  While you may ... may, in time, happen upon a bow enchanted to give greater accuracy, none will have the hitting power of the Greenbow.~ */
  IF ~~ THEN GOTO B12DescribeBowNM
END

IF ~~ THEN BEGIN B12DescribeBowNM
  SAY @68 /* ~As I said, the Greenbow will adjust itself to the strength of its user.  Thus, if you were to magically increase your strength, the Greenbow would sense that and adjust its pull and, hence, its striking power accordingly.~ */
  IF ~~ THEN GOTO B13BowPriceNM
END

IF ~~ THEN BEGIN B13BowPriceNM
  SAY @69 /* ~And even for a follower of Our Lady, I'm afraid that I must ask 14,000 gold for the Greenbow.~ */

  IF ~PartyGoldGT(14000)~ THEN
    REPLY @70 /* ~It sounds like a bargain at that price, Kanno.  I'll take it.~ */
    DO ~TakePartyGold(14000)
        SetGlobal("50_Masterpiece", "GLOBAL", 3)
        GiveItemCreate("F#BOWC01",Protagonist,1,0,0)~
    GOTO B14BowSold

  IF ~PartyGoldLT(14000)~ THEN
    REPLY @71 /* ~It sounds like a bargain, Kanno, but I don't have enough gold right now.  I'll be back when I do.~ */
    EXIT

  IF ~~ THEN
    REPLY @72 /* ~Let me think about it, Kanno, and I'll get back to you later.~ */
    EXIT
END



//
// The HOF Mode "Bow is for sale" sub-tread
//
IF ~~ THEN BEGIN B10BowIsForSaleHOF
  SAY @66 /* ~It most absolutely is, my good ranger.  Let me describe it for you.~ */
  IF ~~ THEN GOTO B11DescribeBowHOF
END

IF ~~ THEN BEGIN B11DescribeBowHOF
  SAY @73 /* ~The Emerald Bow is a weapon consecrated to Our Lady and will adjust itself to the strength of any user.  While you may ... may, in time, happen upon a bow enchanted to give greater accuracy, none will have the hitting power of the Emerald Bow.~ */
  IF ~~ THEN GOTO B12DescribeBowHOF
END

IF ~~ THEN BEGIN B12DescribeBowHOF
  SAY @74 /* ~As I said, the Emerald Bow will adjust itself to the strength of its user.  Thus, if you were to magically increase your strength, the Emerald Bow would sense that and adjust its pull and, hence, its striking power accordingly.~ */
  IF ~~ THEN GOTO B13BowPriceHOF
END

IF ~~ THEN BEGIN B13BowPriceHOF
  SAY @75 /* ~And even for a follower of Our Lady, I'm afraid that I must ask 70,000 gold for the Emerald Bow.~ */

  IF ~PartyGoldGT(70000)~ THEN
    REPLY @70 /* ~It sounds like a bargain at that price, Kanno.  I'll take it.~ */
    DO ~TakePartyGold(70000)
        SetGlobal("50_Masterpiece", "GLOBAL", 3)
        GiveItemCreate("F#HBWC01",Protagonist,1,0,0)~
    GOTO B14BowSold

  IF ~PartyGoldLT(70000)~ THEN
    REPLY @71 /* It sounds like a bargain, Kanno, but I don't have enough gold right now.  I'll be back when I do.~ */
    EXIT

  IF ~~ THEN
    REPLY @72 /* ~Let me think about it, Kanno, and I'll get back to you later.~ */
    EXIT
END

IF ~~ THEN BEGIN B14BowSold
  SAY @76 /* ~Excellent.  May my bow serve you well in the days to come, <CHARNAME>.~ */
  IF ~~ THEN GOTO B15PartingGift
END

IF ~~ THEN BEGIN B15PartingGift
  SAY @77 /* ~Oh, <CHARNAME>, before you go, here's a little gift for you.  Some reading material, if you will.~ */
  IF ~~ THEN 
    REPLY @78 /* ~A book?  Kanno, I'm not sure that I'll have time for any light reading in the near future.~ */
    DO ~GiveItemCreate("F#BOOK01",Protagonist,1,0,0)~ // The Tome of Solonor
    GOTO B16PartingGift
END

IF ~~ THEN BEGIN B16PartingGift
  SAY @79 /* ~Perhaps not, but I do think that you *will* find it ... enlightening  It is a book about Solonor Thelandira, who, among other things, is the elven god of archery.  Perhaps it will give you some additional insights that will help you.~ */
  IF ~~ THEN 
    REPLY @80 /* ~I'll take a look at it when I get a chance.  Thanks again, Master Kanno.~ */
    EXIT
END


IF WEIGHT #0 ~See([ENEMY], FALSE)~ THEN BEGIN E1
  SAY #37856 /* ~You've led monsters to the village - please, kill them before they hurt someone! ~ */
  IF ~~ THEN EXIT
END

//
// END OF FILE
//

