 = LDinos Puzzle Editor V2.0 =

This is the renewed and remastered puzzle editor for Bejeweled 2. It now supports .sol hint editing!
Later versions might have more automated hint solution creations (such as a simulated board or making solutions in a click)

* How does it work?
This document explains most of the programming stuff behind the puzzles and their solution files
https://docs.google.com/document/d/1ORu5ggtIJ0k3bzWp3H1VtkJ7H--1Y_mBkr8ri09HNn0
This program basically has this in mind, and automates the progress much more than doing it yourself in a hex editor

* How can I make a simple fully featured puzzle?
First, using the Gem options (click on the gem to see all gem options and choose one), click anywhere on the
board to add a gem. Make the board however you like! The puzzle is now finished and you can save it
If you want to make hints for that puzzle, make a new state ("ADD STATE" button), and inside that
state, add as many possible hints as you like. Don't forget to make this state the starting state.
The starting state is what will happen when you click HINT in-game right when you enter the puzzle.
Depending on how the board will look after swapping gems (you should be playing bejeweled 2 next to our program), make
more states and their possible hints and don't forget to change the "goto state" setting for each hint so that each
swap will get you to the correct state that you want! When you are finished, dont forget to save that solution.
If you want to see the official puzzle solutions and how they work, you can open puzzle "26. Green right.sol" for a
one hint solution in a state at a time and "2. above and below" for multiple hints for each state. Keep in mind that
state order in official puzzles is really bad

* How do I import my puzzle into Bejeweled 2?
Take your puzzle.bpz (and puzzle.sol if you made one), and move it to the "Bejeweled 2\puzzles\Galaxy One" directory.
Next, in that directory, find and open galaxy.xml and edit it as an admin in a notepad editor.
Remember the default settings (feel free to clone galaxy.xml) and replace any puzzle name with yours. That's all!
You can also make a new galaxy folder, but that is a bit more advanced and I don't have a tutorial for that...

* THINGS TO BE CAREFUL OF (IMPORTANT!)
- For now, the number of hints you can have in one state is a bit limited (around 14). Sorry about that!
- When creating hint arrows, ALWAYS make sure that the FIRST arrow is pointing on a gem and not on emptyness
  If you don't follow that rule, game will crash!
- You don't have to make two hint arrows for one swap (the game knows that the move 1 -> 2 is the same as 1 <- 2)
- Please save somewhere in your own folders and NOT in the Bejeweled 2 folder, as permissions are very strict in Popcap Games
- Please, for the love of god, if you are making changes to an existing puzzle, MAKE BACKUPS FIRST!