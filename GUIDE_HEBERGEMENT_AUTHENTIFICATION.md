# Guide d'Hébergement et Authentification - Manuel CLIMADA

## 🎯 Objectif

Mettre en ligne le manuel CLIMADA avec authentification pour 25 participants + 2 formateurs.

---

## ✅ SOLUTION RECOMMANDÉE : GitHub Pages + Cloudflare Access

### **Avantages**

- ✅ 100% gratuit
- ✅ Authentification sécurisée par email
- ✅ HTTPS automatique
- ✅ Mises à jour automatiques via Git
- ✅ Zéro maintenance

---

## 📋 ÉTAPE 1 : Déployer sur GitHub Pages

### 1.1 Build du site statique

```bash
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA/MkDocs/manuel-utilisateur

# Vérifier que mkdocs.yml est correct
cat mkdocs.yml

# Build le site
mkdocs build

# Vérifier que le dossier 'site/' est créé
ls -la site/
```

### 1.2 Déployer sur GitHub Pages

```bash
# Méthode automatique (RECOMMANDÉE)
mkdocs gh-deploy

# Ou méthode manuelle
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA
git add .
git commit -m "Ajout manuel MkDocs complet avec tous les chapitres"
git push origin main
```

### 1.3 Activer GitHub Pages

1. Aller sur https://github.com/NicaiseKassi/Formation-CLIMADA-CI
2. Cliquer sur **Settings** (en haut à droite)
3. Dans le menu gauche, cliquer sur **Pages**
4. Sous **Source**, sélectionner :
   - Branch : `gh-pages` (créée automatiquement par mkdocs gh-deploy)
   - Folder : `/ (root)`
5. Cliquer **Save**
6. Attendre 2-3 minutes

**URL du site** : `https://nicaisekassi.github.io/Formation-CLIMADA-CI/`

---

## 🔐 ÉTAPE 2 : Ajouter l'Authentification avec Cloudflare Access

### 2.1 Créer un compte Cloudflare

1. Aller sur https://www.cloudflare.com/
2. Créer un compte gratuit
3. Confirmer l'email

### 2.2 Ajouter le site GitHub Pages

1. Dans le dashboard Cloudflare, cliquer **Add Site**
2. Entrer : `nicaisekassi.github.io`
3. Choisir le plan **Free**
4. Cloudflare va scanner les DNS
5. Suivre les instructions pour pointer les DNS (ou utiliser un sous-domaine)

### 2.3 Activer Cloudflare Access (Zero Trust)

1. Dans le dashboard, aller dans **Zero Trust** (menu gauche)
2. Cliquer sur **Access** → **Applications**
3. Cliquer **Add an application**
4. Sélectionner **Self-hosted**
5. Configuration :
   ```
   Application name: Formation CLIMADA DGE
   Session Duration: 24 hours
   Application domain: formation-climada.pages.dev (ou votre domaine)
   ```
6. Cliquer **Next**

### 2.4 Créer une politique d'accès

1. **Policy name** : Participants Formation CLIMADA
2. **Action** : Allow
3. **Configure rules** :
   - Rule type : **Emails**
   - Ajouter les 27 emails :
     ```
     participant1@dge.gouv.ci
     participant2@dge.gouv.ci
     ...
     participant25@dge.gouv.ci
     formateur1@dge.gouv.ci
     formateur2@dge.gouv.ci
     ```
4. Cliquer **Next** puis **Add application**

### 2.5 Tester l'accès

1. Ouvrir un navigateur en mode incognito
2. Aller sur l'URL du site
3. Vous devriez voir une page de connexion Cloudflare
4. Entrer un email autorisé
5. Un code OTP est envoyé par email
6. Entrer le code → Accès au site ✅

---

## 🔄 ÉTAPE 3 : Workflow de Mise à Jour

### 3.1 Modifier le contenu

```bash
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA/MkDocs/manuel-utilisateur

# Modifier les fichiers dans docs/
nano docs/chapitre1_installation.md

# Tester localement
mkdocs serve
# Ouvrir http://localhost:8000
```

