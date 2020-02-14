solve([G,E,T,B,Y,A,R]) :-

dig(E), dig(T), 
dig(Y), dig(A), dig(R),
dig(G), dig(B),


G > 0, B > 0,
E is (Y * T) mod 10, C1 is (Y * T) // 10,
B is (Y * E + C1) mod 10, C10 is (Y * E + C1) // 10,
A is (Y * G + C10) mod 10, B is (Y * G + C10) // 10,
T is (B * T) mod 10, CC1 is (B * Y) // 10,
E is (B * E + CC1) mod 10, CC10 is (B *  E + CC1) // 10,
G is (B * G + CC10) mod 10,
R is (B + T) mod 10, CS1 is (B + T) // 10,
A is (A + E + CS1) mod 10, CS10 is (A + E + CS1) // 10,
E is (B + G + CS10) mod 10, B is (B + G + CS10) // 10, 

all_diff([G,E,T,B,Y,A,R]).

dig(0). 
dig(1). 
dig(2). 
dig(3). 
dig(4). 
dig(5). 
dig(6). 
dig(7). 
dig(8). 
dig(9).

all_diff([]).
all_diff([N|L]) :- not mymember(N,L), all_diff([N|L]).

mymember(N,[N|L]).
mymember(N,[M|L]) :- mymember(N,L).