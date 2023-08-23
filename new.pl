post2pre(Post, Pre) :-
    post2pre(Post, [], Pre).

post2pre([E|T], PreNest, Pre) :-
    (   unary_op(E)
    ->  PreNest = [Term|PNT],
        post2pre(T, [[E,Term]|PNT], Pre)
    ;   binary_op(E)
    ->  PreNest = [Term2,Term1|PNT],
        post2pre(T, [[E,Term1,Term2]|AP], Pre)
    ;   post2pre(T, [E|PreNest], Pre)
    ).
post2pre([], PreNest, Pre) :-
    flatten(PreNest, Pre).

unary_op(X) :-
    memberchk(X, [sin, cos, tan]).

binary_op(X) :-
    memberchk(X, [+, -, /, *]).