sentence([]).

sentence([X|Xs]) :- checkT([X|Xs]) ->
						checkStoTNT(Xs)
					;
						checkF([X|Xs])
					;
						end(X) -> 
							length(Xs, 0) -> true; false
					;
						sentence(Xs).
					
checkStoTNT([X1,X2|Xs]) :- nterminals(X1), tterminals(X2) ->
							[Z|Zs] = Xs ->
								else(Z) ->
									sentence(Zs)
								;
									sentence([]).
checkF([X|Xs]) :- if(X) ->
						[Z1,Z2,Z3,Z4,Z5|Zs] = Xs, checkBtoTET([Z1,Z2,Z3,Z4,Z5|Zs]) ->
							[W|Ws] = Zs, then(W), [G|Gs] = Ws, begin(G) ->
								sentence(Gs).

checkBtoTET([X|Xs]) :- bterminals(X) ->
						[Z|Zs] = Xs, checkT([Z|Zs]) ->
							[W|Ws] = Zs, checkE([W|Ws]) ->
								[G|Gs] = Ws, checkT([G|Gs]),
								[H|Hs] = Gs, bterminals(H).
										
checkT([X|Xs]) :- tterminals(X).
checkE([X|Xs]) :- eterminals(X).
bterminals(Ele) :- memberchk(Ele, ['(',')']).
eterminals(Ele) :- memberchk(Ele, ['>','<']).
tterminals(Ele) :- memberchk(Ele, ['x','y','z',1,0]).
nterminals(Ele) :- memberchk(Ele, ['+','-','=']).
if(if).
then(then).
else(else).
begin(begin).
end(end).
greaterThanZeroFail([X]) :- X > 0, !.