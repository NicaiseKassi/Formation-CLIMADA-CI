# 📦 Scripts d'Installation CLIMADA

## ⚠️ ATTENTION : Choisissez le bon script selon votre système !

### 🐧 Linux / 🍎 Mac

```bash
bash install_climada.sh
```

### 🪟 Windows

**Option 1 : Double-clic (Recommandé)**

- Double-cliquer sur `install_climada.bat`

**Option 2 : Anaconda Prompt**

```cmd
install_climada.bat
```

**Option 3 : Manuel**

```cmd
conda env create -f environment_formation.yml
```

---

## 📁 Fichiers Disponibles

| Fichier                     | Système   | Description              |
| --------------------------- | --------- | ------------------------ |
| `install_climada.sh`        | Linux/Mac | Script bash automatique  |
| `install_climada.bat`       | Windows   | Script batch automatique |
| `environment_formation.yml` | Tous      | Configuration Conda      |
| `test_climada.py`           | Tous      | Test de validation       |

---

## ❌ Erreur Courante sur Windows

```
'bash' n'est pas reconnu en tant que commande interne
```

**Cause :** Bash n'existe pas sur Windows

**Solution :** Utilisez `install_climada.bat` au lieu de `install_climada.sh`

---

## 📖 Documentation Complète

- **Windows :** Voir `INSTALLATION_WINDOWS.md`
- **Linux/Mac :** Voir `INSTALLATION.md`
- **Guide simple :** Voir `GUIDE_INSTALLATION_SIMPLE.md`
- **Problème bash sur Windows :** Voir `WINDOWS_PAS_DE_BASH.md`

---

## ✅ Installation Réussie

Après installation, vous devriez pouvoir faire :

```bash
conda activate climada_formation
python test_climada.py
jupyter lab
```

---

**Besoin d'aide ? Consultez `INDEX_INSTALLATION.md`**
