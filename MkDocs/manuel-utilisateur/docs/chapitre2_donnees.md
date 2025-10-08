# **Chapitre 2 : Les Données d'Entrée - Le Cœur de l'Analyse**

La qualité de votre analyse dépend directement de la qualité de vos données. La stratégie recommandée est de **commencer avec des données mondiales pour construire rapidement un premier modèle, puis de l'affiner itérativement avec des données nationales plus précises.**

---

## **2.1 Tableau Récapitulatif des Sources de Données**

| **Type de Donnée**            | **Sources Internationales (Bon pour commencer)**                                                           | **Sources Nationales (Essentiel pour la précision)**                                                                                                        |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Aléa (Pluie, Temp., etc.)** | Données satellitaires (CHIRPS, NASA GPM), Topographie (SRTM), Modèles globaux (Aqueduct Flood Tool, ERA5). | **SODEXAM** (stations météo), **Direction des Ressources en Eau**, **ANADER**, **Centre de Recherches Océanologiques (CRO)**.                               |
| **Exposition (Actifs, Pop.)** | OpenStreetMap (OSM), WorldPop, Global Human Settlement Layer (GHSL).                                       | **Institut National de la Statistique (INS)** (RGPH), **BNETD**, **Cadastre**, **Ministère de l'Agriculture**, **Ministère de l'Équipement**.               |
| **Vulnérabilité (%)**         | Bibliothèque de fonctions de dommage de CLIMADA, Littérature scientifique internationale.                  | **Expertise locale indispensable :** **CNRA** (agronomie), **CRO** (géomorphologie), ingénieurs civils, assureurs, rapports post-catastrophe de l'**ONPC**. |

---

## **2.2 La Hiérarchie des Données : du Global au Local**

La bonne pratique consiste à toujours privilégier les données locales, qui sont plus précises. Cependant, les données globales sont très utiles pour obtenir rapidement une première estimation ou lorsque les données locales ne sont pas disponibles.

### **📊 Niveau 1 (Optimal) : Données Nationales**

- **Sources :** INS, SODEXAM, BNETD, CNRA, CRO, Ministères sectoriels
- **Avantages :**
  - Haute précision spatiale et temporelle
  - Calibrées pour le contexte ivoirien
  - Crédibilité institutionnelle forte
  - Validation terrain disponible
- **Défis :**
  - Disponibilité parfois limitée
  - Formats hétérogènes
  - Procédures d'accès à clarifier
  - Nécessité de conventions de partenariat

### **🌍 Niveau 2 (Bon pour démarrer) : Données Globales**

- **Sources :** OpenStreetMap, WorldPop, CHIRPS, ERA5, bases de données de la Banque Mondiale
- **Avantages :**
  - Facilement accessibles (téléchargement libre)
  - Couverture mondiale complète
  - Format standardisé (GeoTIFF, NetCDF)
  - Documentation exhaustive
- **Défis :**
  - Moins précises localement
  - Peuvent ne pas capturer les spécificités du terrain
  - Résolution spatiale parfois insuffisante
  - Décalage temporel possible

---

## **2.3 Détail des Sources par Type de Données**

### **🌧️ Données d'Aléa Climatique**

#### **Sources Internationales**

