%%%Heuristique 4 : Attaque et defense oriente attaque

heuristique4(G,LCP,J,C):-attaque(G,LCP,J,C1,M1),changerJ(J,Jsuiv),attaque(G,LCP,Jsuiv,C2,M2),comparaison1(M1,M2,C1,C2,C).

%Si on peut gagner, on joue le coup attaque
comparaison1(M1,_,C1,_,C1):-M1==30.
%Si l'adversaire peut gagner et que nous non, on contre
comparaison1(M1,M2,_,C2,C2):-M2==30,M1\==30.
%Dans tous les autres cas, on attaque
comparaison1(_,_,C1,_,C1).

%%%%Changer de joueur
changerJ(1,2).
changerJ(2,1).

% Recuperer le meilleur coup possible C de la liste des
% coups possibles LCP, a jouer dans la grille G dans une optique
% d'attaque et donc d'aligner le plus grand nombre de pions possibles
% pour le joueur J
attaque(G,LCP,J,C,M):-random_member(C1,LCP),parcoursLCP(G,[C1|LCP],J,C1,0,C,M).

% Parcourir la liste des coups possibles LCP, en regardant pour chaque
% coup possible C de la liste LCP le nombre maximal de pions
% consecutifs alignes dans la grille G, pour le joueur J avec le
% resultat dans M, si le pion est effectivement place en C. A chaque
% nouvel appel, comparer la valeur max trouvee M a celle deja stockee
% dans MAX, garder le max des deux dans MAX et stocker le coup associe
% dans CMAX. Lorsque LCP est vide mettre CMAX dans Cf.
parcoursLCP(_,_,_,[X,Y],30,[Xf,Yf],Mf):- Xf is X, Yf is Y,Mf is 30.
parcoursLCP(_,[],_,[X,Y],MAX,[Xf,Yf],Mf):-Xf is X,Yf is Y,Mf is MAX.
parcoursLCP(G,[C|LCP],J,_,MAX,Cf,Mf):- parcoursDirections(G,J,C,M),M>MAX,parcoursLCP(G,LCP,J,C,M,Cf,Mf).
parcoursLCP(G,[C|LCP],J,CMAX,MAX,Cf,Mf):- parcoursDirections(G,J,C,M),M=<MAX,parcoursLCP(G,LCP,J,CMAX,MAX,Cf,Mf).

% Si le coup C est joue, recuperer la valeur du plus grand nombre de
% pions du joueur J consecutifs places a cote de C dans la grille G et
% mettre le resultat dans M.
parcoursDirections(G,J,C,M):-parcoursLigneDG(G,J,C,0,M1),parcoursLigneGD(G,J,C,0,M2),parcoursColonneHB(G,J,C,0,M3),
 parcoursColonneBH(G,J,C,0,M4),parcoursDiagonale11(G,J,C,0,M5),parcoursDiagonale12(G,J,C,0,M6),
 parcoursDiagonale21(G,J,C,0,M7),parcoursDiagonale22(G,J,C,0,M8),calculMax(M1,M2,M3,M4,M5,M6,M7,M8,M).

%Recuperer le max entre A et B
max(A,B,A):-A>=B.
max(A,B,B):-A<B.

% Recuperer le max entre M1,M2,M3,M4,M5,M6,M7 et M8 mettre le
% resultat dans M
calculMax(M1,M2,M3,M4,M5,M6,M7,M8,M):-max(M1,M2,Ma),max(Ma,M3,Mb),max(Mb,M4,Mc),max(Mc,M5,Md),
	max(Md,M6,Me),max(Me,M7,Mf),max(Mf,M8,M).

%%Ligne Gauche Droite GD
% Parcourir la Xeme ligne de la grille G, en se deplacant a partir de la
% colonne Y de trois coups vers la droite en utilisant le compteur CMT
% pour voir le nombre de pions appartenant au joueur J, consecutivement
% placés à côté de la case de coordonnées [X][Y], avec le resultat mit dans M1.
parcoursLigneGD(_,_,_,3,M1):- M1 is 30.
parcoursLigneGD(_,_,[_,Y],CMT,M1):-Y==6,M1 is CMT*10.
parcoursLigneGD(G,J,[X,Y],CMT,M1):-Y\==6,Y1 is Y+1,trouverElement2Dimensions(X,Y1,R,G),R==J,CMT1 is CMT +1,parcoursLigneGD(G,J,[X,Y1],CMT1,M1).
parcoursLigneGD(G,J,[X,Y],CMT,M1):-Y\==6,Y1 is Y+1,trouverElement2Dimensions(X,Y1,R,G),R\==J, M1 is CMT*10.

