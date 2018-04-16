% Nathanial Tranel
% CSCI 305 Prolog Lab 1

% rule to determine a mother of a child element
mother(Mother,Child) :-
  parent(Mother,Child),
  female(Mother).

% rule to determine a father of a child element
father(Father,Child) :-
  parent(Father,Child),
  male(Father).

% rule to determine if two elements are married
spouse(Male,Female) :-
  married(Male,Female).

% rule to determine if the first element is a child of the second
child(Child,Parent) :-
  parent(Parent,Child).

% rule to determine a son element of the other
son(Son,Parent) :-
  child(Son,Parent),
  male(Son).

% rule to determine a daughter element of the other
daughter(Daughter,Parent) :-
  child(Daughter,Parent),
  female(Daughter).

% rule to determine if two elements are siblings
sibling(First,Second) :-
  mother(Mother,First),
  mother(Mother,Second),
  father(Father,First),
  father(Father,Second),
  not(First=Second).

% rule to determine if an element is a brother of the other
brother(Brother,Other) :-
  sibling(Other,Brother),
  male(Brother).

% rule to determine if an element is a brother of the other
sister(Sister,Other) :-
  sibling(Other,Sister),
  female(Sister).

% rule to determine if element is an uncle of a child
uncle(Uncle,Child) :-
  sibling(Uncle,Parent),
  parent(Parent,Child),
  male(Uncle).

% rule for uncle by marriage (check if it is an uncle of the spouse)
uncle(Uncle,Child) :-
  uncle(Uncle,spouse(Child)).

% rule to determine if element is an aunt of a child
aunt(Aunt,Child) :-
  sibling(Aunt,Parent),
  parent(Parent,Child),
  female(Aunt).

% rule for aunt by marriage (check if it is an uncle of the spouse)
aunt(Aunt,Child) :-
  aunt(Aunt,spouse(Child)).

% rule to determine is an element is a grandparent of the other
grandparent(Grandparent,Child) :-
  parent(Grandparent,Parent),
  parent(Parent,Child).

% rule to determine if an element is a grandfather of the other
grandfather(Grandfather,Child) :-
  grandparent(Grandfather,Child),
  male(Grandfather).

% rule to determine if an element is a grandmother of the other
grandmother(Grandmother,Child) :-
  grandparent(Grandmother,Child),
  female(Grandmother).

% rule to determine is an element is a grandchild of the other
grandchild(Grandchild,Grandparent) :-
  grandparent(Grandparent,Grandchild).

% ancestor/2 (ancestor(X, Y) means X is the ancestor of Y)
% descendant/2 (descendant(X, Y) means X is the descendant of Y)

% rule to determine if an element is older than another
older(Older,Younger) :-
  born(Older,YearO),
  born(Younger,YearY),
  YearO < YearY.

% rule to determine if an element is younger than another
younger(Younger,Older) :-
  born(Older,YearO),
  born(Younger,YearY),
  YearO > YearY.

% regentWhenBorn/2

% rule to determine if an element is a first cousin of the other
cousin(Cousin,Other) :-
  parent(Parent,Cousin),
  parent(ParentTwo,Other),
  sibling(Parent,ParentTwo).
