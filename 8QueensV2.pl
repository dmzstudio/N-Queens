/* 		2nd Version:																 														*/
/* 			This version is an improvement compared to version 1, but still has a very long runtime when testing with 8 Queens 				*/
/* 			It can, however solve the puzzle with 7 queens on an 8x8 board in about a minute (and 6 queens in about 2 seconds!)				*/
/* 			The query to send for the 7 queens case is  ?- eightQueens([Q1, Q2, Q3, Q4, Q5, Q6, Q7]).										*/
/*						 																													*/
/* 			Unlike version 1, this version uses recursion to solve the puzzle and takes in only one parameter: a list of the Queens. 		*/
/* 			Although it uses recursion, it uses similar logic to version 1: it tests Q1 against all the queens after it, 					*/
/* 			then tests Q2 against all the queens after it, etc. 																			*/
/* 			Thus, it uses recursion starting from the front of the list, checking to see if each queen is valid with those after it			*/
/* 			The "valid" rule is also recursive in that it recursively tests the head against each of the Queens in the tail					*/
/*						 																													*/
/* 		QUERY TO SEND FROM SHELL: ?- eightQueens([Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8]). (this will not complete though)							*/
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
/* the rule, eightQueens, initially takes in a list of 8 queens, [Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8], from the shell. */
/* it then recursively goes through list of queens (starting at the front) & makes sure every queen is valid with those after it */

eightQueens([_|[]]).   % basecase is true (when it hits the end of the list of queens)

eightQueens([Q1|[Q2|QS]]) :-   % recursive step
	/* queen's location must be valid with those after it */
	valid(Q1, [Q2|QS]),
	/* then recurse on the tail of the list, which ultimately tests all the queens */
	eightQueens([Q2|QS]).

/* two queens are considered to be in valid locations if queen2 is not in the span of queen1 (and therefore queen1 is not in the span of queen2) */
/* queen2 is in the "span" of queen1 if it is either in the same column, the same row, or it can be reached diagonally from queen 1 */
/* the rule, valid, takes in a queen location "Q" (or "[A|B]") & a list of queen locations "[Q2|QS]" (or "[[C|D]|QS]") */
/* it then recursively checks [A|B] against the queens in [[C|D]|QS], asserting that their locations must be valid */

valid([A|B], []).    % basecase is true

valid([A|B], [[C|D]|QS]) :-     % recursive step
	/* the queens are locations */
	loc([A|B]), loc([C|D]),
	/* do four tests to make sure [C|D] isn't in the span of [A|B] */
	A =\= C,			% makes sure they are not in same row
	B =\= D,			% makes sure they are not in same column
	C - A =\= D - B,	% makes sure they are not in same \ (down to right, up to left) directed diagonal 
	C - A =\= B - D,    % makes sure they are not in same / (up to right, down to left) directed diagonal 
	/* then test [A|B] against remaining QS */
	valid([A|B], QS).