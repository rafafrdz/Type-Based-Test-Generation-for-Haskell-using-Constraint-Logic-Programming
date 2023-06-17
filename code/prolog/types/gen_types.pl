:- module(types, [gen/2, ugen/2]).
:- consult('../types/all').


gen(Type, X) :-
        catch(
            call_with_time_limit(2, ggen(Type, X)),
            time_limit_exceeded,
            pred(Type,X)
            ).
            
% gen(Type, X) :- (ggen(Type, X), !; fail).

%% Generator
ggen(Type, X) :-
    rel_type(Type, G),
    call(G, X).

ggen(Type, X) :- pred(Type, X).

%% Predicate
pred(Type, X) :-
    pred_type(Type, G),
    call(G, X).

%% Undefined extension of Generator
ugen(Gen, X) :- call(Gen, X).

%% Generator relationship
rel_type(char, generator:gen_char).
rel_type(string, generator:gen_string).
rel_type(int, generator:gen_int).
rel_type(integer, generator:gen_integer).
rel_type(bool, generator:gen_bool).
rel_type(unit, generator:gen_unit).

%% Predicate relationship
pred_type(char, generator:char).
pred_type(string, string).
pred_type(int, generator:int).
pred_type(integer, integer).
pred_type(bool, generator:bool).
pred_type(unit, generator:unit).