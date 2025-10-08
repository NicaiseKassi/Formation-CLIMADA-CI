# **Chapitre 1 : Installation Complète de l'Environnement de Travail**

## 🎯 **Objectif**

Ce guide détaille l'installation complète de CLIMADA sur Windows et Linux pour la formation DGE.

---

## 🖥️ **Installation sur window**

### **Prérequis Système**

- **OS** : Windows 10 (64-bit) ou Windows 11
- **RAM** : 8 GB minimum, 16 GB recommandé
- **Espace disque** : 20 GB libres
- **Processeur** : Intel i5 ou équivalent AMD
- **Connexion internet** : Stable pour téléchargements

### **Étape 0 : Installation de Git (Contrôle de Version)**

#### **0.1 Téléchargement**

```bash
# Aller sur https://git-scm.com/download/win
# Télécharger "Git for Windows" (dernière version stable)
# Fichier : Git-2.XX.X-64-bit.exe (~50 MB)
```

#### **0.2 Installation**

1. **Lancer l'installateur** téléchargé
2. **Accepter la licence** GNU General Public License
3. **Choisir le répertoire d'installation** (par défaut : `C:\Program Files\Git`)
4. **Sélectionner les composants** :
   - ✅ Windows Explorer integration (recommandé)
   - ✅ Git Bash Here
   - ✅ Git GUI Here
   - ✅ Associate .git\* configuration files with the default text editor
5. **Configurer l'éditeur par défaut** : Vim ou Nano (ou votre éditeur préféré)
6. **Ajuster le PATH** : Choisir "Git from the command line and also from 3rd-party software"
7. **Choisir HTTPS transport backend** : Use the OpenSSL library
8. **Configurer les fins de lignes** : Checkout Windows-style, commit Unix-style
9. **Configurer l'émulateur de terminal** : Use MinTTY (recommended)
10. **Options supplémentaires** :
    - ✅ Enable file system caching
    - ✅ Enable Git Credential Manager
11. **Cliquer sur "Install"**

#### **0.3 Vérification de l'installation**

Ouvrir **Anaconda Prompt** (ou cmd) et taper :

```bash
git --version
# Résultat attendu : git version 2.XX.X.windows.X
```

#### **0.4 Configuration initiale de Git**

```bash
# Configurer votre identité
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@exemple.ci"

# Vérifier la configuration
git config --list
```

---

### **Étape 1 : Installation d'Anaconda**

#### **1.1 Téléchargement**

```bash
# Aller sur https://www.anaconda.com/products/distribution
# Télécharger "Anaconda Individual Edition" pour Windows
# Fichier : Anaconda3-2023.XX-Windows-x86_64.exe (~500 MB)
```

#### **1.2 Installation**

1. **Exécuter** le fichier téléchargé en tant qu'administrateur
2. **Accepter** les conditions d'utilisation
3. **Choisir** "Install for all users" (recommandé)
4. **Dossier d'installation** : Garder par défaut `C:\ProgramData\Anaconda3`
5. **Options avancées** :
   - ✅ Cocher "Add Anaconda to PATH environment variable"
   - ✅ Cocher "Register Anaconda as default Python"
6. **Terminer** l'installation (15-20 minutes)

#### **1.3 Vérification**

```bash
# Ouvrir "Anaconda Prompt" depuis le menu Démarrer
conda --version
python --version
# Doit afficher : conda 23.X.X et Python 3.X.X
```

### **Étape 2 : Création de l'Environnement CLIMADA**

#### **2.1 Ouverture d'Anaconda Prompt**

```bash
# Clic droit sur "Anaconda Prompt" → "Exécuter en tant qu'administrateur"
```

#### **2.2 Création de l'environnement**

```bash
# Création environnement Python 3.9 (version stable pour CLIMADA)
conda create -n climada python=3.9 -y

# Activation de l'environnement
conda activate climada

# Vérification
python --version
# Doit afficher : Python 3.9.X
```

### **Étape 3 : Installation des Dépendances Géospatiales**

#### **3.1 Installation via conda-forge**

```bash
# Mise à jour conda
conda update conda -y

# Installation des packages géospatiaux (ordre important!)
conda install -c conda-forge geopandas -y
conda install -c conda-forge rasterio -y
conda install -c conda-forge cartopy -y
conda install -c conda-forge pyproj -y
conda install -c conda-forge fiona -y
conda install -c conda-forge shapely -y

# Packages pour données NetCDF
conda install -c conda-forge netcdf4 -y
conda install -c conda-forge h5netcdf -y
conda install -c conda-forge xarray -y

# Packages scientifiques
conda install -c conda-forge scipy -y
conda install -c conda-forge scikit-learn -y
conda install -c conda-forge statsmodels -y
```

#### **3.2 Vérification des installations géospatiales**

```bash
python -c "import geopandas; print('GeoPandas OK')"
python -c "import rasterio; print('Rasterio OK')"
python -c "import cartopy; print('Cartopy OK')"
```

