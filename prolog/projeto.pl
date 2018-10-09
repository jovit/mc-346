reverse([],[]).
reverse([H|T],R) :- reverseacc([H|T],R,[]).
reverseacc([],R,R).
reverseacc([H|T],R,ACC) :- reverseacc(T,R,[H|ACC]).

convert_to_char_arrays([],[]).
convert_to_char_arrays([H|T],[H2|T2]):-string_chars(H, H2), convert_to_char_arrays(T, T2).

does_match(_,_,4).
does_match([H1|T1],[H2|T2],NUM) :- H1=H2, NUM < 4, NUM2 is NUM+1, does_match(T1,T2,NUM2).


find_matches(_,[],[]).
find_matches(IT, [H|T], [H|R]) :- IT \= H, reverse(IT,RIT), does_match(RIT,H,0), find_matches(IT, T, R), !.
find_matches(IT, [IT|T], R) :-find_matches(IT, T, R), !.
find_matches(IT, [H|T], R) :- reverse(IT,RIT), \+(does_match(RIT,H,0)), find_matches(IT, T, R), !.

join_segments(X,[Y], R) :- append(X,Y,R).

replace_segment(OLD, NEW, [H|T],[NEW|T]) :- H = OLD.
replace_segment(OLD, NEW, [H|T],[H|R2]) :- H \= OLD, replace_segment(OLD,NEW,T,R2).

join_all_segments([], L, L).
join_all_segments([H|_], L, R2) :- find_matches(H,L,M), length(M,SM), SM = 1, join_segments(H, M, J), replace_segment(H, J, L, R), join_all_segments(R,R,R2).
join_all_segments([H|T], L, R) :- find_matches(H,L,M), length(M,SM), SM \= 1, join_all_segments(T,L,R).

find_all_alternatives([], []).
find_all_alternatives([H|T],[R|R2]) :- join_all_segments(H,H,R), find_all_alternatives(T, R2).

main :- read_string(user_input,_,X), split_string(X,"\n", "",SP), convert_to_char_arrays(SP, CA), findall(P, permutation(CA, P), PS), find_all_alternatives(PS, ALT), print(ALT).
