% Experiment 9: Forward Chaining

% Initial facts
initial_facts([has_feathers, lays_eggs, healthy]).

% Rules: rule(Conclusion, Premises).
rule(bird, [has_feathers, lays_eggs]).
rule(can_fly, [bird, healthy]).

% Check whether all premises are known
all_known([], _).

all_known([P|Ps], Facts) :-
    member(P, Facts),
    all_known(Ps, Facts).

% Forward chaining process
forward_chain(Facts, Final) :-
    (   rule(Head, Body),
        all_known(Body, Facts),
        \+ member(Head, Facts)
    ->  append(Facts, [Head], More),
        forward_chain(More, Final)
    ;   Final = Facts
    ).

% Start forward chaining
run_forward(Final) :-
    initial_facts(Start),
    forward_chain(Start, Final).