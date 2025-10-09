# 📚 INDEX - Documentation d'Installation CLIMADA

## 📖 Guide de Navigation

Ce dossier contient **toute la documentation** nécessaire pour installer CLIMADA.  
Choisissez le document adapté à votre situation :

---

## 🎯 PAR PROFIL D'UTILISATEUR

### 👨‍🎓 Débutant (Première installation)

**Commencez par :** [`GUIDE_INSTALLATION_SIMPLE.md`](GUIDE_INSTALLATION_SIMPLE.md)

- Guide ultra-simplifié
- Explications pas-à-pas
- Exemples visuels
- ⏱️ Lecture : 5 min

### 💼 Utilisateur Standard

**Recommandé :** [`QUICK_START.md`](QUICK_START.md)

- Installation en 3 étapes
- Format condensé
- Commandes directes
- ⏱️ Lecture : 2 min

### 🔧 Utilisateur Avancé

**Consultez :** [`INSTALLATION.md`](INSTALLATION.md)

- Documentation complète
- Troubleshooting détaillé
- Options avancées
- ⏱️ Lecture : 15 min

### 🪟 Utilisateur Windows

**Spécifique :** [`INSTALLATION_WINDOWS.md`](INSTALLATION_WINDOWS.md)

- Guide Windows détaillé
- Anaconda Prompt
- Astuces PowerShell
- ⏱️ Lecture : 10 min

### 🎓 Formation en Présentiel

**Imprimez :** [`CHECKLIST_INSTALLATION.md`](CHECKLIST_INSTALLATION.md)

- Checklist à remplir
- Validation étape par étape
- Notes personnelles
- ⏱️ Utilisation : Pendant l'installation

---

## 🗂️ PAR TYPE DE DOCUMENT

### 📘 Guides d'Installation

| Document                         | Description                        | Public cible  | Durée lecture   |
| -------------------------------- | ---------------------------------- | ------------- | --------------- |
| **GUIDE_INSTALLATION_SIMPLE.md** | Installation ultra-simplifiée      | Débutants     | 5 min           |
| **QUICK_START.md**               | Démarrage rapide                   | Tous          | 2 min           |
| **INSTALLATION.md**              | Guide complet avec troubleshooting | Tous niveaux  | 15 min          |
| **INSTALLATION_WINDOWS.md**      | Spécifique Windows                 | Windows users | 10 min          |
| **RESUME_INSTALLATION.md**       | Résumé visuel pour formateurs      | Formateurs    | 8 min           |
| **CHECKLIST_INSTALLATION.md**    | Checklist de validation            | Formation     | Pendant install |

### 🔧 Scripts et Outils

| Fichier                       | Type          | Description              | Utilisation               |
| ----------------------------- | ------------- | ------------------------ | ------------------------- |
| **install_climada.sh**        | Bash Script   | Installation automatique | `bash install_climada.sh` |
| **test_climada.py**           | Python Script | Test de l'installation   | `python test_climada.py`  |
| **environment_formation.yml** | Conda Config  | Définition environnement | `conda env create -f ...` |

### 📋 Documents Administratifs

| Document                   | Objectif                 |
| -------------------------- | ------------------------ |
| **README.md**              | Présentation du projet   |
| **RESUME_INSTALLATION.md** | Synthèse pour formateurs |

---

## 🚀 WORKFLOW D'INSTALLATION RECOMMANDÉ

```
┌─────────────────────────────────────────┐
│  1. CHOISIR SON GUIDE                  │
├─────────────────────────────────────────┤
│  • Débutant → GUIDE_INSTALLATION_SIMPLE│
│  • Standard → QUICK_START              │
│  • Windows  → INSTALLATION_WINDOWS     │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  2. SUIVRE LES INSTRUCTIONS            │
├─────────────────────────────────────────┤
│  • Installer prérequis (Git + Conda)   │
│  • Cloner le projet                    │
│  • Lancer install_climada.sh           │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  3. TESTER L'INSTALLATION              │
├─────────────────────────────────────────┤
│  python test_climada.py                │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  4. EN CAS DE PROBLÈME                 │
├─────────────────────────────────────────┤
│  • Consulter INSTALLATION.md           │
│  • Section "Troubleshooting"           │
│  • Ouvrir une issue GitHub             │
└─────────────────────────────────────────┘
```

