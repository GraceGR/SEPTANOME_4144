%%%Heuristique 4 : Attaque et defense oriente attaque

:-use_module(puissance4).
:-use_module(h3).

% Recuperer le meilleur coup possible C de la liste des
% coups possibles LCP, a jouer dans la grille G dans une optique
% d'attaque et donc d'aligner le plus grand nombre de pions possibles
% pour le joueur J. On privilegiera tout le temps l'attaque (aligner le
% plus de pions possibles) sauf dans le cas ou l'adversaire est sur le
% point de gagner (3 pions alignes) et dans ce cas on jouera le contre.

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
