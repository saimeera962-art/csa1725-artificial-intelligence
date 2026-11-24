
% Experiment 4: Diet Suggestion Based on Disease
% Educational categories, not clinical prescriptions.

diet(diabetes, balanced_high_fibre_meals).
diet(hypertension, reduced_sodium_meals).
diet(coeliac_disease, gluten_free_meals).
diet(iron_deficiency_anaemia, iron_rich_foods).

suggest_diet(Disease) :-
    (   diet(Disease, Plan)
    -> format('Example diet category: ~w~n', [Plan])
    ;   format('No diet rule for ~w.~n', [Disease])
    ).
