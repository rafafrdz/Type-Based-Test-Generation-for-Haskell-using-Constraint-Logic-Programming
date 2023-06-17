:- consult('../types/gen_types').
:- consult('../types/all').


either(A, B, left(X11)) :- types:gen(A, X11).
either(A, B, right(X21)) :- types:gen(B, X21).

%% Example:
%% either(int, string, X).
%% X = left(-203662966) ;
%% X = right("Ӈ\u0894ԏȻᔉڣ༉Ⴂᢋऽ፰ᣨᒮᝬ፰ཉ᳃ॐׁ߇ᎅࢻኧܝֻܼޯIᤡᮃڦᩝ\u001D\u0AC6ᖱԇᄟၾࡴɬ").
