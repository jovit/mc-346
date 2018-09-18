pai(antonio,bernardo).
pai(antonio,fabio).
pai(antonio,roger).
pai(bernardo,caio).
pai(antonio,gabriel).
pai(bernardo,davi).
pai(jorge,antonio).
pai(jorge,bernardo).

avo(X,Y) :- pai(X,Z),pai(Z,Y).
irmao(X,Y) :- pai(Z,X),pai(Z,Y), X\=Y.

ante(X,Y) :- pai(X,Y).
ante(X,Y) :- pai(X,Z),ante(Z,Y).

mae(maria,antonio).

mae(marcia,bernardo).
mae(marcia,fabio).

meioirmao(X,Y) :- pai(Z,X), pai(Z,Y), \+ (mae(K,X),mae(K,Y)), X\=Y.
meioirmao(X,Y) :- mae(M,X), mae(M,Y), \+ (pai(P,X),pai(P,Y)), X\=Y.

% ex : tio
% mae
% meio irmao
% irmao de sangue (mesmo pai e mesma mae)
% primo

irmaosangue(X,Y) :- pai(Z,X), pai(Z,Y), mae(M,X), mae(M,Y), X\=Y.

primo(X,Y) :- pai(P1,X), pai(P2,Y), irmao(P1,P2).
tio(X,Y) :- pai(P,Y), irmao(P,X), X \= Y.