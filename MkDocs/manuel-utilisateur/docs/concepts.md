# Les Données d'Entrée - Le Cœur de l'Analyse

La qualité et la pertinence de vos analyses dépendent entièrement des données que vous utiliserez. Ce chapitre vous guide sur où trouver ces données et comment les préparer.

## 2.1 La Hiérarchie des Données : du Global au Local

La bonne pratique consiste à toujours privilégier les données locales, qui sont plus précises. Cependant, les données globales sont très utiles pour obtenir rapidement une première estimation ou lorsque les données locales ne sont pas disponibles.

### Niveau 1 (Optimal) : Données Nationales

- **Sources** : INS, SODEXAM, BNETD, CNRA, CRO, Ministères sectoriels.
- **Avantages** : Haute précision, calibrées pour le contexte ivoirien, crédibilité institutionnelle.
- **Défis** : Disponibilité, format, accès parfois difficile.

### Niveau 2 (Bon pour démarrer) : Données Globales

- **Sources** : OpenStreetMap, WorldPop, CHIRPS, ERA5, bases de données de la Banque Mondiale.
- **Avantages** : Facilement accessibles, couverture mondiale, format standardisé.
- **Défis** : Moins précises, peuvent ne pas capturer les spécificités locales.

## 2.2 Préparation des Données (Pre-processing)

Les données brutes sont rarement utilisables directement. Une étape de préparation est indispensable.

- **Nettoyage** : Traiter les valeurs manquantes, corriger les erreurs.
- **Homogénéisation** : S'assurer que toutes les données géospatiales utilisent le même système de coordonnées (CRS), généralement EPSG:4326.
- **Conversion de format** : Transformer les données (ex: fichiers Excel, Shapefiles) en formats optimisés pour CLIMADA (GeoTIFF, HDF5).
