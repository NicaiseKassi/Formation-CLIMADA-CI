# 🌍 Formation CLIMADA - Installation Rapide

## 🎯 Installation en 3 étapes

### Étape 1 : Cloner le dépôt

```bash
git clone https://github.com/NicaiseKassi/Formation-CLIMADA-CI.git
cd Formation-CLIMADA-CI
```

### Étape 2 : Installer l'environnement

**Option automatique (recommandée) :**

```bash
bash install_climada.sh
```

**Option manuelle :**

```bash
conda env create -f environment_formation.yml
```

### Étape 3 : Activer et tester

```bash
conda activate climada_formation
python test_climada.py
```

## 🚀 Démarrage Rapide

```bash
# Activer l'environnement
conda activate climada_formation

# Lancer Jupyter
jupyter lab

# Ouvrir les TPs dans le dossier TP/
```

## 📚 Contenu de la Formation

- **TP/** - Travaux pratiques avec notebooks Jupyter
  - `TP1_Inondations_Abidjan_2018_Complet.ipynb` - Analyse des inondations
  - `TP2_Secheresse_Agriculture_2016_Complet.ipynb` - Impact sur l'agriculture
- **Cours/** - Matériel pédagogique et présentations

- **Docs/** - Documentation et données d'exemple

## ❓ Problèmes ?

Consultez le guide détaillé : [INSTALLATION.md](INSTALLATION.md)

## 📧 Support

Pour toute question, ouvrez une issue sur GitHub.

---

**Durée d'installation estimée : 15-30 minutes**
