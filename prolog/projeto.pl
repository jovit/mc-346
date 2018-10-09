reverse([], []).
reverse([H|T], R) :-
    reverseacc([H|T], R, []).
reverseacc([], R, R).
reverseacc([H|T], R, ACC) :-
    reverseacc(T, R, [H|ACC]).

convert_to_char_arrays([], []).
convert_to_char_arrays([H|T], [H2|T2]) :-
    string_chars(H, H2),
    convert_to_char_arrays(T, T2).

take_first(_, 0, []) :- !.
take_first([], _, []) :- !.
take_first([H|T], N, [H|T2]) :-
    NN is N-1,
    take_first(T, NN, T2), !.

does_match(L1, L2, N) :-
    reverse(L1, RL1),
    take_first(RL1, N, FL1),
    take_first(L2, N, FL2),
    reverse(FL1, RFL1),
    RFL1 = FL2,
    length(FL2, L),
    L=N,
    !.
does_match(L1, L2, N) :-
    reverse(L1, RL1),
    take_first(RL1, N, FL1),
    take_first(L2, N, FL2),
    reverse(FL1, RFL1),
    RFL1 \= FL2,
    length(FL2, LEN1),
    length(RFL1, LEN2),
    LEN1=N,
    LEN2=N,
    NN is N + 1,
    does_match(L1, L2, NN),
    !.


find_matches(_, [], []).
find_matches(IT, [H|T], [H|R]) :-
    IT\=H,
    does_match(IT, H, 4),
    find_matches(IT, T, R), !.
find_matches(IT, [IT|T], R) :-
    find_matches(IT, T, R), !.
find_matches(IT, [H|T], R) :-
    \+ does_match(IT, H, 4),
    find_matches(IT, T, R), !.

remove_common([], X, X) :- !.
remove_common(_, [], []) :- !.
remove_common([H|T1], [H|T2], R) :-
    H=H,
    remove_common(T1, T2, R), !.
remove_common([H1|_], [H2|T2], T2) :-
    H1\=H2, !.

join_segments(X, [Y|_], R) :-
    reverse(X, RX),
    remove_common(RX, Y, RCY),
    append(X, RCY, R).

replace_segment(OLD, NEW, [H|T], [NEW|T]) :-
    H=OLD.
replace_segment(OLD, NEW, [H|T], [H|R2]) :-
    H\=OLD,
    replace_segment(OLD, NEW, T, R2).

remove_segment(IT, [H|T], T) :-
    H=IT.
remove_segment(IT, [H|T], [H|R2]) :-
    H\=IT,
    remove_segment(IT, T, R2).

join_all_segments([], L, L).
join_all_segments([H|_], L, R2) :-
    find_matches(H, L, M),
    length(M, SM),
    SM>0,
    join_segments(H, M, J),
    replace_segment(H, J, L, RX),
    [MA|_]=M,
    remove_segment(MA, RX, R),
    join_all_segments(R, R, R2).
join_all_segments([H|T], L, R) :-
    find_matches(H, L, M),
    length(M, SM),
    SM=0,
    join_all_segments(T, L, R).

find_all_alternatives([], []).
find_all_alternatives([H|T],[R|R2]) :- join_all_segments(H,H,R), writeln(R), find_all_alternatives(T, R2).

main :- read_string(user_input,_,X), split_string(X,"\n", "",SP), convert_to_char_arrays(SP, CA), findall(P, permutation(CA, P), PS), find_all_alternatives(PS, ALT).
