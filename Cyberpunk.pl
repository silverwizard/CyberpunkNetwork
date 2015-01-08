#!/bin/perl
use strict;
use warnings;

#print $#ARGV;
#if($#ARGV+1 >= 2){
#	use constant depth => $ARGV[1];
#}else{
	use constant depth => 5;
#}

generate($ARGV[0], $ARGV[0], 1);

sub generate {
	my $CHAR;
	my $var;
	mkdir $_[0], 0755 unless -d $_[0];
	open($CHAR, ">" . $_[0] . "/" . $_[1]);
	my $INT =  roll(8,3);
	my $REF = roll(8,3);
	my $CL = roll(8,3);
	my $TECH = roll(8,3);
	my $LK = roll(8,3);
	my $ATT = roll(8,3);
	my $MA = roll(8,3);
	my $EMP = roll(8,3);
	my $BT = roll(8,3);
	
	printf $CHAR table("Biker Leathers", "Blue Jeans", "Corporate Suits", "Jumpsuits", "Miniskirts", "High Fashion", "Cammos", "Normal Clothes", "Nude", "Bag Lady Chic", "Generally Wears");
	printf $CHAR table("Mohawk", "Long & Ratty", "Short & Spiked", "Wild & all over", "Bald", "Stripped", "Tinted", "Neat, short", "Short, curly", "Long, straight", "Hair");
	printf $CHAR table("Tatoos", "Mirrorshades", "Ritual Scars", "Spiked gloves", "Nose Rings", "Earrings", "Long Fingernails", "Spike heeled boots", "Weird contact lenses", "Fingerless gloves", "Affection");
	printf $CHAR table("Anglo-American", "African", "Japanese/Korean", "Central European", "Pacific Islander", "Chinese/Southeast Asian", "Black American", "Hispanic American", "Central/South American", "European", "Ethnicity");
	printf $CHAR table("Corporate Executive", "Corporate Manger", "Corporate Technician", "Nomad Pack", "Pirate Fleet", "Gang Family", "Crime Lord", "Combat Zone Poor", "Urban Homeless", "Arcology Family", "Family Rank");
	$var = roll(10,1);
	if ($var <= 6){
		printf $CHAR "Something happened to your parents!\n";
		printf $CHAR table("Your parents died in warfare", "Your parents died in an accident", "Your parents were murdered", "Your parents have amnesia and don't remember you", "You never knew your parents", "Your parents are in hiding to protect you", "You were left with relatives for safekeeping", "You grew up on the Street and never had parents", "Your parents gave you up for adoption", "Your parents sold you for money", "It was");
	}
	$var = roll(10,1);
	if($var <= 6){
		printf $CHAR "There was a family tragedy!\n";
		printf $CHAR table( "Family lost everything through betrayal", "Family lost everything through bad management", "Family exiled or otherwise driven from their original home/nation/corporation", "Family is imprisoned and you alone escaped", "Family vanished. You are only remaining member", "Family was murdered/killed and you were the only remaining member", "Family is involved in longterm conspiracy, organization or association, such as a crime family or revolutionary group", "Your family was scattered to the winds due to misfortune", "Your family is cursed with a hereditary feud that has lasted for generations", "You are the inheritor of a family debt; you must honour this debt before moving on with your life", "It was");
	}
	printf $CHAR table("Spent life on the Street, with no adult supervision", "Spent in a safe Corporation Suburbia", "In a Nomad Pack moving from town to town", "In a decaying, once upscale neighbourhood", "In a defended Corporate Zone in the Central City", "In the heart of the combat zone", "In a small village or town far from the City", "In a arcology city", "In an aquatic Pirate Pack", "On a corporate controlled Farm or Research Facility", "Childhood Environment");
	$var = roll(10,1);
	if ($var <=7){
		my $i = $var;
		while($i >= 0){
			printf $CHAR "You have a";
			$var = roll(10,1);
			if($var <= 5){
				printf $CHAR "n older";
			}elsif($var <= 9){
				printf $CHAR " younger";
			}else{
				printf $CHAR " twin";
			}
			my $ch = name();
			printf $CHAR " sibling, named " . substr($ch, 0, -1) . " who ";
			$var = roll(10,1);
			if(($var == 1)||($var == 2)){
				printf $CHAR "dislikes you\n";
			}
			if(($var == 3)||($var == 4)){
				printf $CHAR "likes you\n";
			}
			if(($var == 5)||($var == 6)){
				printf $CHAR "is neutral toward you\n";
			}
			if(($var == 7)||($var == 8)){
				printf $CHAR "hero worships you\n";
			}
			if(($var == 9)||($var == 10)){
				printf $CHAR "hates you\n";
			}
			#generate($_[0] . "/" . substr(join('_', split(/ /,$ch)),0,-1), substr($ch,0,-1));
			$i = $i - 1;
		}
	}
	printf $CHAR table("Shy and secretive", "Rebellious, antisocial, violent", "Arrogant, proud, and aloof", "Moody, rash, and headstrong", "Picky, fussy, and nervous", "Stable and serious", "Silly and fluffheaded", "Sneaky and deceptive", "Intellectual and detatched", "Friendly and outgoing", "Personality");
	printf $CHAR table("A parent", "Brother and sister", "Lover", "Friend", "Yourself", "A pet", "Teacher or mentor", "Public Figure", "A personal hero", "No one", "Most Valued Person");
	printf $CHAR table("Money", "Honour", "Your word", "Honesty", "Knowledge", "Vengeance", "Love", "Power", "Having a good time", "Friendship", "Most Valued Thing");
	printf $CHAR table("Neutral", "Neutral", "I like almost everyone", "I hate almost everyone", "People are tools. Use them for your own goals and discard them", "Every person is a valuable individual", "People are obstacles to be destroyed if they cross me", "People are untrustworthy. Don't depend on anyone.", "Wipe 'em all out and give the place to the cockroaches", "People are wonderful", "Feelings on most people");
	printf $CHAR table("A weapon", "A tool", "A piece of clothing", "A photograph", "A book or diary", "A recording", "A musical instrument", "A piece of jewelery", "A toy", "A letter", "Most Valued Possession");
	printf $CHAR "AGE: ";
	my $age = roll(6,1)+roll(6,1);
	print $CHAR $age+16;
	printf $CHAR "\n";

	while($age >= 0){
		$var = roll(10,1);
		if($var <= 3){
			$var = roll(10,1);
			if($var%2 == 0){
				printf $CHAR win();
			}else{
				printf $CHAR "You had a loss!\n";
				my $loss = roll(10,1);
				SWITCH: {
					$var == 1 && do {
						printf $CHAR "Finanacial loss or Debt! You owe " . roll(10,1)*100 . " eb. If you can't pay now, you have a debt to pay, in cash, or in blood.\n";
						last SWITCH;
					};
					$var == 2 && do {
						printf $CHAR "Imprisonment! You have been in prison or possibly held hostage (your choice). It lasted " . roll(10,1) . " months.\n";
						last SWITCH;
					};
					$var == 3 && do {
						printf $CHAR "Illness or addiction! You contracted either an illness or a drug habit. (You have lost 1 REF)\n";
						$REF = $REF - 1;
						last SWITCH;
					};
					$var == 4 && do {
						printf $CHAR "Betrayal! You have been backstabbed in some manner. ";
						my $how = roll(10,1);
						if($how <=3){
							printf $CHAR "You are being black mailed.\n";
						}elsif($how <= 7){
							printf $CHAR "A secret of yours was revealed.\n";
						}else{
							printf $CHAR "It was by a close friend in your career, or a romantic partner.\n";
						}
						last SWITCH;
					};
					$var == 5 && do {
						printf $CHAR "Accident! You were in some kind of terrible accident. ";
						my $what = roll(10,1);
						if($what <= 4){
							printf $CHAR "You were terribly disfigured (You have lost 5 ATT).\n";
							$ATT = $ATT - 5;
						}elsif($what <= 6){
							printf $CHAR "You were hospitalized for " . roll(10,1) . " months.\n";
						}elsif($what <= 8){
							printf $CHAR "You have lost " . roll(10,1) . " months worth of your memory.\n";
						}else{
							printf $CHAR "You constantly relive nightmares of the accident and wake up screaming (8 out of 10 chance each night).\n";
						}
						last SWITCH;
					};
					$var == 6 && do {
						printf $CHAR "Lover, friend, or relative killed. You lost someone you really cared about (named " . name() . ") ";
						my $how = roll(10,1);
						if($how <= 5){
							printf $CHAR "They died accidentally.\n";
						}elsif($how <= 8){
							printf $CHAR "They were murdered by unknown parties.\n";
						}else{
							printf $CHAR "They were murdered and you know who did it. You just need the proof (or do you?)\n";
						}
						last SWITCH;
					};
					$var == 7 && do {
						printf $CHAR "False Accusation! You were set up! You've been accused falsley for ";
						my $what = roll(10,1);
						if($what <= 3){
							printf $CHAR "theft.\n";
						}elsif($what <= 5){
							printf $CHAR "cowardice.\n";
						}elsif($what <= 8){
							printf $CHAR "murder.\n";
						}elsif($what <= 9){
							printf $CHAR "rape.\n";
						}else{
							printf $CHAR "lying or betrayal.\n";
						}
						last SWITCH;
					};
					$var == 8 && do {
						printf $CHAR "You are being hunted by the law! You are being hunted by the law for crimes you may or may not have committed (your choice). ";
						my $who = roll(10,1);
						if($who <= 3){
							printf $CHAR "But it's only by a few local cops.\n";
						}elsif($who <= 6){
							printf $CHAR "It's by the entire local force!\n";
						}elsif($who <= 8){
							printf $CHAR "It's by the Police or Militia.\n";
						}else{
							printf $CHAR "It's by the FBI! (or other national police force)!\n";
						}
						last SWITCH;
					};
					$var == 9 && do {
						printf $CHAR "You pissed off a corporate head honch! ";
						my $who = roll(10,1);
						if($who <= 3){
							printf $CHAR "Luckily, it's only a small local corporation.\n";
						}elsif($who <= 6){
							printf $CHAR "It's a larger firm with office statewide!\n";
						}elsif($who <= 8){
							printf $CHAR "It's a big national corp with agents in major cities nationwide.\n";
						}else{
							printf $CHAR "It's a huge multinational corp with armies, ninjas, and spies EVERYWHERE.\n";
						}
						last SWITCH;
					};
					$var == 10 && do {
						printf $CHAR "You have experienced some type of mental or physical breakdown! ";
						my $who = roll(10,1);
						if($who <= 3){
							printf $CHAR "It's some type of nervous disorder. Likely from a bioplauge (you lost 1 REF.\n";
							$REF = $REF-1;
						}elsif($who <= 7){
							printf $CHAR "It's some kind of mental problem, you suffer anxiety attacks and phobias! (You lost 1 COOL)\n";
							$CL = $CL - 1;
						}else{
							printf $CHAR "It's a major psychosis. You hear voices, are violent, irrational, and depressive.\n";
							$CL = $CL - 1;
							$REF = $REF - 1;
						}
						last SWITCH;
					};
				}	
				printf $CHAR table("Clear your name.", "Clear your name.", "Live it down, and try to forget it.", "Live it down, and try to forget it.", "Hunt down those responsible and MAKE THEM PAY!", "Hunt down those responsible and MAKE THEM PAY!", "Get what's rightfully yours.", "Get what's rightfully yours.", "Save, if possible, anyone else involved in the situation.", "Save, if possible, anyone else involved in the situation.", "What you gonna do about it?");
			}
		}elsif($var <= 6){
			$var = roll(10,1);
			if($var <= 5){
				my $ch = name();
				printf $CHAR "You made a friend named " . substr($ch,0,-1) . ".\n";
				printf $CHAR table("They are like a big brother/sister to you.", "They are like a kid sister/brother to you.", "They are like a teacher or mentor.", "They are like a partner or co-worker.", "They're an old lover.", "They're an old enemy.", "They are like a foster parent to you.", "They're a relative.", "You've reconnected with an old childhood friend.", "You met through a common interest.", "Your relationship");
				if($_[2] < depth){
					generate($_[0] . "/" . substr(join('_', split(/ /,$ch)),0,-1), substr($ch,0,-1), $_[2]+1);
				}
			}else{
				my $ch = name();
				printf $CHAR "You made an enemy named " . substr($ch,0,-1) . ".\n";
				if($_[2] < depth){
					generate($_[0] . "/" . substr(join('_', split(/ /,$ch)),0,-1), substr($ch,0,-1), $_[2]+1);
				}
				printf $CHAR table("Ex friend.", "Ex lover.", "Relative.", "Childhood enemy.", "Person working for you.", "Person you work for.", "Partner or co-worker.", "Booster gang member.", "Corporate Exec.", "Government official.", "Who are they");
				my $why = roll(10,1);
				SWITCH: {
					$why == 1 && do {
						printf $CHAR "Someone caused the other to lose face or status.\n";
						last SWITCH;
					};
					$why == 2 && do {
						printf $CHAR "Someone caused the loss of a lover, friend, or relative.\n";
						last SWITCH;
					};
					$why == 3 && do {
						printf $CHAR "Someone caused a major humiliation.\n";
						last SWITCH;
					};
					$why == 4 && do {
						printf $CHAR "Someone accused the other of cowardice or some other personal flaw.\n";
						last SWITCH;
					};
					$why == 5 && do {
						my $what = roll(6,1);
						if($what <= 2){
							$what = "lose an eye";
						}elsif($what <= 4){
							$what = "lose an arm";
						}else{
							$what = "be badly scarred";
						}
						printf $CHAR "Someone was caused to " . $what . ".\n";
						last SWITCH;
					};
					$why == 6 && do {
						printf $CHAR "Someone deserted or betrayed the other.\n";
						last SWITCH;
					};
					$why == 7 && do {
						printf $CHAR "Someone turned down other's offer of job or romantic involvement.\n";
						last SWITCH;
					};
					$why == 8 && do {
						printf $CHAR "You just don't like each other.\n";
						last SWITCH;
					};
					$why == 9 && do {
						printf $CHAR "You were romantic rivals.\n";
						last SWITCH;
					};
					$why == 10 && do {
						printf $CHAR "Someone was foiled by a plan of the other's.\n";
						last SWITCH;
					};
					printf $CHAR table("You hate them.", "You hate them.", "You hate them.", "You hate them.", "You hate them.", "You hate them.", "You hate them.", "The feelings mutual.", "The feelings mutual.", "The feelings mutual.", "Who's Fracked Off");
					printf $CHAR "What you gonna do about it, punk?\n";
					printf $CHAR table("Go into a murdererous, killing rage and rip his face off.", "Go into a murdererous, killing rage and rip his face off.", "Avoid the scum.", "Avoid the scum.", "Backstab him indirectly.", "Backstab him indirectly.", "Ignore the scum.", "Ignore the scum.", "Rip into him verbally.", "Rip into him verbally.", "If the two of you ever met face to face you would");
					printf $CHAR table("Just himself", "Just himself", "Just himself", "Himself and a friends.", "Himself and a friends.", "An entire gang", "An entire gang", "A small corporation", "A large corporation", "An entire Government Agency", "What can he throw at you");
				}
			}
		}elsif($var <= 8){
			my $ch = name();
			printf $CHAR "You had a romance! With someone named " . $ch;
			printf $CHAR romance();
			if($_[2] < depth){
				generate($_[0] . "/" . substr(join('_', split(/ /,$ch)),0,-1), substr($ch,0,-1), $_[2]+1);
			}
		}elsif($var <=10){
			printf $CHAR "You have an uneventful year\n";
		}
		$age = $age-1;
	}	
	printf $CHAR "INT: " . $INT . "\n";
	printf $CHAR "REF: " . $REF . "\n";
	printf $CHAR "CL: " . $CL . "\n";
	printf $CHAR "TECH: " . $TECH . "\n";
	printf $CHAR "LK: " . $LK . "\n";
	printf $CHAR "ATT: " . $ATT . "\n";
	printf $CHAR "MA: " . $MA . "\n";
	printf $CHAR "EMP: " . $EMP . "\n";
	printf $CHAR "BT: " . $BT . "\n";
	close($CHAR);
}

