scenario = "Mutual Advantage game player 2";
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
"You are Player 2"; }; x=0; y=0; } player2;

picture { text { caption =
"Player 1 will choose to send you
between 0 and 10 dollars."; }; x=0; y=0; } p2DG1;

picture { text { caption =
"You have been sent 5 dollars by Player 1."; }; x=0; y=0; } p2DGa;

#picture { text { caption =
#"You have been sent 9 dollars by player 1."; }; x=0; y=0; } p2DGb;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } fix;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } startfix;

picture { text { caption = "Now you will play a new game
for 4 rounds with the same Player 1."; }; x=0; y=0; } p2TGa;

picture { text { caption =
"You and Player 1 both begin with 10 dollars.

Whatever Player 1 sends you
will be tripled in your account."; }; x=0; y=0; } p2TG;

picture { text { caption =
"Please wait while Player 1 chooses an amount."; }; x=0; y=0; } p2TG1;

picture { text { caption =
"Round 2"; }; x=0; y=0; } p2TGr2;

picture { text { caption =
"Round 3"; }; x=0; y=0; } p2TGr3;

picture { text { caption =
"Round 4"; }; x=0; y=0; } p2TGr4;

trial { picture player2; duration = 3000; code = "p2 playing";} player2t;
trial { picture p2DG1; duration = 3000; code = "p2 DG";} p2DG1t;
trial { picture p2DGa; duration = 14000; code = "p1 sent 2";} p2DGat;
#trial { picture p2DGb; duration = 3000; code = "p1 sent 9";} p2DGbt;
trial { picture p2TG; duration = 3000; code = "p2 TG";} p2TGt;
trial { picture p2TG1; duration = 3000; code = "p2 wait";} p2TG1t;
trial { picture p2TGa; duration = 3000; code = "p2 New";} p2TGat;
trial { picture fix; duration = 5000; code = "fix";} fixing;
trial { picture fix; duration = 15000; code = "startfix";} startfixing;
trial { picture p2TGr2; duration = 3000; code = "round 2";} p2TGr2t;
trial { picture p2TGr3; duration = 3000; code = "round 3";} p2TGr3t;
trial { picture p2TGr4; duration = 3000; code = "round 4";} p2TGr4t;

# sending

text { caption = "With the tripled amount sent to you by Player 1,
you have

Choose any amount to send back to Player 1."; } Person;
text { caption = "_"; } selling;
picture { text Person; x=0; y=0; text selling; x=140; y=20; } Sentpe;
trial { stimulus_event { picture Sentpe; duration = 14000; } personsent;} Sentperson;

# selecting

text { caption = " "; font_size = 12; } cross; 
text { caption = "SELECT
AMOUNT
FROM"; } select;
text { caption = "SENDING:"; } sending;
text { caption = "KEEPING:"; } keeping;
text { caption = "_"; } dollar_2;
text { caption = "_"; } dollar_3;
text { caption = "_"; } ac10;
box { height = 486; width = 2; color = 255,255,255; } vert;
box { height = 2; width = 142; color = 255,255,255; } horiz;
box { height = 2; width = 4; color = 255,255,255; } divide;
box { height = 42; width = 140; color = 0,0,0; } zero;
box { height = 440; width = 140; color = 255,0,0;} red1;
text { caption = "Move mouse up 
to acknowledge";} move;

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

# cursor for accepting

picture { text cross; x=0; y=0;
		box red1; x=0; y=0;
		text move; x = -250; y = 0;
		text ac10; x = 250; y = 0;
		box zero; x=0; y=-242;
		box vert; x=70; y=-22; 
		box vert; x=-70; y=-22; 
		box horiz; x=0; y=220; 
		box horiz; x=0; y=-264;
		} acknow;

trial { stimulus_event {picture acknow;} acknowl;  } acknowledge;
			 
begin_pcl;

include "cursors.pcl";

include "MA p2.pcl";

# Sequence for delivery of stimuli

#array <int> sequence[5] = {1,2,2,2,2};
#	loop int i=1 
#	until i>5 
#	begin
#	if sequence[i]==1
#		then player2t.present(); p2DG1t.present(); DGsent(); p2DG2t.present(); fixing.present()
#	elseif sequence[i]==2
#		then player2t.present(); p2TG1t.present(); TGsent(11000); fixing.present()
#	end;
#		i=i+1
#end;

#presenting the dictator game as p2
startfixing.present(); player2t.present(); p2DG1t.present(); p2DGat.present(); DGsent(10000); fixing.present();
#presenting the trust game 1 as p2
p2TGat.present(); p2TGt.present(); TGsent1(24000); fixing.present();
#presenting the trust game 2 as p2
p2TGr2t.present(); p2TG1t.present(); TGsent2(24000); fixing.present();
#presenting the trust game 3 as p2
p2TGr3t.present(); p2TG1t.present(); TGsent3(24000); fixing.present();
#presenting the trust game 4 as p2
p2TGr4t.present(); p2TG1t.present(); TGsent4(24000); fixing.present();