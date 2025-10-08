# 🚀 Guide d'Installation - Formation CLIMADA

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir :

- Un ordinateur sous **Linux**, **macOS** ou **Windows** (avec WSL recommandé)
- Au moins **10 GB** d'espace disque disponible
- Une connexion Internet stable
- Droits administrateur sur votre machine

---

## 🔧 Installation Rapide (Recommandée)

### Option 1 : Installation Automatique (Linux/macOS)

```bash
# 1. Télécharger le dépôt
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI

# 2. Lancer le script d'installation automatique
bash install_climada.sh
```

Le script va automatiquement :

- ✅ Vérifier et installer Conda/Miniconda si nécessaire
- ✅ Créer l'environnement `climada_formation`
- ✅ Installer toutes les dépendances CLIMADA
- ✅ Tester l'installation

**Durée estimée :** 15-30 minutes selon votre connexion

---

### Option 2 : Installation Manuelle

#### Étape 1 : Installer Miniconda/Anaconda

**Si vous n'avez pas encore Conda :**

##### Linux

```bash
# Télécharger Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Installer
bash Miniconda3-latest-Linux-x86_64.sh

# Suivre les instructions à l'écran
# Accepter la licence et confirmer l'emplacement d'installation

# Recharger votre shell
source ~/.bashrc

# Vérifier l'installation
conda --version
```

##### macOS

```bash
# Télécharger Miniconda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh

# Installer
bash Miniconda3-latest-MacOSX-x86_64.sh

# Suivre les instructions
source ~/.bash_profile

# Vérifier
conda --version
```

##### Windows

1. Télécharger [Miniconda pour Windows](https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe)
2. Double-cliquer sur l'installateur
3. Suivre l'assistant d'installation
4. Ouvrir "Anaconda Prompt" depuis le menu Démarrer

#### Étape 2 : Cloner le dépôt

```bash
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
```

#### Étape 3 : Créer l'environnement CLIMADA

```bash
# Créer l'environnement à partir du fichier YAML
conda env create -f environment_formation.yml

# Attendre la fin de l'installation (peut prendre 15-30 minutes)
```

#### Étape 4 : Activer l'environnement

```bash
conda activate climada_formation
```

#### Étape 5 : Vérifier l'installation

```bash
# Test Python
python -c "import climada; print('CLIMADA version:', climada.__version__)"

# Test des dépendances principales
python -c "
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import cartopy
import geopandas as gpd
print('✅ Toutes les dépendances sont installées correctement!')
"
```

---

## 🧪 Test de l'Installation

### Test Rapide

Exécutez ce script de test :

```python
# test_installation.py
import sys
print("🔍 Vérification de l'environnement CLIMADA...\n")

modules_requis = {
    'climada': 'CLIMADA',
    'numpy': 'NumPy',
    'pandas': 'Pandas',
    'matplotlib': 'Matplotlib',
    'cartopy': 'Cartopy',
    'geopandas': 'GeoPandas',
    'xarray': 'Xarray',
    'rasterio': 'Rasterio',
    'shapely': 'Shapely',
    'netCDF4': 'NetCDF4'
}

erreurs = []
for module, nom in modules_requis.items():
    try:
        __import__(module)
        print(f"✅ {nom:15} : Installé")
    except ImportError:
        print(f"❌ {nom:15} : MANQUANT")
        erreurs.append(nom)

if erreurs:
    print(f"\n⚠️  Modules manquants : {', '.join(erreurs)}")
    print("Réinstallez l'environnement avec : conda env create -f environment_formation.yml --force")
    sys.exit(1)
else:
    print("\n✅ Installation réussie ! Vous êtes prêt pour la formation.")
    sys.exit(0)
```

Exécuter le test :

```bash
python test_installation.py
```

### Test Complet avec Jupyter

```bash
# Lancer Jupyter Notebook
jupyter notebook

# Ou Jupyter Lab
jupyter lab
```

Ouvrir un nouveau notebook et tester :

```python
import climada
from climada.hazard import Hazard
from climada.entity import Exposures
print(f"✅ CLIMADA version {climada.__version__} fonctionne!")
```

---

## 🐛 Résolution des Problèmes Courants

### Problème 1 : Conda commande non trouvée

