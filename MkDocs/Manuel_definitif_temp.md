# **Manuel d\'Utilisation de CLIMADA**

## **Guide pour l\'Évaluation des Risques Climatiques et leur Intégration dans l\'Analyse Économique en Côte d\'Ivoire**

### **Introduction**

Le changement climatique n\'est plus une menace lointaine, mais une
réalité économique et budgétaire pour la Côte d\'Ivoire. La fréquence et
l\'intensité accrues des inondations, des sécheresses et de l\'érosion
côtière impactent directement nos secteurs productifs, nos
infrastructures et la stabilité de nos finances publiques. Face à ce
défi, la Direction Générale de l\'Économie (DGE) doit se doter d\'outils
quantitatifs robustes pour passer d\'une gestion de crise à une
planification économique proactive et résiliente.

**CLIMADA (CLImate ADAptation)** est une plateforme de modélisation
open-source développée par l\'ETH Zurich, une référence scientifique
mondiale. Cet outil permet de traduire des phénomènes climatiques
complexes en impacts économiques chiffrés. Il offre un cadre structuré
pour répondre à des questions cruciales pour la DGE :

-   Quel est le coût annuel moyen des inondations à Abidjan pour notre
    économie ?

-   Quelles pertes de revenus la filière cacao subit-elle lors d\'une
    sécheresse sévère ?

-   Un investissement dans une digue de protection est-il économiquement
    rentable ?

Ce manuel est conçu pour vous accompagner, économistes et analystes de
la DGE, dans la maîtrise de CLIMADA. Il vous guidera de l\'installation
de l\'outil à la réalisation d\'analyses complexes et à
l\'interprétation de leurs résultats pour informer la décision publique.

### **Objectifs du Manuel**

À l\'issue de la lecture et de la pratique de ce manuel, vous serez en
mesure de :

1.  **Comprendre et expliquer** les fondements théoriques de la
    modélisation du risque climatique.

2.  **Installer et configurer** un environnement de travail Python et
    CLIMADA fonctionnel sur votre poste.

3.  **Identifier et préparer** les données d\'entrée (inputs)
    nécessaires à une analyse, en mobilisant les sources de données
    nationales et internationales pertinentes.

4.  **Mener de manière autonome** des analyses d\'impact économique pour
    différents aléas climatiques (inondations, sécheresse, érosion
    côtière).

5.  **Interpréter les métriques de risque** (Perte Annuelle Moyenne,
    Perte Maximale Probable) et les traduire en recommandations
    économiques.

6.  **Évaluer la rentabilité** des projets d\'adaptation grâce à
    l\'analyse coûts-bénéfices.

7.  **Produire les chiffres clés** pour alimenter la Déclaration des
    Risques Budgétaires (DRB) et enrichir le cadrage macroéconomique.

### **Glossaire des Termes Clés**

-   **Aléa (Hazard) :** Le phénomène physique potentiellement
    dommageable (ex: une crue, une vague de chaleur). Il est caractérisé
    par son intensité, sa fréquence et sa localisation.

-   **Exposition (Exposure) :** L\'inventaire des actifs et des
    populations localisés dans les zones soumises à l\'aléa.
    L\'exposition est quantifiée en valeur monétaire (FCFA) ou en nombre
    de personnes.

