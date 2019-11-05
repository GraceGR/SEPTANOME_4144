:- use_module(library(clpfd)).

:-use_module(puissance4).

%RÃƒÂ©cupÃƒÂ©rer l'ÃƒÂ©lÃƒÂ©ment d'un liste ÃƒÂ  l'indice i
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.

%RÃ©cupÃ©rer un Ã©lement d'une liste L Ã  deux dimensions Ã  l'indice [I][J]et le rÃ©sultat va dans Y
% trouverElement2Dimensions(I,J,Y,L):-trouverElement(I,X,L),trouverElement(J,Y,X).
trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%X et Y sont les cordonnees de la case, G la grille de jeu et R le resultat
%%404 est renvoyé si la case est sur le bord
voisin_gauche([X,Y2],R, G):-trouverElement2Dimensions(X,Y,R,G),Y2 is Y+1, X<6, X>=0, Y<6,!.
voisin_gauche([_,0],R, _):-R is 404.

%X et Y sont les cordonnees de la case, G la grille de jeu et R le resultat
%%404 est renvoyé si la case est sur le bord
voisin_droite([X,Y2],R, G):-trouverElement2Dimensions(X,Y,R,G),Y2 is Y-1, X<6, Y=<7,! .
voisin_droite([_,6],R, _):-R is 404.

%X et Y sont les cordonnees de la case, G la grille de jeu et R le resultat
%404 est renvoyé si la case est sur le bord
voisin_bas([X2,Y],R, G):-trouverElement2Dimensions(X,Y,R,G),X2 is X-1, X>=0,Y>=0,!.
voisin_bas([5,_],R, _):-R is 404.

%X et Y sont les cordonnees de la case, G la grille de jeu et R le resultat
%%404 est renvoyé si la case est sur le bord
voisin_haut([X,Y],R, G):-trouverElement2Dimensions(X2,Y,R,G),X2 is X-1, X<6, Y<7, X>0,!.
voisin_haut([0,_],R, _):-R is 404.
%voisin_bas([X2,Y],R, G):-trouverElement2Dimensions(X,Y,R,G),X2 is X-1, X<6, Y<7, X2>0.
%voisin_bas([5,_],R, _):-R is 404.

%La valeur du 1er voisin NO
%X et Y sont les cordonnees de la case, G la grille de jeu et R2 le resultat
%%404 est renvoyé si la case est sur le bord
voisin_NordOuest([X,Y],R2, G):-trouverElement2Dimensions(X2,Y2,R,G), X2 is X-1, Y2 is Y-1, X2>=0, Y2>=0, R2 is R,!.
voisin_NordOuest([X,Y],R2, _):- (  X==0, Y==0), R2 is 404.
voisin_NordOuest([X,Y],R2, _):- ( X=<0; Y=<0), (  X=\=0; Y=\=0),R2 is 404.

%La valeur du 1er voisin NE
%X et Y sont les cordonnees de la case, G la grille de jeu et R2 le resultat
%%404 est renvoyé si la case est sur le bord
voisin_NordEst([X,Y],R2, G):-trouverElement2Dimensions(X2,Y2,R,G), X2 is X-1, Y2 is Y+1, X2>=0, Y2=<7, R2 is R,!.
voisin_NordEst([0,_],R2, _):- R2 is 404.
voisin_NordEst([X,6],R2, _):- X=\=0, R2 is 404.


%La valeur du voisin en bas a droite d'une case
%X et Y sont les cordonnees de la case, G la grille de jeu et R2 le resultat
%%404 est renvoyé si la case est sur le bord
voisin_SudEst([X,Y],R2, G):-trouverElement2Dimensions(X2,Y2,R,G), X2 is X+1, Y2 is Y+1, X2=<7, Y2=<7, R2 is R,!.
voisin_SudEst([5,_],R2, _):- R2 is 404.
voisin_SudEst([X,6],R2, _):- X=\=5, R2 is 404.

%La valeur du voisin en bas a gauche d'une case
%X et Y sont les cordonnees de la case, G la grille de jeu et R2 le resultat
%%404 est renvoyé si la case est sur le bord
voisin_SudOuest([X,Y],R2, G):-trouverElement2Dimensions(X2,Y2,R,G), X2 is X+1, Y2 is Y-1, X2=<7, Y2>=0, R2 is R,!.
voisin_SudOuest([5,_],R2, _):- R2 is 404.
voisin_SudOuest([X,0],R2, _):- X=\=5, R2 is 404.


