%%%%D�nomination des param�tres
%Grille : G (Liste des lignes de 7 �l�ments)
%Joueur : J
%Coup : C (liste � deux �l�ments, i et j. i la ligne et j la colonne)
%Liste des coups possibles : LCP

%Importation des heuristiques
:- use_module(h_3).


%%%%Commencer le jeu  : Initialisation de la grille et de la lcp
%grille de d�part de 6*7 vide.
%Le joueur 1 d�marre.
init :- jouer([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],
                   [0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]], 1,
                   [[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]]).

%R�cup�rer l'�l�ment d'un liste � l'indice N1 et le r�sultat va dans X
%R�cuperer les indices de l'element X et le resultat va dans N1
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.

%R�cup�rer un �lement d'une liste L � deux dimensions � l'indice [I][J]et le r�sultat va dans Y
% trouverElement2Dimensions(I,J,Y,L):-trouverElement(I,X,L),trouverElement(J,Y,X).
trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%%Affichage du plateau
%Afficher les s�parations entre les lignes de la grille
afficherSeparation() :- write('|---+---+---+---+---+---+---|'),write('\n').
%Afficher tous les elements X1 d'une ligne L1 et si on arrive � la fin de la ligne, on saute une ligne
afficherLigne([]) :- write('\n').
afficherLigne([X1|L1]) :- write(' '), write(X1), write(' '),write('|'), afficherLigne(L1).
%Afficher les lignes L de la grille G
afficherPlateau([]).
afficherPlateau([L|G]) :- write('|'),afficherLigne(L), afficherSeparation(), afficherPlateau(G).

%%%%Jouer
%jouerCoup(G,J, LCP) :- afficherSeparation(),afficherPlateau(G).
%Si le jeu est termin�, on affiche le gagnant

jouer(G,_,LCP) :- finJeuVictoire(G,J), gagnant(J), !, afficherSeparation(),afficherPlateau(G).
jouer(G,_,LCP) :-finJeuEgalite(LCP), writeln('Egalit� !'), afficherSeparation(),afficherPlateau(G).
%Sinon, on joue
jouer(G,J,LCP) :- write("C'est au tour de :"), writeln(J),
    afficherSeparation(),
    afficherPlateau(G),
    attaque(G,LCP,J,C), %S�lectionner le coup � jouer gr�ce � une heuristique
    write('Coup choisi : '),
    writeln(C),
    jouerCoup(G,C,NouvG,J), %Jouer le coup et recuperer la nouvelle grille
    modifier(LCP, C, NouvLCP), %mise a jour de la liste des coups possibles
    changerJoueur(J, Jsuivant), %changer de joueur pour le tour suivant
    jouer(NouvG,Jsuivant,NouvLCP).

%Choix des heuristiques pour chaque joueur
% jouerAvecHeuristique(G,LCP,1,C) :- attaque(G,LCP,1,C). %Le joueur 1
% joue avec l'heuristique d'attaque
% jouerAvecHeuristique(G,LCP,2,C) :- attaque(G,LCP,2,C). %Le joueur 1
% joue avec l'heuristique d'attaque


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
%%%Random
%%Choisir un coup au hasard dans la liste de coups possibles.
aleatoire(LCP,C) :- random_member(C,LCP).

%%%Heuristique 2 : Attaque
%attaque(G,LCP,J,C):-parcoursLCP(G,LCP,J,C,_).
%% CMAX : Coup max et MAX : max associ� au coup
%parcoursLCP(_,[],_,[],0).
%parcoursLCP(G,[C|LCP],J,CMAX,MAX):-parcoursDirections(G,J,C,M),testMax(C,M,CMAX,MAX),parcoursLCP(G,LCP,J,CMAX,MAX).
%testMax(C,M,CMAX,MAX,C1,M1):- M>MAX,M1 is M,C1 is C.
%testMax(_,_,_,_).

%%ca ou ...
%parcoursLCP(G,[C|LCP],J,C,M):- parcoursDirections(G,J,C,M),M>MAX,parcoursLCP(G,LCP,J,CMAX,MAX).
%parcoursLCP(G,[C|LCP],J,CMAX,MAX):-  parcoursDirections(G,J,C,M),M=<MAX,parcoursLCP(G,LCP,J,CMAX,MAX).
%%ca
%parcoursLCP(G,[C|LCP],J,C,M):- parcoursDirections(G,J,CMAX,MAX),M>MAX,parcoursLCP(G,LCP,J,C,M).
%parcoursLCP(G,[C|LCP],J,CMAX,MAX):-  parcoursDirections(G,J,C,M),M=<MAX,parcoursLCP(G,LCP,J,CMAX,MAX).

%parcoursDirections(G,J,C,M):-parcoursLigneDG(G,J,C,M1),parcoursLigneGD(G,J,C,M2),parcoursColonneDG(G,J,C,M3),parcoursColonneGD(G,J,C,M4),parcoursDiagonale11(G,J,C,M5),parcoursDiagonale12(G,J,C,M6),parcoursDiagonale21(G,J,C,M7),parcoursDiagonale22(G,J,C,M8),calculMax(M1,M2,M3,M4,M5,M6,M7,M8,M).

%%Ligne Gauche Droite GD
%%Ligne Droite Gauche DG
%%Colonne Gauche Droite GD
%%Colonne DG
%%Diagonale HG BD
%%Diagonale HD BG

%%% Heuristique 3 : Attaque et d�fense mais privil�gier l'attaque en
%%% cas d'�galit�


%%%%Conditions de fin du jeu

%finJeuVictoire

