% to run, execute: swipl -q -g main io.pl < in
main :- read_string(user_input,END,X), split_string(X,"\n", "",SP), print(SP), print(END).