%Retourne 1 s il y a 1 pion de la meme couleur que le joueur (1 ou 2) en haut ou en bas, 2 si les 2.
compter_voisins_mCouleur_HB([X,Y],G,R2,J):-( voisin_haut([X,Y],R3, G) , voisin_bas([X,Y],R4, G)) , (   R3=\=J , R4=\=J  ),R2 is 0,!.
compter_voisins_mCouleur_HB([X,Y],G,R2,J):-( voisin_haut([X,Y],R3, G),voisin_bas([X,Y],R4, G)) , (   R3==J , R4==J),R2 is 2,!.
compter_voisins_mCouleur_HB([X,Y],G,R2,J):-( voisin_haut([X,Y],R3, G) , voisin_bas([X,Y],R4, G)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1,!.


%Retourne 1 s il y a 1 pion de la meme couleur a gauche ou a droite, 2 si les 2.
compter_voisins_mCouleur_GD([X,Y],G,R2,J):-( voisin_droite([X,Y],R3, G),voisin_gauche([X,Y],R4, G)) , (   R3=\=J , R4=\=J ),R2 is 0,!.
compter_voisins_mCouleur_GD([X,Y],G,R2,J):-( voisin_droite([X,Y],R3, G),voisin_gauche([X,Y],R4, G)) , (   R3==J , R4==J),R2 is 2,!.
compter_voisins_mCouleur_GD([X,Y],G,R2,J):-( voisin_droite([X,Y],R3, G),voisin_gauche([X,Y],R4, G)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1,!.

%Pareil sur la diagonale ascendente de droite a gauche.
compter_voisins_mCouleur_Diag1([X,Y],G,R2,J):-( voisin_SudOuest([X,Y],R3, G),voisin_NordEst([X,Y],R4, G)) , (   R3=\=J , R4=\=J ),R2 is 0,!.
compter_voisins_mCouleur_Diag1([X,Y],G,R2,J):-( voisin_SudOuest([X,Y],R3, G),voisin_NordEst([X,Y],R4, G)) , (   R3==J , R4==J),R2 is 2,!.
compter_voisins_mCouleur_Diag1([X,Y],G,R2,J):-( voisin_SudOuest([X,Y],R3, G),voisin_NordEst([X,Y],R4, G)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1,!.


%Pareil sur la diagonale descendente de droite a gauche.
compter_voisins_mCouleur_Diag2([X,Y],G,R2,J):-( voisin_SudEst([X,Y],R3, G),voisin_NordOuest([X,Y],R4, G)) , (   R3=\=J , R4=\=J  ),R2 is 0,!.
compter_voisins_mCouleur_Diag2([X,Y],G,R2,J):-( voisin_SudEst([X,Y],R3, G),voisin_NordOuest([X,Y],R4, G)) , (   R3==J , R4==J),R2 is 2,!.
compter_voisins_mCouleur_Diag2([X,Y],G,R2,J):-( voisin_SudEst([X,Y],R3, G),voisin_NordOuest([X,Y],R4, G)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1,!.

% Compte le nombre total de voisins de la meme couleur que le joueur
% autour d'une case donnee X et Y sont les coordonnees de la case, G la
% grille de jeu, J le joueur (1 ou 2) et R le resultat
nb_voisins_total([X,Y],G,R,J):-compter_voisins_mCouleur_HB([X,Y],G,R2,J),compter_voisins_mCouleur_GD([X,Y],G,R3,J),
							compter_voisins_mCouleur_Diag1([X,Y],G,R4,J), compter_voisins_mCouleur_Diag2([X,Y],G,R5,J),R is R2+R3+R4+R5 .

% Donne la liste des nombres de voisins de la meme couleur que le joueur
% pour tout les coups de la LCP, G la grille de jeu, J le
% joueur et C la liste resultat
liste_nbVoisins([LCP],G,J,[C]):-nb_voisins_total(LCP,G,C,J).
liste_nbVoisins([A|LCP],G,J,[C|R]):-nb_voisins_total(A,G,C,J),liste_nbVoisins(LCP,G,J,R),!.

%recuperer le max d'un tableau et son indice
indice_et_maximum(LCP,Max,End) :-
   maplist(#>=(Max),LCP),
   nth0(End,LCP,Max).

%recupère l'indice du coup choisi dans la LCP
%G est la grille de jeu, J le joueur(1 ou 2), Ind1 l'indice renvoyé
indice_coup_choisi(LCP,G,J,Ind1):-liste_nbVoisins(LCP,G,J,C),indice_et_maximum(C,_,Ind), Ind1 is Ind+1,!.

%l'heuristique en elle même qui donne le coup à jouer.
heuristique1(G,LCP,J,C3):-indice_coup_choisi(LCP,G,J,K),trouverElement(K,C3,LCP),!.

