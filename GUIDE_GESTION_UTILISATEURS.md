# 🔐 Guide de Gestion des Utilisateurs - Formation CLIMADA DGE

## 📋 Configuration Actuelle

### ✅ Ce qui est déjà configuré :

- ✅ Netlify Identity activé
- ✅ Page d'authentification personnalisée
- ✅ Redirections configurées
- ✅ Attribution automatique du rôle "user"
- ✅ Site déployé sur : https://formation-climada-dge.netlify.app/

---

## 👥 INVITER LES PARTICIPANTS (27 personnes)

### Étapes dans Netlify :

1. **Connexion à Netlify**

   - Aller sur : https://app.netlify.com/
   - Se connecter avec votre compte

2. **Accéder à Identity**

   - Cliquer sur votre site : `formation-climada-dge`
   - Dans le menu horizontal en haut, cliquer sur **"Identity"**

3. **Inviter les utilisateurs**
   - Cliquer sur le bouton **"Invite users"**
   - Copier-coller la liste des emails :

```
ettekassi@gmail.com
riflardluc_coulibaly@yahoo.fr
participant3@dge.gouv.ci
participant4@dge.gouv.ci
participant5@dge.gouv.ci
... (jusqu'à 27)
```

4. **Cliquer "Send"**
   - ✅ Chaque personne reçoit un email d'invitation
   - ✅ Le rôle "user" est assigné automatiquement lors de l'inscription

---

## 🔐 FONCTIONNEMENT DE L'AUTHENTIFICATION

### Pour un visiteur NON autorisé :

1. Visite : https://formation-climada-dge.netlify.app/
2. Arrive sur la page d'authentification
3. Essaie de se connecter
4. ❌ **Accès refusé** (pas dans la liste des invités)

### Pour un participant INVITÉ :

1. Reçoit l'email d'invitation de Netlify
2. Clique sur le lien d'invitation
3. Crée son compte :
   - Email : (celui que vous avez invité)
   - Mot de passe : (personnel, 6 caractères minimum)
4. Retourne sur : https://formation-climada-dge.netlify.app/
5. Clique sur "Se connecter"
6. Entre email + mot de passe
7. ✅ **Accès au manuel complet**
8. Session valide 24 heures

---

## 🛠️ GESTION DES UTILISATEURS

### Voir tous les utilisateurs :

1. Netlify → Identity → Users
2. Liste complète avec statuts :
   - **Pending** : Invitation envoyée, pas encore acceptée
   - **Confirmed** : Compte créé et actif
   - **Invited** : En attente de confirmation

### Révoquer l'accès à un utilisateur :

1. Netlify → Identity → Users
2. Cliquer sur l'utilisateur concerné
3. Cliquer sur **"Delete user"**
4. ✅ Cet utilisateur ne peut plus se connecter

### Ajouter un nouvel utilisateur :

1. Netlify → Identity → "Invite users"
2. Entrer le nouvel email
3. ✅ Il reçoit une invitation

### Renvoyer une invitation :

1. Netlify → Identity → Users
2. Trouver l'utilisateur avec statut "Pending"
3. Cliquer sur "Resend invitation"

---

## 📧 EMAIL TYPE À ENVOYER AUX PARTICIPANTS

```
Objet : Invitation - Manuel de Formation CLIMADA (DGE)

Bonjour,

Vous êtes invité(e) à participer à la formation CLIMADA organisée par la Direction Générale de l'Économie.

📚 ACCÈS AU MANUEL EN LIGNE

Vous allez recevoir un email de "noreply@netlify.com" avec le sujet :
"Confirm your email address for Formation CLIMADA"

⚠️ IMPORTANT : Vérifiez votre dossier SPAM si vous ne le voyez pas.

📋 ÉTAPES POUR ACCÉDER :

1. Ouvrir l'email de Netlify
2. Cliquer sur le lien de confirmation
3. Créer votre mot de passe (minimum 6 caractères)
4. Aller sur : https://formation-climada-dge.netlify.app/
5. Cliquer sur "Se connecter"
6. Entrer votre email et mot de passe

✅ Votre accès est valable pendant toute la durée de la formation.

📞 SUPPORT TECHNIQUE

En cas de problème de connexion :
- Nicaise KASSI : ettekassi@gmail.com | 0709252846
- Luc COULIBALY : riflardluc_coulibaly@yahoo.fr | 0707342607

Cordialement,
L'équipe de formation CLIMADA - DGE
```

