%%%%Dénomination des paramètres
%Grille : G (Liste des lignes de 7 éléments)
%Joueur : J
%taille de la Grille (en nombre de lignes)
%Liste des coups possibles : LCP




%%%%Commencer le jeu  : Initialisation de la grille et de la lcp
%grille de départ de 6*7 vide.
%Le joueur 1 démarre.
init :- jouerCoup([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], 1,
                   [[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7]]).

%Récupérer l'élément d'une liste à l'indice i
trouverElement(1,X,[X|_]):-!.
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.

%Récupérer un élement d'une liste à deux dimensions à l'indice [I][J]
% trouverElement2Dimensions(I,J,Y,L):-trouverElement(I,X,L),trouverElement(J,Y,X).
trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%%Affichage du plateau
afficherSeparation() :- write('|---+---+---+---+---+---+---|'),write('\n').
afficherLigne([]) :- write('\n').
afficherLigne([X1|L1]) :- write(' '), write(X1), write(' '),write('|'), afficherLigne(L1).
afficherPlateau([]).
afficherPlateau([L|G]) :- write('|'),afficherLigne(L), afficherSeparation(), afficherPlateau(G).

%%%%Jouer un coup
jouerCoup(G,J, LCP) :- afficherSeparation(),afficherPlateau(G).


%%%%Changer de joueur
changerJoueur(1,2).
changerJoueur(2,1).


%%%%Conditions de fin du jeu

%finJeuVictoire
finJeuEgalite(LCP) :- grillePleine(LCP), write('Egalité !').

%%%Conditions de victoire

%%Victoire à l'horizontale
victoireLigne([J,J,J,J,_,_,_],J,1).
victoireLigne([_,J,J,J,J,_,_],J,1).
victoireLigne([_,_,J,J,J,J,_],J,1).
victoireLigne([_,_,_,J,J,J,J],J,1).
victoireLigne(_,_,0).
victoireHorizontale([],_):-fail.
victoireHorizontale([L|_],J):- victoireLigne(L,J,R),R==1.
victoireHorizontale([L|G],J):- victoireLigne(L,J,R),R==0,victoireHorizontale(G,J).

%%Victoire à la verticale
victoireColonne([J,J,J,J,_,_],J).
victoireColonne([_,J,J,J,J,_],J).
victoireColonne([_,_,J,J,J,J],J).

recupererCol([],_,[]).
recupererCol([L|G],I,[R1|R]):-trouverElement(I,R1,L),recupererCol(G,I,R).

victoireVerticale([],_,_) :- fail.
victoireVerticale(G,I,J) :- recupererCol(G,I,R), I1 is I+1, (victoireColonne(R,J);victoireVerticale(G,I1,J)).

%%Victoire en diagonale 1
victoireDiagonale1(_,_,_,_,4,_,_).
victoireDiagonale1(_,I,K,_,_,_,_):- I>5,K>6,fail.
victoireDiagonale1(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- K<0,K1 is CMTK + 1,I1 is I-CMTI,victoireDiagonale1(G,I1,K1,J,0,0,0).
victoireDiagonale1(G,I,K,J,_,_,_):- K==7,I1 is I+1,victoireDiagonale1(G,I1,0,J,0,0,0).
victoireDiagonale1(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale1(G,I1,0,J,0,0,0).

%%Victoire en diagonale 2
victoireDiagonale2(_,_,_,_,4,_,_).
victoireDiagonale2(_,I,K,_,_,_,_):- I>5,K<0,fail.
victoireDiagonale2(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,_,_):- K<0,I1 is I+1,victoireDiagonale2(G,I1,6,J,0,0,0).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- K==7,I1 is I-CMTI,K1 is K-CMTK-1,victoireDiagonale2(G,I1,K1,J,0,0,0).
victoireDiagonale2(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale2(G,I1,6,J,0,0,0).


%%Récupération du coup du joueur


%%%Grille pleine
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

% victoireDiagonale1([[0,0,0,0,0,0,0],[0,0,0,0,1,0,0],[0,0,0,1,0,0,0],[0,0,1,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,%0,0]],0,0,1,0,0,0).
%
%


%% victoireDiagonale2([[0,0,0,0,0,0,0],[0,1,0,0,0,0,0],[0,0,1,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,1,0,0],[0,0,0,0,0%,0,0]],0,6,1,0,0,0).
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%


