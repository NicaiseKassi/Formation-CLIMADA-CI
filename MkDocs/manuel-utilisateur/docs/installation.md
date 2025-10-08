# Installation Professionnelle de l'Environnement de Travail

Cette section détaille la procédure standard pour installer un environnement de science des données reproductible. Nous utiliserons Git pour la gestion de version et Conda pour la gestion des librairies.

## 1.1 Prérequis : Installation des Outils de Base

Avant de commencer, deux outils doivent être installés sur votre poste.

### 1. Installation de Git (Système de Contrôle de Version)

Git est essentiel pour télécharger (cloner) le dépôt de la formation et gérer les versions de votre code.

**Windows :**

- Téléchargez l'installateur depuis [git-scm.com/download/win](https://git-scm.com/download/win).
- Exécutez-le et acceptez les options par défaut tout au long de l'installation.

**Linux (Debian/Ubuntu) :**

- Ouvrez un terminal.
- Exécutez la commande :
  ```bash
  sudo apt update && sudo apt install git
  ```

### 2. Installation de Miniconda (Gestionnaire d'Environnement)

Miniconda est une version légère d'Anaconda qui nous permet de créer des environnements de travail isolés.

- Téléchargez l'installateur correspondant à votre système depuis la [page officielle de Miniconda](https://docs.conda.io/en/latest/miniconda.html).
- Suivez les instructions d'installation, en conservant les options par défaut.

## 1.2 Configuration de l'Environnement de la Formation

Cette procédure garantit que tout le monde dispose d'un environnement de travail identique.

### Étape 1 : Cloner le Dépôt de la Formation

Ouvrez un terminal (Anaconda Prompt sur Windows) et exécutez la commande suivante pour télécharger tous les fichiers nécessaires (notebooks, données, fichier de configuration) dans un nouveau dossier.

```bash
git clone [URL_DU_DEPOT_GITHUB_DE_LA_FORMATION]
```

### Étape 2 : Créer l'Environnement Conda

Naviguez dans le dossier qui vient d'être créé (`cd nom-du-dossier`). À l'intérieur, vous trouverez un fichier nommé `environnement_formation.yml`. Ce fichier décrit l'ensemble des librairies requises.

Exécutez la commande suivante pour que Conda construise l'environnement automatiquement :

```bash
conda env create -f environnement_formation.yml
```

Cette opération peut prendre plusieurs minutes.

### Étape 3 : Activer l'Environnement et Lancer Jupyter Lab

Une fois l'environnement créé, vous devez l'activer avant chaque session de travail.

```bash
conda activate climada_formation
```

Lancez ensuite l'interface de travail Jupyter Lab :

```bash
jupyter lab
```

Votre navigateur web s'ouvrira, et vous serez prêt à commencer les travaux pratiques.n de l'Environnement de Travail

Cette section détaille la procédure complète pour installer `CLIMADA`. L'utilisation de Conda est fortement recommandée car elle gère de manière isolée et efficace les nombreuses librairies scientifiques dont CLIMADA dépend.

## 1.1 Prérequis : Installation de Miniconda

Miniconda est une version légère d'Anaconda qui contient le gestionnaire d'environnement Conda.

### 1. Téléchargement

- **Windows :** Rendez-vous sur la [documentation officielle de Conda](https://www.anaconda.com/docs/getting-started/miniconda/main) et téléchargez l'installateur Python 3.x pour Windows 64-bit.

- **Linux/macOS :** Allez sur la [page de téléchargement de Miniconda](https://docs.conda.io/en/latest/miniconda.html) et téléchargez le script d'installation correspondant à votre système.

### 2. Installation

- **Windows :** Double-cliquez sur le fichier `.exe` téléchargé et suivez les instructions. Il est recommandé de conserver les options par défaut ("Just Me" et "Add Anaconda to my PATH environment variable").

- **Linux/macOS :** Ouvrez un terminal, naviguez jusqu'au dossier où vous avez téléchargé le script, et exécutez la commande `bash Miniconda3-latest-Linux-x86_64.sh` (adaptez le nom du fichier). Suivez les instructions à l'écran.

### 3. Vérification de l'installation

Fermez et rouvrez votre terminal (ou "Anaconda Prompt" sur Windows). Tapez la commande `conda --version`. Si une version s'affiche (ex: `conda 23.7.4`), l'installation a réussi.

## 1.2 Création de l'Environnement `climada_formation`

Nous allons utiliser un fichier de configuration `(environment.yml)` qui garantit que tous les participants ont exactement les mêmes versions des logiciels, pour une reproductibilité parfaite.
