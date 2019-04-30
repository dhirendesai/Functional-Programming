
import System.IO 
import Data.Char

strlen' :: IO ()
strlen'= do putStr "Enter the username: "
            xs <- getLine
            putStr "The username is: " 
            putStr xs
            putStrLn ",  Enter Instruction to understand game "        
game :: IO ()
game = do putStrLn "Welcome to the text adventure game!" 
          putStrLn  "Input which direction "
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction
         
data Weapon = Weapon {weaponDamage:: Int,weaponHitChance :: Float, weaponName :: String } deriving (Show,Eq)

bfg = Weapon 100 0.9 "BFG"
highlander = Weapon 100 0.9 "Highlander"
loic = Weapon 100 1 "Low Orbital Ion Cannon"

sword          = Weapon 50 0.8 "Sword of Awesome"
rocketLauncher = Weapon 70 0.5 "Rocket Launcher"
revolver = Weapon 40 0.9 "Revolver"

blockSword = Weapon 30 0.9 "Block Sword"
pistol = Weapon 30 0.9 "Pistol"
bow=Weapon 40 0.5 "Bow"

fists = Weapon 20 1 "Fists"

lightweapons=[blockSword,pistol,bow]
heavyweapons=[sword,rocketLauncher,revolver]

play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn (match direction guess)
            play direction

match :: String -> String -> String
match xs ys = description xs ys

--need to add more options of the rooms, for example
-- description "s" "room4"= "you are inside room4"
description :: String->String -> String
description "n" "room1" =
    "You are in a room1.  To the north is the dark mouth\n" ++
    "of a room2; to the south is a small room5.  Your\n" ++
    "assignment, should you decide to accept it, is to\n" ++
    "recover the famed Bar-Abzad ruby and return it to\n" ++
    "this room3."
description "s" "room1" =
    "You are in the mouth of a dank room2.  The exit is to\n" ++
    "the south; there is a large, dark, round passage to\n" ++
    "the east."
---description "s" "room2"= "you are inside room4"
description "s" "room2" = " You are inside room2 at south direction. Congratulations!!  You have recovered the ruby and won the game."
description "w" "room2" = " You are inside room2 at west direction. Congratulations!!  You have recovered the key to entre next level."
description "n" "room2" = " You are inside room2 at north direction. Congratulations!!  Your life is increased "
description "e" "room2" = " You are inside room2 at east direction. Congratulations!!  You have killed all your enemy, you can go to next level."

---description "s" "room3"= "you are inside room4"
description "s" "room3" = " You are inside room2 at south direction. Congratulations!!  You have recovered the torch to see in dark."
description "w" "room3" = " You are inside room2 at west direction. Congratulations!!  You have recovered extra life to go long."
description "n" "room3" = " You are inside room2 at north direction. Congratulations!!  You have recovered binocular. "
description "e" "room3" = " You are inside room2 at east direction. Congratulations!!  You have recovered lessor gun."

---description "s" "room4"= "you are inside room4"
description "s" "room4" = " You are inside room4 at south direction. Congratulations!!  You have recovered Sword to kill enemy."
description "w" "room4" = " You are inside room4 at west direction. Congratulations!!  You have recovered Pistol to shoot enemy."
description "n" "room4" = " You are inside room4 at north direction. Congratulations!!  You have recovered Bomb to through on enemy."
description "e" "room4" = " You are inside room4 at east direction. Congratulations!!  You have recovered Machinegun for multiple assault."

instructions =
    "Enter commands using one or two words.\n" ++
    "Available commands are:\n" ++
    "game               -- to start the game.\n" ++
    "n  s  e  w  u  d   -- to go in that direction.\n" ++
    "take object        -- to pick up the named object.\n" ++
    "drop object        -- to put down the named object.\n" ++
    "kill               -- to attack an enemy.\n" ++
    "look               -- to look around you again.\n" ++
    "i                  -- to see your inventory (what you are holding).\n" ++
    "Weapon             -- lightweapons and heavyweapons. \n" ++
    "quit               -- to end the game and quit."
type Location = String
type Direction = String
type Thing = String
type Response = String


type PathMap = [((Location, Direction), Location)]
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

main :: IO (String)
main = do
    putStrLn "\nWelcome to the text adventure game!\n"
    putStrLn instructions
    return "Goodbye!"
health :: IO ()
health = do putStrLn "check your health: "
            health <- getLine
            putStrLn "Your health is: "



