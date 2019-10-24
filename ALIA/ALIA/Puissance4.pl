%%%%Dénomination des paramètres
%Grille : G (Liste des lignes de 7 éléments)
%Joueur : J
%Coup : C (liste à deux éléments, i et j. i la ligne et j la colonne)
%Liste des coups possibles : LCP




%%%%Commencer le jeu  : Initialisation de la grille et de la lcp
%grille de départ de 6*7 vide.
%Le joueur 1 démarre.
init :- jouer([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], 1,
                   [[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]]).

%Récupérer l'élément d'un liste à l'indice i
trouverElement(1,X,[X|_]).
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

%%%%Jouer
%jouerCoup(G,J, LCP) :- afficherSeparation(),afficherPlateau(G).
%Si le jeu est terminé, on affiche le gagnant

jouer(G,_,LCP) :- finJeuVictoire(G,J), gagnant(J), !, afficherSeparation(),afficherPlateau(G).
jouer(G,_,LCP) :-finJeuEgalite(LCP), writeln('Egalité !'), afficherSeparation(),afficherPlateau(G).
%Sinon, on joue
jouer(G,J,LCP) :- write("C'est au tour de :"), writeln(J),
    afficherSeparation(),
    afficherPlateau(G),
    aleatoire(LCP,C), %Sélectionner le coup à jouer grâce à une heuristique
    write('Coup choisi : '),
    writeln(C),
    jouerCoup(G,C,NouvG,J), %Jouer le coup et recuperer la nouvelle grille
    modifier(LCP, C, NouvLCP), %mise a jour de la liste des coups possibles
    changerJoueur(J, Jsuivant), %changer de joueur pour le tour suivant
    jouer(NouvG,Jsuivant,NouvLCP).

%modifier LCP après avoir joué un coup
%trouver le coup possible suivant s'il existe
%incremente(nouveau coup déterminé à partir du coup joué, coup joué)
increment_CP([Z|Y],[X|Y]):- X>0, Z is X-1.
increment_CP([],[0|_]).

%supprimer le coup déjà joué de la liste des coups possibles
supprimer_CP(C,[C|L],R):- supprimer_CP(C,L,R).
supprimer_CP(C,[X|L],[X|R]) :- supprimer_CP(C,L,R) ,X\==C.
supprimer_CP(_,[],[]).

%Ajouter le nouveau coup à la liste des coups possibles
modifier(LCP,[0|X],NouvLCP):- supprimer_CP([0|X],LCP,NouvLCP).
modifier(LCP,C,[NouvC|NouvLCP]) :-  increment_CP(NouvC,C), supprimer_CP(C,LCP,NouvLCP),NouvC\==[].

%%Jouer un coup (et mettre à jour la grille)
%IndColonne l'indice de la colonne dans laquelle J joue
%IndLigne l'indice de la ligne dans laquelle J joue
%nouvG la nouvelle grille
remplacer([_|T],0,X,[X|T]) :- !.
remplacer([H|T],I,X,[H|R]) :- I>0, I1 is I-1, remplacer(T,I1,X,R).

recupIndLigne(C, IndLigne) :- trouverElement(1,IndLigne,C).
recupIndColonne(C, IndColonne) :- trouverElement(2, IndColonne, C).
jouerCoup(G,C,NouvG,J) :- recupIndLigne(C, IndLigne), recupIndColonne(C, IndColonne),
    nth0(IndLigne, G, L), %Récupération de la ligne à jouer
    remplacer(L, IndColonne, J, NouvL), %Placement du pion à l'ind colonne
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
finJeuVictoire(G, 1):- victoireHorizontale(G,1);victoireVerticale(G,1,1); victoireDiagonale1(G,0,0,1,0,0,0), victoireDiagonale2(G,0,6,1,0,0,0).
finJeuVictoire(G, 2):- victoireHorizontale(G,2);victoireVerticale(G,1,2); victoireDiagonale1(G,0,0,2,0,0,0), victoireDiagonale2(G,0,6,2,0,0,0).
gagnant(J) :-  write('Game Over. Gagnant :'), writeln(J).



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
victoireColonne([J,J,J,J,_,_],J).
victoireColonne([_,J,J,J,J,_],J).
victoireColonne([_,_,J,J,J,J],J).

recupererCol([],_,[]).
recupererCol([L|G],I,[R1|R]):-trouverElement(I,R1,L),recupererCol(G,I,R).

victoireVerticale([],_,_) :- fail.
victoireVerticale(G,I,J) :- recupererCol(G,I,R), I1 is I+1, (victoireColonne(R,J);victoireVerticale(G,I1,J)).


%%Victoire à la diagonale
%%Victoire en diagonale sens 1
victoireDiagonale1(_,_,_,_,4,_,_).
victoireDiagonale1(_,I,K,_,_,_,_):- I>5,K>6,fail.
victoireDiagonale1(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- K<0,K1 is CMTK + 1,I1 is I-CMTI,victoireDiagonale1(G,I1,K1,J,0,0,0).
victoireDiagonale1(G,I,K,J,_,_,_):- K==7,I1 is I+1,victoireDiagonale1(G,I1,0,J,0,0,0).
victoireDiagonale1(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale1(G,I1,0,J,0,0,0).

%%Victoire en diagonale sens 2
victoireDiagonale2(_,_,_,_,4,_,_).
victoireDiagonale2(_,I,K,_,_,_,_):- I>5,K<0,fail.
victoireDiagonale2(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,_,_):- K<0,I1 is I+1,victoireDiagonale2(G,I1,6,J,0,0,0).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- K==7,I1 is I-CMTI,K1 is K-CMTK-1,victoireDiagonale2(G,I1,K1,J,0,0,0).
victoireDiagonale2(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale2(G,I1,6,J,0,0,0).


%%%Grille pleine
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