### **Étape 4 : Installation de CLIMADA**

#### **4.1 Installation du package principal**

```bash
# Installation CLIMADA core
pip install climada-petals

# Packages de visualisation
conda install -c conda-forge matplotlib -y
conda install -c conda-forge seaborn -y
conda install -c conda-forge plotly -y
conda install -c conda-forge folium -y

# Jupyter pour les notebooks
conda install -c conda-forge jupyter -y
conda install -c conda-forge jupyterlab -y
```

#### **4.2 Vérification de la version CLIMADA installée**

**🔍 Méthode 1 : Ligne de commande simple**

```bash
# Commande rapide pour voir la version
python -c "import climada; print('CLIMADA version:', climada.__version__)"
```

**Résultat attendu :**

```
CLIMADA version: 4.1.0
```

**🔍 Méthode 2 : Dans un script Python**

```python
# Ouvrir Python ou Jupyter et exécuter :
import climada
print(f"Version de CLIMADA installée : {climada.__version__}")
print(f"Répertoire d'installation : {climada.__file__}")
```

**🔍 Méthode 3 : Avec informations détaillées**

```python
import climada
import sys
import numpy as np
import pandas as pd

print("=" * 50)
print("INFORMATIONS D'INSTALLATION CLIMADA")
print("=" * 50)
print(f"Version CLIMADA : {climada.__version__}")
print(f"Version Python : {sys.version}")
print(f"Version NumPy : {np.__version__}")
print(f"Version Pandas : {pd.__version__}")
print("=" * 50)
```

#### **4.3 Test complet des modules CLIMADA**

```bash
python -c "import climada; print(f'CLIMADA version: {climada.__version__}')"
python -c "from climada.hazard import Hazard; print('Import Hazard OK')"
python -c "from climada.entity import Exposures; print('Import Exposures OK')"
python -c "from climada.engine import Impact; print('Import Impact OK')"
```

### **Étape 5 : Configuration de l'Environnement de Travail**

#### **5.1 Création de la structure de dossiers**

```bash
# Création du dossier de travail
mkdir C:\CLIMADA_Formation_CI
cd C:\CLIMADA_Formation_CI

# Structure des sous-dossiers
mkdir data
mkdir notebooks
mkdir results
mkdir docs
mkdir config
```

#### **5.2 Configuration Jupyter**

```bash
# Installation du kernel Jupyter pour l'environnement climada
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation"

# Lancement de JupyterLab
jupyter lab
# Une page web s'ouvre automatiquement sur http://localhost:8888
```

### **Étape 6 : Test Complet**

#### **6.1 Création d'un notebook de test**

```python
# Dans JupyterLab, créer un nouveau notebook avec kernel "CLIMADA Formation"
# Copier-coller ce code de test :

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import geopandas as gpd
from climada.hazard import Hazard
from climada.entity import Exposures
from climada.engine import Impact

print("✅ Toutes les importations réussies!")
print(f"CLIMADA version: {climada.__version__}")

# Test création d'un hazard simple
hazard = Hazard('TC')  # Tropical Cyclone
print("✅ Création Hazard réussie!")

# Test création exposures
exposures = Exposures()
print("✅ Création Exposures réussie!")

print("🎉 Installation CLIMADA complète et fonctionnelle!")
```

---

## 🐧 **Installation sur linux (Ubuntu/Debian)**

### **Prérequis Système**

- **OS** : Ubuntu 18.04+ ou Debian 10+
- **RAM** : 8 GB minimum, 16 GB recommandé
- **Espace disque** : 15 GB libres
- **Accès sudo** : Requis pour installation packages système

### **Étape 0 : Installation de Git (Contrôle de Version)**

#### **0.1 Vérification de Git**

```bash
# Vérifier si Git est déjà installé
git --version

# Si Git n'est pas installé, le message suivant apparaît :
# "command 'git' not found"
```

#### **0.2 Installation de Git**

```bash
# Installation via apt (Ubuntu/Debian)
sudo apt update
sudo apt install git -y

# Vérification de l'installation
git --version
# Résultat attendu : git version 2.XX.X
```

#### **0.3 Configuration initiale de Git**

```bash
# Configurer votre identité
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@exemple.ci"

# Configurer l'éditeur par défaut (optionnel)
git config --global core.editor nano

# Activer la coloration syntaxique
git config --global color.ui auto

# Vérifier la configuration
git config --list
```

---

### **Étape 1 : Mise à Jour du Système**

```bash
# Mise à jour des packages
sudo apt update && sudo apt upgrade -y

# Installation des outils de développement
sudo apt install build-essential -y
sudo apt install curl wget -y
```

### **Étape 2 : Installation de Python 3.9**

#### **2.1 Installation Python**

```bash
# Installation Python 3.9 et outils associés
sudo apt install python3.9 python3.9-dev python3.9-venv -y
sudo apt install python3-pip -y

# Vérification
python3.9 --version
pip3 --version
```

