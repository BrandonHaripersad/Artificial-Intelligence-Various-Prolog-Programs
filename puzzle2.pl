solve([O,N,E,T,W]) :-
dig(E), O is (E+E) mod 10,
T is (O+O),
dig(N), W is (N+N) mod 10,
all_diff([O,N,E,T,W]).

dig(1). 
dig(2). 
dig(3). 
dig(4). 
dig(5). 
dig(6). 
dig(7). 
dig(8). 
dig(9).

car(1). car(0).

all_diff([]).
all_diff([N|L]) :- not mymember(N,L), all_diff(L).

mymember(N,[N|L]).
mymember(N,[M|L]) :- mymember(N,L).