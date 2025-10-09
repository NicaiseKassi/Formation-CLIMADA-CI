# 📊 Résumé Visuel - Installation CLIMADA

## 🎯 Pour vos collègues : QU'EST-CE QU'ILS DOIVENT FAIRE ?

```
╔═══════════════════════════════════════════════════════════════╗
║                   INSTALLATION CLIMADA                        ║
║            Formation Analyse Risques Climatiques              ║
╚═══════════════════════════════════════════════════════════════╝

┌───────────────────────────────────────────────────────────────┐
│ ÉTAPE 1 : PRÉREQUIS (Une seule fois, 5-10 min)              │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  🔧 Installer Git                                            │
│     Linux:   sudo apt-get install git                        │
│     Windows: https://git-scm.com/download/win                │
│     Mac:     brew install git                                │
│                                                               │
│  🔧 Installer Miniconda                                      │
│     Linux:   wget https://repo.anaconda.com/miniconda/...    │
│     Windows: Télécharger .exe depuis miniconda.com           │
│     Mac:     curl -O https://repo.anaconda.com/...           │
│                                                               │
└───────────────────────────────────────────────────────────────┘
                            ↓
┌───────────────────────────────────────────────────────────────┐
│ ÉTAPE 2 : TÉLÉCHARGER LE PROJET (2 min)                     │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  📥 Cloner avec Git                                          │
│                                                               │
│     git clone https://github.com/NicaiseKassi/Formation-... │
│     cd Formation-CLIMADA-CI                                  │
│                                                               │
└───────────────────────────────────────────────────────────────┘
                            ↓
┌───────────────────────────────────────────────────────────────┐
│ ÉTAPE 3 : INSTALLER CLIMADA (15-30 min)                     │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  🚀 OPTION A : Automatique (Linux/Mac)                       │
│                                                               │
│     bash install_climada.sh                                  │
│                                                               │
│  ✅ Le script fait TOUT automatiquement !                    │
│     • Vérifie le système                                     │
│     • Configure Conda                                        │
│     • Crée l'environnement                                   │
│     • Installe CLIMADA + dépendances                         │
│     • Teste l'installation                                   │
│                                                               │
│  ─────────────────── OU ──────────────────────               │
│                                                               │
│  🔧 OPTION B : Manuel (Windows/Tous)                         │
│                                                               │
│     conda env create -f environment_formation.yml            │
│     conda activate climada_formation                         │
│     python test_climada.py                                   │
│                                                               │
└───────────────────────────────────────────────────────────────┘
                            ↓
┌───────────────────────────────────────────────────────────────┐
│ ÉTAPE 4 : VÉRIFICATION (1 min)                              │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  ✅ Tester l'installation                                    │
│                                                               │
│     conda activate climada_formation                         │
│     python test_climada.py                                   │
│                                                               │
│  📊 Résultat attendu :                                       │
│     ✅ CLIMADA : OK                                          │
│     ✅ NumPy : OK                                            │
│     ✅ Pandas : OK                                           │
│     ...                                                       │
│     🎉 INSTALLATION RÉUSSIE !                                │
│                                                               │
└───────────────────────────────────────────────────────────────┘
                            ↓
┌───────────────────────────────────────────────────────────────┐
│ UTILISATION (À chaque session)                               │
├───────────────────────────────────────────────────────────────┤
│                                                               │
│  🎓 Démarrer la formation                                    │
│                                                               │
│     1. conda activate climada_formation                      │
│     2. jupyter lab                                           │
│     3. Ouvrir TP/TP1_Inondations_...ipynb                   │
│                                                               │
└───────────────────────────────────────────────────────────────┘
```

---

## 📝 EN RÉSUMÉ : 3 COMMANDES SEULEMENT !

### Pour Linux/Mac :

```bash
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
bash install_climada.sh
```

### Pour Windows (Anaconda Prompt) :

```cmd
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
conda env create -f environment_formation.yml
```

---

## ⏱️ TEMPS NÉCESSAIRE

| Étape                    | Durée         | Remarque               |
| ------------------------ | ------------- | ---------------------- |
| Installation Git + Conda | 5-10 min      | Une seule fois         |
| Clonage du projet        | 2 min         | Dépend de la connexion |
| Installation CLIMADA     | 15-30 min     | Peut être plus long    |
| Test                     | 1 min         | Validation             |
| **TOTAL**                | **23-43 min** | À faire une seule fois |

---

## 📦 CE QUI EST INSTALLÉ