---

## 📊 MATRICE DE DÉCISION

### Quel document choisir ?

| Situation                     | Document recommandé       | Raison                  |
| ----------------------------- | ------------------------- | ----------------------- |
| **Jamais installé Conda**     | GUIDE_INSTALLATION_SIMPLE | Explications prérequis  |
| **Déjà utilisé Python/Conda** | QUICK_START               | Allez à l'essentiel     |
| **Sur Windows**               | INSTALLATION_WINDOWS      | Commandes spécifiques   |
| **Erreur d'installation**     | INSTALLATION.md           | Section troubleshooting |
| **Formation de groupe**       | CHECKLIST_INSTALLATION    | Suivi individuel        |
| **Organisateur de formation** | RESUME_INSTALLATION       | Vue d'ensemble          |

---

## 🎯 POUR LES FORMATEURS

### Documents à Préparer

**Avant la formation (Email aux participants) :**

1. [`GUIDE_INSTALLATION_SIMPLE.md`](GUIDE_INSTALLATION_SIMPLE.md) en PDF
2. [`CHECKLIST_INSTALLATION.md`](CHECKLIST_INSTALLATION.md) en PDF
3. Lien GitHub du projet

**Pendant la formation :**

1. [`INSTALLATION.md`](INSTALLATION.md) pour le troubleshooting
2. [`RESUME_INSTALLATION.md`](RESUME_INSTALLATION.md) pour la présentation

**Support technique :**

1. Avoir [`INSTALLATION.md`](INSTALLATION.md) ouvert
2. Script `test_climada.py` prêt

---

## 📧 TEMPLATES D'EMAIL

### Email Pré-Formation

```
Objet : [ACTION REQUISE] Installation CLIMADA avant formation

Bonjour,

Merci de votre inscription à la formation CLIMADA.

⚠️ IMPORTANT : Installation à faire AVANT le jour J

📥 Téléchargez les documents :
1. Guide d'installation : [lien GUIDE_INSTALLATION_SIMPLE.md]
2. Checklist : [lien CHECKLIST_INSTALLATION.md]

🔗 Projet GitHub :
https://github.com/NicaiseKassi/Formation-CLIMADA-CI

⏱️ Temps nécessaire : 30-45 minutes

Pour toute question, répondez à cet email.

Cordialement,
[Votre nom]
```

### Email de Rappel (J-2)

```
Objet : RAPPEL - Installation CLIMADA (2 jours avant formation)

Bonjour,

La formation commence dans 2 jours.

✅ Avez-vous installé CLIMADA ?

Si non, suivez le guide : [lien]

Test rapide :
  conda activate climada_formation
  python test_climada.py

Si ça fonctionne, vous êtes prêt ! 🎉

Besoin d'aide urgente ? Contactez-nous.
```

---

## 🔍 RECHERCHE RAPIDE

### Par Problème

| Problème                     | Section    | Document                  |
| ---------------------------- | ---------- | ------------------------- |
| Git non reconnu              | Étape 0    | GUIDE_INSTALLATION_SIMPLE |
| Conda non reconnu            | Étape 0    | GUIDE_INSTALLATION_SIMPLE |
| Erreur "Solving environment" | Problème 2 | INSTALLATION.md           |
| Import CLIMADA échoue        | Problème 3 | INSTALLATION.md           |
| Jupyter ne démarre pas       | Problème 5 | INSTALLATION.md           |
| Installation très lente      | Problème 6 | INSTALLATION.md           |
| Manque d'espace disque       | Problème 5 | INSTALLATION.md           |
| Erreur Cartopy/GEOS          | Problème 4 | INSTALLATION.md           |

