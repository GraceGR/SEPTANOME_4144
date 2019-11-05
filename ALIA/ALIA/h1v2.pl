:-use_module(puissance4).


%g([[0,0,0,0,0,0,0],
%    [0,0,0,0,0,0,0],
%    [0,0,0,0,0,0,0],
%    [0,0,0,1,1,0,0],
%    [0,0,2,2,1,0,0],
%    [0,2,1,1,2,2,0]]).

%lcp([[5,0],[4,1],[3,2],[2,3],[2,4],[4,5], [5,6]]).

%Recuperer l'element d'un liste a l'indice i
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.

%Recuperer un element d'une liste L a deux dimensions a l'indice [I][J] et le resultat va dans Y
% trouverElement2Dimensions(I,J,Y,L):-trouverElement(I,X,L),trouverElement(J,Y,X).
trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%X et Y sont les cordonnees de la case, L la grille de jeu et R le resultat
voisin_gauche([X,Y2],R, L):-trouverElement2Dimensions(X,Y,R,L),Y2 is Y+1, X<6, X>=0, Y<6.
voisin_gauche([_,0],R, L):-R is 404.

%X et Y sont les cordonnees de la case, L la grille de jeu et R le resultat
voisin_droite([X,Y2],R, L):-trouverElement2Dimensions(X,Y,R,L),Y2 is Y-1, X<6, Y=<7 .
voisin_droite([_,6],R, L):-R is 404.

%X et Y sont les cordonnees de la case, L la grille de jeu et R le resultat
voisin_haut([X2,Y],R, L):-trouverElement2Dimensions(X,Y,R,L),X2 is X+1, X<5,Y<7, X2>0.
voisin_haut([0,_],R, L):-R is 404.


%X et Y sont les cordonnees de la case, L la grille de jeu et R le resultat
voisin_bas([X2,Y],R, L):-trouverElement2Dimensions(X,Y,R,L),X2 is X-1, X<6, Y<6, X2>0, X>0.
voisin_bas([5,_],R, L):-R is 404.

%La valeur du 1er voisin NO
%X et Y sont les cordonnees de la case, L la grille de jeu et R2 le resultat
voisin_NordOuest([X,Y],R2, L):-trouverElement2Dimensions(X2,Y2,R,L), X2 is X-1, Y2 is Y-1, X2>=0, Y2>=0, R2 is R.
voisin_NordOuest([X,Y],R2, L):- (  X==0, Y==0), R2 is 404.
voisin_NordOuest([X,Y],R2, L):- ( X=<0; Y=<0), (  X=\=0; Y=\=0),R2 is 404.

%La valeur du 1er voisin NE
%X et Y sont les cordonnees de la case, L la grille de jeu et R2 le resultat
voisin_NordEst([X,Y],R2, L):-trouverElement2Dimensions(X2,Y2,R,L), X2 is X-1, Y2 is Y+1, X2>=0, Y2=<7, R2 is R.
voisin_NordEst([0,Y],R2, L):- R2 is 404.
voisin_NordEst([X,6],R2, L):- X=\=0, R2 is 404.


%La valeur du voisin en bas a droite d'une case
%X et Y sont les cordonnees de la case, L la grille de jeu et R2 le resultat
voisin_SudEst([X,Y],R2, L):-trouverElement2Dimensions(X2,Y2,R,L), X2 is X+1, Y2 is Y+1, X2=<7, Y2=<7, R2 is R.
voisin_SudEst([5,Y],R2, L):- R2 is 404.
voisin_SudEst([X,6],R2, L):- X=\=5, R2 is 404.

%La valeur du voisin en bas a gauche d'une case
%X et Y sont les cordonnees de la case, L la grille de jeu et R2 le resultat
voisin_SudOuest([X,Y],R2, L):-trouverElement2Dimensions(X2,Y2,R,L), X2 is X+1, Y2 is Y-1, X2=<7, Y2>=0, R2 is R.
voisin_SudOuest([5,Y],R2, L):- R2 is 404.
voisin_SudOuest([X,0],R2, L):- X=\=5, R2 is 404.