sub roll{
	return int(rand()*$_[0]+$_[1]);
}

sub name{
	my $name = `notwhoami|head -n1`;
	return $name;
}

sub table{
	my $return;
	$return = $_[10] . ": ";
	my $var = roll(10,1);
	SWITCH: {
		$var == 1 && do {
			$return = $return . $_[0];
			last SWITCH;
			};
		$var == 2 && do { 
			$return = $return .  $_[1];
			last SWITCH;
			};
		$var == 3 && do { 
			$return = $return .  $_[2];
			last SWITCH;
			};
		$var == 4 && do { 
			$return = $return .  $_[3];
			last SWITCH;
			};
		$var == 5 && do { 
			$return = $return .  $_[4];
			last SWITCH;
			};
		$var == 6 && do { 
			$return = $return .  $_[5];
			last SWITCH;
			};
		$var == 7 && do { 
			$return = $return .  $_[6];
			last SWITCH;
			};
		$var == 8 && do { 
			$return = $return .  $_[7];
			last SWITCH;
			};
		$var == 9 && do { 
			$return = $return .  $_[8];
			last SWITCH;
			};
		$var == 10 && do { 
			$return = $return .  $_[9];
			last SWITCH;
			};
	}
	$return = $return .  "\n";
	return $return;
}
sub win{
	my $return;
	$return = $return .  "You had a big win!\n";
	my $win = roll(10,1);
	SWITCH: {
		$win == 1 && do {
			my $connection = roll(10,1);
			my $type;
			if($connection <= 4){
				$type = "Police Department";
			}elsif($connection <= 7){
				$type = "District Attorney's Office";
			}elsif($connection <= 10){
				$type = "Mayor's Office";
			}
			$return = $return .  "You made a connection in the " . $type . "!\n";
			last SWITCH;
			};
		$win == 2 && do {
			my $money = roll(10,1)*100;
			$return = $return .  "You had a financial windfall of " . $money . " eb\n";
			last SWITCH;
			};
		$win == 3 && do {
			my $money = roll(10,1)*100;
			$return = $return .  "You had a big score on a job or deal " . $money . " eb\n";
			last SWITCH;
			};
		$win == 4 && do {
			$return = $return .  "You found a sensei! (Begin at +2 or add +1 to a Martial Arts skill of your choice)\n";
			last SWITCH;
			};
		$win == 5 && do {
			$return = $return .  "You found a Teacher! (Begin at +2 or add +1 to a skill of your choice)\n";
			last SWITCH;
			};
		$win == 6 && do {
			$return = $return .  "A powerful corporate executive owes you a favour\n";
			last SWITCH;
			};
		$win == 7 && do {
			$return = $return .  "Local Nomad pack befriends you! You can call them for one favour a month, equivalent to the Family special ability at +2!\n";
			last SWITCH;
			};
		$win == 8 && do {
			$return = $return .  "Make a Friend on the Police Force! You may use him for inside information at a level of +2 Streetwise on any police related situation.\n";
			last SWITCH;
			};
		$win == 9 && do {
			$return = $return .  "Local Boostergang likes you! (Who knows why? These are Boosters, right?) You can call upon them for 1 favour a month, equivalent to a Family Special Ability of +2. But don't push it.\n";
			last SWITCH;
			};
		$win == 10 && do {
			$return = $return .  "You found a Combat Teacher! (Begin at +2 or add +1 to a non-Brawl or non-Martial Arts combat skill of your choice)\n";
			last SWITCH;
			};
	}
	return $return;
}

