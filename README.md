# Prolog N-Queens Solver

My solver for the popular Eight Queens game that I wrote to teach myself Prolog and delve into logical programming languages. The rules for the game are as follows: given N number of queens and a chess board, the player must place all N queens on the board so that no queen threatens another (no queen can be in the vertical, horizontal, or diagonal path of another queen).

In the completion of this project, I happened to explore runtime efficiency by building three different solvers - one that uses brute force, one that uses simple recursion, and finally one that uses tail recursion. 

## Version 1 (brute force): 8QueensV1.pl

This version is very simplistic and does not use recursion. Because of this, it has a very poor runtime	with 7 or 8 queens	

It can, however solve the puzzle with 6 queens on an 8x8 board in about 20 seconds!											

The query to send for the 6 queens case is  `?- eightQueens(Q1, Q2, Q3, Q4, Q5, Q6)`. (but modifications are needed in the eightQueens rule if you want to do this - just delete anything involving Q7 or Q8)	
		 																												
This version declares that all the locations of the 8x8 board are facts, then asserts that all eight queens are locations, then asserts that all of the queens must be in valid locations with each other. It then prints out a solution, assigning each queen variable to a valid location.

## Version 2 (simple recursion): 8QueensV2.pl

This version is an improvement compared to version 1, but still has a very long runtime when testing with 8 Queens. 	

It can, however solve the puzzle with 7 queens on an 8x8 board in about a minute (and 6 queens in about 2 seconds!)	

The query to send for the 7 queens case is `?- eightQueens([Q1, Q2, Q3, Q4, Q5, Q6, Q7])`.							
		 																										
Unlike version 1, this version uses recursion to solve the puzzle and takes in only one parameter: a list of the Queens. Although it uses recursion, it uses similar logic to version 1: it tests Q1 against all the queens after it, then tests Q2 against all the queens after it, etc. Thus, it uses recursion starting from the front of the list, checking to see if each queen is valid with those after it. The "valid" rule is also recursive in that it recursively tests the head against each of the Queens in the tail		

**QUERY TO SEND FROM SHELL**: `?- eightQueens([Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8])` (this will not complete though)													
It will then (eventually?) print out a solution to the problem. (typing a semicolon will reveal the next solution). In the solution, the queens' locations on the grid are in the format [y, x], similar to how the 'loc's are instantiated below. The grid is arranged so that [1,1] is in the upper left and [8,8] is in the bottom right.

**Example solution**:

	Q1 = [8, 4],																												
	Q2 = [7, 2],																												
	Q3 = [6, 7],																												
	Q4 = [5, 3],																												
	Q5 = [4, 6],																												
	Q6 = [3, 8],																												
	Q7 = [2, 5],																												
	Q8 = [1, 1]

## Version 3 (tail recursion): 8QueensV3.pl
											 													
This version also uses recursion but goes straight to the end of the list of queens before checking for validity			

It then moves back towards Q1, checking to make sure that each Q is valid with those after it.								

Doing so results in a much faster runtime than the other versions, completing the puzzle in about 2 seconds					

This is because this version gets all of the eightQueens recursive steps done right away and then uses tail recursion with the recursive calls of valid.																	
			 																												
**QUERY TO SEND FROM SHELL**: `?- eightQueens([Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8]).`													

It will then print out a solution to the problem. (typing a semicolon will reveal the next solution). In the solution, the queens' locations on the grid are in the format [y, x], similar to how the 'loc's are instantiated below. The grid is arranged so that [1,1] is in the upper left and [8,8] is in the bottom right.

**Example solution**:

	Q1 = [8, 4],																												
	Q2 = [7, 2],																												
	Q3 = [6, 7],																												
	Q4 = [5, 3],																												
	Q5 = [4, 6],																												
	Q6 = [3, 8],																												
	Q7 = [2, 5],																												
	Q8 = [1, 1] 

## Performance Results:

Version 1 (brute force): 

 * 6 Queens runtime: 23 seconds
 * 7 Queens runtime: did not finish
 * 8 Queens runtime: did not finish

Version 2 (simple recursion): 

 * 6 Queens runtime: 2 seconds
 * 7 Queens runtime: 1 minute 24 seconds
 * 8 Queens runtime: did not finish

Version 3 (tail recursion):

 * 6 Queens runtime: instantaneous
 * 7 Queens runtime: instantaneous
 * 8 Queens runtime: 2 seconds