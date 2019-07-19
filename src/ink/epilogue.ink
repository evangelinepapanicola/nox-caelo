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
And with that, all of you start running at him, but there appears to be some sort of invisible barrier protecting him.
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
With your shadow defeated you look around to see if any of your friends need help, but they all seem to have taken care of their shadows too.
"Hah, you think you can intimidate me with a weak imitation of myself, little boy?" Sengva yells out to Verso. 
The group's focus returns to Verso. "We have to find a way to break through that barrier, or we're all done for!" Emeralda calls out.
"H̴̖͂ą̶͝h̶̩́a̶̠͝.̶͍̅ Don't fool yourselves. You're out of time!" Verso exclaims, and he stands up.
His body starts glowing brighter, brighter and brighter until Verso becomes a blur, and you see him transform into a a huge, red, demon-like dragon.
The new, demonic Verso rises up, flying with his draconic wings. He calls out, "I̶t̶ ̸w̵a̴s̴ ̴f̸u̶n̴,̸ ̵r̸e̷a̵l̷l̴y̸ ̶g̶u̸y̶s̵!̸ ̵B̶u̶t̴ ̴I̵ ̴m̶u̸s̵t̷ ̶b̴e̵ ̶g̵o̶i̴n̴g̷ ̵n̴o̸w̶.̵ ̴I̵ ̶h̴a̷v̷e̷ ̵a̴ ̵q̶u̷e̸e̵n̵ ̴t̷o̵ ̴k̴i̸l̵l̶.̷"
{boySunglasses == false: 
He cackles, and a huge ball of fire is sent hurtling towards you all. You wince, thinking your time is finally up - until Rax pushes through and holds out his arms, projecting a huge barrier around you all, protecting the group from the flames.
As the fire burns out, the dust settling around you - Verso is gone.
}
{boySunglasses == true: 
"STOPP!" A voice yells, interrupting Verso. A familiar voice, but not one you were expecting...
You turn around to see the paperboy, wearing the cool sunglasses you gave him. A firey explosion goes off behind him, making him look even more badass. "Begone, evil monster!", he cries out.
Verso stops, with a confused look on his face. He appears speechless, and flies away.
}
"Hoo boy..." Sengva sighs. "What now?"
"He's headed for the palace" Emeralda responds. "We have to get there as quickly as possible, Rax, Trax - can you teleport us?"
"We could, but..." Trax begins. "It would be unwise to teleport directly to the palaccce... we have no idea of the dangersss ahead... we could teleport directly into a wall of fire by missstake..." Rax finishes.
Emeralda clears her throat. "Very well then, we will just have to run there as fast as we can." The whole crew nods.
-> the_final_palace

= the_final_palace
When you all arrive at the castle gates, all you can hear is the sound of crackling fire destroying the trees in the surrounding area. There are no guards, so you can walk right in.
"Not a guard in sight..." Emeralda sighs. "Right, lets go everyone. Stay on guard."
You all make your way into the palace, Emeralda at at the front leading the way. You're close behind, at the same pace as Sengva, followed by Trax and Rax at the back.
The palace is eerily silent, but a complete mess. As you all make your down the long corridors, you see charred furniture, guards laying unconscious on the ground, shattered glass and much worse.
As you get closer to the throne room, you start to hear all kinds of crashing noises and yelling.
"That must be them!" Emeralda yells, and picks up the pace.
She barges into the throne room, swinging the doors open.
You see Scarlet, in full battle attire covered in bruises, scrapes and burns. Verso, in his huge demonic form looms above you all.
"Scarlet!" Emeralda calls out. She runs up to Scarlet and hugs her briefly, knowing now isn't the time for an emotional reunion. "Thank god you're alive!"
"Emeralda..." Scarlet coughs, wheezing mid-sentence. "I'm glad you're here."
"H̸a̶h̵a̴h̴a̷!̴" Verso cackles. "O̷h̷,̸ ̴h̷o̸w̸ ̷l̴o̸v̷e̸l̵y̶.̸ H̴a̸v̸e̴ ̶y̴o̵u̶ ̵c̵o̵m̵e̸ ̴t̵o̵ ̴w̶a̷t̵c̴h̵ ̵y̸o̶u̸r̵ ̴f̷r̷i̵e̷n̶d̶ ̶f̵a̶l̴l̵?̶"
Emeralda scowls. 
"Verso... how far you've fallen. I spared your life after you cut short many others, yet you still seek revenge. To even go as far as making an oath with the god of wrath... oh how naive I was." Scarlet says, with pain in her voice.
"I won't make that mistake again."
"Everyone - I'm going to prepare a magical attack, but it will take some time. I need you to take care of him in the meantime." Scarlet coughs.
"Got it." Emeralda says, "Alright, let's bring down this demon!"
The final battle begins.
+ [Attack]
    {weaponEquipped == "sword": You run toward Verso and swing your sword upward at the demon, scraping it's leg.}{weaponEquipped == "bow": You fire an arrow at Verso and it catches him in the leg. He doesn't seem fazed.}{weaponEquipped == "fists": You run toward Verso and punch upward at the demon, slamming your fist into his leg. You pull your hand away sharply in pain, feeling like you've burnt your fist.}
    ~versoHP--
+ [Defend]
You hold a defensive stance, but Verso seems to distracted by your friends attacking him to attack you right now, so you're safe anyway.

- Verso scowls, irritated by the attacks made against him. Scarlet continues to charge up her magical attack.
+ + [Attack]
    {weaponEquipped == "sword": You swing your sword aggressively at him, but he dodges it with ease.}{weaponEquipped == "bow": You fire an arrow at Verso, but he catches it and immediately crushes it into tiny pieces in his hand.}{weaponEquipped == "fists": You try to uppercut the demon, but he dodges with ease.}
+ + [Defend]
    You see Emeralda jab one of her blades into the side of the demon, and then struggle to pull it back out. Verso notices and goes to attack her with one of his claws, but you manage to pull her away just in time.
    ~versoHP--

- - Verso roars with anger, and you see his eyes light up as flames emerge from his mouth. Scarlet remains focused on charging up her magical attack.

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