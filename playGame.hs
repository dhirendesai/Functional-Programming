import System.IO 
import Data.Char
{-- The strlen' function is to introduce your self in the game. You can declare your name at the begaining of the game.--}
strlen' :: IO ()
strlen'= do putStr "Enter the username: "
            xs <- getLine
            putStr "The username is: " 
            putStr xs
            putStrLn ",  Enter Instruction to understand game "
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-- The game function is to play game, run a command game and it will start game in the console.--}
game :: IO ()
game = do putStrLn "Welcome to the text adventure game!" 
          putStrLn  "Input which direction "
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
{-- The function weapon shows different types of weapon available during game. It also show the weapon damage and hit chance capacity. The following list shows different
types of the weapons.--}
weapon :: IO ()
weapon = do putStrLn "enter which weapon you want to pick up"

data Weapon = Weapon {weaponDamage:: Int,weaponHitChance :: Float, weaponName :: String } deriving (Show,Eq)

bfg = Weapon 100 0.9 "BFG"
highlander = Weapon 100 0.9 "Highlander"
loic = Weapon 100 1 "Low Orbital Ion Cannon"

sword          = Weapon 50 0.8 "Sword of Awesome"
rocketLauncher = Weapon 70 0.5 "Rocket Launcher"
revolver = Weapon 40 0.9 "Revolver"

blacksword = Weapon 30 0.9 "Block Sword"
pistol = Weapon 30 0.9 "Pistol"
bow=Weapon 40 0.5 "Bow"

fists = Weapon 20 1 "Fists"

lightweapons=[blacksword,pistol,bow]
heavyweapons=[sword,rocketLauncher,revolver]
---------------------------------------------------------------------------------------------------------------------------------------
play :: String -> IO ()         {-- Play function to play the game. when you inpute play "game" it will start game and ask for the direction and room no.--}
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction
-----------------------------------------------------------------------------------------------------------------------------------------			
match :: String -> String -> String  {-- Match function to match two string, or two empty or non empty list--}
match xs ys = description xs ys

description :: String->String -> String   {-- This function for the room description input is String -> String  and output is String--}
------------------------------------------------------------------------------------------------------------------------------------------------------------------
{- This functions for the rooms descriptions, what is the target in different rooms. --}
---description "s" "room1" = "you are inside room1"
description "s" "room1" =
    "You are in a room1.  To the north is the dark mouth\n" ++
    "of a room2; to the south is a small room5.  Your\n" ++
    "assignment, should you decide to accept it, is to\n" ++
    "recover the famed Bar-Abzad ruby and return it to\n" ++
    "this room3."

---description "n" "room2"= "you are inside room2" 
description "n" "room2" = "You are inside room2 at north direction. Congratulations!!  You have recovered the Bar-Abzad ruby and won the game."

---description "e" "room3"= "you are inside room3"

description "e" "room3" = " You are inside room3 at east direction. Congratulations!!  You have recovered lessor gun."

---description "w" "room4"= "you are inside room4"

description "w" "room4" = " You are inside room4 at west direction. Congratulations!!  You have recovered Pistol to shoot enemy."
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
instructions =
    "Enter commands using one or two words.\n" ++                     {-- This function about the gaming instructions, gives the imformation about all the available commands--}
    "Available commands are:\n" ++
    "main               -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "look               -- to look around you again.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "quit               -- to end the game and quit."
-------------------------------------------------------------------------------------------------------------------------------------------------------------------	
{-- This different functions shows different output, like object is to take or putdown object with command y/n. kill functions is to kill the enemy around you and
look function is to look around you.--}
object :: IO ()
object = do putStrLn "you want to take or drop object? y/n"
y = "you have pick up the object"
n = "you have put down object"
kill = "your enemy is in front of you, attack to kill"
look = "looking around you again"
----------------------------------------------------------------------------------------------------------------------------------------------------------------
type Location = String
type Direction = String
type Thing = String
type Response = String


type PathMap = [((Location, Direction), Location)] {-- This is daya type functions for PathMap, LocationMap and words. to find out the instructions of path, locations and world--}
paths :: PathMap
paths = [
    (("room1", "d"), "room2"),
    (("room2", "u"), "room1"),
    (("room2", "w"), "room2 entrance"),
    (("room2 entrance", "e"), "room2"),
    (("room2 entrance", "s"), "room3"),
    (("room3", "s"), "room1"),
    (("room3", "n"), "room2 entrance")
    ]
type LocationMap = [(Thing, Location)]
locations :: LocationMap
locations =  [
    ("ruby", "room1"),
    ("key", "room2 entrance"),
    ("myself", "room3"),
    
    ("room1", "alive")]
type World = (PathMap, LocationMap, Response)
world :: IO (PathMap, LocationMap, Response)
world = return (paths, locations, "")
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
main :: IO (String)      {-- This is main IO operation to introduce text adventure game which shows instructions on begaining and goodbye at the end of the game--}
main = do
    putStrLn "\nWelcome to the text adventure game!\n"
    putStrLn instructions
    return "Goodbye!"
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
health :: IO () {-- This function shows health of the player--}
health = do putStr "Enter your Health Percentage : "
            xs <- getLine
            putStr "Your health is:  " 
            putStr xs
            putStrLn "% " 
