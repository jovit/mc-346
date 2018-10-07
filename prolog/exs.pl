
insereabb(CHAVE, X, vazia, arv(CHAVE, X,vazia,vazia)).
insereabb(CHAVE, X, arv(CHAVE,_,AE,AD), arv(CHAVE,X,AE,AD)).
insereabb(CHAVE, X, arv(CHAVE2,Y,AE,AD), arv(CHAVE2,Y,AAE,AD)) :- CHAVE < CHAVE2, !, insereabb(CHAVE, X, AE, AAE).
insereabb(CHAVE, X, arv(CHAVE2, Y,AE,AD), arv(CHAVE2,Y,AE,AAD)) :- CHAVE >= CHAVE2, !, insereabb(CHAVE, X, AD, AAD).

trocaabb(CH, X, arv(CH,_,AE,AD), arv(CH,X,AE,AD)).
trocaabb(CH, X, arv(CH2,Y,AE,AD), arv(CH2,Y,AAE,AD)) :- CH < CH2, !, trocaabb(CH, X, AE, AAE).
trocaabb(CH, X, arv(CH2,Y,AE,AD), arv(CH2,Y,AAE,AD)) :- CH >= CH2, !, trocaabb(CH, X, AE, AAE).

lookupabb(CH, arv(CH,X,_,_), X).
lookupabb(CH, arv(CH2,_,AE,_), X) :- CH < CH2, !, lookupabb(CH, AE, X).
lookupabb(CH, arv(CH2,_,_,AD), X) :- CH >= CH2, !, lookupabb(CH, AD, X).




getdic(CH, A, V):-lookupabb(CH, A, V), !.

xgetdic(CH, A, D, V) :- \+(lookupabb(CH, A, V)),!, V=D.
xgetdic(CH, A, _, V) :- lookupabb(CH, A, V), !.

putdic(CH, V, O, N) :- insereabb(CH, V, O, N).