mypred(X, Y, Z) :- ((X*X) =:= (Y-2)) -> % first if statement
						(Y =:= (X+8)) -> % nested, second if statement
							(Y is (X+8)), (Z is (X+Y-5)) % if true
							; 
							(X is (Y+4)), (Z is (X-Y+5)). % else this