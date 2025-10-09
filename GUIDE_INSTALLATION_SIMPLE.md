# 🎯 Installation CLIMADA - Guide Ultra-Simplifié

## Ce que vos collègues doivent faire :

---

## ⚙️ ÉTAPE 0 : Prérequis (À faire UNE SEULE FOIS)

### Installer Git

**Linux/Ubuntu :**

```bash
sudo apt-get update
sudo apt-get install git -y
```

**Windows :**

- Télécharger : https://git-scm.com/download/win
- Installer en cliquant "Suivant" partout

**Mac :**

```bash
brew install git
```

### Installer Conda (Miniconda)

**Linux :**

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# Accepter tout, puis redémarrer le terminal
```

**Windows :**

- Télécharger : https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
- Double-cliquer et installer
- ✅ Cocher "Add to PATH"

**Mac :**

```bash
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```

---

## 🚀 INSTALLATION CLIMADA (3 commandes !)

### Linux/Mac :

```bash
# 1. Télécharger le projet
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI

# 2. Installer automatiquement
bash install_climada.sh

# C'est tout ! Le script fait TOUT le travail !
```

### Windows (Anaconda Prompt) :

**Option A : Automatique (Double-clic) ⭐**

1. Ouvrir le dossier `Formation-CLIMADA-CI` dans l'explorateur
2. Double-cliquer sur `install_climada.bat`
3. Suivre les instructions

**Option B : Ligne de commande**

```cmd
REM 1. Télécharger le projet
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI

REM 2. Installer automatiquement
install_climada.bat

REM OU installation manuelle
conda env create -f environment_formation.yml
conda activate climada_formation
python test_climada.py
```

---

## ✅ Vérifier que ça marche

```bash
# Activer l'environnement
conda activate climada_formation

# Tester
python test_climada.py
```

Vous devez voir :

```
✅ CLIMADA : OK
✅ NumPy : OK
✅ Pandas : OK
...
🎉 TOUTES LES VÉRIFICATIONS ONT RÉUSSI !
```

---

## 🎓 Utiliser CLIMADA

```bash
# 1. Activer l'environnement (à chaque fois)
conda activate climada_formation

# 2. Lancer Jupyter
jupyter lab

# 3. Ouvrir les notebooks dans TP/
```

---

## 🐛 Problèmes ?

### "git: command not found"

➡️ Installer Git (voir Étape 0)

### "conda: command not found"

➡️ Installer Miniconda (voir Étape 0)

### Installation bloquée

```bash
conda clean --all
conda env create -f environment_formation.yml --force
```

### Autres problèmes

➡️ Consulter [INSTALLATION.md](INSTALLATION.md)

---

## 📊 Résumé Visuel

```
┌─────────────────────────────────────────────────┐
│  PREMIÈRE FOIS SEULEMENT                        │
├─────────────────────────────────────────────────┤
│  1. Installer Git                               │
│  2. Installer Miniconda                         │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│  INSTALLATION CLIMADA                           │
├─────────────────────────────────────────────────┤
│  1. git clone https://github.com/...           │
│  2. cd Formation-CLIMADA-CI                     │
│  3. bash install_climada.sh                     │
│     OU                                          │
│     conda env create -f environment_...yml      │
└─────────────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────────────┐
│  UTILISATION (À CHAQUE SESSION)                 │
├─────────────────────────────────────────────────┤
│  1. conda activate climada_formation            │
│  2. jupyter lab                                 │
│  3. Ouvrir les notebooks TP/                    │
└─────────────────────────────────────────────────┘
```

---

## ⏱️ Temps Estimés

- **Installation Git + Conda** : 5-10 minutes
- **Installation CLIMADA** : 15-30 minutes
- **Total** : 20-40 minutes

---

## 📧 Questions ?

Ouvrir une issue sur GitHub : https://github.com/NicaiseKassi/Formation-CLIMADA-CI/issues

---

**C'est tout ! Simple, non ? 😊**
