
import System.IO 
import Data.Char



strlen' :: IO ()
strlen'= do putStr "Enter the username: "
            xs <- getLine
            putStr "The username is: " 
            putStr xs
            putStrLn ",  Enter Game to play"
game :: IO ()
game = do putStrLn "Input which direction "
          direction <- getLine
          putStrLn "input which room are you going to enter:"
          play direction

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
description "s" "room2" = " You are inside room2 at south direction. Congratulations!!  You have recovered the ruby and won the game."
description "w" "room2" = " You are inside room2 at west direction. Congratulations!!  You have recovered the key to entre next level."
description "n" "room2" = " You are inside room2 at north direction. Congratulations!!  Your life is increased "
description "e" "room2" = " You are inside room2 at east direction. Congratulations!!  You have killed all your enemy, you can go to next level."

description "s" "room3" = " You are inside room2 at south direction. Congratulations!!  You have recovered the torch to see in dark."
description "w" "room3" = " You are inside room2 at west direction. Congratulations!!  You have recovered extra life to go long."
description "n" "room3" = " You are inside room2 at north direction. Congratulations!!  You have recovered binocular. "
description "e" "room3" = " You are inside room2 at east direction. Congratulations!!  You have recovered lessor gun."


---description "s" "room4"= "you are inside room4"
description "s" "room4" = " You are inside room4 at south direction. Congratulations!!  You have recovered Sword to kill enemy."
description "w" "room4" = " You are inside room4 at west direction. Congratulations!!  You have recovered Pistol to shoot enemy."
description "n" "room4" = " You are inside room4 at north direction. Congratulations!!  You have recovered Bomb to through on enemy."
description "e" "room4" = " You are inside room4 at east direction. Congratulations!!  You have recovered Machinegun for multiple assault."

