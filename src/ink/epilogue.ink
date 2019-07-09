//the finale goes here

=== final_battle ===
~location = "town"
"Very well then," Verso says. "we'll activate the tomes at dawn tomorrow. For now, hand them over to me for safekeeping."
+ (given_away_tomes)[Hand over the tomes]
You give Verso all three tomes, Charisma, Perseverance and Warfare.
"I̸̲͌n̴͔̈ć̶̮r̷͇̋ȩ̵̕d̵͙̿ì̷̫b̶̥̄ḽ̸̍e̶̥͘" he says , shaking. "We finally have everything we need to defeat Scarlet."
"Now, we should rest up and get some sleep before the big day. I've spoken to the shopkeep on Crescent street, and she said you can stay in the room above her shop tonight."
-> general_store_room

+ [No]
Verso looks at you, eyes wide, "What's wrong?"
+ + [I think they'll be safer with me]
You explain to him that they might be safer in your possession, as not many people know where you are staying.
"I don't quite understand your logic... but alright," Verso says, hesitantly. "Meet me here at dawn with the tomes."
"Now, we should rest up and get some sleep before the big day. I've spoken to the shopkeep on Crescent street, and she said you can stay in the room above her shop tonight."
-> general_store_room

+ + [Tell me the truth. Did you murder all those innocent people?]
"What are you... what are you talking about?"
"It was Scarlet! You know that! Are you telling me not even you believe me now?"
"After all this time?"
"After everything we've been through?"
Tears well up in Verso's eyes.
"I'll do it myself!" He exclaims, and rips the tomes from your hands. Before you can fight back, a portal opens beneath you and you drop immediately.
You keep falling and falling and falling, helpless, for minutes. It's a familiar situation.
~location = "forest"
You eventually land with a crash - into a bush, clutching Cerberus in your arms.
You look up at a familiar starry sky, and look around to see you are surrounded by tall trees. You have returned to the Luna Woods - back in your home realm.
+ + + [Call out to Verso]
No response.
You make your way back home, filled with guilt. Cerberus whimpers the whole way back.
You feel restless, but you realise there's nothing you can do.
Days pass, and eventually, you feel like you've finally convinced yourself that it was all some weird dream. But deep down, you know it was real.
GAME OVER #game-over
+ + + + [Try for a different ending]
-> final_battle

=general_store_room
~location = "nighttown"
You head over to the General Store on Crescent street as the sun sets, the door bells chiming as you enter.
"Ahh, yer here - make yerself at home darlin!" The shopkeep pipes up as you come in.
"Yer room is upstairs, I'm about to head off for the night but I'll be back 'ere 9 'o' clock sharp tomorrow morning."
You nod, and thank her for letting you stay.
You head upstairs{given_away_tomes:.}{not given_away_tomes: and place the tomes in a stack on your bedside table.} The room is simple but cosy. You hop into bed and Cerberus curls up next to you.
Exhausted from all the days of travelling, sleep finds you very quickly.
Until...
~location = "fire"
You wake up in the middle of the night - to the smell of smoke. {not given_away_tomes: You look over to your bedside table, and the tomes are gone.}
-> investigate_disturbance

=investigate_disturbance
You decide to investigate.
+ {tried_door} [Climb out through the window]
You open the window as wide as you can and slowly climb out. Despite being on the first floor, you aren't too high up and manage to safely climb down to the ground. You call out to Cerberus, and he leaps out into your arms.
-> crescent_street_fire
+ {not tried_door} [Look out the window]
You look outside to see a horrifying sight. The whole town is up in flames, people are running around, screaming.
-> investigate_disturbance
+ (downstairs)[Go downstairs]
You run downstairs. Everything is the same as before, but you can hear loud noises of chaos outside - people yelling, loud crashes...
+ + (tried_door)[Go outside]
You try to open the front door, but it's locked shut. You remember the shopkeep saying she wouldn't return to open the store until 9am. Looks like you're stuck here for now.
->downstairs
+ + [Go back upstairs]
You head back upstairs.
->investigate_disturbance

=crescent_street_fire
You're on Crescent street. Everything's on fire.

+ [Enter the General Store]
  It's probably best not to go back inside.
  -> crescent_street_fire

+ [Enter the Library]
    Now probably isn't the time for reading.
    -> crescent_street_fire

+ [Go to the town square]
    ->town_square_fire

=town_square_fire
You find yourself in the town square. Everything is burning.

+ [Investigate the fountain]
All the water has evaporated from the heat.
-> town_square_fire

+ [Go down Crescent Street]
-> crescent_street_fire

+ [Enter the alleyway]
The alleyway is empty.
-> town_square_fire

+ [Town gates]
-> gathering_at_the_gates

=gathering_at_the_gates
As you arrive at the town gates, the first thing you notice is Verso sat on the ground cross legged. The three tomes are open and laid out on the ground, surrounding him in a triangle. He looks like he is deeply concentrating. You call out to him.
+ [What the hell is going on?]
    Verso looks up, only just noticing your presence as you call out to him. He looks surprised to see you. "Oh, y̴̲̚ò̴͇ư̷͈ made it!" There's an element of disappointment in his voice. "I had to start early. Oh, the fires are awful, it's like some kind of otherworldly being is setting fire to the town." He seems strangely calm.
+ [What happened to waiting until dawn?]
    Verso looks up, only just noticing your presence as you call out to him. He looks surprised to see you. "Oh, y̴̲̚ò̴͇ư̷͈ made it!" There's an element of disappointment in his voice. "I had to start early. Oh, the fires are awful, it's like some kind of otherworldly being is setting fire to the town." He seems strangely calm.
+ [Stop!]
    Verso looks up, only just noticing your presence as you call out to him. He looks surprised to see you. "Oh, y̴̲̚ò̴͇ư̷͈ made it!" There's an element of disappointment in his voice. "I'm starting the plan, {players_name}. w̵̪͂h̵̩̒y̵͎̒ do you want me to stop?

- Before you can respond, you hear a group of footsteps running toward you, and you're interrupted -
"HALT!" a voice yells. You turn around to see Sengva, and then behind her you see Lady Emeralda, followed by Rax and Trax.
"Stop this madness" Emeralda exclaims. "{players_name}, this man is using you for his own selfish revenge. He cannot be allowed to use the tomes."
"I was a fool. I allowed myself to be drugged, and in turn I handed over the tome I have spent my life protecting. After you left I found my loyal butler unconscious, and I know for a fact that man did it in order to slip some substance into my tea."
Sengva chimes in. "Something seemed fishy to me. I couldn't understand why someone like you would put yourself in such danger unless... I don't know, you were blackmailed. Either way, after seeing you fight so valiantly, I was curious. I had to see you again, {players_name}."
Trax follows up. "If I may... it is our duty to maintain peaccee in thesse landss... we became ssusspicciouss of your partner, and now the god of wrathhh hass unleasshed flamess upon thiss town..." 
Rax adds, "We musst fight back... we cannot allow this injussticce... he will usse the tomess for evil..."
You turn back to Verso, staring him down.
"You don't believe these fools, do you {players_name}?"
+ + [I believe them. Those 'fools' are my friends!]
-> against_verso
+ + [No, I believe you.]
-> with_verso

=== against_verso ===
"W̷̺̅h̸̘̏ạ̸̏t̷̺̑?̶̪̾"
"Fine! I'll finish the ritual without you!" Verso yells. He goes back to focusing on the tomes.
"Stop him!" Emeralda calls out. "He can't be allowed to complete that ritual!"
And with that, all of you start running at him, but there appears to be some sort of invisible forcefield protecting him.
You hear strange noises behind you, and when you turn around you notice huge, dark, shadowy creatures rising from portals in the ground. They start preparing to attack you and your friends.
"He'ss sssummonning!" Trax exclaims.
The shadows form into lookalikes of you and your friends. Shadow {players_name} approaches you{weaponEquipped == "sword":, sword in hand.}{weaponEquipped == "bow":, holding their bow at the ready.}{weaponEquipped == "fists":.}
+ {weaponEquipped == "bow"} [Fire an arrow at the shadow]
    You fire an arrow at the shadow. The shadow catches it.
+ {weaponEquipped == "sword"} [Slash the shadow]
    You attempt to slash your sword at the shadow, but the shadow catches your sword with their hand.
+ {weaponEquipped == "fists"} [Punch the shadow]
    You try to punch Shadow {players_name} in the face, but they grab your fist.
+ [Guard]
    {weaponEquipped == "bow": Shadow {players_name} fires an arrow at you, but you catch it and throw it on the ground.}{weaponEquipped == "sword": Shadow {players_name} attempts to slash you with their sword, but you duck out of the way just in time.}{weaponEquipped == "fists": Shadow {players_name} attempts to punch you in the face, but you duck out of the way just in time.}

- (shadow_continued) Shadow {players_name} looks at you {&menacingly|threateningly|smugly}.

+ + {weaponEquipped == "bow"} [Fire an arrow at the shadow]
    You fire an arrow at the shadow and it pierces through, causing the shadow to dissipate.
    -> shadow_defeated
+ + {weaponEquipped == "sword"} [Slash the shadow]
    You slash at the shadow, cutting through it, causing the shadow to dissipate.
    ->shadow_defeated
+ + {weaponEquipped == "fists"} [Punch the shadow]
    You swing your fist at the shadow and punch right through it, causing the shadow to dissipate.
    ->shadow_defeated
+ + [Guard]
    {weaponEquipped == "bow": Shadow {players_name} fires an arrow at you, but you catch it and throw it on the ground.}{weaponEquipped == "sword": Shadow {players_name} attempts to slash you with their sword, but you duck out of the way just in time.}{weaponEquipped == "fists": Shadow {players_name} attempts to punch you in the face, but you duck out of the way just in time.}
    ->shadow_continued

=shadow_defeated
With the shadow defeated,
->END


=== with_verso ===
"Wise choice." Verso says, with a grin. "Now, keep them occupied while I finish the ritual."
Seeing that you're siding with Verso, the others draw their weapons. You {visibleWeapon == true: draw your own in response.}{visibleWeapon == false: stand ready to defend yourself.}
"Very well then." Emeralda says, the others looking at you with great disappointment.
"I won't go easy on you." Sengva adds.
And with that, Emeralda charges forward with a dagger in each hand.
+ [Dodge]
    You try to dodge her attack at the last second, but one of her daggers catches your cheek, leaving a gash that starts bleeding down your face.
+ (emeralda_down)[Aim for her stomach]
    {weaponEquipped == "bow": You think fast and fire an arrow from your bow directly towards her, catching her in the side. She wheezes, clutching the arrow lodged into her skin as she stumbles to the ground.}{weaponEquipped == "sword": As she dives toward you, you duck down and swipe your blade across her abdomen and she cries out in pain, clutching her wound as she stumbles to the ground.}{weaponEquipped == "fists": You duck under her arms and slam a fist directly into her stomach. She wheezes, doubled over, and stumbles on to her knees.}

- You hear Sengva charging toward you and as you look you see her leg swinging straight for your face -
    + + [Catch it with your hand]
    You try to catch her shin with your hands, but you underestimate the force of her swing and are knocked to the ground.
    + + (sengva_down)[Dodge]
    You duck below her leg at the last second, and {weaponEquipped == "bow": jab one of your arrows into her other leg. She yelps in pain and stumbles over.}{weaponEquipped == "sword": swipe your sword at her other leg. She yelps in pain, and stumbles over holding the gash on her leg.}{weaponEquipped == "fists": kick her other leg, sending her off balance and crashing to the ground.}
    - - You see a circle with light emanating from it appearing underneath your feet as Rax and Trax approach you, holding their arms in front of them. 
        + + + (lizards_down)[Dash out of the circle]
        You dash out of the circle just in time before you could be grappled by several ethereal hands rising from it. {weaponEquipped == "bow": You quickly fire an arrow at Trax, followed by an arrow at Rax, taking them both down before they can react.}{weaponEquipped == "sword": You throw your sword at Trax, knocking him down and leaving a gash in his side, before running, grabbing it and taking a swing at Rax, taking him out too.}{weaponEquipped == "fists": You run at the two lizards, uppercutting Rax with your left fist and tripping over Trax with your right leg.}
        + + + [Attack from the circle]
        Before you can attack, you realise you can't move. You feel several ethereal hands pulling you down to the ground. You try to resist, but it's too painful, and you fall to the ground.

        - - - -> fight_pt_2

= fight_pt_2
You realise everyone is staring behind you, eyes wide, jaws dropped. You turn to see Verso, glowing as he transforms into a huge, red, demon-like dragon. He cackles. "H̸̲̑͠ã̵̹h̷͔̦̾̈́a̸͉̾͜h̷͙̀̿a̷͔͈̕!̶̜̾ ̸͚͗̍Y̷͖͐ọ̶̃ú̴̻̽ ̸͍͑̋f̵͎̦̈́̀ō̷̩̗o̷̺̅l̸̪͂s̵̯̈!̷̞͑͒"
His new form is the last thing you see before flames hurtle towards you, as you fall unconscious.
GAME OVER #game-over
+ + + + [Try for a different ending]
-> final_battle