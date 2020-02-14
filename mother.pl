person(1).
person(2).
person(3).
person(4).

solve([Ter, Sar, Lau, Jan, Ann, Bri, Cha, Dan]) :-
person(Lau), person(Jan),
person(Bri), not(Bri = 4),
person(Sar), Sar = 1, person(Ann), Ann = 1,
person(Lar), Lar = 2,
person(Dan), person(Cha), Dan > Cha,
person(Ter), Ter = 4,
Cha > Lar,
all_diff([Ter, Sar, Lau, Jan]),
all_diff([Ann, Bri, Cha, Dan]).

all_diff([]).
all_diff([N|L]) :- not mymember(N,L), all_diff(L).

mymember(N,[N|L]).
mymember(N,[M|L]) :- mymember(N,L).