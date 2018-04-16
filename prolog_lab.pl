% Nathanial Tranel
% CSCI 305 Prolog Lab 1

% rule added from lab assignment
mother(M,C) :- parent(M,C), female(M).

% rule to determine a father of a child element
father(F,C) :- parent(F,C), male(F).

spouse(M,F) :- mother(M,C), father(F,C).
child(C,P) :- parent(P,C).
son(S,P) :- child(S,P), male(S).
daughter(D,P) :- child(D,P), female(D).
sibling(X,Y) :- parent(P,X), parent(P,Y), not(X=Y).
brother(B,O) :- sibling(O,B), male(B).
sister(S,O) :- sibling(O,S), female(S).
% uncle/2 (two rules: one by blood, one by marriage.)
% aunt/2 (two rules: one by blood, one by marriage.)
grandparent(GP,C) :- parent(GP,P), parent(P,C).
grandfather(GF,C) :- grandparent(GF,C), male(GF).
grandmother(GM,C) :- grandparent(GM,C), female(GM).
grandchild(GC,GP) :- grandparent(GP,GC).

% ancestor/2 (ancestor(X, Y) means X is the ancestor of Y)
% descendant/2 (descendant(X, Y) means X is the descendant of Y)
