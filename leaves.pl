tree(E, L, R).

leaves(void, 0).
leaves(tree(X, void, void), 0).
leaves(tree(X, L, void), C) :- leaves(L, C1).
leaves(tree(X, void, R), C) :- leaves(R, C1).
leaves(tree(X, L, R), C) :- leaves(L, C1), leaves(R, C1), C is C1+2.

rangeTenForty([], X).
rangeTenForty([H|L], [H|L1]) :- H > 9, H < 41, rangeTenForty(L, L1).
rangeTenForty([H|L], L1) :- rangeTenForty(L, L1).

validNum(10,X) :- myappend(10,X,X1).
validNum(40,X) :- myappend(40,X,X1).
validNum(H,X) :- H < 10.
validNum(H,X) :- H > 40.
validNum(H,X) :- H > 10, H < 40, myappend([H], X1, X).

merge([], [], R, 0).
merge([H1|L1], [H2|L2], R, N) :- H1>H2, merge(L1, L2, R1, N1), myappend([H2, H1], R1, R), N is N1+2.
merge([H1|L1], [H2|L2], R, N) :- H2>H1, merge(L1, L2, R1, N1), myappend([H1, H2], R1, R), N is N1+2.
merge([H1|L1], [H2], R, N) :- H1>H2, myappend([[H2,H1]|L1], R1, R).

mymember(E, L) :- myappend(X, [E|Y], L).

myappend([], L, L).
myappend([H | L1], L2, [H|L]) :- myappend(L1, L2, L).