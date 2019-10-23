%%%%D�nomination des param�tres
%Grille : G (Liste des lignes de 7 �l�ments)
%Joueur : J
%Coup : C (liste � deux �l�ments, i et j. i la ligne et j la colonne)
%Liste des coups possibles : LCP




%%%%Commencer le jeu  : Initialisation de la grille et de la lcp
%grille de d�part de 6*7 vide.
%Le joueur 1 d�marre.
init :- jouer([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], 1,
                   [[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]]).

%R�cup�rer l'�l�ment d'un liste � l'indice i
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.


%%Affichage du plateau
afficherSeparation() :- write('|---+---+---+---+---+---+---|'),write('\n').
afficherLigne([]) :- write('\n').
afficherLigne([X1|L1]) :- write(' '), write(X1), write(' '),write('|'), afficherLigne(L1).
afficherPlateau([]).
afficherPlateau([L|G]) :- write('|'),afficherLigne(L), afficherSeparation(), afficherPlateau(G).

%%%%Jouer
%jouerCoup(G,J, LCP) :- afficherSeparation(),afficherPlateau(G).
%Si le jeu est termin�, on affiche le gagnant
jouer(G,J,LCP) :- not(J==0), finJeuVictoire(G,J), !, write('Game Over. Gagnant :'), writeln(J), afficherSeparation(),afficherPlateau(G).
jouer(G,J,LCP) :- not(J==0), finJeuEgalite(LCP), writeln('Egalit� !'), afficherSeparation(),afficherPlateau(G).
%Sinon, on joue
jouer(G,J,LCP) :- write("C'est au tour de :"), writeln(J),
    afficherSeparation(),
    afficherPlateau(G),
    aleatoire(LCP,C), %S�lectionner le coup � jouer gr�ce � une heuristique
    write('Coup choisi : '),
    writeln(C),
    jouerCoup(G,C,NouvG,J), %Jouer le coup et recuperer la nouvelle grille
    modifier(LCP, C, NouvLCP), %mise a jour de la liste des coups possibles
    changerJoueur(J, Jsuivant), %changer de joueur pour le tour suivant
    jouer(NouvG,Jsuivant,NouvLCP).

%modifier LCP apr�s avoir jou� un coup
%trouver le coup possible suivant s'il existe
%incremente(nouveau coup d�termin� � partir du coup jou�, coup jou�)
increment_CP([Z|Y],[X|Y]):- X>0, Z is X-1.
increment_CP([],[0|_]).

%supprimer le coup d�j� jou� de la liste des coups possibles
supprimer_CP(C,[C|L],R):- supprimer_CP(C,L,R).
supprimer_CP(C,[X|L],[X|R]) :- supprimer_CP(C,L,R) ,X\==C.
supprimer_CP(_,[],[]).

%Ajouter le nouveau coup � la liste des coups possibles
modifier(LCP,[0|X],NouvLCP):- supprimer_CP([0|X],LCP,NouvLCP).
modifier(LCP,C,[NouvC|NouvLCP]) :-  increment_CP(NouvC,C), supprimer_CP(C,LCP,NouvLCP),NouvC\==[].

%%Jouer un coup (et mettre � jour la grille)
%IndColonne l'indice de la colonne dans laquelle J joue
%IndLigne l'indice de la ligne dans laquelle J joue
%nouvG la nouvelle grille
remplacer([_|T],0,X,[X|T]) :- !.
remplacer([H|T],I,X,[H|R]) :- I>0, I1 is I-1, remplacer(T,I1,X,R).

recupIndLigne(C, IndLigne) :- trouverElement(1,IndLigne,C).
recupIndColonne(C, IndColonne) :- trouverElement(2, IndColonne, C).
jouerCoup(G,C,NouvG,J) :- recupIndLigne(C, IndLigne), recupIndColonne(C, IndColonne),
    nth0(IndLigne, G, L), %R�cup�ration de la ligne � jouer
    remplacer(L, IndColonne, J, NouvL), %Placement du pion � l'ind colonne
    remplacer(G, IndLigne, NouvL, NouvG). %Remplacement de la ligne dans la grille

%%%%Changer de joueur
changerJoueur(1,2).
changerJoueur(2,1).


%%%%Heuristiques
%%%%Random
%Choisir un coup au hasard dans la liste de coups possibles.
aleatoire(LCP,C) :- random_member(C,LCP).

%%%%Conditions de fin du jeu

%finJeuVictoire

finJeuEgalite(LCP) :- grillePleine(LCP).
finJeuVictoire(G,J)  :- victoireHorizontale(G,J); victoireVerticale(G,1,J).

%%%Conditions de victoire

%%Victoire � l'horizontale
victoireLigne([J,J,J,J,_,_,_],J,1).
victoireLigne([_,J,J,J,J,_,_],J,1).
victoireLigne([_,_,J,J,J,J,_],J,1).
victoireLigne([_,_,_,J,J,J,J],J,1).
victoireLigne(_,_,0).
victoireHorizontale([],_,_).
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
%victoireDiagonale([],_,_).
%victoireDiagonale(G,J) :- victoireVerticale(G,_,J).




%%%Grille pleine
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