Le script `install_climada.sh` installe automatiquement :

```
CLIMADA
├── 🐍 Python 3.9
├── 📊 Data Science
│   ├── NumPy
│   ├── Pandas
│   ├── Matplotlib
│   ├── SciPy
│   └── Scikit-learn
├── 🗺️ Géospatial
│   ├── GeoPandas
│   ├── Cartopy
│   ├── Rasterio
│   ├── Shapely
│   └── Fiona
├── 🌡️ Climat
│   ├── Xarray
│   ├── NetCDF4
│   └── CFTime
├── 📓 Jupyter
│   ├── Jupyter Lab
│   ├── Jupyter Notebook
│   └── IPyWidgets
└── ⚙️ CLIMADA Core
    ├── climada_python
    └── Toutes dépendances
```

**Total : ~150+ packages**  
**Taille : ~3-5 GB**

---

## 🎯 FICHIERS DISPONIBLES POUR VOS COLLÈGUES

### Guides d'Installation

| Fichier                        | Description            | Public                  |
| ------------------------------ | ---------------------- | ----------------------- |
| `GUIDE_INSTALLATION_SIMPLE.md` | **Guide ultra-simple** | Débutants               |
| `INSTALLATION.md`              | Guide complet détaillé | Tous niveaux            |
| `INSTALLATION_WINDOWS.md`      | Spécifique Windows     | Utilisateurs Windows    |
| `QUICK_START.md`               | Démarrage rapide       | Experts                 |
| `CHECKLIST_INSTALLATION.md`    | Checklist à imprimer   | Formation en présentiel |

### Scripts

| Fichier                     | Description                  | Utilisation |
| --------------------------- | ---------------------------- | ----------- |
| `install_climada.sh`        | **Installation automatique** | Linux/Mac   |
| `test_climada.py`           | Test de l'installation       | Tous        |
| `environment_formation.yml` | Définition environnement     | Conda       |

---

## 🎓 RECOMMANDATION POUR LA FORMATION

### Option 1 : Installation Pré-Formation (RECOMMANDÉE)

**2-3 jours avant la formation :**

1. Envoyer email aux participants avec :

   - Lien GitHub : https://github.com/NicaiseKassi/Formation-CLIMADA-CI
   - Lien direct vers `GUIDE_INSTALLATION_SIMPLE.md`
   - Instructions : "Suivez les étapes avant la formation"

2. Documents à joindre :
   - `CHECKLIST_INSTALLATION.md` (PDF)
   - `GUIDE_INSTALLATION_SIMPLE.md` (PDF)

**Avantages :**

- ✅ Gain de temps pendant la formation
- ✅ Résolution des problèmes en amont
- ✅ Formation plus fluide

### Option 2 : Installation Pendant la Formation

**Jour 1 - Première heure :**

1. Session d'installation guidée
2. Support technique en temps réel
3. Validation avec `test_climada.py`

**Prévoir :**

- USB avec installeurs (Git, Miniconda)
- Connexion Internet stable
- Support technique disponible

---

## 📧 EMAIL TYPE À ENVOYER AUX PARTICIPANTS

```
Objet : Préparation Formation CLIMADA - Installation Requise

Bonjour,

Dans le cadre de la formation sur l'analyse des risques climatiques
avec CLIMADA, nous vous demandons d'installer l'environnement AVANT
le premier jour de formation.

🔗 Lien du projet :
https://github.com/NicaiseKassi/Formation-CLIMADA-CI

📋 Guide d'installation simplifié :
https://github.com/NicaiseKassi/Formation-CLIMADA-CI/blob/main/GUIDE_INSTALLATION_SIMPLE.md

⏱️ Temps nécessaire : 30-45 minutes

✅ Pour installer :

Linux/Mac :
  git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
  cd Formation-CLIMADA-CI
  bash install_climada.sh

Windows :
  1. Installer Git et Miniconda
  2. git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
  3. cd Formation-CLIMADA-CI
  4. conda env create -f environment_formation.yml

🆘 Besoin d'aide ?
Ouvrez une issue sur GitHub ou contactez-nous.

Cordialement,
L'équipe de formation
```

---

## ✅ VALIDATION PRÉ-FORMATION

**Le jour de la formation, vérifier pour chaque participant :**

```bash
# Test rapide (2 minutes par personne)
conda activate climada_formation
python test_climada.py
jupyter lab  # Vérifier que ça lance
```

---

**Document créé pour faciliter l'installation par vos collègues**  
**Dernière mise à jour : 2025**
