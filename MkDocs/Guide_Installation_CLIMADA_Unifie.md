# 🚀 GUIDE COMPLET D'INSTALLATION CLIMADA

## Formation DGE Côte d'Ivoire - Version Unifiée

### 📋 **TABLE DES MATIÈRES**

1. [Prérequis et Préparation](#prérequis)
2. [Installation Python et Conda](#python-conda)
3. [Installation CLIMADA sur Windows](#windows)
4. [Installation CLIMADA sur Linux](#linux)
5. [Configuration Jupyter Lab](#jupyter)
6. [Tests et Validation](#tests)
7. [Résolution des Problèmes](#troubleshooting)

---

## 🔧 **1. PRÉREQUIS ET PRÉPARATION** {#prérequis}

### **Configuration Minimale Requise**

| Composant    | Windows                                 | Linux                      |
| ------------ | --------------------------------------- | -------------------------- |
| **OS**       | Windows 10/11 (64-bit)                  | Ubuntu 18.04+ / Debian 10+ |
| **RAM**      | 8 GB min, 16 GB recommandé              | 8 GB min, 16 GB recommandé |
| **Stockage** | 25 GB libres                            | 20 GB libres               |
| **CPU**      | Intel i5 / AMD équivalent               | Intel i5 / AMD équivalent  |
| **Internet** | Connexion stable (500 MB à télécharger) | Connexion stable           |

### **Structure de Dossiers Recommandée**

```
CLIMADA_Formation_CI/
├── data/               # Données d'entrée (météo, économique)
├── notebooks/          # Notebooks Jupyter de formation
├── results/           # Résultats des analyses
├── docs/              # Documentation et guides
├── config/            # Fichiers de configuration
└── scripts/           # Scripts Python utilitaires
```

---

## 🐍 **2. TÉLÉCHARGEMENT ET INSTALLATION PYTHON/CONDA** {#python-conda}

### **Option A : Installation Anaconda (Recommandée)**

#### **Téléchargement Anaconda**

- **Site officiel** : [https://www.anaconda.com/download](https://www.anaconda.com/download)
- **Version** : Anaconda Individual Edition (gratuite)
- **Taille** : ~500 MB

#### **Windows - Installation Anaconda**

```bash
# 1. Télécharger Anaconda3-2023.XX-Windows-x86_64.exe
# 2. Exécuter en tant qu'administrateur
# 3. Options d'installation :
#    ✅ Install for all users
#    ✅ Add Anaconda to PATH environment variable
#    ✅ Register Anaconda as default Python
#    📁 Dossier : C:\ProgramData\Anaconda3 (par défaut)
```

#### **Linux - Installation Anaconda**

```bash
# Téléchargement
wget https://repo.anaconda.com/archive/Anaconda3-2023.07-Linux-x86_64.sh

# Installation
bash Anaconda3-2023.07-Linux-x86_64.sh

# Suivre les instructions :
# - Accepter la licence
# - Confirmer le dossier d'installation (~/anaconda3)
# - Accepter l'initialisation du shell

# Recharger le terminal
source ~/.bashrc
```

### **Option B : Installation Miniconda (Alternative Légère)**

#### **Windows**

```bash
# Télécharger Miniconda3-latest-Windows-x86_64.exe
# Installation similaire à Anaconda, plus rapide
```

#### **Linux**

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
```

### **Vérification Installation**

```bash
# Ouvrir terminal/Anaconda Prompt
conda --version        # Doit afficher : conda 23.X.X
python --version       # Doit afficher : Python 3.X.X
conda info            # Informations détaillées
```

---

## 🪟 **3. INSTALLATION CLIMADA SUR WINDOWS** {#windows}

### **Étape 1 : Préparation de l'Environnement**

```bash
# Ouvrir "Anaconda Prompt" en tant qu'administrateur
# Mise à jour de conda
conda update conda -y
conda update anaconda -y
```

### **Étape 2 : Création de l'Environnement CLIMADA**

```bash
# Création environnement Python 3.9 (version stable)
conda create -n climada python=3.9 -y

# Activation de l'environnement
conda activate climada

# Vérification
python --version  # Doit afficher Python 3.9.X
```

### **Étape 3 : Installation des Dépendances Géospatiales**

```bash
# Mise à jour de conda-forge
conda config --add channels conda-forge
conda config --set channel_priority strict

# Installation packages géospatiaux (ordre important!)
conda install -c conda-forge geopandas -y
conda install -c conda-forge rasterio -y
conda install -c conda-forge cartopy -y
conda install -c conda-forge pyproj -y
conda install -c conda-forge fiona -y
conda install -c conda-forge shapely -y

# Packages pour NetCDF/données climatiques
conda install -c conda-forge netcdf4 -y
conda install -c conda-forge h5netcdf -y
conda install -c conda-forge xarray -y
conda install -c conda-forge dask -y

# Packages scientifiques
conda install -c conda-forge scipy -y
conda install -c conda-forge scikit-learn -y
conda install -c conda-forge statsmodels -y
conda install -c conda-forge openpyxl -y
```

### **Étape 4 : Installation CLIMADA et Outils**

```bash
# Installation CLIMADA principal
pip install climada-petals

# Packages de visualisation
conda install -c conda-forge matplotlib -y
conda install -c conda-forge seaborn -y
conda install -c conda-forge plotly -y
conda install -c conda-forge folium -y
conda install -c conda-forge contextily -y

# Jupyter et extensions
conda install -c conda-forge jupyter -y
conda install -c conda-forge jupyterlab -y
conda install -c conda-forge nb_conda_kernels -y

# Outils supplémentaires formation
pip install ipywidgets
pip install tqdm
pip install requests
```

### **Étape 5 : Configuration Jupyter**

```bash
# Installation kernel CLIMADA dans Jupyter
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation DGE"

# Création dossier de travail
mkdir C:\CLIMADA_Formation_CI
cd C:\CLIMADA_Formation_CI
mkdir data notebooks results docs config scripts

# Test lancement Jupyter
jupyter lab
# Navigateur s'ouvre sur http://localhost:8888
```

---

## 🐧 **4. INSTALLATION CLIMADA SUR LINUX** {#linux}

### **Étape 1 : Préparation du Système**

```bash
# Mise à jour système
sudo apt update && sudo apt upgrade -y

# Installation outils de développement
sudo apt install build-essential curl wget git -y
sudo apt install software-properties-common -y
```

### **Étape 2 : Installation Dépendances Système**

```bash
# Bibliothèques géospatiales
sudo apt install gdal-bin libgdal-dev -y
sudo apt install libproj-dev proj-data proj-bin -y
sudo apt install libgeos-dev -y
sudo apt install libspatialindex-dev -y

# Bibliothèques scientifiques
sudo apt install libhdf5-dev libnetcdf-dev -y
sudo apt install libblas-dev liblapack-dev libatlas-base-dev -y
sudo apt install libffi-dev libssl-dev -y

# Python 3.9 et outils
sudo apt install python3.9 python3.9-dev python3.9-venv -y
sudo apt install python3-pip -y
```

### **Étape 3 : Environnement Virtuel**

```bash
# Création environnement virtuel
python3.9 -m venv ~/climada_env

# Activation
source ~/climada_env/bin/activate

# Mise à jour pip
pip install --upgrade pip setuptools wheel

# Ajout alias permanent
echo "alias climada='source ~/climada_env/bin/activate'" >> ~/.bashrc
source ~/.bashrc
```

### **Étape 4 : Installation Packages Python**

```bash
# Variables d'environnement GDAL
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal

# Packages de base
pip install numpy pandas

# Installation GDAL avec version système
pip install GDAL==$(gdal-config --version)

# Packages géospatiaux
pip install fiona shapely pyproj
pip install geopandas rasterio
pip install cartopy contextily

# Packages scientifiques
pip install netcdf4 h5netcdf xarray dask
pip install scipy scikit-learn statsmodels
pip install openpyxl requests tqdm

# CLIMADA
pip install climada-petals

# Visualisation
pip install matplotlib seaborn plotly folium

# Jupyter
pip install jupyter jupyterlab ipykernel ipywidgets
```

### **Étape 5 : Configuration**

```bash
# Installation kernel Jupyter
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation DGE"

# Structure dossiers
mkdir -p ~/CLIMADA_Formation_CI/{data,notebooks,results,docs,config,scripts}
cd ~/CLIMADA_Formation_CI

# Script de lancement
cat > ~/start_climada.sh << 'EOF'
#!/bin/bash
echo "🚀 Lancement environnement CLIMADA Formation DGE"
source ~/climada_env/bin/activate
cd ~/CLIMADA_Formation_CI
echo "📁 Dossier de travail : $(pwd)"
echo "🐍 Python : $(python --version)"
echo "📊 CLIMADA : $(python -c "import climada; print(climada.__version__)")"
jupyter lab --no-browser
EOF

chmod +x ~/start_climada.sh

# Variables d'environnement permanentes
echo 'export CLIMADA_DATA_DIR=~/CLIMADA_Formation_CI/data' >> ~/.bashrc
echo 'export CLIMADA_RESULTS_DIR=~/CLIMADA_Formation_CI/results' >> ~/.bashrc
source ~/.bashrc
```

---

## 📊 **5. CONFIGURATION JUPYTER LAB** {#jupyter}

### **Configuration Avancée Jupyter**

```bash
# Génération config Jupyter
jupyter lab --generate-config

# Configuration pour formation (optionnel)
echo "c.LabApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py
echo "c.LabApp.open_browser = True" >> ~/.jupyter/jupyter_lab_config.py
echo "c.LabApp.port = 8888" >> ~/.jupyter/jupyter_lab_config.py
```

### **Extensions Jupyter Utiles**

```bash
# Installation extensions
pip install jupyterlab-git
pip install jupyterlab-spellchecker
pip install jupyterlab_code_formatter
pip install black isort

# Extensions pour géospatial
pip install ipyleaflet
pip install geoplot
```

### **Notebook de Configuration Type**

```python
# Créer notebooks/00_Configuration_Test.ipynb
# Contenu du notebook :

# === CELLULE 1 : Configuration environnement ===
import os
import sys
from pathlib import Path

# Vérification dossiers
data_dir = Path('../data')
results_dir = Path('../results')
data_dir.mkdir(exist_ok=True)
results_dir.mkdir(exist_ok=True)

print(f"📁 Dossier data : {data_dir.absolute()}")
print(f"📁 Dossier results : {results_dir.absolute()}")
print(f"🐍 Python : {sys.version}")

# === CELLULE 2 : Test imports essentiels ===
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import geopandas as gpd
import seaborn as sns

print("✅ Imports data science OK")

# === CELLULE 3 : Test CLIMADA ===
from climada.hazard import Hazard
from climada.entity import Exposures, ImpactFunc, ImpactFuncSet
from climada.engine import Impact

print("✅ Imports CLIMADA OK")
print(f"📦 Version CLIMADA : {climada.__version__}")

# === CELLULE 4 : Test géospatial ===
import rasterio
import cartopy
import folium
from cartopy import crs as ccrs

print("✅ Imports géospatiaux OK")

# === CELLULE 5 : Test création objets ===
# Test hazard
hazard_test = Hazard('FL')  # Flood
print("✅ Création Hazard OK")

# Test exposures
exposures_test = Exposures()
print("✅ Création Exposures OK")

# Test impact function
impf_test = ImpactFunc()
impf_test.haz_type = 'FL'
print("✅ Création Impact Function OK")

print("\n🎉 Configuration complète et fonctionnelle!")
print("🚀 Prêt pour la formation CLIMADA DGE!")
```

---

## ✅ **6. TESTS DE VALIDATION** {#tests}

### **Script de Test Complet**

```python
# Créer scripts/test_installation.py

#!/usr/bin/env python3
"""
Script de validation installation CLIMADA
Formation DGE Côte d'Ivoire
"""

import sys
import traceback
from pathlib import Path

def test_imports():
    """Test des imports essentiels"""
    print("🔍 Test des imports...")

    try:
        # Imports de base
        import numpy as np
        import pandas as pd
        import matplotlib.pyplot as plt
        print("  ✅ NumPy, Pandas, Matplotlib")

        # Géospatial
        import geopandas as gpd
        import rasterio
        import cartopy
        print("  ✅ GeoPandas, Rasterio, Cartopy")

        # CLIMADA
        import climada
        from climada.hazard import Hazard
        from climada.entity import Exposures
        from climada.engine import Impact
        print(f"  ✅ CLIMADA v{climada.__version__}")

        # Jupyter
        from IPython.display import display
        print("  ✅ Jupyter/IPython")

        return True

    except ImportError as e:
        print(f"  ❌ Erreur import : {e}")
        return False

def test_climada_objects():
    """Test création objets CLIMADA"""
    print("\n🔍 Test objets CLIMADA...")

    try:
        from climada.hazard import Hazard
        from climada.entity import Exposures, ImpactFunc

        # Test Hazard
        hazard = Hazard('FL')
        print("  ✅ Création Hazard")

        # Test Exposures
        exposures = Exposures()
        print("  ✅ Création Exposures")

        # Test Impact Function
        impact_func = ImpactFunc()
        impact_func.haz_type = 'FL'
        impact_func.id = 1
        print("  ✅ Création Impact Function")

        return True

    except Exception as e:
        print(f"  ❌ Erreur objets : {e}")
        return False

def test_directories():
    """Test structure dossiers"""
    print("\n🔍 Test structure dossiers...")

    base_dir = Path.cwd()
    required_dirs = ['data', 'notebooks', 'results', 'docs', 'config', 'scripts']

    all_ok = True
    for dir_name in required_dirs:
        dir_path = base_dir / dir_name
        if dir_path.exists():
            print(f"  ✅ {dir_name}/")
        else:
            print(f"  ⚠️  {dir_name}/ manquant - création...")
            dir_path.mkdir(exist_ok=True)
            all_ok = False

    return all_ok

def test_data_processing():
    """Test traitement données simple"""
    print("\n🔍 Test traitement données...")

    try:
        import numpy as np
        import pandas as pd
        import geopandas as gpd
        from shapely.geometry import Point

        # Test données tabulaires
        df = pd.DataFrame({
            'lat': [5.25, 5.30, 5.35],
            'lon': [-4.00, -4.02, -4.05],
            'value': [100, 200, 150]
        })
        print("  ✅ Création DataFrame")

        # Test données géospatiales
        geometry = [Point(lon, lat) for lon, lat in zip(df.lon, df.lat)]
        gdf = gpd.GeoDataFrame(df, geometry=geometry, crs='EPSG:4326')
        print("  ✅ Création GeoDataFrame")

        # Test calculs
        total_value = df.value.sum()
        print(f"  ✅ Calculs : somme = {total_value}")

        return True

    except Exception as e:
        print(f"  ❌ Erreur traitement : {e}")
        return False

def main():
    """Fonction principale de test"""
    print("🚀 VALIDATION INSTALLATION CLIMADA DGE")
    print("="*50)

    tests = [
        test_imports,
        test_climada_objects,
        test_directories,
        test_data_processing
    ]

    results = []
    for test in tests:
        results.append(test())

    print("\n" + "="*50)
    if all(results):
        print("🎉 TOUS LES TESTS RÉUSSIS!")
        print("✅ Installation CLIMADA complète et fonctionnelle")
        print("🚀 Prêt pour la formation DGE!")
    else:
        print("⚠️  Certains tests ont échoué")
        print("📞 Contacter le support technique")

    print("="*50)

if __name__ == "__main__":
    main()
```

### **Exécution des Tests**

```bash
# Windows (Anaconda Prompt)
conda activate climada
cd C:\CLIMADA_Formation_CI
python scripts\test_installation.py

# Linux
source ~/climada_env/bin/activate
cd ~/CLIMADA_Formation_CI
python scripts/test_installation.py
```

---

## 🔧 **7. RÉSOLUTION DES PROBLÈMES** {#troubleshooting}

### **Problèmes Fréquents Windows**

#### **Erreur : "Microsoft Visual C++ 14.0 is required"**

```bash
# Solution 1 : Installer Visual Studio Build Tools
# Télécharger : https://visualstudio.microsoft.com/visual-cpp-build-tools/
# Installer "C++ build tools" workload

# Solution 2 : Alternative via conda
conda install -c conda-forge m2w64-toolchain
```

#### **Erreur : "Permission denied" ou "Access denied"**

```bash
# Exécuter Anaconda Prompt en tant qu'administrateur
# Ou modifier permissions :
icacls C:\ProgramData\Anaconda3 /grant %USERNAME%:F /T
```

#### **Erreur : "Solving environment: failed"**

```bash
# Nettoyer cache conda
conda clean --all -y

# Mise à jour conda
conda update conda -y

# Réinstaller avec channels spécifiques
conda install -c conda-forge -c defaults package_name
```

### **Problèmes Fréquents Linux**

#### **Erreur : "GDAL not found" ou "PROJ not found"**

```bash
# Réinstaller dépendances système
sudo apt remove libgdal-dev libproj-dev
sudo apt update
sudo apt install libgdal-dev libproj-dev gdal-bin

# Réinstaller packages Python
pip uninstall GDAL pyproj fiona geopandas
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install GDAL==$(gdal-config --version)
pip install pyproj fiona geopandas
```

#### **Erreur : "Permission denied" lors création dossiers**

```bash
# Vérifier permissions
ls -la ~/
chmod 755 ~/CLIMADA_Formation_CI

# Si problème persistant
sudo chown -R $USER:$USER ~/CLIMADA_Formation_CI
```

#### **Erreur : "Python.h not found"**

```bash
# Installer headers Python
sudo apt install python3.9-dev python3.9-distutils
```

### **Problèmes Jupyter**

#### **Kernel CLIMADA non visible**

```bash
# Lister kernels
jupyter kernelspec list

# Réinstaller kernel
conda activate climada  # ou source ~/climada_env/bin/activate
python -m ipykernel install --user --name climada --display-name "CLIMADA Formation DGE"

# Redémarrer Jupyter
jupyter lab
```

#### **Jupyter n'ouvre pas le navigateur**

```bash
# Lancement manuel
jupyter lab --no-browser
# Puis ouvrir http://localhost:8888 manuellement

# Ou spécifier navigateur
jupyter lab --browser=firefox
```

### **Problèmes CLIMADA**

#### **Import Error : "No module named 'climada'"**

```bash
# Vérifier environnement actif
conda info --envs
# ou
which python

# Réactiver environnement
conda activate climada  # Windows
source ~/climada_env/bin/activate  # Linux

# Vérifier installation
pip list | grep climada
```

#### **Erreur : "Could not find a suitable cartopy version"**

```bash
# Installation spécifique cartopy
conda install -c conda-forge cartopy
# Si échec :
pip uninstall cartopy
conda install -c conda-forge proj
pip install cartopy
```

### **Script de Diagnostic**

```python
# Créer scripts/diagnostic.py
import sys
import os
import subprocess
from pathlib import Path

def diagnostic_complet():
    print("🔍 DIAGNOSTIC INSTALLATION CLIMADA")
    print("="*50)

    # Info système
    print(f"🖥️  OS : {os.name}")
    print(f"🐍 Python : {sys.version}")
    print(f"📁 Dossier : {Path.cwd()}")

    # Environnements conda
    try:
        result = subprocess.run(['conda', 'info', '--envs'],
                              capture_output=True, text=True)
        print(f"\n📦 Environnements conda :")
        print(result.stdout)
    except:
        print("⚠️  Conda non trouvé")

    # Packages installés
    try:
        result = subprocess.run(['pip', 'list'],
                              capture_output=True, text=True)
        climada_packages = [line for line in result.stdout.split('\n')
                          if 'climada' in line.lower()]
        if climada_packages:
            print(f"\n📊 Packages CLIMADA :")
            for pkg in climada_packages:
                print(f"  {pkg}")
        else:
            print("❌ Aucun package CLIMADA trouvé")
    except:
        print("⚠️  Erreur liste packages")

    # Test imports
    print(f"\n🔍 Test imports :")
    modules = ['numpy', 'pandas', 'geopandas', 'climada']
    for module in modules:
        try:
            __import__(module)
            print(f"  ✅ {module}")
        except ImportError:
            print(f"  ❌ {module}")

if __name__ == "__main__":
    diagnostic_complet()
```

---

## 📞 **SUPPORT ET RESSOURCES**

### **Contacts Support Formation**

- **Email technique** : support-climada@dge.gouv.ci
- **Hotline formation** : [Numéro dédié]
- **Forum communauté** : [Lien Discord/Slack]

### **Ressources Documentation**

- **Documentation CLIMADA** : https://climada.readthedocs.io/
- **GitHub officiel** : https://github.com/CLIMADA-project/climada_python
- **Tutoriels** : https://github.com/CLIMADA-project/climada_petals
- **Exemples CI** : Notebooks fournis avec formation

### **Liens Utiles**

- **Anaconda** : https://www.anaconda.com/download
- **Conda-forge** : https://conda-forge.org/
- **Jupyter** : https://jupyter.org/
- **GeoPandas** : https://geopandas.org/

---

## ✅ **CHECKLIST FINALE**

### **Validation Installation Complète**

- [ ] **Python/Conda installé** et fonctionnel
- [ ] **Environnement CLIMADA** créé et activé
- [ ] **Packages géospatiaux** installés sans erreur
- [ ] **CLIMADA core** importable
- [ ] **Jupyter Lab** lance correctement
- [ ] **Kernel CLIMADA** visible dans Jupyter
- [ ] **Structure dossiers** créée
- [ ] **Tests validation** réussis
- [ ] **Script diagnostic** exécuté sans erreur

### **Prêt pour Formation !**

```
🎉 Installation CLIMADA Complète !
🚀 Environnement Prêt pour Formation DGE
📚 Direction : Notebooks de Formation
✨ Bon apprentissage avec CLIMADA !
```

---

**Version** : 2.0 | **Date** : Septembre 2025 | **Formation DGE Côte d'Ivoire**
