# 🎯 GUIDE ULTRA-SIMPLE - Sign Up vs Log In

## 📧 SITUATION 1 : VOUS VENEZ DE CLIQUER SUR LE LIEN D'INVITATION

### Ce que vous voyez :

```
┌─────────────────────────────────────────┐
│  Manuel de Formation CLIMADA           │
│  ─────────────────────────────────────  │
│                                         │
│  [Modal de Netlify Identity s'ouvre]   │
│                                         │
│  Deux onglets en haut :                 │
│  ┌──────────┐  ┌──────────┐            │
│  │ SIGN UP  │  │ LOG IN   │            │
│  └──────────┘  └──────────┘            │
│                                         │
└─────────────────────────────────────────┘
```

### ✅ QUE FAIRE ?

#### **CLIQUER SUR L'ONGLET "SIGN UP"**

Vous verrez :

```
┌─────────────────────────────────────────┐
│         SIGN UP                         │
│  ─────────────────────────────────────  │
│                                         │
│  Email:                                 │
│  [votre.email@exemple.com] ← Déjà pré-rempli │
│                                         │
│  Password:                              │
│  [____________] ← VOUS devez le choisir │
│                                         │
│  [  Sign up  ]  ← Bouton à cliquer     │
│                                         │
└─────────────────────────────────────────┘
```

**CE QUE VOUS DEVEZ FAIRE** :

1. ✅ Votre **email est déjà là** (pré-rempli)
2. ✅ Vous tapez **UNIQUEMENT le mot de passe** (minimum 6 caractères)
3. ✅ Vous cliquez **"Sign up"**

**❌ PAS de nom à entrer !** Netlify Identity demande seulement :

- Email (déjà rempli)
- Mot de passe (vous le choisissez)

---

### Ensuite, après avoir cliqué "Sign up" :

Le modal peut se fermer ou rester ouvert. Vous devez maintenant **vous connecter** :

```
┌─────────────────────────────────────────┐
│         LOG IN                          │
│  ─────────────────────────────────────  │
│                                         │
│  Email:                                 │
│  [votre.email@exemple.com]              │
│                                         │
│  Password:                              │
│  [____________] ← Le mot de passe       │
│                 que vous venez de créer │
│                                         │
│  [  Log in  ]  ← Cliquer ici           │
│                                         │
└─────────────────────────────────────────┘
```

**CE QUE VOUS DEVEZ FAIRE** :

1. ✅ Cliquer sur l'onglet **"LOG IN"**
2. ✅ Entrer votre **email**
3. ✅ Entrer le **mot de passe que vous venez de créer**
4. ✅ Cliquer **"Log in"**

---

## 📧 SITUATION 2 : TOUTES LES FOIS SUIVANTES

Vous allez sur : **https://formation-climada-dge.netlify.app/**

### ✅ QUE FAIRE ?

#### **CLIQUER SUR L'ONGLET "LOG IN"** (PAS "Sign up")

```
┌─────────────────────────────────────────┐
│         LOG IN                          │
│  ─────────────────────────────────────  │
│                                         │
│  Email:                                 │
│  [votre.email@exemple.com]              │
│                                         │
│  Password:                              │
│  [____________] ← Votre mot de passe    │
│                                         │
│  [  Log in  ]                          │
│                                         │
│  Forgot password?                       │
│                                         │
└─────────────────────────────────────────┘
```

**CE QUE VOUS DEVEZ FAIRE** :

1. ✅ Entrer votre **email**
2. ✅ Entrer votre **mot de passe**
3. ✅ Cliquer **"Log in"**

---

## 🎯 RÉSUMÉ VISUEL

### 1ère FOIS (après avoir cliqué sur le lien d'invitation) :

