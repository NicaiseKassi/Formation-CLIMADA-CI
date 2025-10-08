# 🪟 Installation CLIMADA sur Windows - Guide Visuel

## ⚠️ Important : Sur Windows, bash n'existe pas !

**Sur Windows, n'utilisez PAS `bash install_climada.sh`**

À la place, utilisez :

- ✅ `install_climada.bat` (script Windows)
- ✅ Double-clic sur `install_climada.bat`
- ✅ Ou installation manuelle avec Conda

---

## 🎯 Méthode 1 : Double-Clic (PLUS SIMPLE) ⭐

### Étapes visuelles :

```
1. Ouvrir l'Explorateur Windows
   📁 C:\Users\VotreNom\Downloads\Formation-CLIMADA-CI

2. Trouver le fichier
   📄 install_climada.bat

3. Double-cliquer dessus
   🖱️ Double-clic sur install_climada.bat

4. Une fenêtre noire s'ouvre
   ⬛ Invite de commandes Windows

5. Suivre les instructions
   ⏳ Attendre 15-30 minutes

6. À la fin, voir :
   ✅ INSTALLATION TERMINÉE AVEC SUCCÈS !
```

**C'est tout ! Pas besoin de taper de commandes !**

---

## 🎯 Méthode 2 : Anaconda Prompt

### Étape par étape :

**1. Ouvrir Anaconda Prompt**

```
Menu Démarrer → Rechercher "Anaconda Prompt"
→ Cliquer sur "Anaconda Prompt"
```

**2. Naviguer vers le dossier**

```cmd
cd C:\Users\VotreNom\Downloads\Formation-CLIMADA-CI
```

**3. Lancer l'installation automatique**

```cmd
install_climada.bat
```

**4. Attendre la fin** (15-30 minutes)

---

## 🎯 Méthode 3 : Installation Manuelle

Si les scripts automatiques ne fonctionnent pas :

**Dans Anaconda Prompt :**

```cmd
REM 1. Aller dans le dossier
cd C:\Users\VotreNom\Downloads\Formation-CLIMADA-CI

REM 2. Créer l'environnement
conda env create -f environment_formation.yml

REM 3. Activer l'environnement
conda activate climada_formation

REM 4. Tester
python test_climada.py
```

---

## ❌ ERREURS COURANTES

### Erreur 1 : "bash n'est pas reconnu"

**Problème :**

```cmd
C:\> bash install_climada.sh
'bash' n'est pas reconnu en tant que commande interne
```

**Solution :**

```
NE PAS utiliser bash sur Windows !

Utiliser à la place :
  → install_climada.bat (double-clic)
  → OU conda env create -f environment_formation.yml
```

### Erreur 2 : "conda n'est pas reconnu"

**Problème :**

```cmd
C:\> conda --version
'conda' n'est pas reconnu en tant que commande interne
```

**Solution :**

```
1. Installer Miniconda
2. OU ouvrir "Anaconda Prompt" au lieu de "CMD"
3. OU ajouter Conda au PATH :
   - Rechercher "Variables d'environnement"
   - Ajouter : C:\Users\VotreNom\miniconda3\Scripts
```

### Erreur 3 : "Permission refusée"

**Problème :**

```
Accès refusé
```

**Solution :**

```
1. Clic droit sur "Anaconda Prompt"
2. Choisir "Exécuter en tant qu'administrateur"
3. Relancer le script
```

### Erreur 4 : "Le fichier .bat ne s'ouvre pas"

**Problème :**

```
Double-clic sur .bat → Rien ne se passe
OU
Double-clic → S'ouvre avec un éditeur de texte
```

**Solution :**

```
1. Clic droit sur install_climada.bat
2. Choisir "Exécuter en tant que programme"
OU
3. Ouvrir Anaconda Prompt
4. Naviguer vers le dossier
5. Taper : install_climada.bat
```

---

## 🔍 Comparaison Linux vs Windows

| Action                    | Linux/Mac                 | Windows                              |
| ------------------------- | ------------------------- | ------------------------------------ |
| **Script d'installation** | `bash install_climada.sh` | `install_climada.bat` ou double-clic |
| **Terminal**              | Terminal                  | Anaconda Prompt                      |
| **Commande shell**        | bash                      | cmd ou PowerShell                    |
| **Séparateur de chemin**  | `/` (slash)               | `\` (backslash)                      |
| **Installation manuelle** | Même commandes conda      | Même commandes conda                 |

---

## ✅ Vérification Post-Installation

**Après installation, tester dans Anaconda Prompt :**

```cmd
REM 1. Activer l'environnement
conda activate climada_formation

REM 2. Vérifier CLIMADA
python -c "import climada; print('CLIMADA OK')"

REM 3. Lancer Jupyter
jupyter lab
```

**Si tout fonctionne → ✅ PRÊT !**

---

## 🚀 Raccourci Pratique

Le script `install_climada.bat` crée automatiquement :

**📄 lancer_jupyter.bat**

Double-cliquez dessus pour lancer directement Jupyter Lab !

Vous pouvez :

1. Créer un raccourci sur le Bureau
2. Épingler à la barre des tâches
3. L'utiliser à chaque session de formation

---

## 💡 Astuces Windows

### Astuce 1 : Raccourci Bureau

```
1. Clic droit sur lancer_jupyter.bat
2. Envoyer vers → Bureau (créer un raccourci)
3. Renommer : "Formation CLIMADA"
4. Changer l'icône (optionnel)
```

### Astuce 2 : Commande Rapide

Créer un fichier `cmd_climada.bat` :

```cmd
@echo off
call conda activate climada_formation
cmd /k
```

Double-clic → Ouvre directement une console avec l'environnement activé !

### Astuce 3 : PowerShell

Si vous préférez PowerShell :

```powershell
# Initialiser Conda pour PowerShell
conda init powershell

# Redémarrer PowerShell
# Puis :
conda activate climada_formation
```

---

## 📧 Message pour vos Collègues Windows

```
Bonjour,

Pour installer CLIMADA sur Windows :

⚠️ NE PAS utiliser "bash install_climada.sh" (ça ne marche pas sur Windows)

✅ À LA PLACE :

Option 1 (SIMPLE) :
1. Télécharger : https://github.com/NicaiseKassi/Formation-CLIMADA-CI
2. Dézipper le dossier
3. Double-cliquer sur "install_climada.bat"
4. Attendre 15-30 minutes

Option 2 (Ligne de commande) :
1. Ouvrir "Anaconda Prompt"
2. git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
3. cd Formation-CLIMADA-CI
4. install_climada.bat

Pour plus d'aide : INSTALLATION_WINDOWS.md

Cordialement
```

---

## 🎓 Résumé pour Windows

```
┌─────────────────────────────────────────────────────┐
│  WINDOWS : N'UTILISEZ PAS BASH !                   │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ❌ bash install_climada.sh  (NE MARCHE PAS)       │
│                                                     │
│  ✅ install_climada.bat      (WINDOWS)             │
│  ✅ Double-clic sur .bat     (PLUS SIMPLE)         │
│  ✅ conda env create...      (MANUEL)              │
│                                                     │
└─────────────────────────────────────────────────────┘
```

---

## 📞 Support Windows

**Problème spécifique Windows ?**

1. Consulter ce guide : `INSTALLATION_WINDOWS.md`
2. Vérifier les erreurs courantes ci-dessus
3. Ouvrir une issue GitHub avec :
   - Version de Windows (10/11)
   - Message d'erreur exact
   - Capture d'écran

---

**✨ Bon courage avec l'installation sur Windows ! 🪟**
