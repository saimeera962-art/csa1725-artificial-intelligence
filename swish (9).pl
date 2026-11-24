% Experiment 10: Backward Chaining

% Knowledge base facts
kb_fact(has_feathers(tweety)).
kb_fact(lays_eggs(tweety)).
kb_fact(healthy(tweety)).

kb_fact(has_feathers(polly)).
kb_fact(lays_eggs(polly)).

% Knowledge base rules
kb_rule(bird(X),
        [has_feathers(X), lays_eggs(X)]).

kb_rule(can_fly(X),
        [bird(X), healthy(X)]).

% Prove a goal using facts
prove(Goal) :-
    kb_fact(Goal).

% Prove a goal using rules
prove(Goal) :-
    kb_rule(Goal, Premises),
    prove_all(Premises).

% Prove all premises recursively
prove_all([]).

prove_all([Goal|Rest]) :-
    prove(Goal),
    prove_all(Rest).

% Check and display the goal result
check_goal(Goal) :-
    (   prove(Goal)
    ->  writeln('Goal proved.')
    ;   writeln('Goal cannot be proved.')
    ).