### 3.2 Publier les modifications

```bash
# Méthode 1 : Déploiement direct
mkdocs gh-deploy

# Méthode 2 : Via Git
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA
git add .
git commit -m "Mise à jour chapitre 1"
git push origin main
mkdocs gh-deploy
```

**⏱️ Délai de mise à jour** : 2-3 minutes après le push

---

## 👥 ÉTAPE 4 : Gestion des Utilisateurs

### 4.1 Ajouter un nouvel utilisateur

1. Cloudflare Dashboard → **Zero Trust** → **Access** → **Applications**
2. Cliquer sur "Formation CLIMADA DGE"
3. Aller dans **Policies**
4. Éditer la politique
5. Ajouter le nouvel email
6. Sauvegarder

### 4.2 Révoquer l'accès d'un utilisateur

1. Même procédure
2. Retirer l'email de la liste
3. Sauvegarder

### 4.3 Envoyer les instructions aux participants

**Email type** :

```
Objet : Accès au Manuel de Formation CLIMADA

Bonjour,

Vous êtes invité(e) à accéder au manuel de formation CLIMADA.

🔗 Lien : https://nicaisekassi.github.io/Formation-CLIMADA-CI/

📧 Connexion :
1. Cliquer sur le lien
2. Entrer votre email : votre.email@dge.gouv.ci
3. Un code de vérification vous sera envoyé par email
4. Entrer le code pour accéder au manuel

⏱️ La session reste active 24 heures

📞 Support : ettekassi@gmail.com | 0709252846

Bonne formation !
```

---

## 🆘 ALTERNATIVE : Solution Plus Simple (Sans Cloudflare)

### Option : Netlify avec Identity

Si Cloudflare est trop complexe, utilisez Netlify :

1. **Créer un compte** sur https://www.netlify.com/
2. **Connecter le repo GitHub** : Formation-CLIMADA-CI
3. **Build settings** :
   ```
   Base directory: Formation_CLIMADA/MkDocs/manuel-utilisateur
   Build command: mkdocs build
   Publish directory: site
   ```
4. **Activer Netlify Identity** :
   - Site settings → Identity
   - Enable Identity
   - Invite users (entrer les 27 emails)
5. **Activer le gate** :
   - Identity → Settings
   - Enable "Require login to view site"

**URL** : `formation-climada-dge.netlify.app`

---

## 📊 COMPARAISON FINALE

| Solution                      | Complexité | Coût         | Sécurité   | Recommandation              |
| ----------------------------- | ---------- | ------------ | ---------- | --------------------------- |
| **GitHub Pages + Cloudflare** | ⭐⭐⭐     | Gratuit      | ⭐⭐⭐⭐⭐ | ✅ MEILLEURE                |
| **Netlify + Identity**        | ⭐⭐       | Gratuit      | ⭐⭐⭐⭐⭐ | ✅ ALTERNATIVE              |
| **Serveur DGE + Nginx**       | ⭐⭐⭐⭐⭐ | Coût serveur | ⭐⭐⭐     | ⚠️ Si infrastructure existe |

---

## 🎓 POUR LA FORMATION

### Configuration Recommandée

1. **Avant la formation (J-7)** :

   - Déployer le site sur GitHub Pages
   - Configurer Cloudflare Access
   - Envoyer les invitations aux participants

2. **Pendant la formation** :

   - URL unique pour tous : `https://nicaisekassi.github.io/Formation-CLIMADA-CI/`
   - Chacun se connecte avec son email DGE
   - Accès 24h pour consultation libre

3. **Après la formation** :
   - Maintenir l'accès pour référence
   - Possibilité d'ajouter de nouveaux utilisateurs
   - Mises à jour faciles via Git

---

## 📞 Support

- **Technique** : Nicaise Kassi - ettekassi@gmail.com - 0709252846
- **Contenu** : Luc Coulibaly - riflardluc_coulibaly@yahoo.fr - 0707342607

---

**Date de création** : 5 octobre 2025
**Dernière mise à jour** : 5 octobre 2025