#### **2.2 Installation des dépendances système pour packages géospatiaux**

```bash
# Bibliothèques GDAL/OGR pour géospatial
sudo apt install gdal-bin libgdal-dev -y
sudo apt install libproj-dev proj-data proj-bin -y
sudo apt install libgeos-dev -y

# Bibliothèques pour NetCDF/HDF5
sudo apt install libhdf5-dev libnetcdf-dev -y
sudo apt install libspatialindex-dev -y

# Bibliothèques pour compilation
sudo apt install libffi-dev libssl-dev -y
sudo apt install libblas-dev liblapack-dev -y
```

### **Étape 3 : Création de l'Environnement Virtuel**

#### **3.1 Création et activation**

```bash
# Création de l'environnement virtuel
python3.9 -m venv ~/climada_env

# Activation
source ~/climada_env/bin/activate

# Mise à jour pip
pip install --upgrade pip setuptools wheel
```

#### **3.2 Ajout au .bashrc pour activation automatique**

```bash
# Ajout d'un alias pour faciliter l'activation
echo "alias climada='source ~/climada_env/bin/activate'" >> ~/.bashrc
source ~/.bashrc
```

### **Étape 4 : Installation des Packages Python**

#### **4.1 Installation des dépendances géospatiales**

```bash
# Variables d'environnement pour GDAL
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal

# Installation des packages géospatiaux
pip install numpy pandas
pip install GDAL==$(gdal-config --version)
pip install fiona shapely pyproj
pip install geopandas rasterio
pip install cartopy

# Packages pour données scientifiques
pip install netcdf4 h5netcdf xarray
pip install scipy scikit-learn statsmodels
```

#### **4.2 Installation CLIMADA**

```bash
# Installation CLIMADA
pip install climada-petals

# Packages de visualisation
pip install matplotlib seaborn plotly folium

# Jupyter
pip install jupyter jupyterlab ipykernel
```

### **Étape 5 : Configuration Jupyter**

#### **5.1 Installation du kernel**

```bash
# Installation du kernel Jupyter
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation"

# Configuration JupyterLab
jupyter lab --generate-config
```

#### **5.2 Configuration pour accès distant (optionnel)**

```bash
# Si accès depuis une autre machine
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root
```

### **Étape 6 : Structure de Travail**

#### **6.1 Création des dossiers**

```bash
# Dossier principal
mkdir -p ~/CLIMADA_Formation_CI/{data,notebooks,results,docs,config}
cd ~/CLIMADA_Formation_CI

# Permissions
chmod -R 755 ~/CLIMADA_Formation_CI
```

#### **6.2 Script de lancement**

```bash
# Création d'un script de lancement
cat > ~/start_climada.sh << 'EOF'
#!/bin/bash
source ~/climada_env/bin/activate
cd ~/CLIMADA_Formation_CI
jupyter lab
EOF

chmod +x ~/start_climada.sh
```

---

## 🔧 **Configuration avancée**

### **Variables d'Environnement**

#### **Windows**

```bash
# Dans Anaconda Prompt
set CLIMADA_DATA_DIR=C:\CLIMADA_Formation_CI\data
set CLIMADA_RESULTS_DIR=C:\CLIMADA_Formation_CI\results
```

#### **Linux**

````bash
# Ajout au .bashrc
```bash
# Dans Anaconda Prompt
set CLIMADA_DATA_DIR=C:\CLIMADA_Formation_CI\data
set CLIMADA_RESULTS_DIR=C:\CLIMADA_Formation_CI\results
````

#### **Linux**

```bash
# Ajout au .bashrc
echo 'export CLIMADA_DATA_DIR=~/CLIMADA_Formation_CI/data' >> ~/.bashrc
echo 'export CLIMADA_RESULTS_DIR=~/CLIMADA_Formation_CI/results' >> ~/.bashrc
source ~/.bashrc
```

### **Configuration CLIMADA**

#### **Fichier de configuration**

```python
# Créer config/climada_config.py
import os
from pathlib import Path

# Dossiers de travail
DATA_DIR = Path(os.getenv('CLIMADA_DATA_DIR', './data'))
RESULTS_DIR = Path(os.getenv('CLIMADA_RESULTS_DIR', './results'))

# Paramètres par défaut Côte d'Ivoire
DEFAULT_CRS = 'EPSG:4326'  # WGS84
CI_BOUNDS = {
    'min_lat': 4.0,
    'max_lat': 10.8,
    'min_lon': -8.6,
    'max_lon': -2.5
}

# Résolutions recommandées
URBAN_RESOLUTION_KM = 0.1    # 100m pour zones urbaines
RURAL_RESOLUTION_KM = 1.0    # 1km pour zones rurales
NATIONAL_RESOLUTION_KM = 5.0 # 5km pour analyses nationales
```
