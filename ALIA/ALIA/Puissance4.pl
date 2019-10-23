%%%%D�nomination des param�tres
%Grille : G (Liste des lignes de 7 �l�ments)
%Joueur : J
%taille de la Grille (en nombre de lignes)
%Liste des coups possibles : LCP




%%%%Commencer le jeu  : Initialisation de la grille et de la lcp
%grille de d�part de 6*7 vide.
%Le joueur 1 d�marre.
init :- jouerCoup([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], 1,
                   [[6,1],[6,2],[6,3],[6,4],[6,5],[6,6],[6,7]]).

%R�cup�rer l'�l�ment d'un liste � l'indice i
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
finJeuEgalite(LCP) :- grillePleine(LCP), write('Egalit� !').

%%%Conditions de victoire

%%Victoire � l'horizontale
victoireLigne([J,J,J,J,_,_,_],J,1).
victoireLigne([_,J,J,J,J,_,_],J,1).
victoireLigne([_,_,J,J,J,J,_],J,1).
victoireLigne([_,_,_,J,J,J,J],J,1).
victoireLigne(_,_,0).
victoireHorizontale([],_):-fail.
victoireHorizontale([L|_],J):- victoireLigne(L,J,R),R==1.
victoireHorizontale([L|G],J):- victoireLigne(L,J,R),R==0,victoireHorizontale(G,J).

%%Victoire � la verticale
victoireColonne([J,J,J,J,_,_],J).
victoireColonne([_,J,J,J,J,_],J).
victoireColonne([_,_,J,J,J,J],J).

recupererCol([],_,[]).
recupererCol([L|G],I,[R1|R]):-trouverElement(I,R1,L),recupererCol(G,I,R).

victoireVerticale([],_,_) :- fail.
victoireVerticale(G,I,J) :- recupererCol(G,I,R), I1 is I+1, (victoireColonne(R,J);victoireVerticale(G,I1,J)).

%%Victoire � la diagonale




%%R�cup�ration du coup du joueur


%%%Grille pleine
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

