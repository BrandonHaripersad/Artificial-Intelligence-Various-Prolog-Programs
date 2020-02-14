/* Tree Predicate that represents a Binary Tree, which is a tree that has at most 2 Child Nodes */ 
tree(void, void, void).
tree(X, void, void).
tree(X, L, R) :- tree(L, L1, R1), tree(R, L2, R2).

/* Replace Predicate, replace(X, Y, T1, T2) replaces every occurence of X in T1, T2 is a given binary tree or a variable to compute the new binary tree */ 
replace(X, Y, tree(X, void, void), tree(Y, void, void)).
replace(X, Y, tree(Q, void, void), tree(Q, void, void)).
replace(X, Y, tree(X, L, R), tree(Y, L1, R1)) :- replace(X, Y, L, L1), replace(X, Y, R, R1).
replace(X, Y, tree(Q, L, R), tree(Q, L1, R1)) :- replace(X, Y, L, L1), replace(X, Y, R, R1).

/*  replace(a,b, tree(a, tree(c,void,void), tree(a,void,void)), T).
	T= tree(b, tree(c,void,void), tree(b,void,void))
	
	replace(7,9, tree(4, tree(2,tree(1,void,void),tree(3,void,void)),tree(6,tree(5,void,void),tree(7,void,void))), X).
	X = tree(4, tree(2, tree(1, void, void), tree(3, void, void)), tree(6, tree(5, void, void), tree(9, void, void)))
	

	Expand predicate, expnads the tree by inserting a node X into the tree while maintaining the properties of a Binary Tree, which are - The Root Element is 
	greater than or equal to the all the elements in the Left Tree and - The Root Element is less than or equal to all the elements in the Right Tree.

*/

expand(X, void, void).
expand(X, tree(X, void, void), tree(X, void, void)).
expand(X, tree(E, void, void), tree(E, void, R1)) :- (X >= E), expand(X, tree(X, void, void), R1).
expand(X, tree(E, void, void), tree(E, L1, void)) :- (X =< E), expand(X, tree(X, void, void), L1).
expand(X, tree(E, L, R), tree(E, L1, R1)) :- expand(X, L, L1), expand(X, R, R1).

/* 
	expand(2, tree(4,void,void),T2)
*/