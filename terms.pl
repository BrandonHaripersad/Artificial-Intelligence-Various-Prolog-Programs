/* Next Predicate, will represent a list [Head|Tail]. */ 

next(X, null).
next(X, Y).

/* Cons Predicate, will transform a List into a symbolic representation of a Linked List using the next predicate. */

cons([], null).
cons([[]], null).
cons([[[]]], null).
cons([[[H1 | L1]]], next(next(next(H1, X), null),null)) :- cons(L1, X).
cons([[H1 | L1]], next(next(H1, X),null)) :- cons(L1, X).
cons([[[H1 | L1], Q], R], next(next(next(H1, X), next(Q, X)), next(R,null))) :- cons(L1, X).
cons([[H1 | L1], Q], next(next(H1, X),next(Q,null))) :- cons(L1, X).
cons([H1 | L1], next(H1, X)) :- cons(L1, X).

/* Linked2List predicate, will transform a symbolical representation of a Linked List back into a standard ProLog list */

linked2List(null, []).
linked2List(next(next(E, next(next(Y, null), null)), T1), [[E | [[Y]] ] | X]) :- linked2List(T1, X).
linked2List(next(next(E, next(next(Y, null), null)), T1), [[E | [[Y]] ] | X]) :- linked2List(T1, X).
linked2List(next(next(E, next(next(Y, T), next(Z, null))), T1), [[E | [ [Y]| [Z] ] ] | X]) :- linked2List(T1, X).
linked2List(next(next(E, null), T), [[E] | X]) :- linked2List(T, X).
linked2List(next(next(E, next(Y, null)), T1), [[E | [Y]] | X]) :- linked2List(T1, X).
linked2List(next(E, T1), [E | X]) :- linked2List(T1, X).
linked2List(next(E, null), [E]).

/*
next(a, next(next(b, null), next(c, null)))
next(a, next(next(b, next(c, null)), next(d, null)))
[a, [b,c], d]

next(a, next(next(b, next(next(c, null), next(d,null)) ), next(e, null)) )
[a, [b, [c], d], e]

next(a, next(next(b, next(next(c, null), null)), null))
[a, [b, [c]]]

next(a, next(next(b, next(next(c, next(d, null)), next(e, null))), next(f, null)))
[a, [b, [c, d], e], f]
*/