**Erreur :** `bash: conda: command not found`

**Solution :**

```bash
# Recharger votre configuration shell
source ~/.bashrc   # Linux
source ~/.bash_profile   # macOS

# Si ça ne marche pas, réinstaller Miniconda
```

### Problème 2 : Conflit de dépendances

**Erreur :** `Solving environment: failed with initial frozen solve`

**Solution :**

```bash
# Supprimer l'environnement existant
conda env remove -n climada_formation

# Nettoyer le cache
conda clean --all

# Recréer l'environnement
conda env create -f environment_formation.yml
```

### Problème 3 : Erreur d'importation CLIMADA

**Erreur :** `ImportError: No module named 'climada'`

**Solution :**

```bash
# Vérifier que l'environnement est activé
conda activate climada_formation

# Vérifier l'installation
conda list | grep climada

# Si CLIMADA n'est pas listée, réinstaller
pip install climada
```

### Problème 4 : Erreur Cartopy/GEOS

**Erreur :** `OSError: Could not find libgeos_c`

**Solution :**

```bash
# Réinstaller les dépendances géospatiales
conda install -c conda-forge cartopy geos shapely --force-reinstall
```

### Problème 5 : Manque d'espace disque

**Erreur :** `No space left on device`

**Solution :**

```bash
# Nettoyer le cache Conda (libère 2-5 GB)
conda clean --all -y

# Vérifier l'espace disponible
df -h
```

### Problème 6 : Installation très lente

**Solution :**

```bash
# Utiliser mamba (plus rapide que conda)
conda install mamba -c conda-forge

# Puis créer l'environnement avec mamba
mamba env create -f environment_formation.yml
```

---

## 📦 Environnements Alternatifs

### Installation Minimale (Plus rapide)

Si vous voulez une installation plus légère :

```bash
# Créer un environnement minimal
conda create -n climada_mini python=3.9 -y
conda activate climada_mini

# Installer seulement les packages essentiels
pip install climada pandas numpy matplotlib geopandas jupyter
```

**Note :** Certaines fonctionnalités avancées peuvent ne pas fonctionner.

---

## 🔄 Mise à Jour de l'Environnement

Pour mettre à jour votre environnement :

```bash
# Récupérer les dernières modifications
git pull origin main

# Mettre à jour l'environnement
conda env update -f environment_formation.yml --prune
```

---

## 📝 Commandes Utiles

### Gestion des environnements Conda

```bash
# Lister tous les environnements
conda env list

# Activer un environnement
conda activate climada_formation

# Désactiver l'environnement actuel
conda deactivate

# Supprimer un environnement
conda env remove -n climada_formation

# Exporter votre environnement
conda env export > mon_environnement.yml
```

### Gestion des packages

```bash
# Lister les packages installés
conda list

# Rechercher un package
conda search nom_package

# Installer un nouveau package
conda install -c conda-forge nom_package

# Mettre à jour un package
conda update nom_package

# Supprimer un package
conda remove nom_package
```

---

## 📚 Prochaines Étapes

Une fois l'installation réussie :

1. **Consulter les notebooks de formation** dans le dossier `TP/`
2. **Lire le manuel CLIMADA** dans `Cours/`
3. **Tester les exercices pratiques** :
   - `TP1_Inondations_Abidjan_2018_Complet.ipynb`
   - `TP2_Secheresse_Agriculture_2016_Complet.ipynb`

---

## 🆘 Support

En cas de problème persistant :

1. **Vérifier les Issues GitHub** : [Formation-CLIMADA-CI/issues](https://github.com/NicaiseKassi/Formation-CLIMADA-CI/issues)
2. **Consulter la documentation CLIMADA** : [https://climada-python.readthedocs.io](https://climada-python.readthedocs.io)
3. **Contacter l'équipe de formation** : [Ajouter email/contact]

---

## ✅ Checklist d'Installation

- [ ] Miniconda/Anaconda installé
- [ ] Dépôt cloné localement
- [ ] Environnement `climada_formation` créé
- [ ] Test d'importation CLIMADA réussi
- [ ] Jupyter Notebook/Lab fonctionnel
- [ ] Notebooks de TP accessibles

**Félicitations ! Vous êtes prêt pour la formation CLIMADA ! 🎉**
