/* 		1st Version: 											 																			*/
/* 			This version is very simplistic and does not use recursion. because of this, it has a very poor runtime	with 7 or 8 queens		*/
/* 			It can, however solve the puzzle with 6 queens on an 8x8 board in about 20 seconds!												*/
/* 			The query to send for the 6 queens case is  ?- eightQueens(Q1, Q2, Q3, Q4, Q5, Q6).												*/
/*				(but modifications are needed in the eightQueens rule if you want to do this - just delete anything involving Q7 or Q8)		*/
/*						 																													*/
/* 			This version declares that all the locations of the 8x8 board are facts, then asserts that all eight queens are locations, 		*/
/* 			then asserts that all of the queens must be in valid locations with each other. 												*/
/*			It then prints out a solution, assigning each queen variable to a valid location.												*/
/*						 																													*/
/* 		QUERY TO SEND FROM SHELL: ?- eightQueens(Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8). (this will not complete though)							*/
/* 		it will then (eventually?) print out a solution to the problem. (typing a semicolon will reveal the next solution) 					*/
/* 		in the solution, the queens' locations on the grid are in the format [y, x], similar to how the 'loc's are instantiated below 		*/
/* 		the grid is arranged so that [1,1] is in the upper left and [8,8] is in the bottom right 											*/
/*		example solution:																													*/
/*			Q1 = [8, 4],																													*/
/*			Q2 = [7, 2],																													*/
/*			Q3 = [6, 7],																													*/
/*			Q4 = [5, 3],																													*/
/*			Q5 = [4, 6],																													*/
/*			Q6 = [3, 8],																													*/
/*			Q7 = [2, 5],																													*/
/*			Q8 = [1, 1] 																													*/

/* FACTS */

loc([1,1]). loc([1,2]). loc([1,3]). loc([1,4]). loc([1,5]). loc([1,6]). loc([1,7]). loc([1,8]).
loc([2,1]). loc([2,2]). loc([2,3]). loc([2,4]). loc([2,5]). loc([2,6]). loc([2,7]). loc([2,8]).
loc([3,1]). loc([3,2]). loc([3,3]). loc([3,4]). loc([3,5]). loc([3,6]). loc([3,7]). loc([3,8]).
loc([4,1]). loc([4,2]). loc([4,3]). loc([4,4]). loc([4,5]). loc([4,6]). loc([4,7]). loc([4,8]).
loc([5,1]). loc([5,2]). loc([5,3]). loc([5,4]). loc([5,5]). loc([5,6]). loc([5,7]). loc([5,8]).
loc([6,1]). loc([6,2]). loc([6,3]). loc([6,4]). loc([6,5]). loc([6,6]). loc([6,7]). loc([6,8]).
loc([7,1]). loc([7,2]). loc([7,3]). loc([7,4]). loc([7,5]). loc([7,6]). loc([7,7]). loc([7,8]).
loc([8,1]). loc([8,2]). loc([8,3]). loc([8,4]). loc([8,5]). loc([8,6]). loc([8,7]). loc([8,8]).


/* RULES */

/* to solve the puzzle, all eight queens must be placed in locations such that no two queens threaten each other */
/* the rule, eightQueens, takes in a list of 8 queens (Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8) from the shell. */
/* it then, all at once, declares that all queens must be valid with each other */

eightQueens(Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8) :-
	/* all queens are locations */
	loc(Q1), loc(Q2), loc(Q3), loc(Q4), loc(Q5), loc(Q6), loc(Q7), loc(Q8),
	/* check to see if all eight queens are valid with each other */
	valid(Q1, Q2), valid(Q1, Q3), valid(Q1, Q4), valid(Q1, Q5), valid(Q1, Q6), valid(Q1, Q7), valid(Q1, Q8), 
	valid(Q2, Q3), valid(Q2, Q4), valid(Q2, Q5), valid(Q2, Q6), valid(Q2, Q7), valid(Q2, Q8), 
	valid(Q3, Q4), valid(Q3, Q5), valid(Q3, Q6), valid(Q3, Q7), valid(Q3, Q8), 
	valid(Q4, Q5), valid(Q4, Q6), valid(Q4, Q7), valid(Q4, Q8), 
	valid(Q5, Q6), valid(Q5, Q7), valid(Q5, Q8), 
	valid(Q6, Q7), valid(Q6, Q8), 
	valid(Q7, Q8).

/* two queens are considered to be in valid locations if queen2 is not in the span of queen1 (and therefore queen1 is not in the span of queen2) */
/* queen2 is in the "span" of queen1 if it is either in the same column, the same row, or it can be reached diagonally from queen 1 */
/* the rule, valid, takes in two queen locations and tests to make sure Queen2 ("[C|D]") isn't in the span of Queen1 ("[A|B]") */

valid([A|B], [C|D]) :- 
	/* do four tests to make sure Queen2 isn't in the span of Queen1 */
	A =\= C,			% makes sure they are not in same row
	B =\= D,			% makes sure they are not in same column
	C - A =\= D - B,	% makes sure they are not in same \ (down to right) directed diagonal 
	C - A =\= B - D.    % makes sure they are not in same / (up to right) directed diagonal 


