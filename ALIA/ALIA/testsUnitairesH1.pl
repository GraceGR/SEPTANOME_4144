%Tests unitaires de tous les predicats definis pour l'heuristique 1
%:- use_module(h1).
%VOIR pour la fonction indice_et_maximum ligne 167
%VOIR  ligne 189 si le resultat doit bien etre false ?

%%predicat voisin_guache
testVoisinGauche(N):- voisin_gauche([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N = 1

testVoisinGauche2(N):- voisin_gauche([3,0],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

%predicat voisin_droite
testVoisinDroite(N) :- voisin_droite([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,5,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisinDroite2(N) :- voisin_droite([3,5],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

%predicat voisin_haut
testVoisinHaut(N):- voisin_haut([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,5,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N = 5

testVoisinHaut2(N):- voisin_haut([0,3],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

%predicat voisin_bas
testVoisinBas(N) :- voisin_bas([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,5,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisinBas2(N) :- voisin_bas([5,3],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404


%predicat voisin_nordOuest
testVoisin_NordOuest(N):-voisin_NordOuest([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisin_NordOuest2(N):-voisin_NordOuest([0,0],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordOuest3(N):-voisin_NordOuest([0,1],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordOuest4(N):-voisin_NordOuest([1,0],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordOuest5(N):-voisin_NordOuest([1,1],N,[[6,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=6


%predicat voisin_nordEst
testVoisin_NordEst(N):-voisin_NordEst([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,5,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisin_NordEst2(N):-voisin_NordEst([0,6],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordEst3(N):-voisin_NordEst([0,5],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordEst4(N):-voisin_NordEst([1,6],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_NordEst5(N):-voisin_NordEst([1,5],N,[[0,0,0,0,0,0,6],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=6


%predicat voisin_sudOuest
testVoisin_SudOuest(N):-voisin_SudOuest([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisin_SudOuest2(N):-voisin_SudOuest([5,0],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudOuest3(N):-voisin_SudOuest([5,1],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudOuest4(N):-voisin_SudOuest([4,0],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudOuest5(N):-voisin_SudOuest([4,1],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[6,1,2,1,2,0,0]]).
%Resultat attendu : N=6


%predicat voisin_sudEst
testVoisin_SudEst(N):-voisin_SudEst([3,4],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,5,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=5

testVoisin_SudEst2(N):-voisin_SudEst([5,5],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudEst3(N):-voisin_SudEst([5,6],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudEst4(N):-voisin_SudEst([4,6],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,5,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]]).
%Resultat attendu : N=404

testVoisin_SudEst5(N):-voisin_SudEst([4,5],N,[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,0,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,5]]).
%Resultat attendu : N=5


%predicat compter_voisins_mCouleur_HB
testCvmcHB(X):-compter_voisins_mCouleur_HB([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,0,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=0

testCvmcHB1(X):-compter_voisins_mCouleur_HB([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=1

testCvmcHB2(X):-compter_voisins_mCouleur_HB([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,2,1,2,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=2


%predicat compter_voisins_mCouleur_GD
testCvmcGD(X):-compter_voisins_mCouleur_GD([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,0,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=0

testCvmcGD1(X):-compter_voisins_mCouleur_GD([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,2,1,1,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=1

testCvmcGD2(X):-compter_voisins_mCouleur_GD([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=2


%predicat compter_voisins_mCouleur_Diag1
testCvmc1D(X):-compter_voisins_mCouleur_Diag1([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,0,2,0,0],[0,1,2,1,2,0,0],[0,2,2,2,2,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=0

testCvmc1D1(X):-compter_voisins_mCouleur_Diag1([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,2,1,1,0,0],[0,2,2,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=1

testCvmc1D2(X):-compter_voisins_mCouleur_Diag1([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=2


%predicat compter_voisins_mCouleur_Diag2
testCvmc2D(X):-compter_voisins_mCouleur_Diag2([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,0,1,0,0],[0,1,2,1,2,0,0],[0,2,1,2,2,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=0

testCvmc2D1(X):-compter_voisins_mCouleur_Diag2([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,2,1,1,0,0],[0,1,2,1,1,0,0],[0,2,1,2,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=1

testCvmc2D2(X):-compter_voisins_mCouleur_Diag2([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],X,1).
%Resultat attendu : X=2


%Predicat nb_voisins_total
testNbVoisinsTotal(N):-nb_voisins_total([3,3],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],N,1).
%Resultat attendu : N=8

testNbVoisinsTotal2(N):-nb_voisins_total([0,0],[[0,1,0,0,0,0,0],[1,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],N,1).
%Resultat attendu : N=2

testNbVoisinsTotal3(N):-nb_voisins_total([0,6],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],N,1).
%Resultat attendu : N=0

testNbVoisinsTotal4(N):-nb_voisins_total([5,0],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[1,1,1,1,1,0,0],[0,1,2,1,2,0,0]],N,1).
%Resultat attendu : N=3

testNbVoisinsTotal5(N):-nb_voisins_total([5,6],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,2,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,1,0],[0,1,2,1,2,0,0]],N,1).
%Resultat attendu : N=1


%predicat liste_nbVoisins
testListeNbVoisins([Lres]):-liste_nbVoisins([[0,1],[2,0],[3,3]],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],1,Lres).
%Resultat attendu : Lres=[0,1,8]

%predicat indice_et_maximum
%testIndiceEtMax():-indice_et_maximum([[0,1],[2,0],[3,3]],Max,End)

%predicat indice_coup_choisi
testIndCoupChoisi(X):-indice_coup_choisi([[0,1],[2,0],[3,3]],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,1,1,0,0],[0,1,1,1,1,0,0],[0,2,1,1,1,0,0],[0,1,2,1,2,0,0]],1,X).
%Resultat attendu : X=3

testIndCoupChoisi2(X):-indice_coup_choisi([[0,6],[1,4],[0,0],[1,2]],[[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,1,1,0,0],[0,2,1,2,2,0,0],[0,2,2,2,2,0,0],[0,1,2,1,2,0,0]],1,X).
%Resultat attendu : X=2

%predicat heuristique1
testH1(X):-heuristique1([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,1,1,1,0,0],[0,2,1,2,2,0,0],[0,2,2,2,2,0,0],[0,1,2,1,2,0,0]],[[0,6],[1,4],[0,0],[1,2]],1,X).
%Resultat attendu : X=[1,4]

testH12(X):-heuristique1([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,X).
%Resultat attendu : X=[5,0]

testH13(X):-heuristique1([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],[[5,0]],1,X).
%Resultat attendu : X=[5,0]

testH13(X):-heuristique1([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],[],1,X).
%Resultat attendu : X=false











