BEGIN ~WAFARM~

IF ~Global("WAFARM1","Global",1)~ THEN BEGIN 0
	SAY @0 
	IF ~DEAD("WADEAD1")~ THEN REPLY @1 GOTO 2
	IF ~!DEAD("WADEAD1")~ THEN REPLY @2  GOTO 4
END

/*
IF ~
DEAD("WADEAD1")
!Global("WASUC1","GLOBAL",1)
~ THEN BEGIN 1
SAY @0 
	IF ~DEAD("WADEAD1")~ THEN REPLY @1 GOTO 2
	IF ~~ THEN REPLY @2  GOTO 4
END
*/

IF ~~ THEN BEGIN 2
	SAY @3
	IF ~~ THEN DO ~
	SetGlobal("WAFARM1","Global",2)
	%ERASEJOURNALENTRY_2006%
	%ERASEJOURNALENTRY_2004%
	~ %SOLVED_JOURNAL% @2005 GOTO 3
END

IF ~~ THEN BEGIN 3
	SAY @4 
	IF ~~ THEN REPLY @5 DO ~ReputationInc(1)~ GOTO 5
	IF ~~ THEN REPLY @6 DO ~GiveGoldForce(25)~ GOTO 6
	IF ~~ THEN REPLY @7 DO ~Shout(99)
Enemy()
ReputationInc(-1)
~ EXIT
END

IF ~~ THEN BEGIN 4
	SAY @8
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 5
	SAY @9
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 6
	SAY @10
	IF ~~ THEN EXIT
END

IF ~Global("WAFARM1","Global",2)~ THEN BEGIN 7
	SAY @11 
	IF ~~ THEN EXIT
END