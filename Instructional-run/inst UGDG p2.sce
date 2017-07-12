scenario = "forgiveness game player 2";
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
between 0 and 10 dollars.
If you accept, both of you end up with PAYOFFS.
If you reject, both of you end up with NOTHING."; }; x=0; y=0; } p2UG1;

picture { text { caption =
"Player 1 will choose to send you
between 0 and 10 dollars."; }; x=0; y=0; } p2DG1;

#picture { text { caption =
#"You have been sent 2 dollars by Player 1."; }; x=0; y=0; } p2DGa;

#picture { text { caption =
#"You have been sent 9 dollars by player 1."; }; x=0; y=0; } p2DGb;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } fix;

picture { text { caption = "+"; font_size = 50; }; x=0; y=0; } startfix;

#picture { text { caption = "Now you will play a new game
#for 4 rounds with the same Player 1."; }; x=0; y=0; } p2TGa;

#picture { text { caption =
#"You and Player 1 both begin with 10 dollars.

#Whatever Player 1 sends you 
#will be tripled in your account."; }; x=0; y=0; } p2TG;

#picture { text { caption =
#"Please wait while Player 1 chooses an amount."; }; x=0; y=0; } p2TG1;

#picture { text { caption =
#"Round 2"; }; x=0; y=0; } p2TGr2;

#picture { text { caption =
#"Round 3"; }; x=0; y=0; } p2TGr3;

#picture { text { caption =
#"Round 4"; }; x=0; y=0; } p2TGr4;

trial { picture player2; duration = 3000; code = "p2 playing";} player2t;
trial { picture p2UG1; duration = 6000; code = "p2 UG";} p2UG1t;
trial { picture p2DG1; duration = 6000; code = "p2 DG";} p2DG1t;
#trial { picture p2DGa; duration = 3000; code = "p1 sent 2";} p2DGat;
#trial { picture p2DGb; duration = 3000; code = "p1 sent 9";} p2DGbt;
#trial { picture p2TG; duration = 6000; code = "p2 TG";} p2TGt;
#trial { picture p2TGa; duration = 4000; code = "p2 New";} p2TGat;
trial { picture fix; duration = 5000; code = "fix";} fixing;
trial { picture fix; duration = 15000; code = "startfix";} startfixing;
#trial { picture p2TGr2; duration = 3000; code = "round 2";} p2TGr2t;
#trial { picture p2TGr3; duration = 3000; code = "round 3";} p2TGr3t;
#trial { picture p2TGr4; duration = 3000; code = "round 4";} p2TGr4t;

# sending

text { caption = "You have been sent 

by Player 1."; } Person;
text { caption = "_"; } selling;
picture { text Person; x=0; y=0; text selling; x=0; y=0; } Sentpe;
trial { stimulus_event { picture Sentpe; duration = 14000; } personsent;} Sentperson;

# selecting

text { caption = " "; font_size = 12; } cross; 
#text { caption = "SELECT
#AMOUNT
#FROM"; } select;
#text { caption = "SENDING:"; } sending;
#text { caption = "KEEPING:"; } keeping;
#text { caption = "_"; } dollar_2;
#text { caption = "_"; } dollar_3;
text { caption = "_"; } ac10;
box { height = 486; width = 2; color = 255,255,255; } vert;
box { height = 2; width = 142; color = 255,255,255; } horiz;
box { height = 2; width = 4; color = 255,255,255; } divide;
box { height = 42; width = 140; color = 0,0,0; } zero;
box { height = 440; width = 140; color = 255,0,0;} red1;
text { caption = "Move mouse up 
to Accept 
or Reject";} move;

text { caption = "Move mouse up 
to acknowledge";} movedg;

# cursor for accepting in UG

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

# cursor for acknowledging in DG

picture { text cross; x=0; y=0;
		box red1; x=0; y=0;
		text movedg; x = -250; y = 0;
		text ac10; x = 250; y = 0;
		box zero; x=0; y=-242;
		box vert; x=70; y=-22; 
		box vert; x=-70; y=-22; 
		box horiz; x=0; y=220; 
		box horiz; x=0; y=-264;
		} acknowdg;

trial { stimulus_event {picture acknowdg;} acknowldg;  } acknowledgedg;

begin_pcl;

mouse stick = response_manager.get_mouse( 1 );
#joystick stick = response_manager.get_joystick( 1 ); 
stick.set_min_max( 1, -1, 1 );
stick.set_min_max( 2, -264, 220 );
#stick.set_saturation( 1, 0.999 );
#stick.set_saturation( 2, 0.999 );
#stick.set_dead_zone( 1, 0.001 ); 
#stick.set_dead_zone( 2, 0.001 );
#this is DG presenting to player 2

include "sub UGDG p2.pcl";

# Sequence for delivery of stimuli

startfixing.present();

array <int> sequence[4] = {1,2,1,2};
	loop int i=1 
	until i>4 
	begin
	if sequence[i]==1
		then player2t.present(); p2UG1t.present(); UGsent(24000); fixing.present()
	elseif sequence[i]==2
		then player2t.present(); p2DG1t.present(); DGsent(24000); fixing.present()
	end;
		i=i+1
end;

#presenting the dictator game as p2
#player2t.present(); p2DG1t.present(); p2DGat.present(); DGsent(8000); fixing.present();
#presenting the trust game 1 as p2
#p2TGat.present(); p2TGt.present(); TGsent1(11000); fixing.present();
#presenting the trust game 2 as p2
#p2TGr2t.present(); p2TG1t.present(); TGsent2(11000); fixing.present();
#presenting the trust game 3 as p2
#p2TGr3t.present(); p2TG1t.present(); TGsent3(11000); fixing.present();
#presenting the trust game 4 as p2
#p2TGr4t.present(); p2TG1t.present(); TGsent4(11000); fixing.present();