soma1(CHAVE, [], [dic(CHAVE,1)]).
soma1(CHAVE, [dic(CHAVE,V)|R], [dic(CHAVE,VV)|R]) :- VV is V+1, !.
soma1(CHAVE, [X|R], [X|RR]) :- soma1(CHAVE, R, RR), !.