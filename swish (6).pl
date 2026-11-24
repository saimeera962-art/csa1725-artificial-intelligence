
% Experiment 7: Greedy Best-First Search

% Directed edges
edge(s, a).
edge(s, b).
edge(a, c).
edge(b, d).
edge(c, g).
edge(d, g).

% Heuristic values
h(s, 7).
h(a, 4).
h(b, 2).
h(c, 1).
h(d, 1).
h(g, 0).

% Best-first search
best_first(Start, Goal, Path) :-
    h(Start, H),
    search([H-[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

% Goal reached
search([_-[Goal|Rest]|_], Goal, [Goal|Rest]).

% Expand the node with the lowest heuristic value
search([_-[Node|Rest]|Open], Goal, Path) :-
    Node \= Goal,
    findall(H-[Next,Node|Rest],
            (edge(Node, Next),
             \+ member(Next, [Node|Rest]),
             h(Next, H)),
            Children),
    append(Open, Children, Candidates),
    keysort(Candidates, Sorted),
    search(Sorted, Goal, Path).
