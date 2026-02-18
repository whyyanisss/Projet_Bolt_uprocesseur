## 🔬 Simulations et Tests

Le projet inclut plusieurs programmes de test codés dans la ROM (`ROM.vhd`) pour valider les différents comportements du processeur.

### 1. Test du JUMP
Ce test montre la capacité du processeur à modifier son Program Counter (PC) pour sauter certaines instructions.

**Programme exécuté :** *(Écrit en binaire sur la ROM, le fichier se trouve dans `Sources/Mémoires/ROM.vhd`)*

1. `INIT 5` *(Charge 5)*
2. `STORE x001` *(Sauvegarde en RAM)*
3. `JUMP 7` *(Saut à la ligne 7)*
4. *... instructions ignorées ...*
5. `INIT 1` *(Charge 1)*
6. `SUB x001` *(Fait 5 - 1)* -> **Résultat = 4**
7. `HALT`

Sur la simulation, on observe PC (en bleu) passer de la valeur `3` à la valeur `7`, et le résultat final se stabiliser à `0004`.

![Simulation_JUMP](https://github.com/user-attachments/assets/8cff55ec-8855-4eea-acd0-b620a4d8b3cb)

> **Remarque :** Le PC prend la valeur en sortie du registre ADR. Par conséquent, pendant un court instant, il conserve la valeur précédente avant de latcher sur la nouvelle et bonne valeur.

### 2. Test du GPIO (Entrées/Sorties)
Ce test valide le concept des broches d'entrée et de sortie. Les entrées physiques du processeur (`input_pins`) sont assignées à la valeur `x"ABCD"` dans le test. L'adresse mémoire `0xFFE` est configurée par défaut pour interagir avec ces broches via l'instruction `STORE xFFE`.

**Programme exécuté :**

1. `INIT 10`
2. `STORE xFFE` -> *(SAVE la valeur des `input_pins` dans case mémoire dédiés en RAM)*
3. `LOAD xFFE` -> *(Récupère la valeur des `input_pins` depuis la RAM)*
4. `HALT`

La simulation montre qu'au moment de l'instruction `LOAD xFFE`, le signal de résultat (`RES`) prend bien la valeur `abcd`, prouvant que le processeur a réussi à lire l'état de ses broches physiques.

![Simulation_GPIO](https://github.com/user-attachments/assets/7acef7ad-e9fd-4c00-9394-f268b96d0707)
