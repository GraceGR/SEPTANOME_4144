%Tests unitaires de tous les predicats definis pour le jeu
%Puissance 4.

:- use_module(puissance4).
:- use_module(h2).

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

%%%Test predicats heuristique 2

%Test predicat parcoursLigneGD
testparcoursLigneGD1(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursLigneGD2(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=10

testparcoursLigneGD3(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursLigneGD4(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,3],0,M).
%Resultat attendu : M=30

testparcoursLigneGD5(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,6],0,M).
%Resultat attendu : M=0

testparcoursLigneGD6(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,7],0,M).
%Resultat attendu : false


%Test predicat parcoursLigneDG
testparcoursLigneDG1(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=0

testparcoursLigneDG2(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,5],0,M).
%Resultat attendu : M=10

testparcoursLigneDG3(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursLigneDG4(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=30

testparcoursLigneDG5(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,0],0,M).
%Resultat attendu : M=0

testparcoursLigneDG6(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,8],0,M).
%Resultat attendu : M=0


%Test predicat parcoursColonneHB
testparcoursColonneHB1(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursColonneHB2(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=10

testparcoursColonneHB3(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursColonneHB4(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=30

testparcoursColonneHB5(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursColonneHB6(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,0],0,M).
%Resultat attendu : false


%Test predicat parcoursColonneBH
testparcoursColonneBH1(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursColonneBH2(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,6],0,M).
%Resultat attendu : M=10

testparcoursColonneBH3(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursColonneBH4(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,6],0,M).
%Resultat attendu : M=30

testparcoursColonneBH5(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=0

testparcoursColonneBH6(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[-1,3],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale11
testparcoursDiagonale11a(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursDiagonale11b(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=10

testparcoursDiagonale11c(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,1,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursDiagonale11d(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,4],0,M).
%Resultat attendu : M=30

testparcoursDiagonale11e(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=0

testparcoursDiagonale11f(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[-1,3],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale12
testparcoursDiagonale12a(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,4],0,M).
%Resultat attendu : M=0

testparcoursDiagonale12b(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=10

testparcoursDiagonale12c(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,4],0,M).
%Resultat attendu : M=20

testparcoursDiagonale12d(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale12e(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,6],0,M).
%Resultat attendu : M=0

testparcoursDiagonale12f(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,7],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale21
testparcoursDiagonale21a(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,1],0,M).
%Resultat attendu : M=0

testparcoursDiagonale21b(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=10

testparcoursDiagonale21c(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[1,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursDiagonale21d(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[1,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale21e(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursDiagonale21f(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,1],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale22
testparcoursDiagonale22a(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,5],0,M).
%Resultat attendu : M=0

testparcoursDiagonale22b(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=10

testparcoursDiagonale22c(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[1,0,0,0,0,0,0]],1,[1,4],0,M).
%Resultat attendu : M=20

testparcoursDiagonale22d(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[1,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale22e(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,6],0,M).
%Resultat attendu : M=0

testparcoursDiagonale22f(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,1],0,M).
%Resultat attendu : false


%Test predicat calculMax
testcalculMax1(M):-calculMax(0,1,2,3,4,5,6,7,M).
%Resultat attendu : M=7

testcalculMax2(M):-calculMax(0,1,2,10,4,5,6,7,M).
%Resultat attendu : M=10

testcalculMax3(M):-calculMax(1,1,1,1,1,1,1,1,M).
%Resultat attendu : M=1

testcalculMax4(M):-calculMax(-1,0,1,2,3,4,5,6,M).
%Resultat attendu : M=6

%Test predicat max
testmax1(M):- max(0,10,M).
%Resultat attendu : M=10

testmax2(M):- max(10,10,M).
%Resultat attendu : M=10

testmax3(M):- max(10,0,M).
%Resultat attendu : M=10

testmax4(M):- max(-2,0,M).
%Resultat attendu : M=0


