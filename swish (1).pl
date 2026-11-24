
% Experiment 2: Bird Flight Classification

% Facts
bird(sparrow).
bird(parrot).
bird(eagle).
bird(penguin).
bird(ostrich).

% Flightless birds
flightless(penguin).
flightless(ostrich).

% Rule to identify flying birds
can_fly(Bird) :-
    bird(Bird),
    \+ flightless(Bird).

% Check flight status
check_flight(Bird) :-
    (   bird(Bird)
    ->  (   flightless(Bird)
        ->  format('~w cannot fly.~n', [Bird])
        ;   format('~w can fly.~n', [Bird])
        )
    ;   format('No information about ~w.~n', [Bird])
    ).