```
ÉTAPE 1 : SIGN UP
┌──────────────────────┐
│ Email: [pré-rempli]  │
│ Password: [________] │ ← VOUS choisissez
│                      │
│   [ Sign up ]        │ ← Cliquer
└──────────────────────┘
        ↓
     COMPTE CRÉÉ ✅
        ↓
ÉTAPE 2 : LOG IN
┌──────────────────────┐
│ Email: [tapez-le]    │
│ Password: [________] │ ← Celui que vous venez de créer
│                      │
│   [ Log in ]         │ ← Cliquer
└──────────────────────┘
        ↓
    ACCÈS AU MANUEL ✅
```

### FOIS SUIVANTES (aller directement sur le site) :

```
LOG IN UNIQUEMENT
┌──────────────────────┐
│ Email: [tapez-le]    │
│ Password: [________] │ ← Votre mot de passe
│                      │
│   [ Log in ]         │ ← Cliquer
└──────────────────────┘
        ↓
    ACCÈS AU MANUEL ✅
```

---

## ❓ QUESTIONS FRÉQUENTES

### Q : "On me demande mon nom sur Sign up ?"

**R : NON !** Netlify Identity demande seulement :

- Email (déjà pré-rempli quand vous venez du lien d'invitation)
- Mot de passe (vous le choisissez)

Si vous voyez un champ "Nom", c'est peut-être un autre formulaire ou un bug d'affichage.

---

### Q : "Sign up ou Log in pour la première fois ?"

**R : LES DEUX !**

1. D'abord **"Sign up"** → Créer le compte (choisir le mot de passe)
2. Puis **"Log in"** → Se connecter avec ce compte

---

### Q : "Log in ou Sign up les fois suivantes ?"

**R : LOG IN SEULEMENT !**

- "Sign up" = Une seule fois
- "Log in" = Toutes les fois après

---

### Q : "Je ne me souviens plus si j'ai fait Sign up"

**R : Testez !**

1. Allez sur : https://formation-climada-dge.netlify.app/
2. Cliquez "Log in"
3. Entrez votre email + mot de passe
4. Si ça marche ✅ → Vous avez déjà un compte
5. Si "User not found" ❌ → Vous devez faire "Sign up" d'abord

---

## 🔍 CAPTURE D'ÉCRAN TYPIQUE

Ce que vous devriez voir sur **Sign up** :

```
╔═══════════════════════════════════════════╗
║  Welcome to Formation CLIMADA             ║
║                                           ║
║  ┌─────────┐  ┌─────────┐                ║
║  │ SIGN UP │  │ LOG IN  │                ║
║  └─────────┘  └─────────┘                ║
║                                           ║
║  Email *                                  ║
║  ┌───────────────────────────────────┐   ║
║  │ votre.email@exemple.com           │   ║
║  └───────────────────────────────────┘   ║
║                                           ║
║  Password *                               ║
║  ┌───────────────────────────────────┐   ║
║  │ ••••••••                          │   ║
║  └───────────────────────────────────┘   ║
║                                           ║
║         ┌─────────────┐                  ║
║         │   Sign up   │                  ║
║         └─────────────┘                  ║
║                                           ║
╚═══════════════════════════════════════════╝
```

**SEULEMENT 2 CHAMPS** :

- Email (pré-rempli)
- Password (vous choisissez)

**PAS de champ "Nom" !**

---

## 💡 CONSEIL PRATIQUE

Si c'est votre **première fois** et que vous hésitez :

1. **Cliquez "Sign up"**
2. Entrez un mot de passe
3. Cliquez le bouton "Sign up"
4. **PUIS cliquez "Log in"**
5. Entrez email + le mot de passe que vous venez de créer
6. Cliquez "Log in"

**C'est tout !** 🎉

---

## 📞 SI VOUS ÊTES BLOQUÉ

**Nicaise KASSI** : 0709252846 | ettekassi@gmail.com  
**Luc COULIBALY** : 0707342607 | riflardluc_coulibaly@yahoo.fr

On vous aide en direct ! 📱

---

**Date** : 5 octobre 2025  
**Version** : Guide simplifié Sign up vs Log in
