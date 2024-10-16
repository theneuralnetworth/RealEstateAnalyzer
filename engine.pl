:-op(220,xfx,then).
:-op(35,xfy,if).
:-op(240,fx,rule).
:-op(500,fy,not).
:-op(600,xfy,and).
:-op(600,xfy,or).

:-dynamic justifies/3.

% load knowledge base
load_kb:-
	consult('Expert_System_PPROGIA/Metaknowledge/index.pl'),
	consult('Expert_System_PPROGIA/Rules/index.pl'),
    consult('Expert_System_PPROGIA/Facts/index.pl').

% counts the number of facts
number_of_facts(Total) :-
	findall(N, fact(N, _), LFacts),
	length(LFacts, Total).

% start the inference engine
start_engine :-
    number_of_facts(Total),
	asserta(last_fact(Total)),
    start_engine_loop(0, Total).

% when all facts are processed
start_engine_loop(N, N) :-
    !.

% process each fact and repeat the process after create the new facts
start_engine_loop(N, Total) :-
    N < Total,
    N1 is N + 1,
    fact(N1, Fact),
    fact_triggers_rules1(Fact, LRules),
    trigger_rules(N1, Fact, LRules),
    number_of_facts(Total1),
    start_engine_loop(N1, Total1).

% checks which rules the fact triggers
fact_triggers_rules1(Fact, LRules):-
	fact_triggers_rules(Fact, LRules),
	!.

% case where the fact does not trigger any rule
fact_triggers_rules1(_, []).

% process each rule
trigger_rules(N, Fact, [ID|LRules]):-
	rule ID if LHS then RHS,
	fact_in_condition(Fact,LHS),
	% Instantiate Fact in LHS
	verify_conditions(LHS, LFacts),
	member(N,LFacts),
	conclude(RHS,ID,LFacts),
	!,
	trigger_rules(N, Fact, LRules).

% continue to the next rule
trigger_rules(N, Fact, [_|LRules]):-
	trigger_rules(N, Fact, LRules).

trigger_rules(_, _, []).

% checks if the fact is part of a condition
fact_in_condition(F,[F  and _]).
fact_in_condition(F,[F  or _]).

fact_in_condition(F,[evaluate(F1)  and _]):- F=..[H,H1|_],F1=..[H,H1|_].
fact_in_condition(F,[evaluate(F1)  or _]):- F=..[H,H1|_],F1=..[H,H1|_].

fact_in_condition(F,[_ and Fs]):- fact_in_condition(F,[Fs]).
fact_in_condition(F,[_ or Fs]):- fact_in_condition(F,[Fs]).

fact_in_condition(F,[F]).

fact_in_condition(F,[evaluate(F1)]):-F=..[H,H1|_],F1=..[H,H1|_].

% verifies conditions
verify_conditions([evaluate(X)],_):-
	evaluate(_,X).

verify_conditions([evaluate(X) and evaluate(Y)],_):-
	evaluate(_,X), evaluate(_,Y).

verify_conditions([not evaluate(X) or Y],[not X|LF]):- !,
	\+ evaluate(_,X),
	verify_conditions([Y],LF).

verify_conditions([evaluate(X) or Y],[N|LF]):- !,
	(evaluate(N,X) ; verify_conditions([Y],LF)).

verify_conditions([not X or Y],[not X|LF]):- !,
	(\+ fact(_,X) ; verify_conditions([Y],LF)).

verify_conditions([X or Y],[N|LF]):- !,
	(fact(N,X) ; verify_conditions([Y],LF)).

verify_conditions([not evaluate(X) and Y],[not X|LF]):- !,
	\+ evaluate(_,X),
	verify_conditions([Y],LF).

verify_conditions([evaluate(X) and Y],[N|LF]):- !,
	evaluate(N,X),
	verify_conditions([Y],LF).

verify_conditions([not X and Y],[not X|LF]):- !,
	\+ fact(_,X),
	verify_conditions([Y],LF).

verify_conditions([X and Y],[N|LF]):- !,
	fact(N,X),
	verify_conditions([Y],LF).

verify_conditions([not X],[not X]):- !, \+ fact(_,X).
verify_conditions([X],[N]):- fact(N,X).

% concludes facts
conclude([create_fact(F)|Y],ID,LFacts):-
	!,
	create_fact(F,ID,LFacts),
	conclude(Y,ID,LFacts).

conclude([],_,_):-!.

% creates fact
create_fact(F,_,_):-
	fact(_,F),!.

create_fact(F,ID,LFacts):-
	retract(last_fact(N1)),
	N is N1+1,
	asserta(last_fact(N)),
	assertz(justifies(N,ID,LFacts)),
	assertz(fact(N,F)),!.

