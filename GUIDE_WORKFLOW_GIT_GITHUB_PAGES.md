# 📋 Guide Complet : Workflow Git et Déploiement GitHub Pages

## 🎯 Objectif
Ce guide vous explique comment modifier votre documentation MkDocs, la déployer sur GitHub Pages et gérer l'authentification GitHub OAuth.

---

## 📁 Structure des Branches

### 🔧 Branche `main` (Développement)
- **Usage** : Modification des fichiers sources
- **Contenu** :
  - `docs/` : Documentation MkDocs
  - `TP/` : Notebooks Jupyter
  - `Cours/` : Présentations
  - `mkdocs.yml` : Configuration

### 🌐 Branche `gh-pages` (Déploiement)
- **Usage** : Site web déployé automatiquement
- **Contenu** : Fichiers HTML statiques générés
- **URL** : https://nicaisekassi.github.io/Formation-CLIMADA-CI/

---

## 🔄 Deux Workflows Distincts

## 📁 **CAS 1 : Ajouter Nouveaux Dossiers/TP/Fichiers**

### 🎯 **Règle : TOUJOURS sur la branche `main`**

### 1️⃣ **Vérifier et aller sur main**
```bash
# Voir sur quelle branche vous êtes
git branch
git status

# Aller sur main
git checkout main

# Si erreur de fichiers non suivis :
rm -rf MkDocs/  # Supprimer les fichiers générés
git checkout main
```

### 2️⃣ **Ajouter vos nouveaux contenus**
```bash
# Exemples d'ajouts :
# - Nouveau TP dans TP/
# - Nouvelle présentation dans Cours/
# - Nouveau chapitre dans docs/
# - Nouveaux fichiers de données
```

### 3️⃣ **Sauvegarder UNIQUEMENT sur main**
```bash
# Ajouter TOUS les nouveaux fichiers/dossiers
git add .

# Commit avec message descriptif
git commit -m "Ajout nouveau TP/dossier - [description précise]"

# Push UNIQUEMENT vers main
git push origin main
```

### ⚠️ **IMPORTANT pour nouveaux contenus :**
- ✅ **Main seulement** - Ne pas déployer immédiatement
- ✅ Tous vos TP, Cours, données restent sur `main`
- ❌ **Jamais** ajouter directement sur `gh-pages`

---

## 🌐 **CAS 2 : Déploiement Après Modifications Documentation**

### 🎯 **Pour publier sur le site web public**

### 1️⃣ **Vérifier que vous êtes sur main avec modifications**
```bash
git branch
git status

# Si modifications non sauvées :
git add .
git commit -m "Modifications documentation"
git push origin main
```

### 2️⃣ **Naviguer vers le dossier MkDocs**
```bash
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA/MkDocs/manuel-utilisateur
```

### 3️⃣ **Tester localement (optionnel)**
```bash
# Activer l'environnement conda
source ~/anaconda3/etc/profile.d/conda.sh
conda activate climada_formation

# Lancer le serveur local
mkdocs serve

# Ouvrir http://127.0.0.1:8000 dans le navigateur
# Ctrl+C pour arrêter le serveur
```

### 4️⃣ **Construire le site**
```bash
# Générer les fichiers HTML statiques
mkdocs build
```

### 5️⃣ **Déployer sur gh-pages**
```bash
# Passer à la branche de déploiement
git checkout gh-pages

# Copier les fichiers générés
cp -r site/* .

# Sauvegarder le déploiement
git add .
git commit -m "Déploiement documentation - $(date)"

# Pousser vers GitHub Pages
git push origin gh-pages

# Retourner sur main pour continuer le travail
git checkout main
```

---

## 🚨 Résolution des Problèmes Courants

### ❌ Problème : "Je ne vois pas mes dossiers TP/ et Cours/"
**Solution** : Vous êtes sur la mauvaise branche
```bash
# Vérifier la branche
git branch

# Si vous êtes sur gh-pages, revenir à main
git checkout main

# Si erreur, supprimer les fichiers temporaires
rm -rf MkDocs/
git checkout main
```

### ❌ Problème : "Error: files would be overwritten"
**Solution** : Nettoyer les fichiers non suivis
```bash
# Supprimer le dossier MkDocs généré
rm -rf MkDocs/

# Ou utiliser git clean (ATTENTION : supprime tous les fichiers non suivis)
git clean -fd

# Puis changer de branche
git checkout main
```

### ❌ Problème : Authentification affiche "Utilisateur Test"
**Solution** : Vider le cache du navigateur
1. **Chrome/Firefox** : `Ctrl + Shift + Delete`
2. Cocher "Cache" et "Cookies"
3. Période : "Tout"
4. Cliquer "Effacer"
5. Recharger avec `Ctrl + F5`

---

## 🔐 Configuration GitHub Pages + OAuth

### 1️⃣ **Activer GitHub Pages**
1. Aller sur https://github.com/NicaiseKassi/Formation-CLIMADA-CI
2. **Settings** → **Pages**
3. **Source** : Deploy from a branch
4. **Branch** : `gh-pages` / `/ (root)`
5. **Save**

### 2️⃣ **Créer une OAuth App GitHub**
1. Aller sur https://github.com/settings/developers
2. **New OAuth App**
3. Remplir :
   - **Application name** : `Formation CLIMADA CI`
   - **Homepage URL** : `https://nicaisekassi.github.io/Formation-CLIMADA-CI/`
   - **Authorization callback URL** : `https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/callback.html`
4. **Register application**
5. Noter le **Client ID** (ex: `Ov23liKn3F84EgMGpVnS`)

