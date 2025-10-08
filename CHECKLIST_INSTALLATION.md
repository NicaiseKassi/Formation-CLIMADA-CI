# ✅ CHECKLIST D'INSTALLATION CLIMADA

## Formation - Analyse des Risques Climatiques - Côte d'Ivoire

**Date : ******\_\_\_\_****** Nom : **************\_\_\_****************

---

## 📋 AVANT LA FORMATION

### ☐ Étape 1 : Vérifier les prérequis

- [ ] Ordinateur avec au moins **10 GB d'espace libre**
- [ ] Connexion Internet **stable**
- [ ] Droits **administrateur** sur l'ordinateur
- [ ] Système d'exploitation :
  - [ ] Linux / Ubuntu
  - [ ] Windows 10/11
  - [ ] macOS

---

### ☐ Étape 2 : Installer Git

**Comment vérifier si Git est installé :**

```bash
git --version
```

**Si pas installé :**

**Linux :**

```bash
sudo apt-get install git
```

**Windows :**

- Télécharger : https://git-scm.com/download/win
- Installer le fichier .exe

**Mac :**

```bash
brew install git
```

✅ **Git installé** : Version ****\_\_****

---

### ☐ Étape 3 : Installer Miniconda

**Comment vérifier si Conda est installé :**

```bash
conda --version
```

**Si pas installé :**

**Linux :**

```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
source ~/.bashrc
```

**Windows :**

- Télécharger : https://docs.conda.io/en/latest/miniconda.html
- Installer (cocher "Add to PATH")
- Ouvrir "Anaconda Prompt"

**Mac :**

```bash
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```

✅ **Conda installé** : Version ****\_\_****

---

## 🚀 INSTALLATION CLIMADA

### ☐ Étape 4 : Cloner le projet

```bash
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
```

✅ **Projet cloné** : Taille du dossier ****\_\_****

---

### ☐ Étape 5 : Créer l'environnement

**Option A : Script automatique (Linux/Mac)**

```bash
bash install_climada.sh
```

**Option B : Manuelle**

```bash
conda env create -f environment_formation.yml
```

⏱️ **Durée** : ****\_\_**** minutes

✅ **Environnement créé** : Pas d'erreurs [ ] Oui [ ] Non

---

### ☐ Étape 6 : Activer et tester

```bash
conda activate climada_formation
python test_climada.py
```

✅ **Test réussi** : Tous les modules OK [ ] Oui [ ] Non

---

## 🎓 UTILISATION

### ☐ Étape 7 : Lancer Jupyter

```bash
conda activate climada_formation
jupyter lab
```

✅ **Jupyter fonctionne** : [ ] Oui [ ] Non

---

### ☐ Étape 8 : Ouvrir les notebooks

Dans Jupyter Lab :

- [ ] Naviguer vers `TP/`
- [ ] Ouvrir `TP1_Inondations_Abidjan_2018_Complet.ipynb`
- [ ] Exécuter la première cellule

✅ **Notebook s'exécute** : [ ] Oui [ ] Non

---

## 🐛 PROBLÈMES RENCONTRÉS

**Cocher si vous avez eu ces problèmes :**

- [ ] Git pas reconnu
- [ ] Conda pas reconnu
- [ ] Erreur "Solving environment failed"
- [ ] Manque d'espace disque
- [ ] Erreur d'import CLIMADA
- [ ] Jupyter ne démarre pas
- [ ] Autre : ****************\_****************

**Solution appliquée :**

---

---

---

## ✅ VALIDATION FINALE

**Environnement prêt pour la formation :**

- [ ] Conda activé sans erreur
- [ ] Test Python réussi
- [ ] Jupyter Lab lance
- [ ] Notebook TP s'exécute
- [ ] Import CLIMADA fonctionne

---

## 📝 NOTES PERSONNELLES

---

---

---

---

---

## 📧 BESOIN D'AIDE ?

**En cas de problème :**

1. Consulter `INSTALLATION.md` dans le dossier
2. Ouvrir une issue GitHub
3. Contacter l'équipe de formation : **********\_**********

---

**✅ INSTALLATION COMPLÈTE - PRÊT POUR LA FORMATION ! 🎉**

**Signature du participant :** **************\_\_\_**************

**Date de validation :** ******************\_******************

---

## 📌 RAPPELS POUR CHAQUE SESSION

**À faire avant CHAQUE session de formation :**

```bash
# 1. Activer l'environnement
conda activate climada_formation

# 2. Mettre à jour (si nécessaire)
cd Formation-CLIMADA-CI
git pull

# 3. Lancer Jupyter
jupyter lab
```

---

**Document à conserver pendant toute la durée de la formation**
