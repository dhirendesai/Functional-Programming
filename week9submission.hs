import System.IO

strlen' :: IO ()
strlen'= do putStr "Enter the username: "
            xs <- getLine
            putStrLn "the username is "
            putStr xs
            putStrLn " "
                     
game    ::  IO ()
game =  do  putStrLn "Welcome to the text adventure game!"
            putStrLn instructions
            play "start game" 
--            return "Goodbye!"

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
    "quit               -- to end the game and quit."

play :: String -> IO ()
play direction =
   do guess <- getLine
      if guess == "quit" then
         putStrLn "You won/game over!"
      else
         do putStrLn "check condition"
            play direction	