% Nathanial Tranel
% CSCI 305 Prolog Lab 1

% rule added from lab assignment
mother(M,C) :- parent(M,C), female(M).

% rule to determine a father of a child element
father(F,C) :- parent(F,C), male(F).

% spouse/2

% child/2

son(S,P) :- child(S,P), male(S).
daughter(D,P) :- child(D,P), female(D).
% sibling/2
brother(B,O) :- sibling(O,B), male(B).
sister(S,O) :- sibling(O,S), female(S).
% uncle/2 (two rules: one by blood, one by marriage.)
% aunt/2 (two rules: one by blood, one by marriage.)
% grandparent/2
% grandfather/2
% grandmother/2
% grandchild/2

% ancestor/2 (ancestor(X, Y) means X is the ancestor of Y)
% descendant/2 (descendant(X, Y) means X is the descendant of Y)