- **CHIRPS** (Climate Hazards Group InfraRed Precipitation with Station data)

  - Résolution : 5 km
  - Période : 1981 - présent
  - Accès : [https://www.chc.ucsb.edu/data/chirps](https://www.chc.ucsb.edu/data/chirps)

- **NASA GPM** (Global Precipitation Measurement)

  - Résolution : 10 km
  - Fréquence : Toutes les 30 minutes
  - Accès : [https://gpm.nasa.gov/](https://gpm.nasa.gov/)

- **ERA5** (ECMWF Reanalysis v5)

  - Variables : Température, précipitation, vent, humidité
  - Résolution : 30 km
  - Accès : [https://cds.climate.copernicus.eu/](https://cds.climate.copernicus.eu/)

- **SRTM** (Shuttle Radar Topography Mission)
  - Modèle numérique de terrain
  - Résolution : 30 m ou 90 m
  - Essentiel pour modélisation inondations

#### **Sources Nationales Prioritaires**

- **SODEXAM** : Données de 20+ stations météo en Côte d'Ivoire

  - Données historiques depuis 1960
  - Paramètres : Pluie, température, vent, humidité
  - Contact : <span style="color:blue;">info@sodexam.ci</span>

- **Direction des Ressources en Eau (DRE)** :

  - Données hydrologiques (débits des rivières)
  - Cartes d'inondation historiques

- **ANADER** :
  - Données agro-climatiques
  - Suivi des campagnes agricoles

### **🏘️ Données d'Exposition Économique**

#### **Sources Internationales**

- **OpenStreetMap (OSM)**

  - Bâtiments, routes, infrastructures
  - Données contributives, gratuit
  - Qualité variable selon les zones
  - Accès : [https://www.openstreetmap.org/](https://www.openstreetmap.org/)

- **WorldPop**

  - Densité de population
  - Résolution : 100 m
  - Accès : [https://www.worldpop.org/](https://www.worldpop.org/)

- **Global Human Settlement Layer (GHSL)**
  - Empreinte urbaine
  - Données de bâti
  - Accès : [https://ghsl.jrc.ec.europa.eu/](https://ghsl.jrc.ec.europa.eu/)

#### **Sources Nationales Prioritaires**

- **Institut National de la Statistique (INS)**

  - RGPH (Recensement Général de la Population et de l'Habitat)
  - Données démographiques par localité
  - Données économiques sectorielles
  - PIB régional, revenus, emploi

- **BNETD** (Bureau National d'Études Techniques et de Développement)

  - Études d'impact économique
  - Cartes d'infrastructures
  - Évaluations de projets

- **Cadastre / Direction Générale des Impôts**

  - Valeur foncière et immobilière
  - Propriétés bâties et non bâties

- **Ministère de l'Agriculture**
  - Superficies cultivées par culture
  - Productions agricoles régionales
  - Valeur de la production

### **📉 Données de Vulnérabilité**

#### **Sources Internationales**

- **Bibliothèque CLIMADA**

  - Fonctions de dommage pré-calibrées
  - Courbes pour différents types d'actifs
  - Basées sur littérature scientifique

- **Littérature Scientifique**
  - Articles peer-reviewed
  - Rapports techniques internationaux (Banque Mondiale, UN-ISDR)

#### **Sources Nationales Prioritaires (INDISPENSABLES)**

- **CNRA** (Centre National de Recherche Agronomique)

  - Courbes de rendement vs stress hydrique
  - Vulnérabilité variétale

- **CRO** (Centre de Recherches Océanologiques)

  - Dynamique côtière
  - Taux d'érosion mesurés

- **Ingénieurs Civils / Bureau d'Études**

  - Résistance du bâti aux inondations
  - Standards de construction

- **Compagnies d'Assurance**

  - Sinistres historiques
  - Ratios dommage/valeur assurée

- **ONPC** (Office National de la Protection Civile)
  - Rapports post-catastrophe
  - Évaluations des dommages
  - Retours d'expérience

---

## **2.4 Préparation des Données (Pre-processing)**

Les données brutes sont rarement utilisables directement. Une étape de préparation est indispensable.

### **🧹 Nettoyage des Données**

- **Traiter les valeurs manquantes**

  - Interpolation spatiale ou temporelle
  - Imputation par moyenne/médiane
  - Suppression si trop de données manquantes

- **Corriger les erreurs**
  - Valeurs aberrantes (outliers)
  - Erreurs de saisie
  - Incohérences spatiales

### **🗺️ Homogénéisation Spatiale**

- **Système de Coordonnées de Référence (CRS)**

  - **Recommandé pour CI :** EPSG:4326 (WGS84 - lat/lon)
  - Reprojection si nécessaire avec QGIS ou Python
  - Vérifier l'alignement des couches

- **Résolution Spatiale**
  - Ré-échantillonnage (resampling) pour harmoniser
  - Méthodes : bilinéaire, nearest neighbor, cubic
  - Documenter la résolution finale choisie

### **💾 Conversion de Format**

- **Formats recommandés pour CLIMADA**

  - **Raster** : GeoTIFF, NetCDF, HDF5
  - **Vecteur** : GeoJSON, Shapefile, GeoPackage
  - **Tableaux** : CSV avec colonnes lat/lon

- **Outils de conversion**
  - GDAL (ligne de commande)
  - QGIS (interface graphique)
  - Python (geopandas, rasterio)

### **📝 Documentation des Données**

**ESSENTIEL :** Pour chaque jeu de données, documenter :

- 📍 Source et date d'acquisition
- 📊 Résolution spatiale et temporelle
- 🔧 Traitements appliqués
- ⚠️ Limites et incertitudes connues
- 👤 Responsable/contact

---

## **2.5 Recommandations Pratiques**

### **✅ Démarche Recommandée**

1. **Phase Pilote (1 mois)**

   - Utiliser données globales
   - Construire un premier prototype
   - Identifier les données nationales prioritaires

2. **Phase d'Amélioration (2-3 mois)**

   - Engager les partenariats institutionnels
   - Intégrer progressivement les données nationales
   - Valider avec experts sectoriels

3. **Phase de Production (continu)**
   - Automatiser l'acquisition des données
   - Mettre en place un système de mise à jour
   - Assurer la qualité continue

### **⚠️ Pièges à Éviter**

❌ **Ne pas attendre d'avoir toutes les données parfaites** avant de commencer
→ Commencer avec l'existant et améliorer itérativement

❌ **Ne pas mélanger des résolutions spatiales très différentes**
→ Harmoniser avant analyse

❌ **Ne pas oublier de documenter la provenance des données**
→ Traçabilité essentielle pour la crédibilité

❌ **Ne pas négliger la validation avec les experts locaux**
→ Les données doivent être cohérentes avec la réalité terrain

---

_La qualité des données détermine la qualité des résultats. Investir du temps dans cette phase est crucial pour produire des analyses crédibles et utilisables pour la décision._