### 3️⃣ **Configurer l'authentification dans le code**
```javascript
// Dans docs/auth/auth.js
const CONFIG = {
    CLIENT_ID: 'Ov23liKn3F84EgMGpVnS', // Votre Client ID
    REDIRECT_URI: 'https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/callback.html',
    TEST_MODE: false // IMPORTANT : mettre à false
};

const AUTHORIZED_USERS = [
    'NicaiseKassi',
    // Ajouter d'autres utilisateurs GitHub autorisés
];
```

### 4️⃣ **Ajouter des utilisateurs autorisés**

#### 📍 **Fichier à modifier** : 
```
/MkDocs/manuel-utilisateur/docs/auth/auth.js
```

#### 🔧 **Étapes pour ajouter des utilisateurs** :

1. **Aller sur la branche main** :
```bash
git checkout main
```

2. **Ouvrir le fichier auth.js** :
```bash
# Naviguer vers le fichier
cd MkDocs/manuel-utilisateur/docs/auth/
# Éditer avec VS Code ou autre
```

3. **Modifier la liste AUTHORIZED_USERS** :
```javascript
const AUTHORIZED_USERS = [
  "NicaiseKassi",        // Vous (admin)
  "participant1-github", // Premier participant
  "jean-dupont-ci",      // Exemple participant
  "marie-ministere",     // Exemple ministère
  "expert-climat-2025",  // Exemple expert
  // Ajouter les 27 noms d'utilisateurs GitHub
];
```

4. **Sauvegarder sur main** :
```bash
git add .
git commit -m "Ajout nouveaux utilisateurs autorisés"
git push origin main
```

5. **Déployer les changements** :
```bash
cd .. # Retourner dans MkDocs/manuel-utilisateur/
mkdocs build
git checkout gh-pages
cp -r site/* .
git add .
git commit -m "Mise à jour authentification"
git push origin gh-pages
git checkout main
```

### 5️⃣ **Prérequis pour les participants**

#### ✅ **Chaque participant doit** :
1. **Créer un compte GitHub gratuit** sur https://github.com
2. **Choisir un nom d'utilisateur** (exemple : `jean-dupont-ci`)
3. **Vous communiquer ce nom** pour que vous l'ajoutiez à la liste
4. **Se connecter via GitHub** sur le site de formation

#### 📝 **Instructions pour les participants** :
```
1. Aller sur https://github.com
2. Cliquer "Sign up" 
3. Choisir username (ex: votre-nom-institution)
4. Communiquer ce username à l'organisateur
5. Accéder au site : https://nicaisekassi.github.io/Formation-CLIMADA-CI/
6. Cliquer "Se connecter avec GitHub"
```
```

### 4️⃣ **URLs importantes**
- **Site déployé** : https://nicaisekassi.github.io/Formation-CLIMADA-CI/
- **Page de connexion** : https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/login.html
- **OAuth App GitHub** : https://github.com/settings/developers

---

## 📝 Mémo Rapide

### � **CAS 1 : Ajouter nouveaux TP/dossiers/fichiers**
```bash
# Toujours sur main seulement
git checkout main
git add .
git commit -m "Ajout nouveau [TP/dossier/fichier] - description"
git push origin main
# ⚠️ PAS de déploiement automatique
```

### 🌐 **CAS 2 : Déployer modifications documentation**
```bash
# 1. Sauvegarder sur main
git checkout main
git add .
git commit -m "Modifications documentation"
git push origin main

# 2. Construire et déployer
cd MkDocs/manuel-utilisateur
mkdocs build
git checkout gh-pages
cp -r site/* .
git add .
git commit -m "Déploiement $(date)"
git push origin gh-pages
git checkout main
```

### 👥 **CAS 3 : Ajouter nouveaux utilisateurs**
```bash
# 1. Modifier auth.js sur main
git checkout main
# Éditer MkDocs/manuel-utilisateur/docs/auth/auth.js
# Ajouter noms dans AUTHORIZED_USERS

# 2. Sauvegarder et déployer
git add .
git commit -m "Ajout nouveaux utilisateurs autorisés"
git push origin main

# 3. Déployer authentification
cd MkDocs/manuel-utilisateur
mkdocs build
git checkout gh-pages
cp -r site/* .
git add .
git commit -m "Mise à jour authentification"
git push origin gh-pages
git checkout main
```
git push origin gh-pages
git checkout main
```

### 🔍 Commandes utiles
```bash
# Voir où vous êtes
pwd
git branch
git status

# Voir les dossiers
ls -la

# Nettoyer si problème
rm -rf MkDocs/ site/
```

---

## ✅ Checklist de Déploiement

- [ ] Je suis sur la branche `main`
- [ ] J'ai fait mes modifications
- [ ] J'ai testé localement (optionnel)
- [ ] J'ai commit et push sur `main`
- [ ] J'ai généré le site avec `mkdocs build`
- [ ] J'ai déployé sur `gh-pages`
- [ ] Le site fonctionne sur GitHub Pages
- [ ] L'authentification fonctionne (cache vidé)

---

## 🆘 En cas de problème

1. **Toujours commencer par** :
   ```bash
   git status
   git branch
   ```

2. **Si bloqué** :
   ```bash
   git checkout main
   # Si erreur : rm -rf MkDocs/ puis réessayer
   ```

3. **Pour l'authentification** :
   - Vider le cache navigateur
   - Vérifier que `TEST_MODE: false`
   - Redéployer après modification

---

*Guide créé le 6 octobre 2025 pour la Formation CLIMADA CI*