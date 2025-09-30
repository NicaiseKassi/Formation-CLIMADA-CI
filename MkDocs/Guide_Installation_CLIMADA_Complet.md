# Guide d'Installation CLIMADA - Formation DGE Côte d'Ivoire

## 🎯 **Objectif**
Ce guide détaille l'installation complète de CLIMADA sur Windows et Linux pour la formation DGE.

---

## 🖥️ **INSTALLATION SUR WINDOWS**

### **Prérequis Système**
- **OS** : Windows 10 (64-bit) ou Windows 11
- **RAM** : 8 GB minimum, 16 GB recommandé
- **Espace disque** : 20 GB libres
- **Processeur** : Intel i5 ou équivalent AMD
- **Connexion internet** : Stable pour téléchargements

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

#### **4.2 Test de l'installation CLIMADA**
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

## 🐧 **INSTALLATION SUR LINUX (Ubuntu/Debian)**

### **Prérequis Système**
- **OS** : Ubuntu 18.04+ ou Debian 10+
- **RAM** : 8 GB minimum, 16 GB recommandé
- **Espace disque** : 15 GB libres
- **Accès sudo** : Requis pour installation packages système

### **Étape 1 : Mise à Jour du Système**

```bash
# Mise à jour des packages
sudo apt update && sudo apt upgrade -y

# Installation des outils de développement
sudo apt install build-essential -y
sudo apt install curl wget git -y
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

## 🔧 **CONFIGURATION AVANCÉE**

### **Variables d'Environnement**

#### **Windows**
```bash
# Dans Anaconda Prompt
set CLIMADA_DATA_DIR=C:\CLIMADA_Formation_CI\data
set CLIMADA_RESULTS_DIR=C:\CLIMADA_Formation_CI\results
```

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

---

## 🚨 **RÉSOLUTION DES PROBLÈMES COURANTS**

### **Erreurs d'Installation**

#### **Problème : "Microsoft Visual C++ 14.0 is required" (Windows)**
```bash
# Solution : Installer Visual Studio Build Tools
# Télécharger depuis : https://visualstudio.microsoft.com/visual-cpp-build-tools/
# Installer "C++ build tools" workload
```

#### **Problème : "GDAL not found" (Linux)**
```bash
# Solution : Réinstaller GDAL avec headers
sudo apt remove libgdal-dev
sudo apt install libgdal-dev gdal-bin
pip uninstall GDAL
pip install GDAL==$(gdal-config --version)
```

#### **Problème : "Cartopy installation failed"**
```bash
# Windows
conda install -c conda-forge cartopy

# Linux
sudo apt install libproj-dev proj-data proj-bin
pip install cartopy
```

### **Erreurs d'Exécution**

#### **Problème : "No module named 'climada'"**
```bash
# Vérifier l'environnement actif
conda info --envs  # Windows
which python       # Linux

# Réactiver l'environnement
conda activate climada  # Windows
source ~/climada_env/bin/activate  # Linux
```

#### **Problème : "Kernel not found in Jupyter"**
```bash
# Réinstaller le kernel
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation"
```

---

## ✅ **CHECKLIST DE VALIDATION**

### **Tests à Effectuer**

```python
# Test 1 : Imports de base
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import geopandas as gpd
print("✅ Imports de base OK")

# Test 2 : CLIMADA core
from climada.hazard import Hazard
from climada.entity import Exposures, ImpactFunc
from climada.engine import Impact
print("✅ CLIMADA core OK")

# Test 3 : Création d'objets
hazard = Hazard('FL')
exposures = Exposures()
impact_func = ImpactFunc()
print("✅ Création d'objets OK")

# Test 4 : Géospatial
import rasterio
import cartopy
import folium
print("✅ Packages géospatiaux OK")

# Test 5 : Jupyter
from IPython.display import display
print("✅ Jupyter OK")

print("🎉 Installation complète et validée!")
```

---

## 📞 **SUPPORT TECHNIQUE**

### **Contacts Formation**
- **Email** : support-climada@dge.gouv.ci
- **Téléphone** : [Numéro dédié]
- **Forum** : GitHub Discussions CLIMADA-CI

### **Ressources Complémentaires**
- **Documentation officielle** : https://climada.readthedocs.io/
- **Tutoriels** : https://github.com/CLIMADA-project/climada_python
- **Exemples** : Notebooks fournis avec la formation

---

**Installation réussie ? Vous êtes prêt pour la formation CLIMADA ! 🚀**