finJeuEgalite(LCP) :- grillePleine(LCP).
finJeuVictoire(G, 1):- victoireHorizontale(G,1);victoireVerticale(G,1,1); victoireDiagonale1(G,0,0,1,0,0,0), victoireDiagonale2(G,0,6,1,0,0,0).
finJeuVictoire(G, 2):- victoireHorizontale(G,2);victoireVerticale(G,1,2); victoireDiagonale1(G,0,0,2,0,0,0), victoireDiagonale2(G,0,6,2,0,0,0).
gagnant(J) :-  write('Game Over. Gagnant :'), writeln(J).



%%%Conditions de victoire

%%Victoire � l'horizontale
%Regarder s'il y a une combinaison de 4 jetons J sur une m�me ligne, le r�sultat est renvoy� dans le dernier argument
victoireLigne([J,J,J,J,_,_,_],J,1).
victoireLigne([_,J,J,J,J,_,_],J,1).
victoireLigne([_,_,J,J,J,J,_],J,1).
victoireLigne([_,_,_,J,J,J,J],J,1).
victoireLigne(_,_,0).
%Parcours toutes les lignes L de la grille G pour trouver s'il y a une victoire pour le joueur J
victoireHorizontale([],_,_).
victoireHorizontale([L|_],J):- victoireLigne(L,J,R),R==1.
victoireHorizontale([L|G],J):- victoireLigne(L,J,R),R==0,victoireHorizontale(G,J).


%%Victoire � la verticale
%Regarder s'il y a une combinaison de 4 jetons J sur une m�me colonne
victoireColonne([J,J,J,J,_,_],J).
victoireColonne([_,J,J,J,J,_],J).
victoireColonne([_,_,J,J,J,J],J).

%R�cuperer chaque element � l'indice I de toutes les lignes L de la grille G pour en faire une colonne R
recupererCol([],_,[]).
recupererCol([L|G],I,[R1|R]):-trouverElement(I,R1,L),recupererCol(G,I,R).

%R�cuperer une colonne apr�s l'autre et regarder si elle est gagnante, sinon continuer avec la colonne suivante
victoireVerticale([],_,_) :- fail.
victoireVerticale(G,I,J) :- recupererCol(G,I,R), I1 is I+1, (victoireColonne(R,J);victoireVerticale(G,I1,J)).


%%Victoire � la diagonale
%%Victoire en diagonale sens 1 : haut droit et bas gauche
%Parcourir la grille G et r�cup�rer l'element � l'indice [I][K]. Si il est �gal � J alors, on incr�mente notre compteur CMPT et on poursuit
%la recherche dans la m�me diagonale. Sinon, on met CMPT � 0 et on continue dans la m�me diagonale. Dans les deux cas, on incremente CMTI et CMTK
%qui correspondent au nombre de coups faits dans une m�me diagonale.
%Si CMTP = 4, alors la diagonale est victorieuse et on arr�te.
%Si on a fini le parcours de toute la grille, on arrete et on retourne fail.
%Lorsque on d�passe les limites de la grille, on se replace au d�but de la diagonale suivante.
victoireDiagonale1(_,_,_,_,4,_,_).
victoireDiagonale1(_,I,K,_,_,_,_):- I>5,K>6,fail.
victoireDiagonale1(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K-1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale1(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale1(G,I,K,J,_,CMTI,CMTK):- K<0,K1 is CMTK + 1,I1 is I-CMTI,victoireDiagonale1(G,I1,K1,J,0,0,0).
victoireDiagonale1(G,I,K,J,_,_,_):- K==7,I1 is I+1,victoireDiagonale1(G,I1,0,J,0,0,0).
victoireDiagonale1(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale1(G,I1,0,J,0,0,0).

%%Victoire en diagonale sens 2 : haut gauche et bas droit
%Parcourir la grille G et r�cup�rer l'element � l'indice [I][K]. Si il est �gal � J alors, on incr�mente notre compteur CMPT et on poursuit
%la recherche dans la m�me diagonale. Sinon, on met CMPT � 0 et on continue dans la m�me diagonale. Dans les deux cas, on incremente CMTI et CMTK
%qui correspondent au nombre de coups faits dans une m�me diagonale.
%Si CMTP = 4, alors la diagonale est victorieuse et on arr�te.
%Si on a fini le parcours de toute la grille, on arrete et on retourne fail.
%Lorsque on d�passe les limites de la grille, on se replace au d�but de la diagonale suivante.
victoireDiagonale2(_,_,_,_,4,_,_).
victoireDiagonale2(_,I,K,_,_,_,_):- I>5,K<0,fail.
victoireDiagonale2(G,I,K,J,CMPT,CMTI,CMTK):- I=<5,K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y==J,CMPT1 is CMPT + 1, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,CMPT1,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- I=<5, K=<6,K>=0,trouverElement2Dimensions(I,K,Y,G),Y\==J, I1 is I+1, K1 is K+1,CMTI1 is CMTI +1, CMTK1 is CMTK +1,victoireDiagonale2(G,I1,K1,J,0,CMTI1,CMTK1).
victoireDiagonale2(G,I,K,J,_,_,_):- K<0,I1 is I+1,victoireDiagonale2(G,I1,6,J,0,0,0).
victoireDiagonale2(G,I,K,J,_,CMTI,CMTK):- K==7,I1 is I-CMTI,K1 is K-CMTK-1,victoireDiagonale2(G,I1,K1,J,0,0,0).
victoireDiagonale2(G,I,_,J,_,CMTI,_):- I==6, I1 is I-CMTI+1,victoireDiagonale2(G,I1,6,J,0,0,0).


%%Grille pleine
%On regarde si la liste des coups possibles LCP est vide. Si c'est le cas la partie est termin�e.
ligneVide([]).
grillePleine([]).
grillePleine([X|LCP]) :- ligneVide(X), grillePleine(LCP).

