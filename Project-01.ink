/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR Knife = 0
VAR Strength = 10
VAR Time = -1 // 0 Morning, 1 Noon, 2 Night

-> Chapter1

==Chapter1==
You were kidnapped by a tribe. You are hunrgy and scared. You must escape the island before they kill you.

First, pick up the knife for protection

It is { advance_time() }
* [ Pick up the knife ] -> Knifepickup
+ [ Find Food first ] -> FindFood

-> DONE

== FindFood==
Theres no food, and you just wasted your time.

+[Go Back ] -> Chapter1

->DONE
==Knifepickup ==
You have pick up the knife.
~ Knife = Knife+1
+[ Continue] -> SecondStory
->DONE

==SecondStory==

You only have {Knife} knife for protection. Make sure you sharpen it.

Now escape the cave! Hurry!

+ [Escape] -> Escape
->DONE
==Escape==
 You have escape. Your alone on an island now. It is getting late and it is now {advance_time()}. You are hunrgy, go fishing or hunt animals?

+[ Fishing ] -> Fishing
+ [ Hunting] -> Hunting
+[Rest] ->Rest

->DONE
==Rest==
You rested but now your starving. It is now {advance_time()} Find food quickly or you won't survive.
+[Fishing] -> Fishing
+[Hunting] -> Hunting
->DONE
== Fishing ==
You caught a fish! You cooked it and ate it!
You also gained some strength.

~ Strength = Strength + 5

+[Go Back] -> Escape
+[Continue] -> ThirdStory

->DONE
== Hunting ==

You caught a rabbit! You cooked it and ate it!

You also gained some strength.
~ Strength = Strength + 5
+[Go Back] -> Escape
+[Continue] -> ThirdStory

->DONE

== ThirdStory==

You hear noises in the bushes and suspect it could be the tribe trying to catch you. 

+[Run] -> Escape1
+[Check it out] -> DIED

== Escape1 ==
You've escaped! Now hide!


It is now {advance_time()}

+[ Continue] -> Chapter2

->DONE
== DIED ==
They caught you and killed you. You have died.
+[Go Back] -> ThirdStory
-> END

== function advance_time ==

~Time = Time + 1

{
    - Time > 2:
        ~Time = 0
        }
        
    {
    - Time == 0:
        ~return "Morning"
        
    - Time == 1:
        ~return "Noon"
        
    - Time == 2:
        ~return "Night"
        
    }
    
    ~return Time
    
== Chapter2 ==

You discovered an old map. Do you:
+[Study Map] -> StudyMap
+[Ignore it] -> Ignore

== StudyMap ==
This map reveals hidden location on the island, and you learned more about the island.

~Strength = Strength+10

To be Continued...

->END

== Ignore==
You leave the map behind and continue finding ways to escape.

->END


