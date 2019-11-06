Fonctionnement du Puissance 4

Le dossier de rendu contient les fichiers suivants :

- Puissance4.pl : jeu du puissance 4 lorsque deux machines s’affrontent. Pour le lancer il faut taper le prédicat “init.”. 
Pour changer les heuristiques concurrentes, il suffit de modifier le corps du prédicat “jouerAvecHeuristique(G,LCP,J,C)” 
en changeant le nom de l’heuristique qui peut prendre les valeurs “heuristique1”, “heuristique2”, “heuristique3”, “heuristique4”, 
“heuristique5” (ayant toutes les mêmes paramètres).
- Puissance4_v2.pl :  jeu de puissance 4 quand un humain affronte une machine. Pour le lancer, il faut taper le prédicat “init.”. 
Pour changer l’heuristique de la machine, il suffit de modifier le corps du prédicat “choisirCoup(G,LCP,J,C)” de la même façon 
que décrit précédemment. 
- Puissance4_temps.pl : code pour comparer les performances des heuristiques. Pour le lancer, il faut taper le prédicat “”init.”. 
Pour changer les heuristiques concurrentes, il suffit de modifier le corps du prédicat “jouerAvecHeuristique(G,LCP,J,C)” 
en changeant le nom de l’heuristique qui peut prendre les valeurs “heuristique1”, “heuristique2”, “heuristique3”, “heuristique4”, 
“heuristique5” (ayant toutes les mêmes paramètres).
- Les fichiers h1.pl, h2.pl, h3.pl, h4.pl et h5.pl contiennent le code des différentes heuristiques.
- Les fichiers testsUnitairesPuissance4.pl et testsUnitairesHeuristiques.pl contiennent les tests unitaires de chaque prédicat.
