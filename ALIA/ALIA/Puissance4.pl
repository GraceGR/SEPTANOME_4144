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

%Récupérer l'élément d'un liste à l'indice i
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.


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
victoireHorizontale([],_,_).
victoireHorizontale([L|_],J):- victoireLigne(L,J,R),R==1.
victoireHorizontale([L|G],J):- victoireLigne(L,J,R),R==0,victoireHorizontale(G,J).

%%Victoire à la verticale
victoireVerticale(G,J) :- transforme


%%Victoire à la diagonale




%%Récupération du coup du joueur


%%%Grille pleine
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

