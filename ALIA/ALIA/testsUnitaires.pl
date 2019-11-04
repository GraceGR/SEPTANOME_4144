%Tests unitaires de tous les predicats definis pour le jeu
%Puissance 4.

:- use_module(puissance4).

%%predicat trouverElement
testTrouverElement1(X):- trouverElement(2,X,[a,b,c,d,e,f]).
%Resultat attendu : X = b

testTrouverElement2(N):- trouverElement(N,d,[a,b,c,d,e,f]).
%Resultat attendu : N=4

testTrouverElement3(N) :- trouverElement(N,o,[a,b,c,d,e,f]).
%Resultat attendu : false

testTrouverElement4(X) :-  trouverElement(5,X,[f]).
%Resultat attendu : false

%%Predicat trouverElement2Dimensions
testTrouverElement2D1(I,J) :- trouverElement2Dimensions(I,J,3,[[1,3],[4,8],[5,7]]).
%Resultat attendu : I=0, J=1

testTrouverElement2D2(I,J) :- trouverElement2Dimensions(I,J,10,[[1,3],[4,8],[5,7]]).
%Resultat attendu : false

testTrouverElement2D3(Y) :- trouverElement2Dimensions(2,1,Y,[[1,3],[4,8],[5,7]]).
%Resultat attendu : Y=7

testTrouverElement2D4(Y) :- trouverElement2Dimensions(3,2,Y,[[1,3],[4,8],[5,7]]).
%Resultat attendu : Y=7

%%predicat afficherPion
testAfficherPion1 :- afficherPion(1).
%Resultat attendu : affichage de X

testAfficherPion2 :- afficherPion(2).
%Resultat attendu : affichage de O

testAfficherPion3 :- afficherPion(0).
%Resultat attendu : affichage d'un espace

testAfficherPion4 :- afficherPion(44).
%Resultat attendu : false

%%Predicat afficherPlateau
testAfficherPlateau1 :- afficherPlateau([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]).
%Resultat attendu
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|

testAfficherPlateau2 :-  afficherPlateau([[0,0,0,0,1,1,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,2,1,0,0,0],[0,0,0,2,0,1,0],[0,1,0,2,0,0,0]]).
%Resultat attendu
%|   |   |   |   | X | X |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   |   |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   | O | X |   |   |   |
%|---+---+---+---+---+---+---|
%|   |   |   | O |   | X |   |
%|---+---+---+---+---+---+---|
%|   | X |   | O |   |   |   |
%|---+---+---+---+---+---+---|

testAfficherPlateau3 :- afficherPlateau([]).
%Resultat attendu : true

%%Predicat aleatoire
testAleatoire(C) :- aleatoire([[5,0],[4,1],[6,2]],C).
%Resultat attendu : C=[5,0] ou C=[4,1] ou C=[6,2].

%%%Predicats pour la mise a jour de LCP
%%Predicat increment_CP
testIncrementCP1(NouvC) :- increment_CP(NouvC,[3,2]).
%Resultat attendu : NouvC = [2,2].

testIncrementCP2(NouvC) :- increment_CP(NouvC,[0,4]).
%Resultat attendu : NouvC =[].

%%Predicat supprimer_CP
testSupprimerCP1(R) :- supprimer_CP([0,1],[[2,3],[4,7],[0,1],[1,0]],R).
%Resultat attendu : R = [[2,3],[4,7],[1,0]]

testSupprimerCP2(R) :- supprimer_CP([0,1],[[2,3],[4,7],[8,2],[1,0]],R).
%Resultat attendu : R = [[2,3],[4,7],[8,2],[1,0]]

testSupprimerCP3(R) :- supprimer_CP([0,1],[],R).
%Resultat attendu : R=[]

testSupprimerCP4(R) :- supprimer_CP([],[[2,3],[4,7],[8,2],[1,0]],R).
%Resultat attendu : R = [[2,3],[4,7],[8,2],[1,0]]

%%Predicat modifier_CP
testModifier1(NouvLCP) :- modifier([[5,0],[4,1],[5,2],[3,3]], [5,0],NouvLCP).
%Resultat attendu : NouvLCP = [[4,0],[4,1],[5,2],[3,3]]

testModifier2(NouvLCP) :- modifier([[5,0],[4,1],[5,2],[3,3],[0,6]], [0,6],NouvLCP).
%Resultat attendu : NouvLCP = [[5,0],[4,1],[5,2],[3,3]].

testModifier3(NouvLCP) :- modifier([[0,6]], [0,6],NouvLCP).
%Resultat attendu : NouvLCP = [].

testModifier4(NouvLCP) :- modifier([[5,0],[4,1],[5,2],[3,3]], [],NouvLCP).
%Resultat attendu : false

%%%Predicats utilises pour jouer un coup
%%Predicat recupIndLigne
testRecupIndLigne1(IndL) :- recupIndLigne([3,1],IndL).
%Resultat attendu : IndL = 3

testRecupIndLigne2(IndL) :- recupIndLigne([],IndL).
%Resultat attendu : false

%%Predicat recupIndColonne
testRecupIndColonne1(IndC) :- recupIndColonne([6,4],IndC).
%Resultat attendu : IndC = 4
testRecupIndColonne2(IndC) :- recupIndColonne([],IndC).
%


