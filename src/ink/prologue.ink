DEV MODE: Choose how you'd like to test -

+ [Play as normal]
->normal_story

+ [Skip to epilogue]
->final_battle

+ [Skip to fight sequence (sword)]
~weaponEquipped = "sword"
~money = 2
~visibleWeapon = true
-> ignis_arena._fight

+ [Skip to town square]
-> town_square

+ [Skip to town square (with money and weapon)]
~weaponEquipped = "sword"
~money = 2
~visibleWeapon = true
-> town_square

+ [Skip to negotiation]
~weaponEquipped = "fists"
~money = 2
~visibleWeapon = true
-> fox_house.the_negotiation

+ [Skip to the labyrinth]
~weaponEquipped = "fists"
~money = 2
~visibleWeapon = true
-> labyrinth_of_fury

+ [Skip to town square (With 2 quest items)]
~weaponEquipped = "fists"
~money = 2
~visibleWeapon = true
~questsItems = 2
-> town_square

=== normal_story ===
~location = "house"
It's a quiet, uneventful night at home, as usual.
You are {players_name} - and right now, you're watching TV after a long day of chores.

"Woof!"

* [What's that?]
You hear Cerberus barking in the hallway. You go to investigate.
-> investigate

* [Call Cerberus]
"Cerberus!" You call out.
-> call_cerberus

=== investigate ===

{!Out in the hallway, your dog Cerberus is sat innocently by the door, looking at you expectantly.}
{!You check your watch, and realise it's time for your daily night-time walk in the forest!}

* [Head out for walk with Cerberus]
-> walk

* [Pet Cerberus]
Cerberus seems happy.
-> investigate


=== call_cerberus ===

Your dog, Cerberus wanders into the room and sits down, looking at you expectantly.

* [Pet Cerberus]
Cerberus seems happy.
You check your watch, and realise it's time for your daily night-time walk in the forest! You head on out.
-> walk

* [Follow]
You follow Cerberus out into the hallway. The realisation hits, and sure enough you check your watch - it's time for your daily night-time walk in the forest! You head on out.
-> walk

=== walk ===

~location = "forest"

It's a cold, but clear night in the Luna Woods. As you walk down the main path through the trees, Cerberus runs around excitedly.

Eventually, the path comes to a split - as you are used to. You can go either way:

* (go_left) [Go left]
You reckon Cerberus needs the exercise, so you take the left-hand path, the slightly longer way around.

* (go_right) [Go right]
Feeling tired, you take the right-hand path, the slightly quicker way around.

- You notice something glimmering in the dirt.

* [Pick up]

{ go_left: 
        ~money = money+2
}

{go_left: You found a £2 coin. Nice!}

{go_right: 
        ~money++
}
{go_right: You found a £1 coin.}

* [Ew, no thanks, who knows where that's been]
You ignore the weird thing in the dirt, and continue onward.

- The two paths converge, bringing you back onto the main path.

Normally, it's just you and Cerberus on these walks. People don't usually go out into the forest at this time of night.

"HELLO?"

But weirdly, you hear someone yelling in the distance.

"HELLOO??"

Cerberus barks at the mystery voice.

You also notice some footprints on the ground.

* [Head towards the voice]
You follow the sound of the person's voice.
-> the_voice

* [Follow the footprints]
You follow the footprints on the ground.
-> the_footprints

= the_voice

"IS SOMEBODY THERE??"

The voice continues. It gets louder as you approach it.

* [YEAH?]
* [WHERE ARE YOU?]

- You yell out to the mystery person.

"PLEASE HELP ME!" The person yells back, with urgency. Sensing that this person may be in danger, you:

* [Pick up the pace]
You and Cerberus start running forward down the path frantically, until you finally see a figure in the distance.

* [Hesitantly power walk]
Wanting to help, but being unsure of the dangers ahead, you walk a bit faster. You start to see a figure in the distance.

- ->meet_verso

= the_footprints

"IS SOMEBODY THERE??"

The voice continues.

The trail of footprints in the mud go on for quite some time, to the point where you wonder if they actually lead anywhere.

* [Keep your eyes on the footprints]
You focus on following the footprints to find the person as quickly as possible. As you do so, you notice the footprints change briefly. It's almost like two, three or four sets of footprints in the same path you've been following belong to someone - or something completely different. Up until now, the footprints had been seemingly normal, human footprints from what looks like a pair of boots; but this unusual set of footprints that differ to the others look completely different - like they come from some sort of barefoot, pointy toed animal.

But It's late - you're probably just tired and seeing things.

On that note - as you keep walking, you see a figure in the distance.

* [Look up at the stars]
You look up at the full moon and admire It's beauty... as you try not to walk into a tree.
Continuing to follow the footprints, you eventually notice a figure in the distance.

- ->meet_verso

= meet_verso

{!As you get closer, you identify this figure as a small man wearing what looks like... a suit of armour? He immediately notices you and starts waving his arms wildly, signalling for you to come over. "Finally! Someone found me!" He yells.}

{!You figure this poor guy probably got lost doing live action roleplay with his friends. As you approach him, you're bound to have some questions:}

* [How did you end up here?] You ask {verso_name: Verso|the man} how on earth he ended up here.
"I fled here from my kingdom! Please, you must help, the people are in imminent danger!"
    * * [Your... uh... kingdom?]
    * * [Who is in danger exactly?]
    - - "I hail from the kingdom of Luna. I fled here, to your realm, seeking help. If we don't go back soon, I fear my people will be in grave danger. Scarlet... she will destroy them."
    * * [Tell {verso_name: Verso|the guy} that you didn't realise he was just doing some LARP]
        You try and explain to {verso_name: Verso|the guy} that you didn't realise he was just pretending to be in danger, you thought he was seriously in trouble.
        "LARP? I'm not pretending, I'm serious! You have to help me."
        * * * [Alright, alright. How do I help you exactly?]
            "You have to come with me - back to Luna. I need you to retrieve the legendary tomes, only then can we take down Scarlet and bring justice to the people."
            ->meet_verso
        * * * [You're delusional.]
            You notice {verso_name: Verso|the man} start to tear up at your comment.
            "Please... I'm begging you. You're my only hope. Without your help, my people, they'll-"
            ->meet_verso
        
* (verso_name)[What's your name?]
"Sorry for not introducing myself. I am... Verso." He bows in front of you as he says this.
->meet_verso
* -> to_luna

= to_luna

Verso holds his hand out to you. 
"Please, come with me."

* [Take his hand]
You take Verso's hand, and he yanks you forward - but, instead of tripping and falling face-first into the ground, you just keep falling, falling, falling...
* [Refuse]
Feeling distrust, you keep your arms firmly by your sides. Before you can explain that you don't want to go with him, he grabs your arm and yanks you forward - but, instead of tripping and falling face-first into the ground, you just keep falling, falling, falling...
- -> welcome_to_luna