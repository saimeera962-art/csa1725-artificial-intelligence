
% Experiment 6: Fruit and Colour Using Backtracking

fruit_colour(apple, red).
fruit_colour(apple, green).
fruit_colour(banana, yellow).
fruit_colour(grape, green).
fruit_colour(grape, purple).
fruit_colour(orange, orange).

colour_of(Fruit, Colour) :-
    fruit_colour(Fruit, Colour).

print_fruit_colours :-
    forall(fruit_colour(Fruit, Colour),
           format('~w is ~w.~n', [Fruit, Colour])).
