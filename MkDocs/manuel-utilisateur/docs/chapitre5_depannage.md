# **Chapitre 5 : Dépannage et Bonnes Pratiques**

## 🚨 **Résolution des problèmes fréquents**

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

## ✅ **Checklist de validation**

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

## 📚 **Bonnes pratiques de modélisation**

- **Commencez simple :** Ne cherchez pas à tout modéliser d'un coup. Isoler un aléa et une zone géographique pour commencer.

- **Documentez tout :** Gardez une trace de vos sources de données, de vos hypothèses et des versions de vos codes. La reproductibilité est la clé.

- **Analysez la sensibilité :** Testez comment vos résultats changent si vous modifiez une hypothèse clé (ex: la fonction de vulnérabilité). Cela vous donnera une idée de la robustesse de vos conclusions.

- **Collaborez :** Une bonne analyse de risque est toujours pluridisciplinaire. Travaillez en étroite collaboration avec les experts sectoriels (météorologues, agronomes, ingénieurs).

---

## 📞 **Support technique**

### **Contacts Formation**

- **Email** : <span style="color:blue;">ettekassi@gmail.com</span>
- **Téléphone** : <span style="color:red;">0709252846</span>
- **Email** : <span style="color:blue;">riflardluc_coulibaly@yahoo.fr</span>
- **Téléphone** : <span style="color:red;">0707342607</span>

### **Ressources Complémentaires**

- **Documentation officielle** : https://climada.readthedocs.io/
- **Tutoriels** : https://github.com/NicaiseKassi/Formation-CLIMADA-CI
- **Exemples** : Notebooks fournis avec la formation
