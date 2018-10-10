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
    RFL1=FL2,
    length(FL2, L),
    L=N, !.
does_match(L1, L2, N) :-
    reverse(L1, RL1),
    take_first(RL1, N, FL1),
    take_first(L2, N, FL2),
    reverse(FL1, RFL1),
    RFL1\=FL2,
    length(FL2, LEN1),
    length(RFL1, LEN2),
    LEN1=N,
    LEN2=N,
    NN is N+1,
    does_match(L1, L2, NN), !.


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

skip_first([], _, []).
skip_first(X, 0, X).
skip_first([_|T], N, R) :-
    NN is N-1,
    skip_first(T, NN, R).

remove_common([], X, _, X) :- !.
remove_common(_, [], _, []) :- !.
remove_common(L1, L2, N, R) :-
    does_match(L1, L2, N),
    NN is N+1,
    \+ does_match(L1, L2, NN),
    skip_first(L2, N, R), !.
remove_common(L1, L2, N, R) :-
    does_match(L1, L2, N),
    NN is N+1,
    does_match(L1, L2, NN),
    remove_common(L1, L2, NN, R), !.

join_segments(X, [Y|_], R) :-
    remove_common(X, Y, 4, RCY),
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

write_list([]).
write_list([H|T]) :-
    write(H),
    write_list(T).

write_results([]).
write_results([H|T]) :-
    write_list(H),
    writeln(""),
    write_results(T).

main :-
    read_string(user_input, _, X),
    split_string(X, "\n", "", SP),
    convert_to_char_arrays(SP, CA),
    join_all_segments(CA, CA, R),
    write_results(R).
