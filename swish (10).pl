% Experiment 8: Medical Diagnosis - Educational Expert System

% Simplified classroom rules; not for patient use.

condition(common_cold, [sneezing, runny_nose]).
condition(hay_fever, [sneezing, itchy_eyes]).
condition(flu, [fever, body_ache]).

% Check whether all required symptoms are present
all_present([], _).

all_present([Finding|Rest], Given) :-
    member(Finding, Given),
    all_present(Rest, Given).

% Find possible matching conditions
possible_condition(Findings, Condition) :-
    condition(Condition, Required),
    all_present(Required, Findings).

% Display matching conditions
diagnose(Findings) :-
    findall(C, possible_condition(Findings, C), Matches),
    (   Matches = []
    ->  writeln('No matching classroom rule.')
    ;   format('Matching classroom labels: ~w~n',
               [Matches])
    ).