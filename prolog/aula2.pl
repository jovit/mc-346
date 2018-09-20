% tamanho de uma lista
tam(L,N) :- tam(L,N,0).
tam([],N,ACC) :- N=ACC.
tam([_|T],N,ACC) :- IA is ACC + 1, tam(T,N,IA).
% soma dos elementos de uma lista soma(+LISTA,-SOMA)
soma(L,S) :- soma(L,S,0).
soma([],S,A) :- S=A.
soma([H|T],S,A) :- ACC is A + H, soma(T,S,ACC).

% soma dos números pares de uma lista somap(+LISTA,-SOMA)
par(N) :- 0 is mod(N,2).
somap(L,S) :- somap(L,S,0).
somap([],S,A) :- S=A.
somap([H|T],S,A) :- par(H), AA is A + H, somap(T,S,AA).
somap([H|T],S,A) :- \+(par(H)), somap(T,S,A).

% soma dos elementos nas posições pares da lista ( o primeiro elemento esta na posicao 1) somapares(+LISTA,-SOMA)
somapares(L,S) :- somapares(L,S,0,1).
somapares([],S,A,_) :- S=A.
somapares([H|T],S,A,P) :- par(P), PP is P + 1, AA is A + H, somapares(T,S,AA,PP).
somapares([_|T],S,A,P) :- \+(par(P)), PP is P + 1, somapares(T,S,A,PP).

% existe item na lista elem(+IT,+LISTA)
elem(_,[]) :- false.
elem(IT,[H|_]) :- IT=H.
elem(IT, [H|T]) :- \+(it=H), elem(IT,T).

% posição do item na lista: 1 se é o primeiro, falha se nao esta na lista pos(+IT,+LISTA,-POS)
pos(IT,L,POS) :- pos(IT,L,POS,0).
pos(IT,[H|_],POS,I) :- H=IT, POS=I.
pos(IT, [H|T], POS, I) :- II is I+1, \+(H=IT), pos(IT, T, POS, II).


% conta quantas vezes o item aparece na lista (0 se nenhuma) conta(+IT,+LISTA,-CONTA)


% maior elemento de uma lista - maior(+LISTA,-MAX)
% reverte uma lista -
% intercala 2 listas (intercala1 e intercala2)
% intercala1([1,2,3], [4,5,6,7,8], X).
%  X =  [1,4,2,5,3,6]
% intercala2([1,2,3], [4,5,6,7,8], Y),
%  Y =   [1,4,2,5,3,6,7,8]
% a lista ja esta ordenada?
% dado n gera a lista de 1 a n
% retorna o ultimo elemento de uma lista
% retorna a lista sem o utlimo elemento
% shift right
% shiftr([1,2,3,4],X)
%  X = [4,1,2,3]
% shiftr n lista (shift right n vezes)
% shift left
% shift left n vezes
% remove item da lista (1 vez so)
remove(_,[],[]).
remove(IT,[IT|T],T).
remove(IT,[X|T],R) :- IT \= X, remove(IT,T,RR), R = [X|RR].

% remove item da lista (todas as vezes)
% remove item da lista n (as primeiras n vezes)
% remove item da lista (a ultima vez que ele aparece) **
% troca velho por novo na lista (1 so vez)
% troca velho por novo na lista (todas vezes)
% troca velho por novo na lista n (as primeiras n vezes)