-   **Vulnérabilité (Vulnerability / Impact Function) :** La propension
    d\'un actif exposé à subir des dommages face à une intensité d\'aléa
    donnée. Elle est représentée par une fonction mathématique (courbe
    de dommage) qui associe une intensité (ex: 1 mètre d\'eau) à un
    pourcentage de perte (ex: 25% de la valeur du bâtiment).

-   **Risque (Risk) :** La combinaison de l\'aléa, de l\'exposition et
    de la vulnérabilité. Il représente les pertes économiques
    potentielles sur une période donnée.

-   **Perte Annuelle Moyenne (PAM) / Average Annual Loss (AAL) :** La
    métrique de risque la plus importante. Elle représente l\'espérance
    mathématique des pertes sur une longue période, lissant les petites
    catastrophes fréquentes et les grandes catastrophes rares. C\'est
    l\'équivalent de la \"provision pour risque climatique\" qu\'il
    faudrait budgétiser chaque année.

-   **Perte Maximale Probable (PMP) / Probable Maximum Loss (PML) :** Le
    montant des pertes pour un événement ayant une certaine période de
    retour (ex: la perte maximale probable pour un événement qui a 1% de
    chance de se produire chaque année, soit une crue centennale). Cette
    métrique est essentielle pour les stress tests budgétaires.

### **Chapitre 1 : Installation Complète de l\'Environnement de Travail**

Cette section détaille la procédure complète pour installer CLIMADA.
L\'utilisation de **Conda** est fortement recommandée car elle gère de
manière isolée et efficace les nombreuses librairies scientifiques dont
CLIMADA dépend.

#### **1.1 Prérequis : Installation de Miniconda**

Miniconda est une version légère d\'Anaconda qui contient le
gestionnaire d\'environnement Conda.

1.  **Téléchargement :**

    -   **Windows :** Rendez-vous sur la [documentation officielle de
        Conda](https://www.google.com/search?q=https://docs.conda.io/en/latest/miniconda.html%23windows-installers)
        et téléchargez l\'installateur Python 3.x pour Windows 64-bit.

    -   **Linux/macOS :** Allez sur la [page de téléchargement de
        Miniconda](https://docs.conda.io/en/latest/miniconda.html) et
        téléchargez le script d\'installation correspondant à votre
        système.

```{=html}
<!-- -->
```
1.  **Installation :**

    -   **Windows :** Double-cliquez sur le fichier .exe téléchargé et
        suivez les instructions. Il est recommandé de conserver les
        options par défaut (\"Just Me\" et \"Add Anaconda to my PATH
        environment variable\").

    -   **Linux/macOS :** Ouvrez un terminal, naviguez jusqu\'au dossier
        où vous avez téléchargé le script, et exécutez la commande bash
        Miniconda3-latest-Linux-x86_64.sh (adaptez le nom du fichier).
        Suivez les instructions à l\'écran.

```{=html}
<!-- -->
```
1.  **Vérification :** Fermez et rouvrez votre terminal (ou \"Anaconda
    Prompt\" sur Windows). Tapez la commande conda \--version. Si une
    version s\'affiche (ex: conda 23.7.4), l\'installation a réussi.

#### **1.2 Création de l\'Environnement climada_formation**

Nous allons utiliser un fichier de configuration (environment.yml) qui
garantit que tous les participants ont exactement les mêmes versions des
logiciels, pour une reproductibilité parfaite.

1.  **Obtenir le fichier :** Assurez-vous d\'avoir le fichier
    environment.yml fourni durant la formation dans un dossier de
    travail (ex:
    C:\\Utilisateurs\\VotreNom\\Documents\\Formation_CLIMADA).

2.  **Ouvrir le terminal Conda :**

    -   Sur Windows, ouvrez \"Anaconda Prompt\" depuis le menu Démarrer.

    -   Sur macOS/Linux, ouvrez un terminal classique.

```{=html}
<!-- -->
```
1.  **Naviguer jusqu\'au dossier :** Utilisez la commande cd pour vous
    déplacer dans le dossier contenant le fichier environment.yml.

2.  cd C:\\Utilisateurs\\VotreNom\\Documents\\Formation_CLIMADA

3.  

4.  **Créer l\'environnement :** Exécutez la commande suivante. Conda va
    lire le fichier, télécharger tous les packages nécessaires (cela
    peut prendre plusieurs minutes) et créer l\'environnement.

5.  conda env create -f environment.yml

6.  

7.  Une fois l\'opération terminée, l\'environnement climada_formation
    est créé.

#### **1.3 Activer l\'Environnement et Lancer Jupyter Lab**

Avant chaque session de travail, vous devrez \"activer\" cet
environnement.

1.  **Activation :** Dans votre terminal Conda, tapez :

2.  conda activate climada_formation

3.  

4.  Le nom de votre environnement (climada_formation) devrait maintenant
    apparaître au début de la ligne de commande.

5.  **Lancer Jupyter Lab :** Jupyter Lab est l\'interface web où nous
    écrirons et exécuterons notre code Python. Une fois l\'environnement
    activé, lancez-le avec la commande :

6.  jupyter lab

7.  

8.  Cette commande ouvrira un nouvel onglet dans votre navigateur web
    avec l\'interface Jupyter. Vous êtes prêt à travailler !

#### **1.4 Vérification Finale**

Pour être absolument certain que tout est fonctionnel, créez un nouveau
Notebook dans Jupyter Lab et exécutez le code suivant dans une cellule :

from climada.hazard import Hazard

from climada.entity import Exposures

from climada.engine import Impact

print(\"✅ L\'environnement CLIMADA est correctement installé et
fonctionnel !\")

Si le message s\'affiche sans erreur, votre installation est un succès.

### **Chapitre 2 : Les Données d\'Entrée - Le Cœur de l\'Analyse**

La qualité de votre analyse dépend directement de la qualité de vos
données. La stratégie recommandée est de **commencer avec des données
mondiales pour construire rapidement un premier modèle, puis de
l\'affiner itérativement avec des données nationales plus précises.**

  ----------------------------------------------------------------------------------
  **Type de         **Sources Internationales    **Sources Nationales (Essentiel
  Donnée**          (Bon pour commencer)**       pour la précision)**
  ----------------- ---------------------------- -----------------------------------
  **Aléa (Pluie,    Données satellitaires        **SODEXAM** (stations météo),
  Temp., etc.)**    (CHIRPS, NASA GPM),          **Direction des Ressources en
                    Topographie (SRTM), Modèles  Eau**, **ANADER**, **Centre de
                    globaux (Aqueduct Flood      Recherches Océanologiques (CRO)**.
                    Tool, ERA5).                 

  **Exposition      OpenStreetMap (OSM),         **Institut National de la
  (Actifs, Pop.)**  WorldPop, Global Human       Statistique (INS)** (RGPH),
                    Settlement Layer (GHSL).     **BNETD**, **Cadastre**,
                                                 **Ministère de l\'Agriculture**,
                                                 **Ministère de l\'Équipement**.

  **Vulnérabilité   Bibliothèque de fonctions de **Expertise locale indispensable
  (%)**             dommage de CLIMADA,          :** **CNRA** (agronomie), **CRO**
                    Littérature scientifique     (géomorphologie), ingénieurs
                    internationale.              civils, assureurs, rapports
                                                 post-catastrophe de l\'**ONPC**.
  ----------------------------------------------------------------------------------

### **Chapitre 3 : Travaux Pratiques Détaillés**

Cette section contient les guides pas à pas pour les trois cas
pratiques. Vous pouvez copier-coller le code directement dans vos
notebooks Jupyter.

#### **TP 1 : Inondations Urbaines à Abidjan (2018)**

-   **Objectif :** Quantifier les dommages économiques directs de
    l\'événement de juin 2018 pour valider notre méthodologie.

-   **Fichier Notebook :** TP1_Inondations_Abidjan.ipynb

-   **Étapes et Code :** Suivez les instructions du notebook fourni, qui
    vous guideront à travers :

    1.  La création d\'un aléa synthétique d\'inondation.

    2.  La génération de l\'exposition économique avec LitPop.

    3.  La définition d\'une fonction de dommage hauteur-dégâts.

    4.  Le calcul et la cartographie des dommages totaux.

    5.  L\'analyse critique des résultats et la comparaison avec les
        données historiques.

#### **TP 2 : Sécheresse Agricole et Impact sur l\'Anacarde (2016)**

-   **Objectif :** Estimer les pertes de production pour la filière
    anacarde dues à la sécheresse de 2016.

-   **Fichier Notebook :** TP2_Secheresse_Agricole.ipynb

-   **Étapes et Code :** Le notebook vous montrera comment :

    1.  Modéliser un aléa de sécheresse basé sur un indice synthétique
        (SPI).

    2.  Créer une exposition représentant la valeur de la production
        agricole dans les régions du nord.

    3.  Construire une fonction de dommage liant l\'intensité de la
        sécheresse à la perte de rendement.

    4.  Calculer les pertes économiques totales et analyser l\'impact
        sur la filière.

#### **TP 3 : Érosion Côtière et Risques pour le Patrimoine à Grand-Bassam**

-   **Objectif :** Évaluer la valeur des actifs touristiques et
    résidentiels menacés par l\'érosion à un horizon 2050.

-   **Fichier Notebook :** TP3_Erosion_Cotiere.ipynb

-   **Étapes et Code :** Ce cas prospectif vous apprendra à :

    1.  Définir un aléa binaire représentant la future zone d\'érosion.

    2.  Générer l\'exposition économique de la zone côtière de
        Grand-Bassam.

    3.  Appliquer une fonction de dommage de perte totale (100%) pour
        les actifs situés dans la zone.

    4.  Calculer la valeur totale des actifs à risque, fournissant ainsi
        une estimation du **coût de l\'inaction**.

### **Chapitre 4 : De l\'Analyse à la Décision Économique**

Une fois les impacts calculés, CLIMADA devient un puissant outil d\'aide
à la décision pour la DGE.

#### **4.1 Mener une Analyse Coûts-Bénéfices (ACB)**

L\'ACB permet de justifier économiquement les investissements dans
l\'adaptation. La démarche est la suivante :

1.  **Calculer le Scénario de Référence :** Utilisez CLIMADA pour
    calculer la **Perte Annuelle Moyenne (PAM)** pour un risque donné
    (ex: inondations à Abidjan). Cette PAM représente le coût annuel
    moyen de l\'inaction.

    -   *Exemple : PAM Inondations Abidjan = 2,8 Milliards FCFA/an.*

```{=html}
<!-- -->
```
1.  **Modéliser l\'Intervention :** Définissez un projet d\'adaptation
    (ex: un programme de curage des caniveaux coûtant 5 Milliards FCFA).
    Modélisez son effet sur l\'aléa (le curage réduit la hauteur d\'eau
    maximale de 30% en moyenne).

2.  **Calculer le Scénario \"Avec Projet\" :** Relancez le calcul de la
    PAM avec l\'aléa modifié.

    -   *Exemple : Nouvelle PAM avec projet = 1 Milliard FCFA/an.*

```{=html}
<!-- -->
```
1.  **Calculer le Bénéfice et la Rentabilité :**

    -   **Bénéfice Annuel :** PAM (sans projet) - PAM (avec projet) =
        2,8 - 1 = 1,8 Milliards FCFA de pertes évitées chaque année.

    -   **Temps de Retour sur Investissement :** Coût du projet /
        Bénéfice Annuel = 5 / 1,8 ≈ 2,8 ans.

    -   **Conclusion pour la décision :** L\'investissement est
        économiquement très rentable. CLIMADA fournit les chiffres pour
        arbitrer en faveur de ce budget préventif.

#### **4.2 Intégration dans la Déclaration des Risques Budgétaires (DRB)**

Les résultats de CLIMADA alimentent directement la DRB et répondent aux
exigences de nos partenaires (notamment la MR2 de l\'accord avec le
FMI).

-   La **Perte Annuelle Moyenne (PAM)** doit être interprétée comme un
    **passif contingent implicite** récurrent pour le budget de l\'État.
    C\'est le montant moyen que l\'État devra débourser chaque année (en
    aide d\'urgence, reconstruction, etc.).

-   La **Perte Maximale Probable (PMP)** pour une période de retour
    donnée (ex: 100 ans) représente le **montant d\'un choc budgétaire
    extrême**. Ce chiffre est essentiel pour les stress tests et pour
    dimensionner les fonds de contingence ou les mécanismes d\'assurance
    souveraine.

### **Conclusion : Vers une Planification Économique Résiliente**

La maîtrise de CLIMADA représente une montée en compétence stratégique
pour la DGE. Elle nous permet de passer d\'une approche descriptive des
risques à une **approche quantitative, probabiliste et prospective**. En
chiffrant le coût de l\'inaction et la rentabilité de l\'adaptation,
nous renforçons notre capacité de conseil et notre crédibilité dans les
arbitrages budgétaires et les négociations internationales.

Pour que cette formation porte ses fruits, un plan d\'action doit être
mis en œuvre :

1.  **Institutionnaliser l\'outil :** Installer CLIMADA sur les postes
    de travail et désigner des points focaux.

2.  **Centraliser les données :** Créer un groupe de travail
    interministériel (avec SODEXAM, INS, BNETD, etc.) pour bâtir et
    partager une base de données nationale pour les analyses de risque.

3.  **Intégrer les analyses :** Rendre l\'évaluation de risque
    climatique avec CLIMADA une étape standard dans l\'analyse des
    projets d\'investissement public et dans la préparation annuelle de
    la DRB.

Cette démarche est une étape décisive pour ancrer la résilience
climatique au cœur de la stratégie de développement de la Côte
d\'Ivoire.

# **Manuel d\'Utilisation de CLIMADA**

## **Guide pour l\'Évaluation des Risques Climatiques et leur Intégration dans l\'Analyse Économique en Côte d\'Ivoire**

### **Introduction**

Le changement climatique n\'est plus une menace lointaine, mais une
réalité économique et budgétaire pour la Côte d\'Ivoire. La fréquence et
l\'intensité accrues des inondations, des sécheresses et de l\'érosion
côtière impactent directement nos secteurs productifs, nos
infrastructures et la stabilité de nos finances publiques. Face à ce
défi, la Direction Générale de l\'Économie (DGE) doit se doter d\'outils
quantitatifs robustes pour passer d\'une gestion de crise à une
planification économique proactive et résiliente.

**CLIMADA (CLImate ADAptation)** est une plateforme de modélisation
open-source développée par l\'ETH Zurich, une référence scientifique
mondiale. Cet outil permet de traduire des phénomènes climatiques
complexes en impacts économiques chiffrés. Il offre un cadre structuré
pour répondre à des questions cruciales pour la DGE :

-   Quel est le coût annuel moyen des inondations à Abidjan pour notre
    économie ?

-   Quelles pertes de revenus la filière cacao subit-elle lors d\'une
    sécheresse sévère ?

-   Un investissement dans une digue de protection est-il économiquement
    rentable ?

Ce manuel est conçu pour vous accompagner, économistes et analystes de
la DGE, dans la maîtrise de CLIMADA. Il vous guidera de l\'installation
de l\'outil à la réalisation d\'analyses complexes et à
l\'interprétation de leurs résultats pour informer la décision publique.

### **Objectifs du Manuel**

À l\'issue de la lecture et de la pratique de ce manuel, vous serez en
mesure de :

1.  **Comprendre et expliquer** les fondements théoriques de la
    modélisation du risque climatique.

2.  **Installer et configurer** un environnement de travail Python et
    CLIMADA fonctionnel sur votre poste.

3.  **Identifier et préparer** les données d\'entrée (inputs)
    nécessaires à une analyse, en mobilisant les sources de données
    nationales et internationales pertinentes.

4.  **Mener de manière autonome** des analyses d\'impact économique pour
    différents aléas climatiques (inondations, sécheresse, érosion
    côtière).

5.  **Interpréter les métriques de risque** (Perte Annuelle Moyenne,
    Perte Maximale Probable) et les traduire en recommandations
    économiques.

6.  **Évaluer la rentabilité** des projets d\'adaptation grâce à
    l\'analyse coûts-bénéfices.

7.  **Produire les chiffres clés** pour alimenter la Déclaration des
    Risques Budgétaires (DRB) et enrichir le cadrage macroéconomique.

### **Glossaire des Termes Clés**

-   **Aléa (Hazard) :** Le phénomène physique potentiellement
    dommageable (ex: une crue, une vague de chaleur). Il est caractérisé
    par son intensité, sa fréquence et sa localisation.

-   **Exposition (Exposure) :** L\'inventaire des actifs et des
    populations localisés dans les zones soumises à l\'aléa.
    L\'exposition est quantifiée en valeur monétaire (FCFA) ou en nombre
    de personnes.

-   **Vulnérabilité (Vulnerability / Impact Function) :** La propension
    d\'un actif exposé à subir des dommages face à une intensité d\'aléa
    donnée. Elle est représentée par une fonction mathématique (courbe
    de dommage) qui associe une intensité (ex: 1 mètre d\'eau) à un
    pourcentage de perte (ex: 25% de la valeur du bâtiment).

-   **Risque (Risk) :** La combinaison de l\'aléa, de l\'exposition et
    de la vulnérabilité. Il représente les pertes économiques
    potentielles sur une période donnée.

-   **Perte Annuelle Moyenne (PAM) / Average Annual Loss (AAL) :** La
    métrique de risque la plus importante. Elle représente l\'espérance
    mathématique des pertes sur une longue période, lissant les petites
    catastrophes fréquentes et les grandes catastrophes rares. C\'est
    l\'équivalent de la \"provision pour risque climatique\" qu\'il
    faudrait budgétiser chaque année.

-   **Perte Maximale Probable (PMP) / Probable Maximum Loss (PML) :** Le
    montant des pertes pour un événement ayant une certaine période de
    retour (ex: la perte maximale probable pour un événement qui a 1% de
    chance de se produire chaque année, soit une crue centennale). Cette
    métrique est essentielle pour les stress tests budgétaires.

### **Chapitre 1 : Installation Complète de l\'Environnement de Travail**

Cette section détaille la procédure complète pour installer CLIMADA.
L\'utilisation de **Conda** est fortement recommandée car elle gère de
manière isolée et efficace les nombreuses librairies scientifiques dont
CLIMADA dépend.

#### **1.1 Prérequis : Installation de Miniconda**

Miniconda est une version légère d\'Anaconda qui contient le
gestionnaire d\'environnement Conda.

1.  **Téléchargement :**

    -   **Windows :** Rendez-vous sur la [documentation officielle de
        Conda](https://www.google.com/search?q=https://docs.conda.io/en/latest/miniconda.html%23windows-installers)
        et téléchargez l\'installateur Python 3.x pour Windows 64-bit.

    -   **Linux/macOS :** Allez sur la [page de téléchargement de
        Miniconda](https://docs.conda.io/en/latest/miniconda.html) et
        téléchargez le script d\'installation correspondant à votre
        système.

```{=html}
<!-- -->
```
1.  **Installation :**

    -   **Windows :** Double-cliquez sur le fichier .exe téléchargé et
        suivez les instructions. Il est recommandé de conserver les
        options par défaut (\"Just Me\" et \"Add Anaconda to my PATH
        environment variable\").

    -   **Linux/macOS :** Ouvrez un terminal, naviguez jusqu\'au dossier
        où vous avez téléchargé le script, et exécutez la commande bash
        Miniconda3-latest-Linux-x86_64.sh (adaptez le nom du fichier).
        Suivez les instructions à l\'écran.

```{=html}
<!-- -->
```
1.  **Vérification :** Fermez et rouvrez votre terminal (ou \"Anaconda
    Prompt\" sur Windows). Tapez la commande conda \--version. Si une
    version s\'affiche (ex: conda 23.7.4), l\'installation a réussi.

#### **1.2 Création de l\'Environnement climada_formation**

Nous allons utiliser un fichier de configuration (environment.yml) qui
garantit que tous les participants ont exactement les mêmes versions des
logiciels, pour une reproductibilité parfaite.

1.  **Obtenir le fichier :** Assurez-vous d\'avoir le fichier
    environment.yml fourni durant la formation dans un dossier de
    travail (ex:
    C:\\Utilisateurs\\VotreNom\\Documents\\Formation_CLIMADA).

2.  **Ouvrir le terminal Conda :**

    -   Sur Windows, ouvrez \"Anaconda Prompt\" depuis le menu Démarrer.

    -   Sur macOS/Linux, ouvrez un terminal classique.

```{=html}
<!-- -->
```
1.  **Naviguer jusqu\'au dossier :** Utilisez la commande cd pour vous
    déplacer dans le dossier contenant le fichier environment.yml.

2.  cd C:\\Utilisateurs\\VotreNom\\Documents\\Formation_CLIMADA

3.  

4.  **Créer l\'environnement :** Exécutez la commande suivante. Conda va
    lire le fichier, télécharger tous les packages nécessaires (cela
    peut prendre plusieurs minutes) et créer l\'environnement.

5.  conda env create -f environment.yml

6.  

7.  Une fois l\'opération terminée, l\'environnement climada_formation
    est créé.

#### **1.3 Activer l\'Environnement et Lancer Jupyter Lab**

Avant chaque session de travail, vous devrez \"activer\" cet
environnement.

1.  **Activation :** Dans votre terminal Conda, tapez :

2.  conda activate climada_formation

3.  

4.  Le nom de votre environnement (climada_formation) devrait maintenant
    apparaître au début de la ligne de commande.

5.  **Lancer Jupyter Lab :** Jupyter Lab est l\'interface web où nous
    écrirons et exécuterons notre code Python. Une fois l\'environnement
    activé, lancez-le avec la commande :

6.  jupyter lab

7.  

8.  Cette commande ouvrira un nouvel onglet dans votre navigateur web
    avec l\'interface Jupyter. Vous êtes prêt à travailler !

#### **1.4 Vérification Finale**

Pour être absolument certain que tout est fonctionnel, créez un nouveau
Notebook dans Jupyter Lab et exécutez le code suivant dans une cellule :

from climada.hazard import Hazard

from climada.entity import Exposures

from climada.engine import Impact

print(\"✅ L\'environnement CLIMADA est correctement installé et
fonctionnel !\")

Si le message s\'affiche sans erreur, votre installation est un succès.

### **Chapitre 2 : Les Données d\'Entrée - Le Cœur de l\'Analyse**

La qualité de votre analyse dépend directement de la qualité de vos
données. La stratégie recommandée est de **commencer avec des données
mondiales pour construire rapidement un premier modèle, puis de
l\'affiner itérativement avec des données nationales plus précises.**

  ----------------------------------------------------------------------------------
  **Type de         **Sources Internationales    **Sources Nationales (Essentiel
  Donnée**          (Bon pour commencer)**       pour la précision)**
  ----------------- ---------------------------- -----------------------------------
  **Aléa (Pluie,    Données satellitaires        **SODEXAM** (stations météo),
  Temp., etc.)**    (CHIRPS, NASA GPM),          **Direction des Ressources en
                    Topographie (SRTM), Modèles  Eau**, **ANADER**, **Centre de
                    globaux (Aqueduct Flood      Recherches Océanologiques (CRO)**.
                    Tool, ERA5).                 

  **Exposition      OpenStreetMap (OSM),         **Institut National de la
  (Actifs, Pop.)**  WorldPop, Global Human       Statistique (INS)** (RGPH),
                    Settlement Layer (GHSL).     **BNETD**, **Cadastre**,
                                                 **Ministère de l\'Agriculture**,
                                                 **Ministère de l\'Équipement**.

  **Vulnérabilité   Bibliothèque de fonctions de **Expertise locale indispensable
  (%)**             dommage de CLIMADA,          :** **CNRA** (agronomie), **CRO**
                    Littérature scientifique     (géomorphologie), ingénieurs
                    internationale.              civils, assureurs, rapports
                                                 post-catastrophe de l\'**ONPC**.
  ----------------------------------------------------------------------------------

### **Chapitre 3 : Travaux Pratiques Détaillés**

Cette section contient les guides pas à pas pour les trois cas
pratiques. Vous pouvez copier-coller le code directement dans vos
notebooks Jupyter.

#### **TP 1 : Inondations Urbaines à Abidjan (2018)**

-   **Objectif :** Quantifier les dommages économiques directs de
    l\'événement de juin 2018 pour valider notre méthodologie.

-   **Fichier Notebook :** TP1_Inondations_Abidjan.ipynb

-   **Étapes et Code :** Suivez les instructions du notebook fourni, qui
    vous guideront à travers :

    1.  La création d\'un aléa synthétique d\'inondation.

    2.  La génération de l\'exposition économique avec LitPop.

    3.  La définition d\'une fonction de dommage hauteur-dégâts.

    4.  Le calcul et la cartographie des dommages totaux.

    5.  L\'analyse critique des résultats et la comparaison avec les
        données historiques.

#### **TP 2 : Sécheresse Agricole et Impact sur l\'Anacarde (2016)**

-   **Objectif :** Estimer les pertes de production pour la filière
    anacarde dues à la sécheresse de 2016.

-   **Fichier Notebook :** TP2_Secheresse_Agricole.ipynb

-   **Étapes et Code :** Le notebook vous montrera comment :

    1.  Modéliser un aléa de sécheresse basé sur un indice synthétique
        (SPI).

    2.  Créer une exposition représentant la valeur de la production
        agricole dans les régions du nord.

    3.  Construire une fonction de dommage liant l\'intensité de la
        sécheresse à la perte de rendement.

    4.  Calculer les pertes économiques totales et analyser l\'impact
        sur la filière.

#### **TP 3 : Érosion Côtière et Risques pour le Patrimoine à Grand-Bassam**

-   **Objectif :** Évaluer la valeur des actifs touristiques et
    résidentiels menacés par l\'érosion à un horizon 2050.

-   **Fichier Notebook :** TP3_Erosion_Cotiere.ipynb

-   **Étapes et Code :** Ce cas prospectif vous apprendra à :

    1.  Définir un aléa binaire représentant la future zone d\'érosion.

    2.  Générer l\'exposition économique de la zone côtière de
        Grand-Bassam.

    3.  Appliquer une fonction de dommage de perte totale (100%) pour
        les actifs situés dans la zone.

    4.  Calculer la valeur totale des actifs à risque, fournissant ainsi
        une estimation du **coût de l\'inaction**.

### **Chapitre 4 : De l\'Analyse à la Décision Économique**

Une fois les impacts calculés, CLIMADA devient un puissant outil d\'aide
à la décision pour la DGE.

#### **4.1 Mener une Analyse Coûts-Bénéfices (ACB)**

L\'ACB permet de justifier économiquement les investissements dans
l\'adaptation. La démarche est la suivante :

1.  **Calculer le Scénario de Référence :** Utilisez CLIMADA pour
    calculer la **Perte Annuelle Moyenne (PAM)** pour un risque donné
    (ex: inondations à Abidjan). Cette PAM représente le coût annuel
    moyen de l\'inaction.

    -   *Exemple : PAM Inondations Abidjan = 2,8 Milliards FCFA/an.*

```{=html}
<!-- -->
```
1.  **Modéliser l\'Intervention :** Définissez un projet d\'adaptation
    (ex: un programme de curage des caniveaux coûtant 5 Milliards FCFA).
    Modélisez son effet sur l\'aléa (le curage réduit la hauteur d\'eau
    maximale de 30% en moyenne).

2.  **Calculer le Scénario \"Avec Projet\" :** Relancez le calcul de la
    PAM avec l\'aléa modifié.

    -   *Exemple : Nouvelle PAM avec projet = 1 Milliard FCFA/an.*

```{=html}
<!-- -->
```
1.  **Calculer le Bénéfice et la Rentabilité :**

    -   **Bénéfice Annuel :** PAM (sans projet) - PAM (avec projet) =
        2,8 - 1 = 1,8 Milliards FCFA de pertes évitées chaque année.

    -   **Temps de Retour sur Investissement :** Coût du projet /
        Bénéfice Annuel = 5 / 1,8 ≈ 2,8 ans.

    -   **Conclusion pour la décision :** L\'investissement est
        économiquement très rentable. CLIMADA fournit les chiffres pour
        arbitrer en faveur de ce budget préventif.

#### **4.2 Intégration dans la Déclaration des Risques Budgétaires (DRB)**

Les résultats de CLIMADA alimentent directement la DRB et répondent aux
exigences de nos partenaires (notamment la MR2 de l\'accord avec le
FMI).

-   La **Perte Annuelle Moyenne (PAM)** doit être interprétée comme un
    **passif contingent implicite** récurrent pour le budget de l\'État.
    C\'est le montant moyen que l\'État devra débourser chaque année (en
    aide d\'urgence, reconstruction, etc.).

-   La **Perte Maximale Probable (PMP)** pour une période de retour
    donnée (ex: 100 ans) représente le **montant d\'un choc budgétaire
    extrême**. Ce chiffre est essentiel pour les stress tests et pour
    dimensionner les fonds de contingence ou les mécanismes d\'assurance
    souveraine.

### **Conclusion : Vers une Planification Économique Résiliente**

La maîtrise de CLIMADA représente une montée en compétence stratégique
pour la DGE. Elle nous permet de passer d\'une approche descriptive des
risques à une **approche quantitative, probabiliste et prospective**. En
chiffrant le coût de l\'inaction et la rentabilité de l\'adaptation,
nous renforçons notre capacité de conseil et notre crédibilité dans les
arbitrages budgétaires et les négociations internationales.

Pour que cette formation porte ses fruits, un plan d\'action doit être
mis en œuvre :

1.  **Institutionnaliser l\'outil :** Installer CLIMADA sur les postes
    de travail et désigner des points focaux.

2.  **Centraliser les données :** Créer un groupe de travail
    interministériel (avec SODEXAM, INS, BNETD, etc.) pour bâtir et
    partager une base de données nationale pour les analyses de risque.

3.  **Intégrer les analyses :** Rendre l\'évaluation de risque
    climatique avec CLIMADA une étape standard dans l\'analyse des
    projets d\'investissement public et dans la préparation annuelle de
    la DRB.

Cette démarche est une étape décisive pour ancrer la résilience
climatique au cœur de la stratégie de développement de la Côte
d\'Ivoire.