%%Ligne Droite Gauche DG
% Parcourir la Xeme ligne de la grille G, en se deplacant a partir de la
% colonne Y de trois coups vers la gauche en utilisant le compteur CMT,
% pour voir le nombre de pions appartenant au joueur J, consecutivement
% placés à côté de la case de coordonnées [X][Y], avec le resultat mit dans M1.
parcoursLigneDG(_,_,_,3,M1):- M1 is 30.
parcoursLigneDG(_,_,[_,Y],CMT,M1):-Y==0,M1 is CMT*10.
parcoursLigneDG(G,J,[X,Y],CMT,M1):-Y\==0,Y1 is Y-1,trouverElement2Dimensions(X,Y1,R,G),R==J,CMT1 is CMT +1,parcoursLigneDG(G,J,[X,Y1],CMT1,M1).
parcoursLigneDG(G,J,[X,Y],CMT,M1):-Y\==0,Y1 is Y-1,trouverElement2Dimensions(X,Y1,R,G),R\==J, M1 is CMT*10.

%%Colonne Haut Bas HB
% Parcourir la Yeme colonne de la grille G, en se deplacant a partir de
% la ligne X de trois coups vers le bas en utilisant le compteur
% CMT, pour voir le nombre de pions appartenant au joueur J, consecutivement
% placés à côté de la case de coordonnées [X][Y], avec le resultat mit dans M1.
parcoursColonneHB(_,_,_,3,M1):- M1 is 30.
parcoursColonneHB(_,_,[X,_],CMT,M1):-X==5,M1 is CMT*10.
parcoursColonneHB(G,J,[X,Y],CMT,M1):-X\==5,X1 is X+1,trouverElement2Dimensions(X1,Y,R,G),R==J,CMT1 is CMT +1,parcoursColonneHB(G,J,[X1,Y],CMT1,M1).
parcoursColonneHB(G,J,[X,Y],CMT,M1):-X\==5,X1 is X+1,trouverElement2Dimensions(X1,Y,R,G),R\==J, M1 is CMT*10.

%%Colonne Bas Haut BH
% Parcourir la Yeme colonne de la grille G, en se deplacant a partir de
% la ligne X de trois coups vers le haut en utilisant le compteur
% CMT, pour voir le nombre de pions appartenant au joueur J, consecutivement
% placés à côté de la case de coordonnées [X][Y], avec le resultat mit dans M1.
parcoursColonneBH(_,_,_,3,M1):- M1 is 30.
parcoursColonneBH(_,_,[X,_],CMT,M1):-X==0,M1 is CMT*10.
parcoursColonneBH(G,J,[X,Y],CMT,M1):-X\==0,X1 is X-1,trouverElement2Dimensions(X1,Y,R,G),R==J,CMT1 is CMT +1,parcoursColonneBH(G,J,[X1,Y],CMT1,M1).
parcoursColonneBH(G,J,[X,Y],CMT,M1):-X\==0,X1 is X-1,trouverElement2Dimensions(X1,Y,R,G),R\==J, M1 is CMT*10.

%%Diagonale Bas Droit Haut Gauche BD HG/ Diagonale 11
% Parcourir la diagonale (X,Y) de la grille G, en se deplacant a
% partir de la case de coordonnées [X][Y] de trois coups vers le haut
% gauche en utilisant le compteur CMT, pour voir le nombre de pions
% appartenant au joueur J, consecutivement placés à côté de la case de
% coordonnées [X][Y], avec le resultat mit dans M1.
parcoursDiagonale11(_,_,_,3,M1):- M1 is 30.
parcoursDiagonale11(_,_,[X,Y],CMT,M1):-(X==0;Y==0),M1 is CMT*10.
parcoursDiagonale11(G,J,[X,Y],CMT,M1):-X\==0,Y\==0,X1 is X-1,Y1 is Y-1,trouverElement2Dimensions(X1,Y1,R,G),R==J,CMT1 is CMT +1,parcoursDiagonale11(G,J,[X1,Y1],CMT1,M1).
parcoursDiagonale11(G,J,[X,Y],CMT,M1):-X\==0,Y\==0,X1 is X-1,Y1 is Y-1,trouverElement2Dimensions(X1,Y1,R,G),R\==J, M1 is CMT*10.

