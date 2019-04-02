//main story goes here

=== welcome_to_luna ===

You're falling for what feels like ages, almost like you're skydiving at midnight, in space, with the stars falling all around you. You can hear Cerberus howling above you, until you eventually catch him and hold him in your arms tightly.

CRASH!

The three of you land in a heap on a pavement, Parvus breaking your fall and Cerberus on top of you still in your arms. It's daylight. You look around and you're in a place you don't recognise... a city that looks almost like it's from medieval times. People are walking the streets, seemingly going about their daily lives just fine.

-> whats_goin_on

= whats_goin_on

+ (where_are_we)[Where are we?]

{got_up: "Welcome, my dear, to the kingdom of Luna!" Parvus says, with his arms outstretched. ->explore_luna|You hear some wheezing sounds coming from Parvus. Maybe you should stop crushing him before you ask questions.->whats_goin_on}

* (got_up)[Stop crushing Parvus]
You stand up so Parvus can breathe, and put Cerberus back on the ground.
->whats_goin_on

* -> explore_luna

= explore_luna

* [So where's this "imminent danger" you were talking about?]
    You mention that everyone here seems to be fine.
    "So perhaps it wasn't quite as... dire of a situation as I said, but you definitely wouldn't have come with me if I hadn't been so persuasive, no?" -> explore_luna
    
* [How on earth did we get here?]
    "That, my friend, is a story for another time... and by that, I mean I am bound by an oath that means I cannot tell you." -> explore_luna
    
* [What now?]
    "We begin 'Parvus' master plan to save the people of Luna', which begins with you getting ready to go dungeoneering. I'll explain more later. For now, I suggest you go explore the town, get yourself a weapon and some... suitable armour..." he says, looking at your dog walking clothes with a face that says "trying not too look disgusted".
    "Meet me back here by the town gates when you're ready to go!"
    
    You stand there, still gobsmacked and coming to terms with what on earth just happened. You're not entirely sure what the right thing is to do in this situation, but your phone has no signal or battery, and you have no idea how you'd even attempt to get back home. You aren't sure what this Parvus guy's intentions are, but perhaps It's worth hearing him out.
    
    You go for a walk to clear your head. 
    -> town_square
    
=== town_square === 

You find yourself in the town square. {!People are roaming about, coming in and out of shops and chatting.}

+ [Investigate the fountain]
-> _fountain

+ [Talk to the paperboy]
-> _paperboy

+ [Go down Crescent Street]
-> crescent_street

+ [Enter the alleyway]
{weaponEquipped == "": ->old_man_intro|->_alley}

+ [Town gates]

{questsItems == 0: ->town_gates}
{questsItems > 0: -> dungeons_info}

= town_gates

You head back to the town gates, where Parvus is waiting for you.

{visibleWeapon == true: "Aha! I see you got yourself a weapon. Well done. You still need some armour, though." ->town_gates_options|"Haven't you got yourself a weapon and some armour yet? Come on! Luna won't save itself."}

<> {weaponEquipped == "fists": ->town_gates_options}

+ {weaponEquipped == ""} [Head back]
    ->town_square
    
= town_gates_options

* [I couldn't find any armour.]
"Oh," Parvus sighs. "Luna is SO useless in the fashion department! Luckily I found this for you as backup." He hands you some folded up clothes. "There's some stalls just around the corner you can use to change."
    * * [Change clothes]
        You go and find the stalls Parvus was talking about and change into the "armour" he gave you. Weirdly, it's a perfect fit. You look like a brave warrior, a knight, or perhaps like you got lost on the way to Comic-Con.
        
        "There you go! You look perfect."
        ->town_gates_options
    
* {visibleWeapon == true} [Isn't owning this weapon sort of... illegal?]
"Well, uhh...", Parvus stumbles over his words. "Sort of. Regular townsfolk aren't really allowed weapons. But you're no ordinary townsfolk, and besides, this is for justice! Plus, you're sort of forgetting that this whole mission is against the law, really. Taking down Scarlet is uh, kinda treason."
-> town_gates_options

* {visibleWeapon == false} [I've decided I don't need a weapon.]
"What on earth are you talking about? How on earth are you going to fight the enemies ahead of us?"
    * * [*flexes* With these guns!]
    * * [I can still fight with kicks and punches?]
    - - "Alrighty then. I'll allow it."
    ->town_gates_options

* ->dungeons_info

= crescent_street

{You decide to take a look down|You're on} Crescent street. This seems to be where all the main shops are.

+ [Enter the General Store]
    -> general_store

+ [Enter the Library]
You try to enter the library, but the door is locked shut. There's no sign to indicate that it's closed, or anything...
    + + [Go back]
        -> crescent_street

+ [Go back to the town square]
    ->town_square
    
= general_store

A jolly lady greets you as you enter. "Welcome love! Take a look at the wares I've got for sale."

->general_store_options

= general_store_options

    + {not get_weapon}[Ask about weapons]
        You ask her if she has any weapons for sale.
        "Weapons? Ho ho - not here my love. Ye might want to keep quiet about that sort of thing 'round here. But if ye really want something along those lines...", she leans in close to you, and whispers: 
        "Ye didn't here it from me, but the older fellow in the alleyway by the town square can get you what you need. Ye just need the code!"
        + + (weaponCode)[The code?]
        "Why yes - ye must say to him 'I have a message from Sebille'".
        You thank the lady for her guidance.
        -> general_store_options
    
    + {not coolSunglasses} [Look at the Cool Sunglasses]
        "An eye for taste I see!" The lady pipes up. "These sunglasses will have ye looking powerful. I doubt anyone'll mess with ye while wearing these! Would you like to buy 'em? They're a steal at £1"
        {not get_weapon: You realise you probably shouldn't waste money on sunglasses right now.}
        {get_weapon && money < 1: You realise you don't actually have any money.}
        
        + + {get_weapon && money >= 1}[Yes please!]
            ~money--
            ~coolSunglasses = true 
            "A wise purchase!"
            You put on the Cool Sunglasses. You've never looked so badass!
            ->general_store_options
        
        + + [No thank you.]
            "Suit yerself."
            -> general_store_options
    
    + {not apple} [Look at the Apples]
        "Ah yes! These apples are so tasty they've been selling out fast. We only have one left! Buy it for just £1."
        {not get_weapon: You realise you probably shouldn't waste money on apples right now, even if you are peckish.}
        {get_weapon && money < 1: You realise you don't actually have any money.}
        
        + + {get_weapon && money >= 1}[Yes please!]
            ~money--
            ~apple = true 
            "A wise purchase!"
            You buy the apple, putting it in your backpack for later.
            ->general_store_options
        
        + + [No thank you.]
            "Suit yerself."
            -> general_store_options
    
    + [Take your leave]
    "Take care, love!" The lady waves at you on your way out.
    -> crescent_street


= old_man_intro

{You enter the dark, pungent-smelling back alley of the town. You're not entirely sure if it's safe here. A tall, old-looking man in a long coat is stood leaning against the wall in a shifty manner. His eyes are fixed on you as you enter the alleyway.|The old man has his eyes fixed on you.}

+ [Make conversation]
    {weaponCode:"I have a message from Sebille" You tell the old man. ->get_weapon|You ask the shifty old man what brings him here.}
    "Listen, kiddo. I don't know who you are or what your business is - but I suggest you get outta here", the old man says, threateningly.
    -> old_man_intro

+ [Go back to the town square]
-> town_square

= get_weapon

{!"How- who are you?" the man says, startled by your statement.}
 + {weaponEquipped == ""} [I need a weapon.]
 "You've come to the right place. Just be warned, I'm only gonna let you buy one, and this is the only time I'm gonna show you them, so if you back out, you're not getting a weapon at all. It'll cost ya £2 to get one."
 
 {money < 2: You reach into your pockets and realise you haven't got enough money. "Come back when you can afford it!" the man says. You skulk back out of the alleyway. -> town_square}
 
    * * [Choose the sword]
        ~money = money - 2
        ~weaponEquipped = "sword"
        ~visibleWeapon = true
        "Alright, the sword it is. Be careful, It's heavy."
        The old man hands you the sword. He's right, it is heavy - but you feel confident in wielding it. It has a nice decorative handle, and the name "Dawnbreaker" is engraved on the hilt.
        
        You hand over £2, and thank the man.
        -> get_weapon
        
    * * [Choose the bow]
        ~money = money - 2
        ~weaponEquipped = "bow"
        ~visibleWeapon = true
        "Fancy yourself a ranger, huh? The bow it is. The quiver it comes with will mean you never run out of arrows."
        You've always had a thing for archery, but this bow is like none you've ever seen before. It's very decorative, and looks like something you'd find in an art museum. You inspect the quiver it comes with, and find that every time you pull out an arrow, another one pops up in it's place, seemingly out of nowhere.
        
        You hand over £2, and thank the man.
        -> get_weapon
        
    * * [Decide you don't need one]
        ~weaponEquipped = "fists"
        "Whaddya mean you don't need one? Changed your mind, eh?"
        You're not sure what it is - maybe seeing the weapons made it all a bit too real, or perhaps neither of them are really your style. Either way, you decide not to buy one, leaving you with no weapon.
        -> get_weapon
 
 * [I'm {players_name}.]
 "Well, {players_name}, I definitely haven't seen you 'round here before. I take it the shopkeep on Crescent street told you about me."
 -> get_weapon
 
 * (whatHappenedSebille) {weaponEquipped != ""} [Who is Sebille?]
 {!"Sebille... Sebille was my partner."}
 
    * * [What happened?]
        "Somebody killed her. Murder. Happened a long time ago. Never found out who did it."
        * * * [Why do you sell weapons in secret?]
                "Luna has a pretty strict 'no weapons' law. It's something I believe in, despite what I do. If the law was stricter, Sebille would probably still be alive right now. But you gotta pay the bills somehow."
                -> get_weapon
        
    
    * * [I'm sorry for your loss.]
    "Don't worry, I'm done grieving."
    -> whatHappenedSebille
    
* -> leave_alley

= leave_alley

You thank the old man for his help and leave the alleyway.
-> town_square
 
 
= _alley

Sorry, I haven't written this area yet. I'll send you back to the town square!
-> town_square

= _paperboy

{You notice a boy|The boy continues} yelling in the middle of the square, clutching a pile of newspapers. "MURDERS ON THE RISE! MURDERS ON THE RISE! IS ANYBODY SAFE? FIND OUT IN TODAY'S ISSUE OF THE DAILY LUNA!"

* [Ask about the murders]
You ask the boy about the murders he's yelling about.
"There's been more and more weapon related murders lately! Rather perculiar given the no-weapons law. Nobody can figure out what's going on"
    * * [I'll get to the bottom of it.]
        "Good luck stranger! If you find out anything interesting, do a pal a favour and let me know." 
        -> _paperboy
    
    * * [Are the guards here really that bad?]
        The boy looks a little offended.
        "No! Whoever's behind these crimes is just really good at cleaning up afterwards. They can never find any evidence. Besides, if you think they're so rubbish, you try solving a serial murder case!"
        -> _paperboy

* [Tell the boy to keep his voice down]
The boy snarls, "I'm just doing my job, leave me be!"
-> _paperboy

+ [Take your leave]
->town_square


= _fountain

You look at the fountain. It's a pretty standard fountain, with a statue of {met_scarlet: Scarlet|a pretty lady} holding a wine glass (which is where the water is coming from)

* [Scoop some coins out of the water]
~money = money+2
You scoop some coins out of the water, while several people give you dirty looks. You gain £2! Handy that they use the same currency here.
-> _fountain

+ {money > 0 && weaponEquipped != ""} [Throw a coin in]
~money--
You make a wish, and throw in £1.
-> _fountain

+ [Look at something else]
-> town_square


= dungeons_info

{questsItems == 3: -> final_battle_info}

{!"Anyway, it looks like we're ready to get going!" Parvus says excitedly.}
{!"So here's what you need to do. There are three legendary tomes that we can use to defeat Scarlet. The problem is, they're all hidden in 3 separate locations. I need you to go out there and retrieve them."}

* [How do you know that Scarlet is bad?]

Have you heard about the murders going on here?

 * * {_paperboy} [Yeah, I have.]
    "I know Scarlet is behind them. As soon as she decides she doesn't like someone, she hires people to do the deed. She is the only one powerful enough to conceal the evidence."
    ->dungeons_info
    
 * * {not _paperboy} [The what?]
 "There have been more murders around Luna than I can count, and they're becoming more and more frequent. I know Scarlet is behind them. As soon as she decides she doesn't like someone, she hires people to do the deed. She is the only one powerful enough to conceal the evidence."
    ->dungeons_info

+ (three_locations)[What are the three locations?]
    {!"Ignis Arena, Fox House and the Labyrinth of Fury. All located outside of Luna."}
    + + {not ignis_arena}[Tell me about the Ignis Arena.]
        "The Ignis Arena is where the Tome of Warfare is hidden. I would prepare for a fight if you're headed there."
        * * * [Head to the Ignis Arena]
                -> ignis_arena
        + + + [Tell me about the other places]
                ->three_locations
                
    + + {not fox_house}[What's Fox House like?]
    "Fox House is, despite the name, not a house full of cute fuzzy foxes." Parvus says, in a disapointed tone.
    "Fox House is where you'll find Lady Emeralda, who is closely guarding the Tome of Charisma. It'll take a lot of convincing for her to hand it over."
        * * * [Head to Fox House]
                -> fox_house
        + + + [Tell me about the other places]
                ->three_locations
    
    + + {not labyrinth_of_fury}[The Labyrinth of Fury, huh?]
    "The Labyrinth of Fury is, well, a huge maze. At the heart of it is the Tome of Perserverance. You'll need plenty of patience for this one."
        * * * [Head to the Labyrinth of Fury]
                -> labyrinth_of_fury
        + + + [Tell me about the other places]
                ->three_locations
                
    + + {questsItems > 0}[Go back to the town square]
        ->town_square
                
+ {questsItems > 0}[Go back to the town square]
->town_square
    
    
    
=== ignis_arena ===
"Alright, let's get going!"
And with that, you and Parvus begin your 3 days of travelling to Ignis Arena. You travel there on horseback, stopping to rest and camp every now and then.

On day 2, you're settled down by an open fire, with Cerberus snoozing in your lap. You wonder if you'll ever get to go home again.
Parvus notices you deep in thought.
"Thank you."
* [For what?]
"For helping me with all of this.
* [Wow, about time!]
"Yeah I know, I know, It's really overdue.
* [Don't worry about it.]
- <> It really means a lot to me. I was born and raised in Luna, the people are my family. I can't bear to watch any more die. But I know how big this task I ask of you is. You must be missing so much from your realm."

You and Parvus chat for a while, and then rest before continuing on your journey.
Eventually, you arrive at the huge stone walls around the entrance to Ignis Arena.

"Alright, good luck!" Parvus exclaims. "I'll be waiting out here for you."

You swallow every ounce of fear inside of you, and make your way into the arena entrance.

The entrance is packed with loud people, swigging beer and chanting. You see a desk in the back titled "SIGN UPS" where a receptionist is sat, looking bored and picking at her nails.
A large, athletic looking man in armour stumbles into the entrance from the arena, his face covered in bruises, a gash on his cheek and blood stains scattered over him. The people give him a small cheer as he enters, and an even taller man gives him a hard pat on the back, saying with a deep voice, "Better luck next time, lad." The bloodied man wheezes at the pat on the back.

You approach the desk. The receptionist doesn't seem to notice your presence.

* [Hello?]
* [Excuse me!]

- (receptionist) {!The lady looks up at you, slightly confused.}
{!"Can I help you?"}

* [Do you know where I can find the Tome of Warfare?]
    You hear someone behind you spit-take, another person chuckles.
    The lady looks at you, eyes wide, "Uh, excuse me? You want the Tome of Warfare? Oh little one... the only way you'll get your hands on that is by defeating the reigning arena champion. He hasn't been defeated in 50 years."
    * * [I'll fight him.]
        "Are you sure? You'll need a sponsor to fight."
        * * * [I'm sure, but-]
            You tell the lady you're sure you'll fight. Just as you start to tell her you don't have a sponsor yet, you feel a hand on your shoulder. 
            "I'll sponsor." You look up, and a tall, muscular lady covered in scars, with a buzzcut, silver hair and dark, smudged makeup is standing by you. She gives you a mischievous grin. 
            The receptionist sighs. "Alrighty then, your spot's at 5pm. Don't be late."
            ->talk_with_cereza
        
* [I want to fight.]
The receptionist looks you up and down. "Uh, okay, well here's the list of challengers and rewards." She hands you a crumpled up piece of paper.

You spend time going through the whole list, looking for a fight with the reward being the Tome of Warfare. At the very bottom, you find "Fighter: Marg the Destroyer, Reward: The Tome of Warfare."

You tell the receptionist you want to fight Marg the Destroyer.

The lady looks at you, eyes wide, "Uh, excuse me? Oh little one... that's the reigning arena champion. He hasn't been defeated in 50 years."
    * * [I'll fight him.]
        "Are you sure? You'll need a sponsor to fight."
        * * * [I'm sure, but-]
            You tell the lady you're sure you'll fight. Just as you start to tell her you don't have a sponsor yet, you feel a hand on your shoulder. 
            "I'll sponsor." You look up, and a tall, muscular lady covered in scars, with a buzzcut, silver hair and dark, smudged makeup is standing by you. She gives you a mischievous grin. 
            The receptionist sighs. "Alrighty then, your spot's at 5pm. Don't be late."
            ->talk_with_cereza
            
* [Is that guy okay?]
"Who? Oh," She notices the bloodied man, who is now sat down at a table, tending to his wounds. "He'll be fine, little one. He had quite the fight. Not the worst I've seen."
->receptionist

= talk_with_cereza

{!"Lets talk." The silver haired woman heads over to the table in the far corner of the room and sits down, indicating for you to follow.}

{!You sit down, a million questions running through your head. Before you can say anything, she pipes up, "I'm Cereza, nice to meet you."}
{!You introduce yourself. "I can tell you're a newbie, {players_name}. It's very rare that anyone would come in here to challenge Marg the Destroyer. It's suicide.}
* [Why did you sponsor me?]
I'm curious to see what tricks you have up your sleeve. I'm a regular in this arena. I've seen the typical type of people come and go. Bounty hunters, mercenaries, people who are simply looking for thrills. But if I'm honest, you don't seem like much of a fighter. Which means you're probably after the Tome of Warfare. Why do you need such a powerful artefact?"
    * * [Tell her you're here to retrieve it for a friend]
        "Wow. You must be quite a loyal friend. How much are they paying you?"
        * * * [Nothing, actually...]
            She looks at you, wide-eyed. "Very well then."
            ->talk_with_cereza
    * * [Lie]
        You make up some story about being a tome collector.
        "I see...", Cereza says slowly, with uncertainty. She can tell you're lying.
        ->talk_with_cereza
* [How do I beat this guy?]
"Honestly, little one." She sighs. "If I knew, I'd tell you. Trust me. Not even I have defeated Marg the Destroyer. He's ruled this arena for 50 years. But honestly, the best advice I have for you, based on your uh, weapon of choice... 
{weaponEquipped =="bow": <> try and use high ground to your advantage, and try and stay far back from him so he can't hit you."}
{weaponEquipped =="sword": <> try and strike his weak points with your sword, and dodge as best as you can."}
{weaponEquipped =="fists": <> try to strike his weak points, and dodge as best as you can. You'll have to be careful he doesn't try to counter your punches and kicks."}

->_fight

= _fight
"{players_name}! You're up!" You hear the announcer call your name.
"Looks like it's your time to shine, little one." Cereza pats you hard on the back, and the two of you head into the Arena. "GOOD LUCK!" Cereza yells as she goes to take her seat, while you nervously head into the center ring.
You hear the crowd roaring and chanting as you enter, it's almost deafening.
"EVERYBODY PLEASE WELCOME YOUR NEW CHALLENGER! {players_name}! FROM! LUNAAAA!" #uppercase 
The announcer yells, and the crowd roars even louder.

You take some time to look around the huge arena. There are two gates, the one you came from and the one on the opposite side. On the west and east sides of the ring are high platforms. There is also a mud pit in the centre. You decide you should find a good position, before Marg appears.

* (west_platform)[Climb up on to the west platform]
You decide to it would be advantageous to use the high ground, so you climb the west platform.

* (east_platform)[Climb up on to the east platform]
You decide to it would be advantageous to use the high ground, so you climb the east platform.

* (mud_pit)[Stand by the mud pit]
You decide to stand by the mud pit.

* (hide)[Hide by Marg's door]
You hide by Marg's door, hoping to catch him by surprise.

- "FIGHTING {players_name} TODAY, WE HAVE MARG THE DESTROYERRRR!" #uppercase
The announcer calls out, and everyone gasps. You start to hear people muttering and whispering to eachother.
The opposite gate clunks open, and from the shadows you see a huge, monsterous troll appear, his stomping footsteps shaking the arena slightly. He roars, and the crowd starts to chant his name. 
{weaponEquipped == "bow": ->bow_fight} {weaponEquipped == "sword": ->sword_fight} {weaponEquipped == "fists": ->fist_fight}

= bow_fight
The announcer calls out, "READY... FIGHT!"
{hide: Marg looks confused, unable to see you in the arena. You take this as an opportunity and pre-emptively shoot an arrow at him.}

{west_platform || east_platform: You watch as Marg approaches your platform, and tries to climb up.}

{mud_pit: You watch as Marg trudges through the mud pit towards you until you are face to face.}

+ {hide} [Shoot again]
You hear as Marg roars louder than ever, absolutely fuming with anger as he pulls the arrow out of his arm. You quickly take out another arrow and pull back the string on your bow, shooting him again in the back before he turns around.
~fightSuccess++

+ {hide} [Attempt to grapple him]
You try to grapple him, but it's harder than you thought with a bow in hand. Irritated, Marg grabs your arms and throws you overhead on to the ground. You feel the pain spread through your whole body as you lie on the ground. You get up as quickly as you can.

+ {west_platform || east_platform} [Shoot an arrow at one of his hands]
As he starts to climb the ladder up, you try to aim an arrow at his right hand. It hits, and he wails in pain, removing his hand from the ladder and is forced to jump down.
~highGround = true
~fightSuccess++

+ {west_platform || east_platform} [Wait until he reaches the top, and then shoot an arrow in his face]
As soon as Marg stands up on to the platform, you shoot an arrow at him- but he catches the arrow perfectly, throwing it onto the ground beneath you. You feel frozen with fear, and before you can process what is happening, Marg slams his fist into your face, sending you flying off the platform and crashing into the ground. You feel the pain spread through your whole body as you lie there, and get up as quickly as you can.
Marg jumps back down from the ladder and looms over you.

+ {mud_pit} [Shoot an arrow at his foot]
You shoot an arrow at his foot and he starts hopping on the other foot, clutching his now wounded foot in pain. He staggers backwards before losing his balance and falling back into the mud pit. After a few seconds you watch him emerge from the pool of mud, wipe his face and let out a roar. You can tell he is seething with anger.
~fightSuccess++

+ {mud_pit} [Shoot an arrow at his face]
You shoot an arrow at his face- but he catches the arrow perfectly, throwing it into the mud pit. He gives an irritated roar, before pulling back one of his clenched fists and sending it hurtling toward your face. You don't dodge in time, and it collides with your face. You stumble backwards, and as you look up at Marg with a glare, you wipe the blood from your nose.

- He rushes at you with full speed, yelling,

    + + [Shoot an arrow directly at him]
        You try to predict his movements and land an arrow on him, but he dodges past and {highGround == true: rushes up the ladder. You find yourself face to face with him. |gets up close to you.}
        
    + + [Dodge at the last second]
        {highGround == false: As he rushes forward, closing the distance between you- you dodge his fist at the last second.}
        {highGround == true: As he rushes forward, darting up the ladder and on to the platform, he swings his fist toward you and you dodge at the very last second.}
        {fightSuccess == 1: You can tell he's starting to look tired, but he still continues to fight.}
        {fightSuccess == 0: He shakes it off, and prepares for the next attack.}
        ~fightSuccess++

    - - You try to focus, and for a minute it's almost like time stops. You look at Cereza sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. {highGround == false: You try to remember the advice she gave you... and climb back on to the nearest high platform to give yourself a clearer shot.}
    
        The fight continues.
        
        + + + [Aim for his face]
                You shoot an arrow at him in desparation, but it misses.
                
        + + + [Aim for his feet]
                You try to hit one of his feet, but you miss and send an arrow into the ground.
                
        + + + [Aim under the chin]
                Noticing a wound under his chin, you send an arrow flying toward it. It hits - he roars in pain, clutching his chin in agony.
                ~fightSuccess++
        
        - - - You wheeze, breathing heavily as you try to regain some stamina. You feel like you're going to pass out - your sight is blurry, you're aching all over and for a moment darkness clouds your vision.
        + + + [Resist, go for the final blow]
                You can't give up. You won't give up. You leap from the platform, bow in hand, yelling - 
                {fightSuccess >= 2: You pull back the bowstring and send a mid air shot hurtling toward the same wound under his chin. It hits, and he roars again, weakly throwing a punch in return, but collapses on to the ground. You watch for a moment as he tries to get up one final time. He coughs and splutters for a few minutes before falling unconscious. ->fight_won}
                {fightSuccess < 2: <> but before you can even shoot, your body gives out and you crash to the ground. You look up at Marg once more as he chuckles, before everything fades to black. ->fight_lost}
        
        + + + [Surrender]
                You decide to give up on the fight, and raise both arms above your head. 
                ->fight_lost


= sword_fight
The announcer calls out, "READY... FIGHT!"
{hide: Marg looks confused, unable to see you in the arena. You take this as an opportunity and pre-emptively strike him with your sword.}

{west_platform || east_platform: You watch as Marg approaches your platform, and tries to climb up.}

{mud_pit: You watch as Marg trudges through the mud pit towards you until you are face to face.}

+ {hide} [Go for a second strike]
You hear as Marg roars louder than ever, absolutely fuming with anger. You quickly swing your sword and strike him again, before he turns to face you.
~fightSuccess++

+ {hide} [Attempt to grapple him]
You try to grapple him, but it's harder than you thought with sword in hand. Irritated, Marg grabs your arms and throws you overhead on to the ground. You feel the pain spread through your whole body as you lie on the ground. You get up as quickly as you can.

+ {west_platform || east_platform} [Swipe his hands with your sword]
As he starts to climb the ladder up, you try to swipe at his hands with your sword. You slash one of his hands and Marg roars in pain as he removes his wounded hand from the ladder, causing him to lose balance and crash into the ground. You jump down from the platform and stand tall over him, until he gets back on his feet.
~fightSuccess++
+ {west_platform || east_platform} [Wait until he reaches the top, and then strike him]
As soon as Marg stands up on to the platform, you swing your sword at him- but he catches the blade perfectly, pulling it from your hands and throwing it onto the ground beneath you. You feel frozen with fear, and before you can process what is happening, Marg slams his fist into your face, sending you flying off the platform and crashing into the ground. You feel the pain spread through your whole body as you lie there, and get up as quickly as you can.
Marg jumps back down from the ladder and looms over you.
~weaponEquipped=""

+ {mud_pit} [Swing your sword up toward his face]
You swing your sword at his face and he dodges, causing him to stagger backwards before losing his balance and falling back into the mud pit. After a few seconds you watch him emerge from the pool of mud, wipe his face and let out a roar. You can tell he is seething with anger.
~fightSuccess++

+ {mud_pit} [Swing your sword at his feet]
You swing your sword at Marg's feet and he easily jumps to dodge it. He gives an irritated roar, before pulling back one of his clenched fists and sending it hurtling toward your face. You don't dodge in time, and it collides with your face. You stumble backwards, and as you look up at Marg with a glare, you wipe the blood from your nose.

- {weaponEquipped=="":You run and scramble to retrieve the Dawnbreaker from the dirt.} 
~weaponEquipped="sword" 
<> He rushes at you with full speed, yelling,

    + + [Stand strong and block his attack]
        You hold the flat edge of your sword in front of your face, preparing to block his attack, but he quickly notices and guts you in the stomach instead. Doubled over in pain, you wince as you try to stay on your feet.
        
    + + [Prepare to counter his attack]
        As he rushes forward, you diagonally slash downward and leave a gash on his arm. He roars with pain.
        {fightSuccess == 1: You can tell he's starting to look hurt, but he still continues to fight.}
        {fightSuccess == 0: He shakes it off, and prepares for the next attack.}
        ~fightSuccess++
        
    + + [Strike forward]
        You try your hardest to strike your sword forward into his stomach, but he just narrowly dodges. You don't quite make it on time and he lands a nasty blow to your face, giving you a black eye.

    - - You try to focus, and for a minute it's almost like time stops. You look at Cereza sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. You try to remember the advice she gave you... as you look back at Marg you notice a nasty wound on the underside of his chin.
    
        The fight continues.
        
        + + + [Slash towards his face]
                You swing your sword at him in desparation, but it misses.
                
        + + + [Stab him in the foot]
                You try to stab one of his feet, but you miss and plunge the Dawnbreaker into the ground.
                
        + + + [Slash him under the chin]
                Noticing his weak point, you swing your sword upwards and slash the wound under his chin. He roars in pain, clutching his chin in agony.
                ~fightSuccess++
        
        - - - You wheeze, breathing heavily as you try to regain some stamina. You feel like you're going to pass out - your sight is blurry, you're aching all over and for a moment darkness clouds your vision.
        + + + [Resist, go for the final blow]
                You can't give up. You won't give up. You rush toward him, sword in hand, yelling - 
                {fightSuccess >= 2: You land a slash on the same wound under his chin. He roars again, weakly throwing a punch in return, but collapses on to the ground. You watch for a moment as he tries to get up one final time. He coughs and splutters for a few minutes before falling unconscious. ->fight_won}
                {fightSuccess < 2: <> but before you can land a hit, your body gives out and you crash to the ground. You look up at Marg once more as he chuckles, before everything fades to black. ->fight_lost}
        
        + + + [Surrender]
                You decide to give up on the fight, and raise both arms above your head. 
                ->fight_lost

= fist_fight
The announcer calls out, "READY... FIGHT!"
{hide: Marg looks confused, unable to see you in the arena. You take this as an opportunity and pre-emptively dive on top of him. He's so heavy, you don't quite manage to knock him over but you now have him grappled.}

{west_platform || east_platform: You watch as Marg approaches your platform, and tries to climb up.}

{mud_pit: You watch as Marg trudges through the mud pit towards you until you are face to face.}

+ {hide} [Cover his eyes]
You hear as Marg roars louder than ever, absolutely fuming with anger and scrambling to try and pull you off of him. He trips over and stumbles on to the ground, before shaking you off. Marg stands up to face you.
~fightSuccess++

+ {hide} [Hit the top of his head]
As you try and bash Marg on the top of his skull, he is seemingly unfazed. You actually feel like you hurt your fist more than you hurt him. Irritated, Marg grabs your arms and throws you overhead on to the ground. You feel the pain spread through your whole body as you lie on the ground. You get up as quickly as you can.

+ {west_platform || east_platform} [Try and push him off the ladder]
As he starts to climb the ladder up, you lean down and try to push him off. He grabs one of your arms with one hand and yanks you off the platform, sending you hurtling on to the ground. You feel the pain spread through your whole body as you lie there, and get up as quickly as you can.
Marg jumps back down from the ladder and looms over you.

+ {west_platform || east_platform} [Wait until he reaches the top, and then kick him to try and make him fall off]
As soon as Marg stands up on to the platform, you strongly kick him square in the stomach, causing him to stumble backwards and fall off the platform. You hear him wail as he falls and crashes to the ground. You jump down from the platform and stand tall over him, until he gets back on his feet.
~fightSuccess++

+ {mud_pit} [Uppercut punch him in the jaw]
You punch him hard underneath his jaw, causing him to stagger backwards before losing his balance and falling back into the mud pit. After a few seconds you watch him emerge from the pool of mud, wipe his face and let out a roar. You can tell he is seething with anger.
~fightSuccess++

+ {mud_pit} [Roundhouse kick him in the stomach]
With a leap you drive all of your strength into a sharp kick to Marg's stomach. Marg barely flinches, and as you move your leg back you feel a pain as though you've stubbed a toe. Marg rubs his stomach and gives an irritated roar, before pulling back one of his clenched fists and sending it hurtling toward your face. You don't dodge in time, and it collides with your face. You stumble backwards, and as you look up at Marg with a glare, you wipe the blood from your nose.

- He rushes at you with full speed, yelling,

    + + [Stand strong and block his attack]
        You cross your arms in front of your face, preparing to block his attack, but he quickly notices and guts you in the stomach instead. Doubled over in pain, you wince as you try to stay on your feet.
        
    + + [Prepare to counter his attack]
        As he rushes forward, you grab his fist and pull it forward, kneeing him in the stomach before sending him hurtling toward the ground.
        {fightSuccess == 1: You can tell he's starting to look hurt, but he just barely stands back up.}
        {fightSuccess == 0: He gets back on his feet again.}
        ~fightSuccess++
        
    + + [Try to trip him up]
        You try your hardest to stick your leg out at the last second and trip him up, but it fails. You don't quite make it on time and he lands a nasty blow to your face, giving you a black eye.

    - - You try to focus, and for a minute it's almost like time stops. You look at Cereza sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. You try to remember the advice she gave you... as you look back at Marg you notice a nasty wound on the underside of his chin.
    
        The fight continues.
        
        + + + [Punch him in the face]
                You swing your fist at him in desparation, but it misses.
                
        + + + [Kick him in the shin]
                You try to kick him hard in the shin, but you miss and almost lose your balance.
                
        + + + [Elbow him under the chin]
                Noticing his weak point, you drive your elbow up and whack the wound under his chin as hard as you can. He roars in pain, clutching his chin in agony.
                ~fightSuccess++
        
        - - - You wheeze, breathing heavily as you try to regain some stamina. You feel like you're going to pass out - your sight is blurry, you're aching all over and for a moment darkness clouds your vision.
        + + + [Resist, go for the final blow]
                You can't give up. You won't give up. You rush toward him, yelling - 
                {fightSuccess >= 2: Your fist hurtles toward him at you land a blow on the wound under his chin. He roars again, weakly throwing a punch in return, but you counter it and pull him onto the ground. You watch for a moment as he tries to get up one final time. He coughs and splutters for a few minutes before falling unconscious. ->fight_won}
                {fightSuccess < 2: <> but before you can land a hit, your body gives out and you crash to the ground. You look up at Marg once more as he chuckles, before everything fades to black. ->fight_lost}
        
        + + + [Surrender]
                You decide to give up on the fight, and raise both arms above your head. 
                ->fight_lost
        
= fight_won
Out of breath, you look around at the crowd as they cheer, chanting your name.
"{players_name}! {players_name}! {players_name}! {players_name}!" #uppercase
You have won the fight.

Leaning on Cereza for support, you limp back into the arena entrance. As you enter, the people raise their drinks and cheer once again. 

"That was incredible, {players_name}." Cereza looks at you, excitedly. "I've never seen anything quite like it. You have to stay, continue fighting here at the arena. I'll be your coach!"

* [I'm sorry, I have a mission to complete...]
    Cereza sighs, but gives you a look of understanding. "I had a feeling you'd say that. I understand. I'm proud of you, little one. Keep in touch, yeah?"
* [You're kidding, right? That was too easy.]
Cereza chuckes. "Hah, the confidence of a champion. I understand you have things to do. Good luck out there little one. Don't be a stranger, okay?"

- "Impressive display." You hear a deep voice interrupt. You realise you're suddenly stood in a large shadow, and you turn around to see Marg, holding some ice to his chin. You gulp.
Marg chuckles. "Don't worry, the fight is over. Congratulations, nobody has beaten me in a long, long time. Here - I believe this is yours." He hands you a large book with a red velvet hardback cover. You look at the title etched on to it: "The Tome of Warfare."

~questsItems++
You say your goodbyes to Cereza and the rest of the arena folk, and make your way out to find Parvus again.

Tome in hand, you journey back to Luna.

->town_square
 
= fight_lost

{players_name} failed to obtain the Tome of Warfare. In their defeat, they were so embarrassed that they ran away, never to be seen again.

+ [Try again]
~fightSuccess = 0
{weaponEquipped == "bow": ->bow_fight} {weaponEquipped == "sword": ->sword_fight} {weaponEquipped == "fists": ->fist_fight}

=== fox_house ===
This is where Fox House would be, but I haven't written it yet. Sorry! Here's the quest item anyway.

* [Pretend you did the quest and go back]
~questsItems++
->town_square

=== labyrinth_of_fury ===
~questsItems++
This is where the Labyrinth of Fury would be, but I haven't written it yet. Sorry! Here's the quest item anyway.

* [Pretend you did the quest and go back]
->town_square

//TEMPORARY
=== met_scarlet ===

->END

=== final_battle_info ===

Are you ready for the final battle?

+ [Yes]
-> final_battle

+ [No]
Come back when you're ready.
-> town_square