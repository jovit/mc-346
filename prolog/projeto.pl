reverse([],[]).
reverse([H|T],R) :- reverseacc([H|T],R,[]).
reverseacc([],R,R).
reverseacc([H|T],R,ACC) :- reverseacc(T,R,[H|ACC]).

check_intersections([], "").
check_intersections([],  "").

convert_to_char_arrays([],[]).
convert_to_char_arrays([H|T],[H2|T2]):-string_chars(H, H2), convert_to_char_arrays(T, T2).

does_match(_,_,4).
does_match([H1|T1],[H2|T2],NUM) :- H1=H2, NUM < 4, NUM2 is NUM+1, does_match(T1,T2,NUM2).

find_matches(_,[],[]).
find_matches(IT, [H|T], [H|R]) :- IT \= H, reverse(IT,RIT), does_match(RIT,H,0), find_matches(IT, T, R), !.
find_matches(IT, [IT|T], R) :-find_matches(IT, T, R), !.
find_matches(IT, [H|T], R) :- reverse(IT,RIT), \+(does_match(RIT,H,0)), find_matches(IT, T, R), !.


print_matches([H|T],L) :- find_matches(H,L,M), print(M), print_matches(T, L).

main :- read_string(user_input,_,X), split_string(X,"\n", "",SP), convert_to_char_arrays(SP, CA), print_matches(CA, CA).
