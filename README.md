# 🌍 Formation CLIMADA - Côte d'Ivoire

Bienvenue dans le dépôt officiel du matériel pédagogique pour la formation sur le modèle d'évaluation des risques climatiques **CLIMADA**, organisée en Côte d'Ivoire.

## � Accès à la Formation

**📚 Manuel de Formation :** [https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/login.html](https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/login.html)

> 🔐 **Connexion requise :** Utilisez votre compte GitHub pour accéder au contenu de la formation.

## 🎯 Objectif de cette Formation

Cette formation vous permet de maîtriser **CLIMADA**, un outil puissant d'évaluation des risques climatiques développé par l'ETH Zurich. Vous apprendrez à :

- 📊 **Analyser les risques climatiques** pour différents secteurs économiques
- 🌡️ **Modéliser les aléas climatiques** (inondations, sécheresses, érosion côtière)
- 💰 **Évaluer les impacts économiques** du changement climatique
- 🛡️ **Développer des stratégies d'adaptation** basées sur des données scientifiques

## 📋 Contenu de la Formation

### 📓 **Travaux Pratiques (TP)**

1. **TP1 : Analyse Cacao & Climat CI** - Impact du changement climatique sur la production de cacao
2. **TP2 : Analyse Inondations CI** - Évaluation des risques d'inondation en zone urbaine
3. **TP3 : Analyse Érosion Côtière CI** - Modélisation de l'érosion du littoral ivoirien

### 📚 **Modules de Formation**

- **Module 1** : Installation et configuration de CLIMADA
- **Module 2** : Gestion des données climatiques et d'exposition
- **Module 3** : Travaux pratiques interactifs
- **Module 4** : Prise de décision basée sur les résultats
- **Module 5** : Résolution de problèmes et dépannage

### 🐍 **Environnement Technique**

- **`environment_formation.yml`** : Configuration Conda complète avec toutes les dépendances CLIMADA
- **Notebooks Jupyter** : Exercices pratiques prêts à l'emploi
- **Documentation interactive** : Manuel utilisateur complet avec exemples

## 🚀 Installation pour les Participants

### Installation Automatique (Recommandée)

```bash
# 1. Cloner le dépôt
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI

# 2. Lancer l'installation automatique
bash install_climada.sh

# 3. Activer l'environnement
conda activate climada_formation

# 4. Tester l'installation
python test_climada.py
```

**⏱️ Durée estimée :** 15-30 minutes

### Guides d'Installation Détaillés

- 📘 **Guide Complet** : [INSTALLATION.md](INSTALLATION.md)
- 🪟 **Guide Windows** : [INSTALLATION_WINDOWS.md](INSTALLATION_WINDOWS.md)
- ⚡ **Démarrage Rapide** : [QUICK_START.md](QUICK_START.md)

### Installation Manuelle

```bash
# Créer l'environnement Conda
conda env create -f environment_formation.yml

# Activer l'environnement
conda activate climada_formation

# Lancer Jupyter
jupyter lab
# Cloner le repository
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git

# Installer l'environnement Conda
conda env create -f environment_formation.yml
conda activate climada_formation

# Lancer Jupyter Lab
jupyter lab
```

### 3. **Travaux Pratiques**

- Ouvrez les notebooks dans le dossier `TP/`
- Suivez les instructions du manuel en ligne
- Exécutez les cellules pas à pas

## Fonctionnalités de la Plateforme

- ✅ **Interface web moderne** avec authentification GitHub
- ✅ **Documentation interactive** avec exemples de code
- ✅ **Notebooks Jupyter** prêts à l'emploi
- ✅ **Support technique** intégré
- ✅ **Glossaire** des termes techniques
- ✅ **Guides de dépannage** détaillés

## 📞 Support

Pour toute question technique ou pédagogique :

- 📧 Contactez l'équipe de formation
- 📝 Consultez la section "Dépannage" du manuel
- 💬 Utilisez les canaux de communication fournis pendant la formation

## 📄 Licence

Ce matériel pédagogique est développé pour la formation CLIMADA en Côte d'Ivoire.

---

**🎯 Prêt à explorer CLIMADA ? [Commencez maintenant !](https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/login.html)**