### Par Commande

| Commande                  | Document  | Section     |
| ------------------------- | --------- | ----------- |
| `git clone`               | Tous      | Étape 2     |
| `conda env create`        | Tous      | Étape 3     |
| `bash install_climada.sh` | Linux/Mac | Étape 3     |
| `conda activate`          | Tous      | Étape 4     |
| `python test_climada.py`  | Tous      | Étape 4     |
| `jupyter lab`             | Tous      | Utilisation |

---

## 📖 GLOSSAIRE

| Terme             | Définition                                                   |
| ----------------- | ------------------------------------------------------------ |
| **Conda**         | Gestionnaire de paquets et d'environnements Python           |
| **Miniconda**     | Version minimale de Conda                                    |
| **Anaconda**      | Distribution complète (Conda + 150+ packages)                |
| **environnement** | Espace isolé avec des versions spécifiques de packages       |
| **CLIMADA**       | Climate Adaptation (outil d'analyse des risques climatiques) |
| **Jupyter**       | Interface notebook pour Python                               |
| **Git**           | Système de contrôle de version                               |
| **Clone**         | Télécharger un projet Git                                    |

---

## 🎓 FAQ RAPIDE

**Q: Dois-je installer Anaconda ou Miniconda ?**  
R: Miniconda suffit (plus léger). Si vous avez déjà Anaconda, gardez-le.

**Q: Combien de temps prend l'installation ?**  
R: 20-40 minutes (première fois). 15-30 min pour CLIMADA seul.

**Q: Puis-je installer sans Internet ?**  
R: Non, une connexion stable est requise.

**Q: Quel espace disque nécessaire ?**  
R: Au moins 10 GB recommandés.

**Q: Windows, Mac ou Linux ?**  
R: Les trois sont supportés.

**Q: Que fait install_climada.sh ?**  
R: Installation automatique complète (vérification système, création environnement, test).

**Q: Que faire si test_climada.py échoue ?**  
R: Consulter INSTALLATION.md section "Troubleshooting".

**Q: Dois-je être administrateur ?**  
R: Oui, pour installer Conda et Git.

---

## 📞 SUPPORT

### Problème pendant l'installation ?

1. **Vérifier la FAQ** ci-dessus
2. **Consulter** [`INSTALLATION.md`](INSTALLATION.md) - Section Troubleshooting
3. **Ouvrir une issue** sur GitHub
4. **Contacter** l'équipe de formation

### Liens Utiles

- 🌐 GitHub : https://github.com/NicaiseKassi/Formation-CLIMADA-CI
- 📖 Doc CLIMADA : https://climada-python.readthedocs.io
- 🐍 Doc Conda : https://docs.conda.io

---

## ✅ VALIDATION PRÉ-FORMATION

**Le jour J, chaque participant doit pouvoir exécuter :**

```bash
conda activate climada_formation
python test_climada.py
# Résultat : 🎉 TOUTES LES VÉRIFICATIONS ONT RÉUSSI !

jupyter lab
# Résultat : Jupyter s'ouvre dans le navigateur
```

Si ces deux commandes fonctionnent = ✅ **PRÊT !**

---

## 📅 HISTORIQUE DES VERSIONS

| Date       | Version | Changements                     |
| ---------- | ------- | ------------------------------- |
| 2025-10-08 | 1.0     | Création documentation complète |

---

**Navigation recommandée :**

```
INDEX.md (ce fichier)
    ↓
GUIDE_INSTALLATION_SIMPLE.md (si débutant)
    OU
QUICK_START.md (si expérimenté)
    ↓
test_climada.py (validation)
    ↓
PRÊT POUR LA FORMATION ! 🎉
```

**Bonne installation ! 🚀**
