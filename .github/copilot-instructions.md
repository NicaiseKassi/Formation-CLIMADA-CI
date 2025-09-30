# Instructions Copilot pour le Code de Formation CLIMADA

## Vue d'ensemble du projet
- **CLIMADA** est une plateforme open-source pour l'évaluation probabiliste des risques climatiques et l'analyse d'impact économique, adaptée ici pour la Côte d'Ivoire (contexte DGE).
- Le code est principalement composé de notebooks Jupyter, de données CSV et d'une documentation extensive (voir `Docs/`).
- Le workflow se centre sur l'équation : **Risque = Aléa × Exposition × Vulnérabilité**.

## Composants clés et flux de données
- **Notebooks** (`*.ipynb`) : Point d'entrée principal pour l'analyse, la formation et la démonstration. Chaque notebook couvre typiquement un workflow complet : import des données, modélisation des aléas, modélisation de l'exposition, calcul d'impact et visualisation des résultats.
- **Données** (`Docs/*.csv`) : Données d'entrée pour les aléas (inondations, sécheresses), expositions (économiques, agricoles) et calibration.
- **Configuration** : La configuration spécifique au projet est souvent définie dans des fichiers Python (voir `config/` ou inline dans les notebooks) et via des variables d'environnement (`CLIMADA_DATA_DIR`, `CLIMADA_RESULTS_DIR`).
- **Documentation** : `Docs/manuel-climada-complet-1.md` et `Guide_Installation_CLIMADA_Complet.md` font autorité pour les workflows, le dépannage et l'architecture.

## Workflows développeur
- **Configuration environnement** : Suivre strictement `Guide_Installation_CLIMADA_Complet.md` pour les étapes spécifiques à l'OS (conda/venv, dépendances géospatiales, installation CLIMADA, configuration kernel Jupyter).
- **Structure répertoires données** : Utiliser les dossiers recommandés : `data/`, `notebooks/`, `results/`, `docs/`, `config/` (voir le guide d'installation et le manuel pour la structure).
- **Kernel Notebook** : Toujours utiliser le kernel `CLIMADA Formation` pour la cohérence.
- **Tests** : Valider l'installation et le workflow en exécutant les blocs de code de vérification dans le guide d'installation (tests d'import, création d'objets, vérifications packages géospatiaux).
- **Dépannage** : Les erreurs courantes et leurs corrections sont documentées dans le guide d'installation (GDAL, Cartopy, problèmes de kernel, etc.).

## Modèles spécifiques au projet
- **Modélisation des aléas** : Utiliser `climada.hazard.Hazard` avec des données locales (SODEXAM, ONPC, etc.).
- **Modélisation de l'exposition** : Utiliser `climada.entity.Exposures` avec des données économiques/sectorielles, incluant toujours les colonnes `value`, `geometry` et `impf_{HAZ}`.
- **Fonctions d'impact** : Définir avec `climada.entity.ImpactFunc`, en utilisant la calibration spécifique à la Côte d'Ivoire quand possible.
- **Calcul d'impact** : Utiliser `climada.engine.ImpactCalc` pour l'agrégation des risques et les rapports.
- **Données géospatiales** : Toutes les données spatiales doivent utiliser `EPSG:4326` (WGS84) et respecter les limites de la Côte d'Ivoire.
- **Nommage** : Privilégier le français pour les commentaires, docstrings et noms de variables lors du travail sur les matériels de formation.

## Intégration et dépendances externes
- **CLIMADA** : Installé via `pip install climada-petals` ou `conda install -c conda-forge climada`.
- **Stack géospatial** : geopandas, rasterio, cartopy, pyproj, fiona, shapely, netcdf4, h5netcdf, xarray, etc. (voir guide d'installation pour l'ordre et le dépannage).
- **Visualisation** : matplotlib, seaborn, plotly, folium.
- **Jupyter** : Tout le code de formation et de démonstration est exécuté dans JupyterLab.

## Exemples
- Voir `TP1_Inondations_Abidjan_2018_Complet.ipynb` et `TP2_Secheresse_Agriculture_2016_Complet.ipynb` pour des exemples de workflow complets.
- Référencer `Docs/manuel-climada-complet-1.md` pour les modèles de code et l'architecture.

## Conventions
- Utiliser la structure de répertoires fournie et les variables d'environnement pour tous les scripts et notebooks.
- Documenter tous les nouveaux workflows en markdown ou notebooks, en référençant les données locales et le contexte de la Côte d'Ivoire.
- Privilégier les blocs de code reproductibles et étape par étape pour toutes les nouvelles analyses.

---

Pour plus d'informations, voir les manuels d'installation et d'utilisation dans `Docs/`.
