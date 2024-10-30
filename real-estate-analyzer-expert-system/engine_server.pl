:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- consult('engine.pl').

:- http_handler(root(realestates), handle_real_estates, []).

start_server(Port) :-
    http_server(http_dispatch, [port(Port)]).

handle_real_estates(Request) :-
    http_read_json_dict(Request, DictIn),
    %process_request(DictIn, DictOut),
    reply_json(DictOut).

process_request(DictIn, DictOut) :-
    _{preferences: Preferences} :< DictIn
     -> get_real_estates(Preferences, RealEstates),
       DictOut = _{realEstates: RealEstates}
;   DictOut = _{error: "Missing preferences"}.

    generate_json_string(PrologTerm, String) :-
    atom_json_dict(String, PrologTerm, []).

get_real_estates(Preferences, RealEstates) :-
    load_kb,
    start_engine,
    findall(Dict,
        (fact(_, Fact),
         fact_to_dict(Fact, Dict)),
        RealEstates).

fact_to_dict(Fact, Dict) :-
    Fact =.. [Predicate | Args],
    maplist(arg_to_json, Args, JsonArgs),
    Dict = _{type: Predicate, args: JsonArgs}.

arg_to_json(Arg, JsonArg) :-
    (   atom(Arg)
    ->  JsonArg = Arg
    ;   number(Arg)
    ->  JsonArg = Arg
    ;   var(Arg)
    ->  JsonArg = "unbound"
    ;   JsonArg = Arg).

:- initialization(main).

main :-
    start_server(8000),
    write('Server listening on http://localhost:8000.'), nl,
    catch((repeat, sleep(1000000000)), _E, true).