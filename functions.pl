list(Op, Ref, List) :- (
    Op=('=='), findall([X,Y,Z], (pay(X, Y, Z), Z=:=Ref), List);
    Op=('!='), findall([X,Y,Z], (pay(X, Y, Z), Z=\=Ref), List);
    Op=('>'), findall([X,Y,Z], (pay(X, Y, Z), Z>Ref), List);
    Op=('>='), findall([X,Y,Z], (pay(X, Y, Z), Z>=Ref), List);
    Op=('<'), findall([X,Y,Z], (pay(X, Y, Z), Z<Ref), List);
    Op=('<='), findall([X,Y,Z], (pay(X, Y, Z), Z=<Ref), List)
).

count(Op, Ref, Count) :- (
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  length(List, Count);
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  length(List, Count);
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  length(List, Count);
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  length(List, Count);
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  length(List, Count);
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  length(List, Count)
).

total(Op, Ref, Total) :- (
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  find_total(List, T), Total is T;
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  find_total(List, T), Total is T;
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  find_total(List, T), Total is T;
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  find_total(List, T), Total is T;
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  find_total(List, T), Total is T;
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  find_total(List, T), Total is T
).

avg(Op, Ref, Avg) :- (
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  find_avg(List, A), Avg is A;
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  find_avg(List, A), Avg is A;
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  find_avg(List, A), Avg is A;
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  find_avg(List, A), Avg is A;
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  find_avg(List, A), Avg is A;
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  find_avg(List, A), Avg is A
).

min(Op, Ref, Min) :- (
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  find_min(List, M), Min is M;
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  find_min(List, M), Min is M;
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  find_min(List, M), Min is M;
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  find_min(List, M), Min is M;
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  find_min(List, M), Min is M;
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  find_min(List, M), Min is M
).

max(Op, Ref, Max) :- (
    Op=('=='), findall(Z, (pay(X, Y, Z), Z=:=Ref), List),  find_max(List, M), Max is M;
    Op=('!='), findall(Z, (pay(X, Y, Z), Z=\=Ref), List),  find_max(List, M), Max is M;
    Op=('>'), findall(Z, (pay(X, Y, Z), Z>Ref), List),  find_max(List, M), Max is M;
    Op=('>='), findall(Z, (pay(X, Y, Z), Z>=Ref), List),  find_max(List, M), Max is M;
    Op=('<'), findall(Z, (pay(X, Y, Z), Z<Ref), List),  find_max(List, M), Max is M;
    Op=('<='), findall(Z, (pay(X, Y, Z), Z=<Ref), List),  find_max(List, M), Max is M
).

find_total([], 0).
find_total([X|Xs], Total) :- find_total(Xs, RestTotal), Total is X + RestTotal.

find_avg(List, Avg) :- find_total(List, Total), length(List, Length), (Length > 0 -> Avg is Total / Length ; Avg is 0).

find_min([X], X).
find_min([X,Y|Xs], Min) :- X =< Y, find_min([X|Xs], Min) ; find_min([Y|Xs], Min).

find_max([X], X).
find_max([X,Y|Xs], Max) :- X >= Y, find_max([X|Xs], Max) ; find_max([Y|Xs], Max).