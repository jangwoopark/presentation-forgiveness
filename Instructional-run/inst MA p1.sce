scenario = "Mutual Advantage game player 1";
scenario_type = fMRI_emulation;
#scenario_type = fMRI;
scan_period = 3000;
response_matching = simple_matching;
no_logfile = false;
sequence_interrupt=false; #default
#active_buttons = 2;
#button_codes=0,1;
default_font="arial";
default_font_size=30;
default_text_color=255,255,255;
default_background_color=0,0,0;

begin;

picture { text { caption = 
"You are Player 1"; }; x=0; y=0; } player1;

picture { text { caption =
" Choose:

KEEP 5 dollars, SEND 5 dollars to Player 2

OR 

KEEP 1 dollar, SEND 1 dollar to Player 2
"; }; x=0; y=0; } p1DG1;

picture { text { caption =
"Waiting for Player 2 to acknowledge your decision"; }; x=0; y=0; } p1DG2;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } fix;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } startfix;

picture { text { caption = "Now you will play a new game
for 4 rounds with the same Player 2."; }; x=0; y=0; } p1TGa;

picture { text { caption =
"You will begin with 10 dollars.
Whatever you send will be tripled in Player 2's account."; }; x=0; y=0; } p1TG;

picture { text { caption =
"Please wait while Player 2 makes a decision."; }; x=0; y=0; } p1TG1;

picture { text { caption =
"Round 2"; }; x=0; y=0; } p1TGr2;

picture { text { caption =
"Round 3"; }; x=0; y=0; } p1TGr3;

picture { text { caption =
"Round 4"; }; x=0; y=0; } p1TGr4;

trial { picture player1; duration = 3000; code = "p1 playing";} player1t;
trial { picture p1DG1; duration = 14000; code = "p1 DG";} p1DG1t;
trial { picture p1DG2; duration = 3000; code = "p1 sent";} p1DG2t;
trial { picture p1TGa; duration = 3000; code = "p1 TGa";} p1TGat;
trial { picture p1TG; duration = 14000; code = "p1 TG";} p1TGt;
trial { picture p1TG1; duration = 3000; code = "p1 wait";} p1TG1t;
trial { picture fix; duration = 5000; code = "fix";} fixing;
trial { picture fix; duration = 15000; code = "startfix";} startfixing;
trial { picture { text { caption = "temp"; } texting; x=0; y=0; }; duration = 14000; } info_trial;
trial { picture p1TGr2; duration = 3000; code = "round 2";} p1TGr2t;
trial { picture p1TGr3; duration = 3000; code = "round 3";} p1TGr3t;
trial { picture p1TGr4; duration = 3000; code = "round 4";} p1TGr4t;

# selecting

text { caption = " "; font_size = 12; } cross; 
text { caption = "SELECT
AMOUNT
FROM"; } select;
text { caption = "SENDING:"; } sending;
text { caption = "KEEPING:"; } keeping;
text { caption = "_"; } dollar_2;
text { caption = "_"; } dollar_3;
box { height = 486; width = 2; color = 255,255,255; } vert;
box { height = 2; width = 142; color = 255,255,255; } horiz;
box { height = 2; width = 4; color = 255,255,255; } divide;
box { height = 42; width = 140; color = 0,0,0; } zero;

# cursors for 10, 13, 16, 19, 22, 25, 28, 31, 34, 37, 40

TEMPLATE "cursors.tem" {
dol dollar k red10 rex cursor coding codes; 
10 dollar_10 10 "red10_10_" rex10 cursor10 coding10 codes10;
13 dollar_13 13 "red10_13_" rex13 cursor13 coding13 codes13;
16 dollar_16 16 "red10_16_" rex16 cursor16 coding16 codes16;
19 dollar_19 19 "red10_19_" rex19 cursor19 coding19 codes19;
22 dollar_22 22 "red10_22_" rex22 cursor22 coding22 codes22;
25 dollar_25 25 "red10_25_" rex25 cursor25 coding25 codes25;
28 dollar_28 28 "red10_28_" rex28 cursor28 coding28 codes28;
31 dollar_31 31 "red10_31_" rex31 cursor31 coding31 codes31;
34 dollar_34 34 "red10_34_" rex34 cursor34 coding34 codes34;
37 dollar_37 37 "red10_37_" rex37 cursor37 coding37 codes37;
40 dollar_40 40 "red10_40_" rex40 cursor40 coding40 codes40;
};

#MA sending choices

text { caption = "SELECT
AMOUNT"; } nofrom;

array { LOOP $i 10; $t = '$i+1'; box {height = '440/10-2'; width = 140; color = 0,0,0;} "dgred10_10_$t"; ENDLOOP; } dgrex10;

picture { text cross; x=0; y=0;
		LOOP $i 10; $t='$i+1'; 
		box "dgred10_10_$t"; x=0; y='-220+(440/(2*10))+$i*440/10';
		ENDLOOP;
		LOOP $i '10+1';
		box divide; x=68; y='220-$i*(440/10)';
		box divide; x=-68; y='220-$i*(440/10)';
		ENDLOOP;
		text nofrom; x = -250; y = 0;
		text dollar_10; x = -250; y = -100;
		text sending; x = 250; y = 23;
		text dollar_2; x = 400; y = 23;
		text keeping; x = 250; y = -23;
		text dollar_3; x = 400; y = -23;
		box zero; x=0; y=-242;
		box vert; x=70; y=-22; 
		box vert; x=-70; y=-22; 
		box horiz; x=0; y=220; 
		box horiz; x=0; y=-264;
		} dgcur;

trial { stimulus_event {picture dgcur;} dgcod;  } dgcoding;
			 
begin_pcl;

include "inst MA p1.pcl";

# Sequence for delivery of stimuli

#array <int> sequence[5] = {1,2,3,3,3};
#	loop int i=1 
#	until i>5 
#	begin
#	if sequence[i]==1
#		then player1t.present(); p1DG1t.present(); p1DG2t.present(); DG(8000); fixing.present()
#	elseif sequence[i]==2
#		then p1TGt.present(); p1TGt.present(); TG(8000); showing(); p1TG1t.present(); fixing.present()
#	elseif sequence[i]==3
#		then info_trial.present(); p1TGt.present(); TG(8000); showing(); p1TG1t.present(); fixing.present()
#	end;
#		i=i+1
#end;

#presenting the dictator game as p1
startfixing.present(); player1t.present(); p1DG1t.present(); DG(10000); p1DG2t.present(); fixing.present();
#presenting the trust game 1 as p1
p1TGat.present(); p1TGt.present(); TG1(10000); showing(); p1TG1t.present(); fixing.present();
#presenting the trust game 2 as p1
info_trial.present(); p1TGr2t.present(); TG2(10000); showing(); p1TG1t.present(); fixing.present();
#presenting the trust game 3 as p1
info_trial.present(); p1TGr3t.present(); TG3(10000); showing(); p1TG1t.present(); fixing.present();
#presenting the trust game 4 as p1
info_trial.present(); p1TGr4t.present(); TG4(10000); showing(); p1TG1t.present(); fixing.present();