%%Diagonale Bas Gauche Haut Droit BG HD/Diagonale 12
% Parcourir la diagonale (X,Y) de la grille G, en se deplacant a
% partir de la case de coordonnées [X][Y] de trois coups vers le haut
% droit en utilisant le compteur CMT, pour voir le nombre de pions
% appartenant au joueur J, consecutivement placés à côté de la case de
% coordonnées [X][Y], avec le resultat mit dans M1.
parcoursDiagonale12(_,_,_,3,M1):- M1 is 30.
parcoursDiagonale12(_,_,[X,Y],CMT,M1):-(X==0;Y==6),M1 is CMT*10.
parcoursDiagonale12(G,J,[X,Y],CMT,M1):-X\==0,Y\==6,X1 is X-1,Y1 is Y+1,trouverElement2Dimensions(X1,Y1,R,G),R==J,CMT1 is CMT +1,parcoursDiagonale12(G,J,[X1,Y1],CMT1,M1).
parcoursDiagonale12(G,J,[X,Y],CMT,M1):-X\==0,Y\==6,X1 is X-1,Y1 is Y+1,trouverElement2Dimensions(X1,Y1,R,G),R\==J, M1 is CMT*10.

%%Diagonale Haut Droit Bas Gauche HD BG/Diagonale 21
% Parcourir la diagonale (X,Y) de la grille G, en se deplacant a
% partir de la case de coordonnées [X][Y] de trois coups vers le bas
% gauche en utilisant le compteur CMT, pour voir le nombre de pions
% appartenant au joueur J, consecutivement placés à côté de la case de
% coordonnées [X][Y], avec le resultat mit dans M1.
parcoursDiagonale21(_,_,_,3,M1):- M1 is 30.
parcoursDiagonale21(_,_,[X,Y],CMT,M1):-(X==5;Y==0),M1 is CMT*10.
parcoursDiagonale21(G,J,[X,Y],CMT,M1):-X\==5,Y\==0,X1 is X+1,Y1 is Y-1,trouverElement2Dimensions(X1,Y1,R,G),R==J,CMT1 is CMT +1,parcoursDiagonale21(G,J,[X1,Y1],CMT1,M1).
parcoursDiagonale21(G,J,[X,Y],CMT,M1):-X\==5,Y\==0,X1 is X+1,Y1 is Y-1,trouverElement2Dimensions(X1,Y1,R,G),R\==J, M1 is CMT*10.


%%Diagonale Haut Gauche Bas Droit HG BD/Diagonale 22
% Parcourir la diagonale (X,Y) de la grille G, en se deplacant a
% partir de la case de coordonnées [X][Y] de trois coups vers le bas
% droit en utilisant le compteur CMT, pour voir le nombre de pions
% appartenant au joueur J, consecutivement placés à côté de la case de
% coordonnées [X][Y], avec le resultat mit dans M1.
parcoursDiagonale22(_,_,_,3,M1):- M1 is 30.
parcoursDiagonale22(_,_,[X,Y],CMT,M1):-(X==5;Y==6),M1 is CMT*10.
parcoursDiagonale22(G,J,[X,Y],CMT,M1):-X\==5,Y\==6,X1 is X+1,Y1 is Y+1,trouverElement2Dimensions(X1,Y1,R,G),R==J,CMT1 is CMT +1,parcoursDiagonale22(G,J,[X1,Y1],CMT1,M1).
parcoursDiagonale22(G,J,[X,Y],CMT,M1):-X\==5,Y\==6,X1 is X+1,Y1 is Y+1,trouverElement2Dimensions(X1,Y1,R,G),R\==J, M1 is CMT*10.


trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%Test
%parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,6],0,M).
%%
%%parcoursDirections([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,6],M).
% parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[10,10],0,Cf).
%attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf).
