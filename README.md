# Tic Tac Toe

## Outline

This is a project to build a tic-tac-toe style game to be played in the command line between two players.

This project will help me become more comfortable working with classes and objects. It will also develop my understanding of OOP theory and state management.

## Dev notes

12/12/22

I'm toying with the idea of creating multiple key value pairs instead of dealing with a single nested array. I think the code might end up being cleaner if I can call individual methods on the board class rather than dealing with nested #each_with_index enumerables. I am still going to give the nested array a go but this is worth considering.

13/12/22

Having completed a first draft I am now going through the document to implement
the ruby style guide to the best of my ability. Obviously this requires some
fundamental overhauls to the document. I will be splitting the GameBoard class
into two separate classes, one for the intended purpose and the other for
checking if either player has won. I will then be placing them in their own
files and requiring them at the top of the main file.

## Conclusion

I have completely refactored this project to be compliant with the ruby style
guide. This process taught me a lot about writing readable, easily maintainable
code. The biggest change has been the way I approach writing methods.

Before I read the style guide, my methods were bloated and relied heavily on
variables contained in the main file. This practice led to the introduction
of bad habits such as using global variables.

Following the style guide also made bugfixing far easier. It was nice to see
exactly which method in which file was causing the problem.

Overall this project has reinforced some great coding and workflow habits.
