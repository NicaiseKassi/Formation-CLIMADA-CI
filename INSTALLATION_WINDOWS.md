# 🪟 Installation CLIMADA pour Windows

## 📋 Prérequis

- Windows 10/11 (64 bits)
- Au moins 10 GB d'espace disque
- Connexion Internet stable
- Droits administrateur

---

## 🚀 Installation Pas à Pas

### Étape 1 : Installer Miniconda

1. **Télécharger Miniconda** :

   - Aller sur : https://docs.conda.io/en/latest/miniconda.html
   - Télécharger "Miniconda3 Windows 64-bit"

2. **Installer** :

   - Double-cliquer sur le fichier téléchargé
   - Suivre l'assistant d'installation
   - ✅ Cocher "Add Miniconda3 to my PATH environment variable"
   - ✅ Cocher "Register Miniconda3 as my default Python"

3. **Vérifier l'installation** :
   - Ouvrir "Anaconda Prompt" depuis le menu Démarrer
   - Taper : `conda --version`
   - Vous devez voir : `conda 23.x.x` ou similaire

### Étape 2 : Télécharger le Projet

**Option A : Avec Git**

```cmd
# Dans Anaconda Prompt
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
```

**Option B : Sans Git**

1. Aller sur : https://github.com/NicaiseKassi/Formation-CLIMADA-CI
2. Cliquer sur "Code" → "Download ZIP"
3. Extraire le fichier ZIP
4. Dans Anaconda Prompt, naviguer vers le dossier :
   ```cmd
   cd C:\Users\VOTRE_NOM\Downloads\Formation-CLIMADA-CI-main
   ```

### Étape 3 : Créer l'Environnement

#### Option A : Installation Automatique ⭐ RECOMMANDÉ

**Méthode 1 : Double-clic**

1. Dans l'explorateur Windows, naviguez vers le dossier `Formation-CLIMADA-CI`
2. Double-cliquez sur **`install_climada.bat`**
3. Suivez les instructions à l'écran

**Méthode 2 : Ligne de commande**
Dans **Anaconda Prompt** :

```cmd
install_climada.bat
```

Le script fait TOUT automatiquement ! ✨

#### Option B : Installation Manuelle

Dans **Anaconda Prompt** :

```cmd
# Créer l'environnement (15-30 minutes)
conda env create -f environment_formation.yml

# Si vous avez des erreurs, essayez :
conda clean --all
conda env create -f environment_formation.yml
```

⏱️ **Cette étape peut prendre 15-30 minutes**, soyez patient !

### Étape 4 : Activer l'Environnement

```cmd
conda activate climada_formation
```

Votre prompt devrait changer pour afficher `(climada_formation)` au début.

### Étape 5 : Tester l'Installation

```cmd
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

## 🎓 Utilisation

### Démarrer Jupyter

```cmd
# Activer l'environnement
conda activate climada_formation

# Lancer Jupyter Lab
jupyter lab

# OU Jupyter Notebook
jupyter notebook
```

Votre navigateur s'ouvrira automatiquement avec Jupyter.

### Ouvrir les TPs

Dans Jupyter :

1. Naviguer vers le dossier `TP/`
2. Ouvrir `TP1_Inondations_Abidjan_2018_Complet.ipynb`
3. Commencer la formation !

---

## 🐛 Résolution de Problèmes Windows

### Problème 1 : "conda n'est pas reconnu"

**Solution :**

1. Ouvrir "Anaconda Prompt" au lieu de "CMD" ou "PowerShell"
2. Ou réinstaller Miniconda en cochant "Add to PATH"

### Problème 2 : Erreur "Solving environment: failed"

**Solution :**

```cmd
# Nettoyer le cache
conda clean --all -y

# Réessayer
conda env create -f environment_formation.yml
```

### Problème 3 : Installation très lente

**Solution :**

```cmd
# Installer mamba (plus rapide)
conda install mamba -c conda-forge -y

# Créer l'environnement avec mamba
mamba env create -f environment_formation.yml
```

### Problème 4 : Erreur d'espace disque

**Solution :**

1. Libérer de l'espace sur C:\
2. Nettoyer le cache Conda :
   ```cmd
   conda clean --all -y
   ```

### Problème 5 : Jupyter ne démarre pas

**Solution :**

```cmd
# Réinstaller Jupyter
conda activate climada_formation
pip install --upgrade jupyter jupyterlab
```

---

## 🔄 Mise à Jour

Pour mettre à jour l'environnement :

```cmd
cd Formation-CLIMADA-CI
git pull

conda activate climada_formation
conda env update -f environment_formation.yml --prune
```

---

## 📝 Commandes Utiles Windows

### Navigation

```cmd
# Changer de disque
D:

# Changer de dossier
cd C:\Users\VotreNom\Documents

# Lister les fichiers
dir

# Remonter d'un niveau
cd ..
```

### Conda

```cmd
# Lister les environnements
conda env list

# Activer un environnement
conda activate climada_formation

# Désactiver
conda deactivate

# Supprimer un environnement
conda env remove -n climada_formation
```

---

## ✅ Checklist d'Installation

- [ ] Miniconda installé
- [ ] Projet téléchargé
- [ ] Environnement `climada_formation` créé
- [ ] Test `python test_climada.py` réussi
- [ ] Jupyter Lab lance correctement
- [ ] Notebooks TP accessibles

---

## 🆘 Support

Si les problèmes persistent :

1. Vérifier les Issues GitHub : https://github.com/NicaiseKassi/Formation-CLIMADA-CI/issues
2. Consulter la documentation : [INSTALLATION.md](INSTALLATION.md)
3. Contacter l'équipe de formation

---

## 💡 Astuces Windows

### Utiliser PowerShell au lieu de CMD

Si vous préférez PowerShell :

```powershell
# Initialiser Conda pour PowerShell
conda init powershell

# Redémarrer PowerShell
# Puis activer l'environnement
conda activate climada_formation
```

### Créer un raccourci

1. Clic droit sur le Bureau → Nouveau → Raccourci
2. Emplacement :
   ```
   %windir%\System32\cmd.exe /K "C:\Users\VOTRE_NOM\miniconda3\Scripts\activate.bat climada_formation && jupyter lab"
   ```
3. Nommer : "Formation CLIMADA"

Maintenant, double-cliquez sur le raccourci pour lancer directement Jupyter Lab !

---

**🎉 Bonne formation avec CLIMADA ! 🌍**