evaluate(N,P):-	P=..[Functor,Entidade,Operando,Valor],
		P1=..[Functor,Entidade,Valor1],
		fact(N,P1),
		compare_values(Valor1,Operando,Valor).

count_services(Property, Count):-
	findall(Service, fact(_, services(Property, Service)), LServices),
	length(LServices, Count).

compare_values(V1,==,V):- V1==V.
compare_values(V1,\==,V):- V1\==V.
compare_values(V1,>,V):-V1>V.
compare_values(V1,<,V):-V1<V.
compare_values(V1,>=,V):-V1>=V.
compare_values(V1,=<,V):-V1=<V.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualization of the fact base
show_facts:-
	findall(N, fact(N, _), LFacts),
	write_facts(LFacts).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generation of explanations of the type "How"

how(N):-last_fact(Last),Last<N,!,
	write('This conclusion was not made'),nl,nl.

how(N):-justifies(N,ID,LFacts),!,
	fact(N,F),
	write('Concluded fact no. '),write(N),write(' -> '),write(F),nl,
	write('by rule '),write(ID),nl,
	write('by verifying that:'),nl,
	write_facts(LFacts),
	write('********************************************************'),nl,
	explain(LFacts).

how(N):-fact(N,F),
	write('Fact no. '),write(N),write(' -> '),write(F),nl,
	write('was initially known'),nl,
	write('********************************************************'),nl.

% writes facts in a list
write_facts([I|R]):-fact(I,F), !,
	write('Fact no. '),write(I),write(' -> '),write(F),write(' is true'),nl,
	write_facts(R).

write_facts([I|R]):-
	write('Condition '),write(I),write(' is true'),nl,
	write_facts(R).

write_facts([]).

% explanation logic
explain([I|R]):- \+ integer(I),!,explain(R).

explain([I|R]):-how(I),
	explain(R).

explain([]):-	write('********************************************************'),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generation of explanations of the type "Why not"

whynot(Fact):-
	whynot(Fact,1).

whynot(Fact,_):-
	fact(_, Fact),
	!,
	write('Fact '),write(Fact),write(' is not false!'),nl.

whynot(Fact,Level):-
	find_whynot_rules(Fact,LLPF),
	whynot1(LLPF,Level).

whynot(not Fact,Level):-
	format(Level),write('Because:'),write(' Fact '),write(Fact),
	write(' is true'),nl.

whynot(Fact,Level):-
	format(Level),write('Because:'),write(' Fact '),write(Fact),
	write(' is not defined in the knowledge base'),nl.

% Explanations of whynot(Fact) must consider all rules that could lead to the conclusion about the fact Fact

% finds rules that could explain why the fact is not true
find_whynot_rules(Fact,LLPF):-
	findall((ID,LPF),
		(
		rule ID if LHS then RHS,
		member(create_fact(Fact),RHS),
		find_false_premises(LHS,LPF),
		LPF \== []
		),
		LLPF).

whynot1([],_).

whynot1([(ID,LPF)|LLPF],Level):-
	format(Level),write('Because by rule '),write(ID),write(':'),nl,
	Level1 is Level+1,
	explain_why_not(LPF,Level1),
	whynot1(LLPF,Level).

	find_false_premises([not X and Y], LPF):-
	verify_conditions([not X], _),
	!,
	find_false_premises([Y], LPF).

find_false_premises([X and Y], LPF):-
	verify_conditions([X], _),
	!,
	find_false_premises([Y], LPF).

find_false_premises([not X], []):-
	verify_conditions([not X], _),
	!.

find_false_premises([X], []):-
	verify_conditions([X], _),
	!.

find_false_premises([not X and Y], [not X|LPF]):-
	!,
	find_false_premises([Y], LPF).

find_false_premises([X and Y], [X|LPF]):-
	!,
	find_false_premises([Y], LPF).

find_false_premises([not X], [not X]):-!.
find_false_premises([X], [X]).
find_false_premises([]).

explain_why_not([],_).

explain_why_not([not evaluate(X)|LPF],Level):-
	!,
	format(Level),write('The condition not '),write(X),write(' is false'),nl,
	explain_why_not(LPF,Level).

explain_why_not([evaluate(X)|LPF],Level):-
	!,
	format(Level),write('The condition '),write(X),write(' is false'),nl,
	explain_why_not(LPF,Level).

explain_why_not([P|LPF],Level):-
	format(Level),write('The premise '),write(P),write(' is false'),nl,
	Level1 is Level+1,
	whynot(P,Level1),
	explain_why_not(LPF,Level).

format(Level):-
	Esp is (Level-1)*5, tab(Esp).
