convert([],[]).
convert([X,X2,X3|_], Y) :- 
					swaperoo(X2, Z), % convert first element
					swaperoo(X3, W), % convert second element
					append(Z, W, G), % put together
					append(G, [X], Y). % add on first operator to end of list

convert(X,Y) :- append([], [X], Y). % single element
swaperoo([X|Xs], Y) :- append(Xs, [X], Y). % swap nested list
swaperoo(X, Y) :- append([], [X], Y). % list not nested, just do a return

append([],X,X). % append
append([X|L1], L2, [X|L3]) :- append(L1,L2,L3).