sub romance{
	my $return;
	my $workedout = roll(10,1);
	if($workedout <= 4){
		$return = $return .  "You had a happy love affair, it worked out well\n";
	}elsif($workedout == 5){
		$return = $return .  "It ended in tragedy\n";
		$return = $return . table("Loved died in an accident", "Lover mysteriously vanished", "It didn't work out", "A personal goal or vendetta came between you", "Lover kidnapped", "Lover went insane", "Lover committed suicide", "Lover was killed in a fight", "Rival cut you out of the action", "Love imprisoned or exiled", "What happened");
		$return = $return . table("They still love you", "You still love them", "You still love each other", "You hate them", "They hate you", "You hate each other", "You're friends", "No feeling's either way; it's over", "You like them hate you", "They like you, you hate them", "Mutual Feelings Remaining");
	}elsif($workedout <= 7){
		$return = $return .  "Problems occured\n";
		$return = $return . table("Your lover's friends/family hate you", "Your lover's friends/family would use any means to get rid of you", "Your friends/family hate your lover", "One of you has a romantic rival", "You are separated in some way", "You fight constantly", "You're professional rivals", "One of you is insanely jealous", "One of you is \"messing around\"", "You have conflicting backgrounds and family", "What problems");
	}else{
		$return = $return .  "The two of you have hot dates and fast affairs\n";
	}
	return $return;
}
