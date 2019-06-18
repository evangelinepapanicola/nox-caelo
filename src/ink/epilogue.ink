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
"Your room is upstairs, I'm about to head off for the night but I'll be back here 9 'o' clock sharp tomorrow morning."


->END