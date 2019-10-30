%%%Heuristique 5 : Attaque et defense equilibrees

:-use_module(puissance4).
:-use_module(h3).

% Ni l'attaque ni la defense ne sont privilegiee. Dans la liste
% des coups possibles, on calcule le nombre de pions alignes
% (dans les 8 sens) pour chaque coup et on joue a la position ayant le
% nombre de pions max, qu'il s'agisse d'une attaque ou d'une defense.

heuristique5(G,LCP,J,C):-attaque(G,LCP,J,C1,M1),changerJoueur(J,Jsuiv),attaque(G,LCP,Jsuiv,C2,M2),comparaison2(M1,M2,C1,C2,C).

%Si on peut gagner, on joue le coup attaque
comparaison2(M1,_,C1,_,C1):-M1==30.
%Si l'adversaire peut gagner et que nous non, on contre
comparaison2(M1,M2,_,C2,C2):-M2==30,M1\==30.
% Si le coup en attaque a un max superieur ou egal a celui de la
% defense, on attaque
comparaison2(M1,M2,C1,_,C1):-M1>=M2.
% Si la defense a un max strictement plus grand que l'attaque, on defend
comparaison2(M1,M2,_,C2,C2):-M2>M1.

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

