# ruby-tic-tac-toe

This is a project to build a tic-tac-toe style game to be played in the command line between two players.

This project will help me become more comfortable working with classes and objects. It will also develop my understanding of OOP theory and state management.

12/12/22

I'm toying with the idea of creating multiple key value pairs instead of dealing with a single nested array. I think the code might end up being cleaner if I can call individual methods on the board class rather than dealing with nested #each_with_index enumerables. I am still going to give the nested array a go but this is worth considering.

**Outline**

    -Make a board class and a player class.
    -Make a model for holding board information using nested array.
    -Create two player instances (named by the users) and a board instance.
    -Create a game loop that takes a player input, places it into the array, then checks to see if either player has won.

13/12/22

Having completed a first draft I am now going through the document to implement
the ruby style guide to the best of my ability. Obviously this requires some
fundamental overhauls to the document. I will be splitting the GameBoard class
into two separate classes, one for the intended purpose and the other for
checking if either player has won. I will then be placing them in their own
files and requiring them at the top of the main file.
