% <sent> ::== <noun group> <verb group>
% <noun group> ::== <det> <noun>
% <verb group> ::== <verb> <noun group>
% <det> ::== a | the | my | yours | its
% <noun> ::== cow | tail | body
% <verb> ::== walks | shakes | moves

% ?- t(sent, [a,cow,shakes,its,tail], [], Tree).

noun(cow). noun(tail). noun(body).
%noun(X):-member(X,[cow, tail, body]).
det(X):-member(X,[a, the, my, yours, its]).
verb(X):-member(X,[walks, shakes, moves]).

t(sent, I, O, sent(NG,VG)):-
    t(ng, I, R, NG),
    t(vg, R, O, VG).
t(ng, I, O, ng(Det,N)):-
    t(det,I,R, Det),
    t(noun,R,O,N).
t(vg, I, O, vg(V,NG)):-
    t(verb, I,R, V),
    t(ng, R,O, NG).
t(det, [X|I],I, det(X)):-
    det(X).
t(verb,[X|I],I, verb(X)):-
    verb(X).
t(noun, [X|I],I, noun(X)):-
    noun(X).
