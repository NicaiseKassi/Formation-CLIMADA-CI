# 🧪 Guide de Test de l'Authentification

## ✅ CORRECTIONS APPORTÉES

### Problème identifié :

Après avoir cliqué sur le lien d'invitation, l'utilisateur était **automatiquement connecté** et accédait directement au manuel **sans avoir à s'authentifier**.

### Solution mise en place :

1. **Ordre des redirections corrigé** dans `_redirects` :

   - La page d'authentification est maintenant prioritaire
   - Toutes les pages nécessitent une session active

2. **Détection de confirmation d'email** dans `index_auth.html` :

   - Quand un utilisateur clique sur le lien d'invitation
   - Le système détecte qu'il vient de confirmer son email
   - Il est **immédiatement déconnecté**
   - Un message lui demande de se **reconnecter manuellement**

3. **Flux d'authentification forcé** :
   - Après confirmation : déconnexion automatique
   - Message : "Email confirmé ! Veuillez vous connecter"
   - Ouverture automatique du modal de connexion après 2 secondes

---

## 🧪 PROCÉDURE DE TEST COMPLÈTE

### **Test 1 : Première invitation**

1. **Supprimer l'utilisateur existant** (si déjà invité) :

   - Aller sur : https://app.netlify.com/
   - Site : `formation-climada-dge`
   - Identity → Users
   - Trouver ettekassi@gmail.com et le supprimer

2. **Renvoyer l'invitation** :

   - Identity → "Invite users"
   - Email : ettekassi@gmail.com
   - Cliquer "Send"

3. **Attendre 2-3 minutes** pour le déploiement Netlify

4. **Vérifier l'email** :

   - Ouvrir l'email de Netlify
   - Objet : "Confirm your email address for Formation CLIMADA"

5. **Cliquer sur le lien d'invitation** :

   - ✅ **Attendu** : Page s'ouvre
   - ✅ **Attendu** : Message "Email confirmé ! Veuillez vous connecter"
   - ✅ **Attendu** : Modal de connexion s'ouvre automatiquement après 2 secondes
   - ❌ **Pas attendu** : Accès direct au manuel sans authentification

6. **Se connecter** :

   - Dans le modal, cliquer sur "Log in"
   - Entrer : ettekassi@gmail.com
   - Entrer : votre mot de passe (créé lors de la confirmation)
   - Cliquer "Log in"

7. **Vérifier l'accès** :
   - ✅ **Attendu** : Redirection vers le manuel
   - ✅ **Attendu** : Chapitre 1 s'affiche correctement
   - ✅ **Attendu** : Navigation fonctionne

---

### **Test 2 : Déconnexion et reconnexion**

1. **Se déconnecter** :

   - Ouvrir la console du navigateur (F12)
   - Taper : `netlifyIdentity.logout()`
   - Appuyer sur Entrée

2. **Essayer d'accéder au manuel** :

   - Aller sur : https://formation-climada-dge.netlify.app/chapitre1_installation/
   - ✅ **Attendu** : Redirection vers la page d'authentification
   - ✅ **Attendu** : Modal de connexion s'ouvre
   - ❌ **Pas attendu** : Accès direct au contenu

3. **Se reconnecter** :
   - Entrer email et mot de passe
   - ✅ **Attendu** : Accès au manuel après connexion

---

### **Test 3 : Navigation privée (nouvel utilisateur)**

1. **Ouvrir une fenêtre de navigation privée** (Ctrl + Shift + N)

2. **Aller sur le site** :

   - URL : https://formation-climada-dge.netlify.app/
   - ✅ **Attendu** : Page d'authentification
   - ✅ **Attendu** : Modal de connexion s'ouvre
   - ❌ **Pas attendu** : Accès direct

3. **Essayer d'accéder directement à un chapitre** :
   - URL : https://formation-climada-dge.netlify.app/chapitre2_donnees/
   - ✅ **Attendu** : Redirection vers index_auth.html
   - ✅ **Attendu** : Demande de connexion

---

### **Test 4 : Session persistante (comportement normal)**

1. **Se connecter normalement**

2. **Fermer le navigateur complètement**

3. **Rouvrir le navigateur et aller sur le site** :
   - ✅ **Attendu** : Toujours connecté (session valide 24h)
   - ✅ **Attendu** : Accès direct au manuel (c'est normal, la session est active)

---

## 🎯 RÉSULTATS ATTENDUS

### ✅ Comportement CORRECT :

1. **Première visite après invitation** :

   - Clic sur lien → Confirmation → **Demande de connexion** → Accès

2. **Utilisateur non connecté** :

   - Essai d'accès → **Redirection vers authentification** → Connexion → Accès

3. **Utilisateur connecté (session active)** :
   - Accès direct au manuel (c'est normal)

### ❌ Comportement INCORRECT (ancien problème) :

1. **Première visite après invitation** :
   - Clic sur lien → ~~Accès direct sans authentification~~ ❌

---

## 🔍 VÉRIFICATIONS TECHNIQUES

### Dans Netlify Identity :

1. **Vérifier le rôle** :

   - Identity → Users → ettekassi@gmail.com
   - Onglet "User metadata"
   - ✅ **Doit contenir** : `"roles": ["user"]`

2. **Vérifier le statut** :
   - ✅ **Confirmed** (après clic sur le lien)

### Dans le navigateur :

1. **Console (F12)** :

   - Vérifier : `netlifyIdentity.currentUser()`
   - ✅ **Doit retourner** : `null` après confirmation (avant connexion manuelle)
   - ✅ **Doit retourner** : objet user après connexion manuelle

2. **LocalStorage** :
   - Application → Local Storage → https://formation-climada-dge.netlify.app
   - ✅ **Doit contenir** : `gotrue.user` seulement après connexion manuelle

---

## 🐛 PROBLÈMES POSSIBLES

### Problème : "Je vois encore l'ancien comportement"

**Solution** :

1. Vider le cache du navigateur :

   - Chrome : Ctrl + Shift + Delete
   - Cocher "Cookies" et "Cached images"
   - Cliquer "Clear data"

2. Essayer en navigation privée

3. Attendre 3-5 minutes après le déploiement

### Problème : "Le modal ne s'ouvre pas"

**Solution** :

1. Vérifier la console (F12) pour les erreurs
2. Vérifier que Netlify Identity est activé
3. Rafraîchir la page plusieurs fois

### Problème : "Message d'erreur après connexion"

**Solution** :

1. Vérifier que le rôle "user" est assigné
2. Vérifier dans netlify/functions/identity-signup.js
3. Vérifier dans Netlify Identity → Settings → Registration preferences → Invite only

---

## 📞 SI ÇA NE FONCTIONNE TOUJOURS PAS

Contacter :

- **Nicaise KASSI** : ettekassi@gmail.com | 0709252846
- **Luc COULIBALY** : riflardluc_coulibaly@yahoo.fr | 0707342607

Ou partager :

1. Captures d'écran du comportement
2. Console du navigateur (F12 → Console)
3. URL visitée

---

**Date de test** : 5 octobre 2025  
**Version** : Après correction du flux d'authentification  
**Déploiement** : ✅ Déployé sur gh-pages et Netlify
