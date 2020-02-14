/* Helping Predicates */

counter([], 0).
counter([_|T], N) :- count(T, N1), N is N1+1.

dictionary(1, one).
dictionary(2, two).
dictionary(3, three).
dictionary(4, four).
dictionary(5, five).
dictionary(6, six).
dictionary(one, 1).
dictionary(two, 2).
dictionary(three, 3).
dictionary(four, 4).
dictionary(five, 5).
dictionary(six, 6).

match(X, []).
match(X, Y) :- not(X=Y).
match(X, Y) :- X = Y.

myappend([], Y, Y).
myappend([H|X], Y, [H|Z]) :- myappend(X, Y, Z).

mylength(0, []).
mylength(L, [H|T]) :- mylength(L1,T), L is L1+1.

checkLength(0, []).
checkLength(N, []).
checkLength(N, H) :- N > mylength(H).

grep2(E, [E | T ], O, 1).
grep2(E, [H | L1], O1, Count) :- grep2(E, L1, O, Count1), Count is Count1+1.

add(0, [], X).

add(N, [], []).

add(N, [H | L1], [H | X1]) :- N1 is N-1, add(N1, L1, X1).

convert([], []).

convert([H1|L1], [H2|X1]) :- convert(L1, X1), dictionary(H1, H2).

grep([], [], O).

grep(X,[],O).

grep(E, [H1 | L1], O1) :- grep2(E, [H1 | L1], O1, Count), myappend(O, [Count], O1).







