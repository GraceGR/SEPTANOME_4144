:-use_module(puissance4).
:-use_module(h2).
:-use_module(h3).
:-use_module(h4).

%%% Test predicats heuristique 2 %%%

%Test predicat parcoursLigneGD
testparcoursLigneGD1(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursLigneGD2(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=10

testparcoursLigneGD3(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursLigneGD4(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,3],0,M).
%Resultat attendu : M=30

testparcoursLigneGD5(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,6],0,M).
%Resultat attendu : M=0

testparcoursLigneGD6(M):-parcoursLigneGD([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,7],0,M).
%Resultat attendu : false


%Test predicat parcoursLigneDG
testparcoursLigneDG1(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=0

testparcoursLigneDG2(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,5],0,M).
%Resultat attendu : M=10

testparcoursLigneDG3(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursLigneDG4(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=30

testparcoursLigneDG5(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,0],0,M).
%Resultat attendu : M=0

testparcoursLigneDG6(M):-parcoursLigneDG([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,8],0,M).
%Resultat attendu : M=0


%Test predicat parcoursColonneHB
testparcoursColonneHB1(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursColonneHB2(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=10

testparcoursColonneHB3(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursColonneHB4(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=30

testparcoursColonneHB5(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursColonneHB6(M):-parcoursColonneHB([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,0],0,M).
%Resultat attendu : false


%Test predicat parcoursColonneBH
testparcoursColonneBH1(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursColonneBH2(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,6],0,M).
%Resultat attendu : M=10

testparcoursColonneBH3(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[2,4],0,M).
%Resultat attendu : M=20

testparcoursColonneBH4(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,6],0,M).
%Resultat attendu : M=30

testparcoursColonneBH5(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=0

testparcoursColonneBH6(M):-parcoursColonneBH([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[-1,3],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale11
testparcoursDiagonale11a(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=0

testparcoursDiagonale11b(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=10

testparcoursDiagonale11c(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,1,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursDiagonale11d(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,4],0,M).
%Resultat attendu : M=30

testparcoursDiagonale11e(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,0],0,M).
%Resultat attendu : M=0

testparcoursDiagonale11f(M):-parcoursDiagonale11([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[-1,3],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale12
testparcoursDiagonale12a(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,4],0,M).
%Resultat attendu : M=0

testparcoursDiagonale12b(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=10

testparcoursDiagonale12c(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,4],0,M).
%Resultat attendu : M=20

testparcoursDiagonale12d(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[4,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale12e(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,6],0,M).
%Resultat attendu : M=0

testparcoursDiagonale12f(M):-parcoursDiagonale12([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,7],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale21
testparcoursDiagonale21a(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,1],0,M).
%Resultat attendu : M=0

testparcoursDiagonale21b(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=10

testparcoursDiagonale21c(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[1,0,0,0,0,0,0]],1,[3,2],0,M).
%Resultat attendu : M=20

testparcoursDiagonale21d(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[1,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale21e(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,0],0,M).
%Resultat attendu : M=0

testparcoursDiagonale21f(M):-parcoursDiagonale21([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,1],0,M).
%Resultat attendu : false


%Test predicat parcoursDiagonale22
testparcoursDiagonale22a(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,5],0,M).
%Resultat attendu : M=0

testparcoursDiagonale22b(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,5],0,M).
%Resultat attendu : M=10

testparcoursDiagonale22c(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[1,0,0,0,0,0,0]],1,[1,4],0,M).
%Resultat attendu : M=20

testparcoursDiagonale22d(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,1],[0,0,1,0,0,1,1],[1,1,0,1,1,1,1],[1,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,3],0,M).
%Resultat attendu : M=30

testparcoursDiagonale22e(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[5,6],0,M).
%Resultat attendu : M=0

testparcoursDiagonale22f(M):-parcoursDiagonale22([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,0,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,1],0,M).
%Resultat attendu : false


%Test predicat calculMax
testcalculMax1(M):-calculMax(0,1,2,3,4,5,6,7,M).
%Resultat attendu : M=7

testcalculMax2(M):-calculMax(0,1,2,10,4,5,6,7,M).
%Resultat attendu : M=10

testcalculMax3(M):-calculMax(1,1,1,1,1,1,1,1,M).
%Resultat attendu : M=1

testcalculMax4(M):-calculMax(-1,0,1,2,3,4,5,6,M).
%Resultat attendu : M=6

%Test predicat max
testmax1(M):- max(0,10,M).
%Resultat attendu : M=10

testmax2(M):- max(10,10,M).
%Resultat attendu : M=10

testmax3(M):- max(10,0,M).
%Resultat attendu : M=10

testmax4(M):- max(-2,0,M).
%Resultat attendu : M=0

%Test predicat parcoursDirections
testparcoursDirections1(M):-parcoursDirections([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],1,[4,4],M).
%Resultat attendu : M=0
%
testparcoursDirections2(M):-parcoursDirections([[0,0,0,1,0,0,0],[0,0,0,0,1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],1,[1,3],M).
%Resultat attendu : M=10

testparcoursDirections3(M):-parcoursDirections([[0,1,0,1,0,0,0],[0,0,1,1,0,0,0],[0,0,1,0,1,1,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],1,[2,3],M).
%Resultat attendu : M=20

testparcoursDirections4(M):-parcoursDirections([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[1,6],M).
% Resultat attendu : M=30

testparcoursDirections5(M):-parcoursDirections([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[6,2],M).
% Resultat attendu : false

testparcoursDirections6(M):-parcoursDirections([[0,0,0,0,1,0,1],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],1,[0,7],M).
% Resultat attendu : false


%Test predicat parcoursLCP
testparcoursLCP1H2(Cf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,1,1],[0,1,0,0,1,1,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf).
%Resultat attendu : Cf=[5,3]

testparcoursLCP2H2(Cf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf).
%Resultat attendu : Cf=[5,6]

testparcoursLCP3H2(Cf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf).
%Resultat attendu : Cf=[5,0]


%Test predicat attaque
testattaque1H2(Cf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,1,0,0,0,1,1],[1,1,1,0,1,0,1],[0,1,0,0,1,1,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf).
%Resultat attendu : Cf=[5,1]

testattaque2H2(Cf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,1,1],[1,0,1,0,1,0,1],[0,1,0,1,1,1,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf).
%Resultat attendu : Cf=[5,2]

testattaque3H2(Cf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,1,1,0,1,1],[1,0,1,1,1,0,1],[0,0,0,0,1,1,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf).
%Resultat attendu : Cf=[5,5]


%%% Test predicats heuristique 3 %%%

%Test predicat parcoursLCP de H3 et H4
testparcoursLCP1H34(Cf,Mf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,1],0,Cf,Mf).
%Resultat attendu : Cf=[5,1] et Mf=0

testparcoursLCP2H34(Cf,Mf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,1,0,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf,Mf).
%Resultat attendu : Cf=[5,2] et Mf=10

testparcoursLCP3H34(Cf,Mf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf,Mf).
%Resultat attendu : Cf=[5,0] et Mf=20

testparcoursLCP4H34(Cf,Mf):-parcoursLCP([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,[5,0],0,Cf,Mf).
%Resultat attendu : Cf=[5,6] et Mf=30


%Test predicat attaque de H3 et H4
testattaque1H34(Cf,Mf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,1,0,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf,Mf).
%Resultat attendu : Cf=[5,2] et Mf=10

testattaque2H34(Cf,Mf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf,Mf).
%Resultat attendu : Cf=[5,0] et Mf=20

testattaque3H34(Cf,Mf):-attaque([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,1,1,1,1,0,1],[0,1,0,0,1,0,1],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,Cf,Mf).
%Resultat attendu : Cf=[5,6] et Mf=30


%Test predicat comparaison1
testcomparaison1a(C):-comparaison1(30,0,[5,1],[5,0],C).
%Resultat attendu : C=[5,1]

testcomparaison1b(C):-comparaison1(20,30,[5,1],[5,4],C).
%Resultat attendu : C=[5,4]

testcomparaison1c(C):-comparaison1(20,20,[5,2],[5,4],C).
%Resultat attendu : C=[5,2]

testcomparaison1d(C):-comparaison1(10,20,[5,2],[5,4],C).
%Resultat attendu : C=[5,2]

testcomparaison1e(C):-comparaison1(10,0,[5,2],[5,4],C).
%Resultat attendu : C=[5,2]

testcomparaison1f(C):-comparaison1(30,30,[5,5],[5,4],C).
%Resultat attendu : C=[5,5]


%Test predicat heuristique3
testheuristique3a(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,2,0,0,1,1],[0,1,0,0,1,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,2]

testheuristique3b(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,2,0,1],[0,1,0,0,2,0,0],[0,0,0,1,2,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,4]

testheuristique3c(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,1,0,0,0,0,0],[0,0,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,2]

testheuristique3d(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,2,0,0,0,0,0],[0,2,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,3]

testheuristique3e(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,0,0],[0,1,0,0,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,0]

testheuristique3f(C):-heuristique3([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,2,0,0,0,1,0],[0,2,0,0,0,1,0],[0,2,0,0,0,1,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,5]


%%% Tests predicats heuristique 4 %%%

%Test predicat comparaison2
testcomparaison2a(C):-comparaison2(30,10,[5,1],[5,0],C).
%Resultat attendu : C=[5,1]

testcomparaison2b(C):-comparaison2(20,30,[5,1],[5,4],C).
%Resultat attendu : C=[5,4]

testcomparaison2c(C):-comparaison2(30,30,[5,1],[5,4],C).
%Resultat attendu : C=[5,1]

testcomparaison2d(C):-comparaison2(20,20,[5,2],[5,4],C).
%Resultat attendu : C=[5,2]

testcomparaison2e(C):-comparaison2(10,20,[5,2],[5,3],C).
%Resultat attendu : C=[5,3]

testcomparaison2f(C):-comparaison2(20,10,[5,5],[5,3],C).
%Resultat attendu : C=[5,5]


%Test predicat heuristique 4
testheuristique4a(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,1,2,0,0,0,1],[0,1,0,0,1,0,0],[2,1,0,1,0,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,1]

testheuristique4b(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,2,0,1],[0,0,0,1,2,0,0],[0,0,0,1,2,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,4]

testheuristique4c(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,1,0,1],[2,1,0,1,0,0,0],[2,0,1,1,0,0,0],[2,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,1]

testheuristique4d(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[1,0,0,0,2,0,0],[0,1,1,0,2,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,2]

testheuristique4e(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,0,0,0,0,0,1],[0,0,0,0,0,2,0],[0,1,0,0,2,0,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,3]

testheuristique4f(C):-heuristique4([[0,0,1,0,0,0,0],[1,1,1,0,1,0,0],[0,2,0,0,0,0,0],[0,2,0,0,0,1,0],[0,0,0,0,2,1,0],[0,0,0,0,0,0,0]],[[5,0],[5,1],[5,2],[5,3],[5,4],[5,5],[5,6]],1,C).
%Resultat attendu : C=[5,5]

