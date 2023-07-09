%% Char type

char(C) :- char_code(C, _).

gen_char(C) :-
    repeat,
    random_between(0, 7935, Code),
    (char_code(C, Code), !; fail).