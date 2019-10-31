g([[0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0],
    [0,0,1,1,1,0,0],
    [0,0,2,2,1,0,0],
    [0,0,1,1,2,0,0]]).
    

%RÃƒÂ©cupÃƒÂ©rer l'ÃƒÂ©lÃƒÂ©ment d'un liste ÃƒÂ  l'indice i
trouverElement(1,X,[X|_]).
trouverElement(N1,X,[_|L]) :- trouverElement(N,X,L), N1 is N+1.

%RÃ©cupÃ©rer un Ã©lement d'une liste L Ã  deux dimensions Ã  l'indice [I][J]et le rÃ©sultat va dans Y
% trouverElement2Dimensions(I,J,Y,L):-trouverElement(I,X,L),trouverElement(J,Y,X).
trouverElement2Dimensions(I,J,Y,L):- nth0(I,L,X),nth0(J,X,Y).

%Marche :) 
voisin_gauche([X,Y],R, L).
voisin_gauche([X,Y2],R, L):-trouverElement2Dimensions(X,Y,R,L),Y2 is Y+1, X<6, X>0, Y<6.

%Marche :) 
voisin_droite([X,Y],R, L).
voisin_droite([X,Y2],R, L):-trouverElement2Dimensions(X,Y,R,L),Y2 is Y-1, X<6, Y<7 .

%Marche :) 
voisin_haut([X,Y],R, L).
voisin_haut([X2,Y],R, L):-trouverElement2Dimensions(X,Y,R,L),X2 is X+1, X<5,Y<7, X2>0.

%Marche :) 
voisin_bas([X,Y],R, L).
voisin_bas([X2,Y],R, L):-trouverElement2Dimensions(X,Y,R,L),X2 is X-1, X<6, Y<6.

%La valeur du 1er voisin NW %Marche :) 
voisin_NordWest([X,Y],R, L).
voisin_NordWest([X,Y],R, L):-voisin_haut([X,Y2],R,L),voisin_droite([X2,Y],R,L),Y2 is Y-1, X2 is X+1.

%La valeur du 1er voisin NE %Marche :) 
voisin_NordEst([X,Y],R, L).
voisin_NordEst([X,Y],R, L):-voisin_haut([X,Y2],R,L),voisin_gauche([X2,Y],R,L),Y2 is Y+1,X2 is X+1.

%work in progress...
coup_Valable([X,Y],L).
coup_Valable([X,Y],L):-voisin_haut([X,Y],R, L),  R=\=0.


%La valeur des 2 premiers voisins NE..ça ne marche pas toujours
%voisin_NordEstListe([X,Y],R, L).
%voisin_NordEstListe([X,Y],R, L):-voisin_haut([X,Y2],R,L),voisin_droite([X2,Y2],R,L),Y2 is Y+1, X2 is X-1. 

%La valeur des 2 premiers voisins NW..ça ne marche pas toujours
%voisin_NordWestListe([X,Y],R, L).
%voisin_NordWestListe([X,Y],R, L):-voisin_haut([X,Y2],R,L),voisin_gauche([X2,Y],R,L),Y2 is Y-1,X2 is X-1.









