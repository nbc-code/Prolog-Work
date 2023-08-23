duplicate([], []).
duplicate([X|Xs], Y) :-	member(X,Xs) -> % appears later in list, skip element
							duplicate(Xs, Y).
duplicate([X|Xs], [X|Y]) :- duplicate(Xs, Y).