%Retourne 1 s il y a 1 pion de la meme couleur en haut ou en bas, 2 si les 2.
compter_voisins_mCouleur_HB([X,Y],L,R2,J):-( voisin_haut([X,Y],R3, L) , voisin_bas([X,Y],R4, L)) , (   R3=\=J , R4=\=J  ),R2 is 0.
compter_voisins_mCouleur_HB([X,Y],L,R2,J):-( voisin_haut([X,Y],R3, L),voisin_bas([X,Y],R4, L)) , (   R3==J , R4==J),R2 is 2.
compter_voisins_mCouleur_HB([X,Y],L,R2,J):-( voisin_haut([X,Y],R3, L) , voisin_bas([X,Y],R4, L)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1.


%Retourne 1 s il y a 1 pion de la meme couleur a gauche ou a droite, 2 si les 2.
compter_voisins_mCouleur_GD([X,Y],L,R2,J):-( voisin_droite([X,Y],R3, L),voisin_gauche([X,Y],R4, L)) , (   R3=\=J , R4=\=J ),R2 is 0.
compter_voisins_mCouleur_GD([X,Y],L,R2,J):-( voisin_droite([X,Y],R3, L),voisin_gauche([X,Y],R4, L)) , (   R3==J , R4==J),R2 is 2.
compter_voisins_mCouleur_GD([X,Y],L,R2,J):-( voisin_droite([X,Y],R3, L),voisin_gauche([X,Y],R4, L)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1.

%Pareil sur la diagonale ascendente de droite a gauche.
compter_voisins_mCouleur_Diag1([X,Y],L,R2,J):-( voisin_SudOuest([X,Y],R3, L),voisin_NordEst([X,Y],R4, L)) , (   R3=\=J , R4=\=J ),R2 is 0.
compter_voisins_mCouleur_Diag1([X,Y],L,R2,J):-( voisin_SudOuest([X,Y],R3, L),voisin_NordEst([X,Y],R4, L)) , (   R3==J , R4==J),R2 is 2.
compter_voisins_mCouleur_Diag1([X,Y],L,R2,J):-( voisin_SudOuest([X,Y],R3, L),voisin_NordEst([X,Y],R4, L)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1.


%Pareil sur la diagonale descendente de droite a gauche.
compter_voisins_mCouleur_Diag2([X,Y],L,R2,J):-( voisin_SudEst([X,Y],R3, L),voisin_NordOuest([X,Y],R4, L)) , (   R3=\=J , R4=\=J  ),R2 is 0.
compter_voisins_mCouleur_Diag2([X,Y],L,R2,J):-( voisin_SudEst([X,Y],R3, L),voisin_NordOuest([X,Y],R4, L)) , (   R3==J , R4==J),R2 is 2.
compter_voisins_mCouleur_Diag2([X,Y],L,R2,J):-( voisin_SudEst([X,Y],R3, L),voisin_NordOuest([X,Y],R4, L)) , (  ( (R3=\=J ; R4=\=J)) , (   R3==J ; R4==J )) ,R2 is 1.

% Compte le nombre total de voisins de la meme couleur que le joueur
% autour d'une case donnee X et Y sont les coordonnees de la case, L la
% grille de jeu, J le joueur (1 ou 2) et R le resultat
nb_voisins_total([X,Y],L,R,J):-compter_voisins_mCouleur_HB([X,Y],L,R2,J),compter_voisins_mCouleur_GD([X,Y],L,R3,J),
							compter_voisins_mCouleur_Diag1([X,Y],L,R4,J), compter_voisins_mCouleur_Diag2([X,Y],L,R5,J),R is R2+R3+R4+R5 .

% Donne la liste des nombres de voisins de la meme couleur que le joueur
% pour tout les coups possibles A est la LCP, L la grille de jeu, J le
% joueur et C la liste resultat
liste_nbVoisins([A],L,J,[C]):-nb_voisins_total(A,L,C,J).
liste_nbVoisins([A|Y],L,J,[C|R]):-nb_voisins_total(A,L,C,J),liste_nbVoisins(Y,L,J,R).

%recuperer le max d'un tableau
max([],0).
max([H|T],Max) :-max(T,TMax),H > TMax,Max is H.
max([H|T],Max) :- max(T,TMax), H=< TMax, Max is TMax.

%recuperer l'element X d'indice M d'un tableau
indice(X, 0, [X | _]).
indice(X, M, [_ | L]) :- indice(X, K, L), M is K + 1.

indice_coup_choisi(A,L,J,K):-liste_nbVoisins(A,L,J,C), max(C,I2),   indice(I2, K, C),!.

attaque(L,A,J,C3):-indice_coup_choisi(A,L,J,K),trouverElement(K,C3,A) .

