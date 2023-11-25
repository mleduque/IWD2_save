// creator  : weidu (version 110)
// argument : CMSHI01.DLG
// game     : .
// source   : ./override/CMSHI01.DLG
// dialog   : ./dialog.tlk
// dialogF  : (none)

BEGIN ~CMSHI01~

IF ~True()
~ THEN BEGIN 0 // from:
  SAY @1 /* ~Greetings traveler, you have the appearance of someone who needs some supplies yes? What can I do for you?~ #41512 */
  IF ~~ THEN REPLY @2 /* ~What is a good looking lady doing up here in the cold?~ #41513 */ GOTO 1
  IF ~~ THEN REPLY @3 /* ~Lets take a look at your goods.~ #41514 */ GOTO 2
  IF ~~ THEN REPLY @4 /* ~Nothing for now.~ #41515 */ EXIT
END

IF ~~ THEN BEGIN 1 // from: 0.0
  SAY @5 /* ~It just so happens I love the cold and the solitude that the Northern lands provide. Plus I can sell my wares to people who are in need of things. Anything else?~ #41516 */
  IF ~~ THEN REPLY @6 /* ~Where have you traveled in the Northern lands? It is a huge place after all.~ #41517 */ GOTO 3
  IF ~~ THEN REPLY @7 /* ~I guess not lets take a look at your goods.~ #41518 */ GOTO 2
  IF ~~ THEN REPLY @4 /* ~Nothing for now.~ #41515 */ EXIT
END

IF ~~ THEN BEGIN 2 // from: 3.0 1.1 0.1
  SAY @8 /* ~Ok here is what I have.~ #41519 */
  IF ~~ THEN DO ~StartStore("cmstor01",Protagonist)
~ EXIT
END

IF ~~ THEN BEGIN 3 // from: 1.0
  SAY @9 /* ~I've been to the Gloomfrost Glacier. It's such a beautiful place this time of year. I did meet a nut case of a dwarf up there that ruined my solitude, but other then that it was nice there. I may travel back there some time again. Now why don't we get down too business.~ #41520 */
  IF ~~ THEN REPLY @10 /* ~Alright lets take a look at your goods.~ #41521 */ GOTO 2
  IF ~~ THEN REPLY @4 /* ~Nothing for now.~ #41515 */ EXIT
END
