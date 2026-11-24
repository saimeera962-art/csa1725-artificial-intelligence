
% Experiment 5: Monkey and Banana Problem

place(door).
place(window).
place(middle).

move(state(P, floor, B, no), walk(P, Q),
     state(Q, floor, B, no)) :-
    place(Q), dif(P, Q).

move(state(P, floor, P, no), push(P, Q),
     state(Q, floor, Q, no)) :-
    place(Q), dif(P, Q).

move(state(P, floor, P, no), climb,
     state(P, on_box, P, no)).

move(state(middle, on_box, middle, no), grasp,
     state(middle, on_box, middle, yes)).

solve(state(_, _, _, yes), _, []).
solve(State, Seen, [Action|Actions]) :-
    move(State, Action, Next),
    \+ member(Next, Seen),
    solve(Next, [Next|Seen], Actions).

monkey_plan(Actions) :-
    Start = state(door, floor, window, no),
    solve(Start, [Start], Actions).
