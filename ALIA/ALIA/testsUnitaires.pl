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
%%Predicat remplacer
testRemplacer1(NouvL) :- remplacer([1,2,3,4], 0, 0, NouvL).
%Resultat attendu : NouvL=[0,2,3,4]

testRemplacer2(NouvL) :- remplacer([1,2,3,4], 2, 5, NouvL).
%Resultat attendu : NouvL=[1,2,5,4]

testRemplacer3(NouvL) :- remplacer([1,2,3,4], 6, 4, NouvL).
%Resultat attendu : false

testRemplacer4(NouvL) :- remplacer([], 6, 4, NouvL).
%Resultat attendu : false


%%Predicat recupIndLigne
testRecupIndLigne1(IndL) :- recupIndLigne([3,1],IndL).
%Resultat attendu : IndL = 3

testRecupIndLigne2(IndL) :- recupIndLigne([],IndL).
%Resultat attendu : false

%%Predicat recupIndColonne
testRecupIndColonne1(IndC) :- recupIndColonne([6,4],IndC).
%Resultat attendu : IndC = 4

testRecupIndColonne2(IndC) :- recupIndColonne([],IndC).
%Resultat attendu : false

%%Predicat jouerCoup
testJouerCoup1(NouvG) :- jouerCoup([[0,0,0],[2,1,2],[0,1,0]],[0,1],NouvG,1).
%Resultat attendu : NouvG=[[0,1,0],[2,1,2],[0,1,0]]

testJouerCoup2(NouvG) :- jouerCoup([[0,1,0],[2,1,2],[0,1,0]],[2,0],NouvG,2).
%Resultat attendu : NouvG=[[0,1,0],[2,1,2],[2,1,0]]

testJouerCoup3(NouvG) :- jouerCoup([],[0,1],NouvG,1).
%Resultat attendu : NouvG=false

testJouerCoup4(NouvG) :- jouerCoup([[0,1,0],[2,1,2],[0,1,0]],[5,6],NouvG,2).
%Resultat attendu : false.

%%%Predicats pour les fins de jeu
%%Predicat victoireHorizontale
testVictoireHorizontale1 :- victoireHorizontale([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],1).
%Resultat attendu : false

testVictoireHorizontale2 :- victoireHorizontale([[0,0,0,0,0,0,0],[0,2,0,0,0,0,0],[0,2,2,2,2,0,0],[0,2,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],2).
%Resultat attendu : true

%%Predicat victoireVerticale
testVictoireVerticale1 :- victoireVerticale([[0,0,0,0,0,0,0],[0,2,0,0,0,0,0],[0,2,2,2,2,0,0],[0,2,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],1,2).
%Resultat attendu : true

testVictoireVerticale2 :- victoireVerticale([[0,0,0,0,0,0,0],[0,2,0,0,0,0,0],[0,2,2,2,2,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],1,2).
%Resultat attendu : false

%%Predicat victoireDiagonale1
testVictoireDiagonale1_1 :- victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,1,0,2,1],[0,1,1,1,2,1,1],[0,1,2,2,0,1,0],[0,1,2,0,1,0,0],[0,1,1,0,0,0,0]],0,0,2,0,0,0,0).
%Resultat attendu : true

testVictoireDiagonale1_2 :-victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,1,0,2,1],[0,1,1,1,0,1,1],[0,1,2,2,0,1,0],[0,1,2,0,1,0,0],[0,1,1,0,0,0,0]],0,0,2,0,0,0,0).
%Resultat attendu : false

testVictoireDiagonale1_3 :- victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,0,0,2,1],[0,1,1,1,2,1,1],[0,1,0,2,0,1,0],[0,1,2,2,1,0,0],[0,1,1,0,0,0,0]],0,0,2,0,0,0,0).
%Resultat attendu : true

testVictoireDiagonale1_4 :- victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,0,0,2,1],[0,1,1,1,0,1,1],[0,1,0,2,0,1,0],[0,1,2,2,1,0,0],[0,1,1,0,0,0,0]],0,0,2,0,0,0,0).
%Resultat attendu : false

testVictoireDiagonale1_5 :- victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,0,0,2,1],[0,1,1,1,2,1,1],[1,1,0,2,0,1,0],[0,1,2,2,1,0,0],[0,1,1,0,0,0,0]],0,0,1,0,0,0,0).
%Resultat attendu : true

testVictoireDiagonale1_6 :- victoireDiagonale1([[0,0,0,1,1,0,0],[0,0,1,0,0,2,1],[0,1,0,1,2,1,1],[2,0,0,2,0,1,0],[0,1,2,2,1,0,0],[0,1,1,0,0,0,0]],0,0,1,0,0,0,0).
%Resultat attendu : false

%%Predicat victoireDiagonale2
testVictoireDiagonale2_1 :- victoireDiagonale2([[0,0,0,2,1,0,0],[0,0,1,1,2,1,1],[0,1,1,1,0,2,2],[0,1,1,1,1,2,2],[0,1,1,1,0,0,0],[0,1,1,2,0,0,0]],0,6,2,0,0,0,6).
%Resultat attendu : true

testVictoireDiagonale2_2 :- victoireDiagonale2([[0,0,2,1,1,0,0],[0,1,1,2,1,1,1],[0,1,1,1,0,1,2],[0,1,1,1,1,2,1],[0,1,1,1,0,0,2],[0,1,1,2,0,0,0]],0,6,2,0,0,0,6).
%Resultat attendu : false

%Predicat victoireDiagonale2
testVictoireDiagonale2_3 :- victoireDiagonale2([[0,0,0,2,1,0,0],[0,0,1,1,2,1,1],[0,1,1,1,0,2,2],[0,1,1,1,1,2,2],[0,1,1,1,0,0,0],[0,1,1,2,0,0,0]],0,6,2,0,0,0,6).
%Resultat attendu : true

%Predicat victoireDiagonale2
testVictoireDiagonale2_4 :- victoireDiagonale2([[0,0,2,1,1,0,0],[0,1,2,0,1,1,1],[0,1,1,2,0,1,2],[0,1,1,1,1,0,1],[0,1,1,1,0,2,1],[0,1,1,2,0,0,2]],0,6,2,0,0,0,6).
%Resultat attendu : false

%Predicat victoireDiagonale2
testVictoireDiagonale2_5 :- victoireDiagonale2([[1,0,0,1,1,0,0],[2,0,0,0,1,1,1],[0,2,1,0,0,1,2],[0,1,2,2,1,0,1],[0,1,1,2,0,0,1],[0,1,1,1,0,2,0]],0,6,2,0,0,0,6).
%Resultat attendu : true

%Predicat victoireDiagonale2
testVictoireDiagonale2_6 :- victoireDiagonale2([[1,0,0,1,1,0,0],[2,0,0,0,1,1,1],[0,2,1,0,0,1,2],[0,1,2,2,1,0,1],[0,1,1,1,0,0,1],[0,1,1,1,2,0,0]],0,6,2,0,0,0,6).
%Resultat attendu : false

%%Predicat grillePleine
testGrillePleine1 :- grillePleine([]).
%Resultat attendu : true

testGrillePleine2 :- grillePleine([[1,2],[0,6]]).
%Resultat attendu : false

