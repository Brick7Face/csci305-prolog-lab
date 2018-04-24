% Nathanial Tranel
% CSCI 305 Prolog Lab 1

% rule to ask if Mother was the mother of Child
mother(Mother,Child) :-
  parent(Mother,Child),
  female(Mother).

% rule to ask if Father was the father of Child
father(Father,Child) :-
  parent(Father,Child),
  male(Father).

% rule to ask if Spouse1 is married to Spouse2
spouse(Spouse1,Spouse2) :-
  married(Spouse1,Spouse2);         % check both orders; if not one, then perhaps the other
  married(Spouse2,Spouse1).

% rule to ask if Child is the child of Parent
child(Child,Parent) :-
  parent(Parent,Child).

% rule to ask if Son is the son of Parent
son(Son,Parent) :-
  parent(Parent,Son),
  male(Son).

% rule to ask if Daughter is the daughter of Parent
daughter(Daughter,Parent) :-
  parent(Parent,Daughter),
  female(Daughter).

% rule to ask if First is the sibling of Second
sibling(First,Second) :-
  mother(Mother,First),
  mother(Mother,Second),
  father(Father,First),
  father(Father,Second),
  not(First=Second).

% rule to ask if Brother is a brother of Other
brother(Brother,Other) :-
  sibling(Other,Brother),
  male(Brother).

% rule to ask if Sister is a sister of Other
sister(Sister,Other) :-
  sibling(Other,Sister),
  female(Sister).

% rule to ask if Uncle is a blood uncle of Child
uncle(Uncle,Child) :-
  parent(Parent,Child),
  sibling(Uncle,Parent),
  male(Uncle).

% rule to ask if Uncle is an uncle-by-marriage of Child (married to a parent's sister)
uncle(Uncle,Child) :-
 parent(Parent,Child),
 sister(Aunt,Parent),
 married(Uncle,Aunt),
 male(Uncle).

% rule to ask if Aunt is a blood aunt of Child
aunt(Aunt,Child) :-
  sibling(Aunt,Parent),
  parent(Parent,Child),
  female(Aunt).

% rule to ask if Aunt is an aunt-by-marriage of Child (married to a parent's brother)
aunt(Aunt,Child) :-
  parent(Parent,Child),
  brother(Uncle,Parent),
  married(Aunt,Uncle),
  female(Aunt).

% rule to ask if Grandparent is a grandparent of Child
grandparent(Grandparent,Child) :-
  parent(Grandparent,Parent),
  parent(Parent,Child).

% rule to ask if Grandfather is a grandfather of Child
grandfather(Grandfather,Child) :-
  grandparent(Grandfather,Child),
  male(Grandfather).

% rule to ask if Grandmother is a grandmother of Child
grandmother(Grandmother,Child) :-
  grandparent(Grandmother,Child),
  female(Grandmother).

% rule to ask if Grandchild is a grandchild of Grandparent
grandchild(Grandchild,Grandparent) :-
  grandparent(Grandparent,Grandchild).

% rule to ask if Ancestor is an ancestor of Descendant, defined recursively
ancestor(Ancestor,Descendant) :-
  parent(Ancestor,Descendant).
  
% recursive definition of ancestor - ask if Parent is the parent of Descendant
% and Ancestor is the ancestor of that Parent
ancestor(Ancestor,Descendant) :-
  parent(Parent,Descendant),
  ancestor(Ancestor,Parent).

% rule to ask if Descendant is a descendant of Ancestor, defined recursively
descendant(Descendant,Ancestor) :-
  child(Descendant,Ancestor).

% recursive definition of descendant - ask if Child is the child of Ancestor
% and Descendant is the descendant of that Child
descendant(Descendant,Ancestor) :-
  child(Child,Ancestor),
  descendant(Descendant,Child).

% rule to ask if Older is in fact older than Younger
older(Older,Younger) :-
  born(Older,YearO),
  born(Younger,YearY),
  YearO < YearY.

% rule to ask if Younger is younger than Older
younger(Younger,Older) :-
  born(Older,YearO),
  born(Younger,YearY),
  YearO > YearY.

% rule to ask who was King or Queen (Regent) when Person was born
regentWhenBorn(Regent,Person) :-
    reigned(Regent,Start,End),
    born(Person,Birth),
    (Start =< Birth),
    (Birth =< End),
    not(Regent=Person).

% rule to ask if Cousin is a cousin to Other
cousin(Cousin,Other) :-
  parent(Parent,Cousin),
  parent(ParentTwo,Other),
  sibling(Parent,ParentTwo).
