:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- consult('engine.pl').

:- http_handler(root(realestates), handle_real_estates, []).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).

handle_real_estates(Request) :-
    http_read_json_dict(Request, DictIn),
    process_request(DictIn, DictOut),
    reply_json_dict(DictOut).

process_request(DictIn, DictOut) :-
    (   _{preferences: Preferences} :< DictIn
    ->  get_real_estates(Preferences, RealEstates),
        DictOut = _{realEstates: RealEstates}
    ; DictOut = _{error: "Missing preferences"}).

get_real_estates(Preferences, RealEstates) :-
    load_kb,
    start_engine,
    findall(Dict,
        (fact(_, Fact), 
         fact_to_dict(Fact, Dict)),
        RealEstates).

fact_to_dict(Fact, Dict) :-
    Fact =.. [Predicate | Args],
    Dict = _{type: Predicate, args: Args}.

:- initialization(server(8080)).