---

## 🔄 METTRE À JOUR LE MANUEL

Quand vous modifiez le contenu du manuel :

```bash
# 1. Activer l'environnement Conda
conda activate climada_formation

# 2. Aller dans le dossier
cd /home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA/MkDocs/manuel-utilisateur

# 3. Modifier vos fichiers
nano docs/chapitre1_installation.md

# 4. Tester localement (optionnel)
mkdocs serve
# Ouvrir http://localhost:8000

# 5. Déployer
mkdocs gh-deploy --force

# ⏱️ Attendre 2-3 minutes
# ✅ Netlify met à jour automatiquement depuis GitHub
```

---

## 🚨 RÉSOLUTION DES PROBLÈMES

### Problème : Un participant ne reçoit pas l'email d'invitation

**Solutions** :

1. Vérifier que l'email est correct dans Netlify
2. Demander au participant de vérifier le dossier SPAM
3. Renvoyer l'invitation depuis Netlify Identity
4. Si le problème persiste, inviter avec un autre email

### Problème : "Invalid email or password"

**Solutions** :

1. Vérifier que l'utilisateur a bien créé son compte (cliqué sur le lien d'invitation)
2. Vérifier que le mot de passe est correct (6 caractères minimum)
3. Réinitialiser le mot de passe depuis la page de connexion

### Problème : Le site affiche "404 - Page not found"

**Solutions** :

1. Attendre 2-3 minutes après le déploiement
2. Vider le cache du navigateur (Ctrl + Shift + Delete)
3. Essayer en navigation privée
4. Vérifier que Netlify a bien déployé (pas d'erreur dans les logs)

### Problème : Le modal de connexion ne s'affiche pas

**Solutions** :

1. Vérifier que Netlify Identity est bien activé
2. Rafraîchir la page plusieurs fois
3. Vider le cache et réessayer
4. Vérifier la console du navigateur (F12) pour voir les erreurs

---

## 📊 STATISTIQUES D'UTILISATION

Netlify vous permet de voir :

- Nombre total d'utilisateurs
- Nombre de connexions actives
- Historique des connexions

**Accès** : Netlify → Identity → Usage

**Note** : Le plan gratuit permet jusqu'à 1000 utilisateurs et 1000 MAU (Monthly Active Users).

---

## ✅ CHECKLIST AVANT LA FORMATION

- [ ] Netlify Identity activé
- [ ] Mode "Invite only" configuré
- [ ] Tous les participants invités (27 emails)
- [ ] Email de bienvenue envoyé
- [ ] Site testé en navigation privée
- [ ] Support technique prêt (contacts disponibles)
- [ ] Manuel à jour avec le dernier contenu
- [ ] Credentials de sauvegarde notés

---

## 🎓 POUR LE JOUR DE LA FORMATION

1. **Préparer une session de démonstration** :

   - Montrer comment se connecter
   - Montrer la navigation dans le manuel
   - Montrer comment se déconnecter/reconnecter

2. **Avoir les identifiants de secours** :

   - Accès Netlify prêt sur un laptop
   - Contacts support affichés

3. **Prévoir un point de contrôle** :
   - 10 minutes avant le début : vérifier que tous les participants ont accès
   - Résoudre les problèmes de connexion en direct

---

**Date de création** : 5 octobre 2025
**Dernière mise à jour** : 5 octobre 2025
**Responsable** : Nicaise KASSI
