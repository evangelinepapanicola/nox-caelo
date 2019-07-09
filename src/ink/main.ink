//main story goes here

=== welcome_to_luna ===

You're falling for what feels like ages, almost like you're skydiving at midnight, in space, with the stars falling all around you. You can hear Cerberus howling above you, until you eventually catch him and hold him in your arms tightly.

CRASH!
~location = "town"
The three of you land in a heap on a pavement, Verso breaking your fall and Cerberus on top of you still in your arms. It's daylight. You look around and you're in a place you don't recognise... a city that looks almost like it's from medieval times. People are walking the streets, seemingly going about their daily lives just fine.

-> whats_goin_on

= whats_goin_on

+ (where_are_we)[Where are we?]

{got_up: "Welcome, my dear, to the kingdom of Luna!" Verso says, with his arms outstretched. ->explore_luna|You hear some wheezing sounds coming from Verso. Maybe you should stop crushing him before you ask questions.->whats_goin_on}

* (got_up)[Stop crushing Verso]
You stand up so Verso can breathe, and put Cerberus back on the ground.
->whats_goin_on

* -> explore_luna

= explore_luna

* [So where's this "imminent danger" you were talking about?]
    You mention that everyone here seems to be fine.
    "So perhaps it wasn't quite as... dire of a situation as I said, but you definitely wouldn't have come with me if I hadn't been so persuasive, no?" -> explore_luna
    
* [How on earth did we get here?]
    "That, my friend, is a story for another time... and by that, I mean I am bound by an oath that means I cannot tell you." -> explore_luna
    
* [What now?]
    "We begin 'Verso's master plan to save the people of Luna', which begins with you getting ready to go dungeoneering. I'll explain more later. For now, I suggest you go explore the town, get yourself a weapon and some... suitable armour..." he says, looking at your dog walking clothes with a face that says "trying not too look disgusted".
    "Meet me back here by the town gates when you're ready to go!"
    
    You stand there, still gobsmacked and coming to terms with what on earth just happened. You're not entirely sure what the right thing is to do in this situation, but your phone has no signal or battery, and you have no idea how you'd even attempt to get back home. You aren't sure what this Verso guy's intentions are, but perhaps It's worth hearing him out.
    
    You go for a walk to clear your head. 
    -> town_square
    
=== town_square === 
~location = "town"

{questsItems == 2 && not royal_palace && scarletletter == false: 
As you re-enter Luna, a small man carrying a large sack runs up to you, who you can only assume is the postman.
"{players_name}! {players_name}! I have post for you!" He hands you a letter and immediately takes off in another direction.
Wary, you look down at the letter in your hands. It's in a fancy looking envelope with a wax seal. You open it.
"Dear {players_name}, #italic 
Word has come to me that you are a new citizen here in Luna. I would love to meet you. #italic
Therefore I would like to invite you to the royal palace for a chat over some tea. #italic
Yours sincerely, #italic
Scarlet." #italic
You pocket the letter for later.
~scarletletter = true
}
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

* {scarletletter == true && not royal_palace} [Head to the Royal Palace]
-> royal_palace

= town_gates
~location = "town"
You head back to the town gates, where Verso is waiting for you.

{visibleWeapon == true: "Aha! I see you got yourself a weapon. Well done. You still need some armour, though." ->town_gates_options|"Haven't you got yourself a weapon and some armour yet? Come on! Luna won't save itself."}

<> {weaponEquipped == "fists": ->town_gates_options}

+ {weaponEquipped == ""} [Head back]
    ->town_square
    
= town_gates_options
~location = "town"
* [I couldn't find any armour.]
"Oh," Verso sighs. "Luna is SO useless in the fashion department! Luckily I found this for you as backup." He hands you some folded up clothes. "There's some stalls just around the corner you can use to change."
    * * [Change clothes]
        You go and find the stalls Verso was talking about and change into the "armour" he gave you. Weirdly, it's a perfect fit. You look like a brave warrior, a knight, or perhaps like you got lost on the way to Comic-Con.
        
        "There you go! You look perfect."
        ->town_gates_options
    
* {visibleWeapon == true} [Isn't owning this weapon sort of... illegal?]
"Well, uhh...", Verso stumbles over his words. "Sort of. Regular townsfolk aren't really allowed weapons. But you're no ordinary townsfolk, and besides, this is for justice! Plus, you're sort of forgetting that this whole mission is against the law, really. Taking down Scarlet is uh, kinda treason. She is the queen after all."
-> town_gates_options

* {visibleWeapon == false} [I've decided I don't need a weapon.]
"What on earth are you talking about? How on earth are you going to fight the enemies ahead of us?"
    * * [*flexes* With these guns!]
    * * [I can still fight with kicks and punches?]
    - - "Alrighty then. I'll allow it."
    ->town_gates_options

* ->dungeons_info

= crescent_street
~location = "town"
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

{questsItems == 0 && coolSunglasses == false: 
The old man is still stood alone in the alleyway.
"You still here kiddo? Haven't ya got something better to do?"
You nod, and head back to the town square.
->town_square
}

{questsItems == 0 && coolSunglasses == true: 
The old man is still stood alone in the alleyway.
"Those are some neat lookin sunglasses you gotta there kiddo! Did ya come all the way back here just to show me? Haven't ya got something better to do?"
You nod, and head back to the town square.
->town_square
}

{questsItems == 1: 
The old man sees you enter and smiles.
"{players_name}! Long time no see! How've you been?"
+ [Great, I've been travelling!]
"Well well, you have been busy. Make sure you keep your weapon safe."
You nod, and head back to the town square.
->town_square
+ [Exhausted, I've been travelling]
"Well well, you have been busy. Make sure you keep your weapon safe."
You nod, and head back to the town square.
->town_square
}

{questsItems == 2: 
The old man sees you enter and smiles.
"{players_name}! It's good to see you again. How are you doing?"
+ [Great, I've been travelling again.]
"Again? You're quite the adventurer huh? Well knock yourself out, as long as you keep your weapon safe. Don't let it fall into the wrong hands, okay?"
You nod, and head back to the town square.
->town_square
+ [Sooooo tired, way too much travelling]
"Again? You're quite the adventurer huh? Well knock yourself out, as long as you keep your weapon safe. Don't let it fall into the wrong hands, okay?"
You nod, and head back to the town square.
->town_square
}

{questsItems == 3: 
The old man sees you enter and smiles.
"{players_name}! Great to see you! How are you doing?"
+ [Great, I've done my last lot of travelling!]
"Wow! You must be sad It's over now. Well, good luck with whatever you do next!"
You nod, and head back to the town square.
->town_square
+ [Sooooo exhausted, glad my travelling is finally over.]
"Wow! No more travelling eh? Well, good luck with whatever you do next!"
You nod, and head back to the town square.
->town_square
}

= _paperboy_sunglasses

"Wow!" the boy gasps. "Those sunglasses are sooooo cooooool!"
    "Can I have them? Can I? Pleaaaase?" he begs.
    + [Sure]
    You hand the boy your sunglasses.
    "Oh my gosh, you're the best!"
    ~coolSunglasses = false
    ~boySunglasses = true
    + (refused)[No way]
    "Awwww...", he says, disapointed.

- ->->

= _paperboy

{coolSunglasses == true && visited_paperboy && not refused: -> _paperboy_sunglasses ->}

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

+ (visited_paperboy) [Take your leave]
->town_square


= _fountain

You look at the fountain. It's a pretty standard fountain, with a statue of {royal_palace.inside_the_palace: Scarlet|a pretty lady} holding a wine glass (which is where the water is coming from)

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
~location = "town"
{questsItems == 3: -> final_battle_info}

{!"Anyway, it looks like we're ready to get going!" Verso says excitedly.}
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
    "Fox House is, despite the name, not a house full of cute fuzzy foxes." Verso says, in a disapointed tone.
    "Fox House is where you'll find Lady Emeralda, who is closely guarding the Tome of Charisma. It'll take a lot of convincing for her to hand it over."
        * * * [Head to Fox House]
                -> fox_house
        + + + [Tell me about the other places]
                ->three_locations
    
    + + {not labyrinth_of_fury}[The Labyrinth of Fury, huh?]
    "The Labyrinth of Fury is, well, a huge maze. At the heart of it is the Tome of Perseverance. You'll need plenty of patience for this one."
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
~location = "journey"
And with that, you and Verso begin your 3 days of travelling to Ignis Arena. You travel there on horseback, stopping to rest and camp every now and then.

On day 2, you're settled down by an open fire, with Cerberus snoozing in your lap. You wonder if you'll ever get to go home again.
Verso notices you deep in thought.
"Thank you."
* [For what?]
"For helping me with all of this.
* [Wow, about time!]
"Yeah I know, I know, It's really overdue.
* [Don't worry about it.]
- <> It really means a lot to me. I was born and raised in Luna, the people are my family. I can't bear to watch any more die. But I know how big this task I ask of you is. You must be missing so much from your realm."

You and Verso chat for a while, and then rest before continuing on your journey.
Eventually, you arrive at the huge stone walls around the entrance to Ignis Arena.

"Alright, good luck!" Verso exclaims. "I'll be waiting out here for you."

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
            ->talk_with_sengva
        
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
            ->talk_with_sengva
            
* [Is that guy okay?]
"Who? Oh," She notices the bloodied man, who is now sat down at a table, tending to his wounds. "He'll be fine, little one. He had quite the fight. Not the worst I've seen."
->receptionist

= talk_with_sengva

{!"Lets talk." The silver haired woman heads over to the table in the far corner of the room and sits down, indicating for you to follow.}

{!You sit down, a million questions running through your head. Before you can say anything, she pipes up, "I'm Sengva, nice to meet you."}
{!You introduce yourself. "I can tell you're a newbie, {players_name}. It's very rare that anyone would come in here to challenge Marg the Destroyer. It's suicide.}
* [Why did you sponsor me?]
I'm curious to see what tricks you have up your sleeve. I'm a regular in this arena. I've seen the typical type of people come and go. Bounty hunters, mercenaries, people who are simply looking for thrills. But if I'm honest, you don't seem like much of a fighter. Which means you're probably after the Tome of Warfare. Why do you need such a powerful artefact?"
    * * [Tell her you're here to retrieve it for a friend]
        "Wow. You must be quite a loyal friend. How much are they paying you?"
        * * * [Nothing, actually...]
            She looks at you, wide-eyed. "Very well then."
            ->talk_with_sengva
    * * [Lie]
        You make up some story about being a tome collector.
        "I see...", Sengva says slowly, with uncertainty. She can tell you're lying.
        ->talk_with_sengva
* [How do I beat this guy?]
"Honestly, little one." She sighs. "If I knew, I'd tell you. Trust me. Not even I have defeated Marg the Destroyer. He's ruled this arena for 50 years. But honestly, the best advice I have for you, based on your uh, weapon of choice... 
{weaponEquipped =="bow": <> try and use high ground to your advantage, and try and stay far back from him so he can't hit you."}
{weaponEquipped =="sword": <> try and strike his weak points with your sword, and dodge as best as you can."}
{weaponEquipped =="fists": <> try to strike his weak points, and dodge as best as you can. You'll have to be careful he doesn't try to counter your punches and kicks."}

->_fight

= _fight
"{players_name}! You're up!" You hear the announcer call your name.
"Looks like it's your time to shine, little one." Sengva pats you hard on the back, and the two of you head into the Arena. "GOOD LUCK!" Sengva yells as she goes to take her seat, while you nervously head into the center ring. Sengva looks after Cerberus for you in the meantime, sitting comfortably in her lap amongst the crowd.
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

    - - You try to focus, and for a minute it's almost like time stops. You look at Sengva with Cerberus sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. {highGround == false: You try to remember the advice she gave you... and climb back on to the nearest high platform to give yourself a clearer shot.}
    
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

    - - You try to focus, and for a minute it's almost like time stops. You look at Sengva and Cerberus sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. You try to remember the advice she gave you... as you look back at Marg you notice a nasty wound on the underside of his chin.
    
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

    - - You try to focus, and for a minute it's almost like time stops. You look at Sengva and Cerberus sitting on the other side of the arena chanting with the rest of the crowd, and she gives you a wink. You try to remember the advice she gave you... as you look back at Marg you notice a nasty wound on the underside of his chin.
    
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
Cerberus runs out from the crowd, barking and sprinting before diving on top of you in excitement.
You have won the fight.

Leaning on Sengva for support, you limp back into the arena entrance. As you enter, the people raise their drinks and cheer once again. 

"That was incredible, {players_name}." Sengva looks at you, excitedly. "I've never seen anything quite like it. You have to stay, continue fighting here at the arena. I'll be your coach!"

* [I'm sorry, I have a mission to complete...]
    Sengva sighs, but gives you a look of understanding. "I had a feeling you'd say that. I understand. I'm proud of you, little one. Keep in touch, yeah?" Sengva pets Cerberus on the head firmly. "You too, fluffy one."
* [You're kidding, right? That was too easy.]
Sengva chuckes. "Hah, the confidence of a champion. I understand you have things to do. Good luck out there little one. Don't be a stranger, okay?" Sengva pets Cerberus on the head firmly. "You too, fluffy one."

- "Impressive display." You hear a deep voice interrupt. You realise you're suddenly stood in a large shadow, and you turn around to see Marg, holding some ice to his chin. You gulp.
Marg chuckles. "Don't worry, the fight is over. Congratulations, nobody has beaten me in a long, long time. Here - I believe this is yours." He hands you a large book with a red velvet hardback cover. You look at the title etched on to it: "The Tome of Warfare."

~questsItems++
~warfare = true
You say your goodbyes to Sengva and the rest of the arena folk, and make your way out to find Verso again.

Tome in hand, you journey back to Luna.

->town_square
 
= fight_lost

{players_name} failed to obtain the Tome of Warfare. In their defeat, they were so embarrassed that they ran away, never to be seen again.

+ [Try again]
~fightSuccess = 0
{weaponEquipped == "bow": ->bow_fight} {weaponEquipped == "sword": ->sword_fight} {weaponEquipped == "fists": ->fist_fight}

=== fox_house ===
"Off we go then!" Verso exclaims.
~location = "journey"
After some preparation, the two of you set out on your journey to Fox House.
-> who_is_she

= who_is_she
During your journey, you try to find out more about Lady Emeralda.

* [What's Lady Emeralda like?]
"Lady Emeralda is a very powerful woman. She's well known for her efforts in ending wars peacefully. She is a strong advocate for peace, but she is also extremely capable of defending her allies in times of war."
->who_is_she

* [What is her favourite food?]
    "That's a weird question, I honestly have no idea. My guess would be apples. I seem to recall her having several apple trees planted all around Fox House."
    -> who_is_she
    
* [How do I convince her to give me the Tome of Charisma?]
"Honestly, it's going to be tough. Her main job is to guard it after all. Just try to be diplomatic about it. "
-> who_is_she

* -> fox_house_arrival

= fox_house_arrival
As you're talking, you arrive at some huge, towering iron gates, where two guards are stood with one guard dog. Cerberus barks at the sight of the dog.
"HALT!" One of the guards yells. "What is your business here?"
"We've travelled from Luna to speak with Lady Emeralda, please" Verso exclaims.
"Is she expecting you?"
"No, well - we weren't sure how long travel would take, and we did not want to waste Lady Emeralda's time," Verso explains. "We just request half an hour of her time, please, it is of high importance."
"If it is so important, might I ask why you wish to speak with milady?" The guard looks at you both, curiously. Verso turns to you.

* [Luna is in grave danger. Scarlet has turned against her people.]
The guards look at eachother, and give eachother a nod. "Alright, if it is aid you seek, and your people are in danger - we shall allow you to speak with milady."
"Thank you!" You both say with gratitude.
->inside_fox_house

* [We need the Tome of Charisma.]
The guard chuckles. "You need it do you? I hope you realise we don't just give away the tome willy nilly. Many people come daily asking for the tome purely for their own greedy, selfish reasons. I suggest you leave."
"Wait!" Verso says. "Please, this isn't a greedy request. Luna is in grave danger. Only the Tome's power can save it."
The guards glance at eachother.
"Alright. We'll let you through. But if this is all some farce, you'll be in deep trouble, I hope you know that."
"We understand." Verso says.
->inside_fox_house

= inside_fox_house
As you enter the posh looking mansion that is Fox House, a lady dressed in a smart suit greets you both and leads you into a waiting area.
While you sit in the fancy, plush seats of the waiting area there is an awkward silence. You can read the nervousness on Verso's face.
After 5 minutes or so pass, Verso stands up, "I'm gonna go use the bathroom, I'll be back in a few moments..." he says quietly. The well dressed lady escorts him away.
As you sit there alone, nervously, the door to Lady Emeralda's meeting room creaks open and a tall gentleman with a curly moustache leaves, chuckling to himself. You then see a woman poke her head around the door, with curly red hair and a green dress with a pattern of little foxes printed on - Lady Emeralda.
"I believe you are next inline to see me?" She asks.

* [That's right!]
"Come on in, then", she says, with a smile on her face. You walk up and shake her hand, introducing yourself.
"Nice to meet you, {players_name}! Have a seat."
->the_negotiation
* [Yes, my friend is supposed to be joining us, but he is using the facilities.]
"Oh", Emeralda says, with a serious look on her face. "Well, since you are the only ones here at present, I can wait 5 minutes."
A minute passes.
Two minutes pass. Still no sign of Verso.
Three minutes...
Four minutes...
5 minutes pass, and Verso is still nowhere to be seen. Lady Emeralda starts to look impatient.
* * [I'm sorry, let's start without him.]
    "Okay, come on in then.", she says. You walk up and shake her hand, introducing yourself.
    "Nice to meet you, {players_name}. Have a seat."
    ->the_negotiation
* * [I don't know why he's taking so long... can we wait a bit longer?]
    Lady Emeralda crosses her arms. "This is a waste of my time. You can come and speak to me now if you'd like, but I am not waiting any longer."
    You nod, and you both enter the meeting room. You introduce yourself.
    ->the_negotiation

=the_negotiation
You take your seat opposite Emeralda and try to calm your nerves.
"Before we start, {players_name}, tell me about yourself. Forgive me if I sound rude, but you don't seem like you're... from these parts."

+ [Tell the truth]
~emeralda +=1
You're completely honest with Emeralda. You tell her about how Verso found you in the forest, and then you ended up in Luna.
"From a different realm you say? How unusual. If it were anyone else I wouldn't believe you. But I can tell you're being honest."
You breathe a sigh of relief.

+ [Lie]
~emeralda -=1
You tell her you've lived in Luna for a few years, but you moved there from another continent. You try to explain how the traditions of where you grew up are very different.
She nods, but also squints slightly and you aren't sure if she entirely believes you. "Riight. I see."

- "So, {players_name}. What brings you here today?"

+ [We need the Tome of Charisma.]
~emeralda -= 1
Emeralda gives you a look that makes you feel like she's trying really hard not to roll her eyes.
"Do you know how often people come into my home and ask for this? A lot!"

+ [I want to discuss the current state of Luna.]
~emeralda += 1
Emeralda looks at you inquisitvely. "Really, go on."

+ [Scarlet is evil.]
~emeralda -= 1
Emeralda chuckles. "Well well, you do realise you are speaking about a dear friend of mine?"

- You explain to Emeralda what Verso had told you, about the murders in Luna and how you think Scarlet is to blame.
"But where is your proof? This all sounds like a conspiracy to me."
Before you can respond, you both hear a knock on the door.
"Hello? Who's there?" Emeralda pipes up.
You hear Verso's voice behind the door quietly say "Um, it's Verso. I'm sorry I'm late! But I have tea for everyone."
You explain to Emeralda that Verso is who you were waiting for.
"Come in!" Emeralda says, and Verso enters the room timidly, holding a tray with teacups and saucers.
Verso puts the tray down on the table and sits down in the seat next to you. "Your lovely assisstant was feeling unwell, so I offered to bring the tea through instead."
"How kind of you" Emeralda says before taking a long sip of tea.
"Now, back to the discussion. What proof do you have that Scarlet is committing these crimes against her own people?"
You look at Verso desparately, but he doesn't seem to be answering.
+ [She is the only one capable of covering it up]
    ~emeralda -= 1
    "How do you know that for sure? You mean to tell me that nobody in Luna, absolutely nobody, is capable of committing a murder with little to no evidence besides Scarlet? That's a strong claim to make."
+ {apple == true}[Here's my proof! (Give her your apple)]
    ~emeralda += 1
     "An... apple? How is this proof exactly?"
     You explain it's actually not proof, you just thought she might like an apple.
     "I must admit, apples are my favourite."   
+ [She's, uh... mean]
    ~emeralda -= 1
    Emeralda almost spittakes. "Well. Wow."
+ [We don't have any]
    ~emeralda += 1
    "I appreciate your honesty. But I can't -"
- Before Emeralda can speak further, you see her pause for a moment as her expression changes completely. You see her go from a serious frown to a soft, neutral, almost emotionless face. It's unusual and unsettling.
"Perhaps I am being too strict. The Tome of Charisma is such a dangerous weapon in the wrong hands, but... you two are lovely people."
{emeralda >= 1: Emeralda stands up and heads toward the cabinet in the back of her meeting room. She undoes the complex lock, and pulls out a green, velvet covered book. She places it on the table: The Tome of Charisma. -> negotiation_win}
{emeralda < 1: <> It then suddenly tenses up again, back to how it was before. "Wait, what on earth am I saying... my thoughts are clouded. You can't come here, accuse my friend of murder, and then blatantly lie to my face about having evidence. You should leave at once." -> negotiation_fail}


=negotiation_win
~questsItems++
~charisma = true
Verso immediately takes the tome and puts it in his satchel.
"Thank you so much, Lady Emeralda", Verso says, grinning.
You also thank Emeralda, but something feels... off. It was almost too easy to convince her.
Nevertheless, you and Verso leave Fox House, and make your way back to Luna.
->town_square

=negotiation_fail
You and Verso are promptly escorted out of the building. You try to defend yourselves, but Emeralda and the guards aren't having it.
With no Tome of Charisma, your quest comes to an end.

+ [Try again]
~emeralda = 0
->the_negotiation

=== labyrinth_of_fury ===
"Better get going, then!"
~location = "journey"
You and Verso prepare and set off on a few days of travelling. On the second day it starts to rain heavily, so you both decide to take shelter in a nearby cave.
->interrogate_verso

=interrogate_verso
{!Now would be a good time to interrogate Verso.|Now would be a good time to interrogate Verso.|Now would be a good time to interrogate Verso.}

* [What do these tomes actually do?]
Verso hears you loud and clear - but does not look you in the eye as he responds, "On their own, the tomes have little use. But with all three, the wielder of the three tomes can transform into a powerful being."
->interrogate_verso

* [Why do we need the tomes?]
"In order to get through to Scarlet... in order for her to even take notice of us, we need to have the charisma to persuade her to own up to her actions, the perseverance to push through anything she throws at us, and with the Tome of Warfare we will have the power to defend ourselves if we need to."
->interrogate_verso

* [Why did you seek my help in particular?]
"I travelled far and wide, I cried out to anyone and everyone for help and nobody believed me. Nobody was willing to help. Except you."
->interrogate_verso

* ->the_labyrinth

=the_labyrinth
Eventually the rain stops, and you're both able to continue on the rest of your journey. 
After some further travelling, you find your way through a tall rainforest and approach some huge, tall stone walls.
You notice what appears to be a green lizard man perched on a chair by the entrance to the labyrinth. 
You approach him. 
* [Who are you?]
"You may call me Rax... welcome to the labyrinthhh..." he says, in a raspy, hissing voice. "What do you sseek..."
"We're here for the Tome of Perseverance" Verso says.
"The tome...", the lizard hisses. "Many come into the labyrinth sseeking tome... many do not return..." he trails off. "You may enter, sshould you wissh to try and claimm it."
Verso looks at you with a serious expression. "I'll be waiting for you out here."
And with that, you make your way into the Labyrinth of Fury.
The maze is quiet, damp and dark. You're glad you have Cerberus for company.
->in_the_maze

=in_the_maze
~location = "labyrinth"
Ignoring dead ends, you can go left or right. Which way do you go?
+ (first_left)[Left]
You ignore the dead end to your left and walk past it. You can go left or proceed onward round the bend to the right.
+ + [Left]
You go left, walk down the corridor and continue onward walking around all the twists and turns, and you find yourself in a large, open room full of more dust and cobwebs.
-> maze_complete
+ + [Forward/right]
You go around the bend and push onwards. Unfortunately you find yourself at a dead end.
+ + + [Go back]
->first_left

+ + [Go back]
-> in_the_maze

+ (first_right)[Right]
You go right, ignoring the dead end ahead of you and turn right again. You walk through the small corridor, turn left. You ignore the two dead ends (the one in front of you and the one to your left). You go right around the bend into a long corridor, with a dead end to your left and an opening into another corridor to your right.
+ + [Keep going forwards]
You decide to press on... but you end up at a dead end.
+ + + [Go back]
-> first_right
+ + (next_corridor)[Go left into the next corridor]
You go left into another corridor. Do you go left or right?
+ + + [Go left]
You go left down the corridor, and find yourself at a dead end, full of skeletons...
+ + + + [Go back]
-> next_corridor
+ + + [Go right]
You go right down the corridor, and find yourself at a dead end, full of skeletons...
+ + + + [Go back]
-> next_corridor
+ + + [Go back]
-> first_right
+ + [Go back]
-> in_the_maze

=maze_complete
In the center of the room, you see... Rax? You call out to him.
The lizard hisses. "No... I am Trax... brave one, you have found the ccentre of the labyrinthhh...", he looks at you and holds out a blue, velvety coloured book. "You may have it... the tome of perseverance..."
~questsItems++
~perseverance = true
You approach Trax slowly, and grip the opposite end of the tome in your hands. As you hold the tome, you start feeling light, as if you're floating upwards like a balloon. You look at your arms and you can see yourself disintegrating, as if you're scattering into tiny pieces. Your vision fades to white for a minute.
~location = "journey"
As your vision comes back, you feel your body rebuild itself as you land back outside the labyrinth, holding the Tome of Perseverance.
Rax nods his head as you appear in front of him. "Sso you did it... congratulationss... you musst have met my brother, Trax... "
->talk_with_rax
= talk_with_rax
* [I sure did]
"He'ss been guarding the tome for the past 200 yearss..."
-> talk_with_rax
* [How did I get back out here?]
"Trax used his powerss to teleport you..."
* * [His... powers?]
"Yess... Trax and I have sspecial abilitiess. We have made an oath to maintain peacce in thesse landss, and in exchange the god of persseverance has granted uss these powerss..."
->talk_with_rax

* -> rax_questions

=rax_questions

"It wass good to meet you, brave one... what may I call you..."
* [{players_name}.]
"{players_name}... very well then..."
"Before you leave, {players_name}... what do you intend to do with the tome?"
* * [Answer honestly]
* * [Lie]

- - Before you can respond, Verso interrupts - "We're using it to save the people of Luna. Now, lets go, {players_name}."
Rax gives Verso a suspicious glance, and as you both turn around and walk off, you feel like Rax's eyes are pressing into your back.
You and Verso journey back to Luna, talking very little on the way back.
->town_square

=== royal_palace ===
{visibleWeapon == true: Remembering that weapons are illegal in Luna, you make sure yours is fully obscured before heading to the Palace.}
You walk up the long, winding path to the royal palace using the directions given on the letter from Scarlet.
As you approach the palace gates, two guards stop you.
->royal_guards
= royal_guards
"Halt! What is your business with the queen?"
+ [We're best buds]
You try to convince the guards that you and Scarlet are best friends. They ignore you and tell you to stop wasting your time.
->royal_guards
+ [Present letter]
You show the guards your letter from Scarlet, along with the official wax seal. They nod.
"You may proceed."
-> inside_the_palace
=inside_the_palace
As you enter the palace, you are greeted by a tall man with pointy ears in a waistcoat.
"Ah, {players_name} is it? I shall escort you to the tea room."
The palace is huge and luxurious, the floors and walls all made of marble and a beautiful smell of vanilla throughout. You're walking for what feels like forever, up long spiral staircases and through long corridors.
Eventually, you arrive at two huge doors. The man opens them and gestures for you to enter. "After you," he says.
You enter into a room with a long dining table. The only other person in the room is a lady with long, dark red hair in a black, long sleeved dress. You assume this must be Scarlet.
"Ah, {players_name}, yes, do come in.", the lady says with a soft voice. {coolSunglasses == true: "Is it too bright in here? I can turn the lights down if you want, so you can take those sunglasses off."} The man who escorted you here closes the door behind you.
"Please, take a seat."
You take a seat at the dining table.
"Luna isn't a particularly large kingdom, so I like to greet every person who moves here formally, over some tea. Now, before we chat, I must ask, what is your favourite food?"
* [Apple pie]
~favouriteFood = "applepie"
* [Cinnamon swirls]
~favouriteFood = "cinnamon"
* [Chocolate cake]
~favouriteFood = "cake"
* [Pizza]
~favouriteFood = "pizza"
- "Perfect, that can be arranged," and she snaps her fingers. Seconds later, the doors open and five people in chef's clothing enter, carrying {favouriteFood == "applepie": plates upon plates of steaming hot apple pie. The smell of freshly cooked pastry and warm apple filling wafts toward you.}{favouriteFood == "cinnamon": plates upon plates of freshly baked cinnamon swirls. The smell of baked cinnamon, sugar and sweet pastry immediately wafts toward you.}{favouriteFood == "cake": plates upon plates of fudgy chocolate cake. It's still hot, and the smell of hot chocolate pudding immediately wafts toward you.}{favouriteFood == "pizza": plates upon plates of freshly cooked pizza, with all varieties of toppings. The smell of hot pizza dough and melted cheese immediately wafts toward you.} They also bring some luxury dog treats for Cerberus, who is very appreciative.
You wonder what the extent of her powers are exactly, if she's able to instantly summon your favourite food like this.
The chefs pour you both cups of tea. "Perfect, dig in, {players_name}!" Scarlet says, and immediately starts eating.
After finishing her food, Scarlet leans forward, placing her chin in her hands and asks, "So, have you made any friends in Luna yet?"
* [Tell her about Verso]
You tell her about Verso, only giving vague details. 
"Verso..." she says, with a stern look on her face. "I knew a Verso once."
* * [Tell me more]
    Scarlet pauses for a bit before responding, as if she's debating whether or not to tell you. "The Verso I knew... I haven't seen him in years. He was one of the Royal Mercenaries."
* * * [What happened?]
        "He...", she stumbles over her words for a moment. "I had to let him go."
        "As a Royal Mercenary, you are allowed to carry a weapon - something that is illegal for regular citizens. Verso abused this power."
        "He became jealous of the other mercenaries, who were often praised for their achievements. He started killing innocent people, claiming that they were criminals. All to make himself look like a hero."
        "Eventually we found out, and he was sent to prison, of course."
        "Anyway," Scarlet sighs. "I'm sorry to drop such an old, dark story on you like that. You must think I'm an awful leader, to let something like that happen."
        * * * * [It wasn't your fault]
                Scarlet forces a smile. "Now, you probably have things to do - I'll show you out."
                ->time_to_leave
        * * * * [...]
                "So... I expect you have things to do. I'll show you out."
                ->time_to_leave
* * * [Oh... anyway]
        "Yes, I guess it's time for you to get going. I expect you have things to do, places to see, people to meet!"
        ->time_to_leave
* * [What a funny coincidence!]
She gives out a light chuckle, but does not look you in the eye. "Yeah, funny." 
->other_friends
* [None]
"Oh really, what a shame. You must be quite lonely." she says, giving you a look of pity.
->other_friends

=other_friends
"But... anyway, you surely must have made other friends, no?"
"Perhaps some of the people you've come across already consider you a friend, while you may only think of them as an acquaintance." 
"Plus, I may be busy, but you can always consider me a friend." Scarlet smiles brightly.
Scarlet continues chatting with you, and you tell her about all the people you've met so far along your journey. Eventually, you realise you should probably get going.
->time_to_leave

=time_to_leave
You and Scarlet keep chatting as she walks you back to the front of the palace.
"Thanks so much for coming, {players_name}. It was truly lovely to meet you." She says politely, and you nod your head before making your way back to the town square.
->town_square

=== final_battle_info ===

"So, we did it. You finally have all three tomes." Verso says.
"If you have any unfinished business in town, I suggest you go back and deal with it now."

+ [I have unfinished business]
You head back to the town square.
->town_square

+ [No, I'm ready]
-> final_battle