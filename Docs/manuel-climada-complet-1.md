# Manuel d'utilisation CLIMADA
## Évaluation probabiliste des risques climatiques et impacts économiques
### Guide pratique pour les ingénieurs, statisticiens et économistes de la DGE - Côte d'Ivoire

---

## **Table des matières**

1. [Introduction à CLIMADA](#1-introduction-à-climada)
2. [Installation et configuration](#2-installation-et-configuration)
3. [Architecture et concepts fondamentaux](#3-architecture-et-concepts-fondamentaux)
4. [Module 1 : Gestion des aléas (Hazards)](#4-module-1--gestion-des-aléas-hazards)
5. [Module 2 : Modélisation de l'exposition (Exposures)](#5-module-2--modélisation-de-lexposition-exposures)
6. [Module 3 : Fonctions de vulnérabilité (Impact Functions)](#6-module-3--fonctions-de-vulnérabilité-impact-functions)
7. [Module 4 : Calcul des impacts économiques](#7-module-4--calcul-des-impacts-économiques)
8. [Applications spécifiques à la Côte d'Ivoire](#8-applications-spécifiques-à-la-côte-divoire)
9. [Mesures d'adaptation et analyse coût-bénéfice](#9-mesures-dadaptation-et-analyse-coût-bénéfice)
10. [Visualisation et export des résultats](#10-visualisation-et-export-des-résultats)
11. [Automatisation et scripts avancés](#11-automatisation-et-scripts-avancés)
12. [Intégration dans la planification économique](#12-intégration-dans-la-planification-économique)
13. [Dépannage et bonnes pratiques](#13-dépannage-et-bonnes-pratiques)
14. [Ressources et références](#14-ressources-et-références)

---

## **1. Introduction à CLIMADA**

### **1.1 Qu'est-ce que CLIMADA ?**

CLIMADA (CLIMate ADAptation) est une plateforme open-source développée par l'ETH Zurich pour l'évaluation probabiliste des risques climatiques et l'analyse économique des mesures d'adaptation. Cette plateforme permet de :

- **Quantifier les pertes économiques** liées aux événements climatiques extrêmes
- **Évaluer l'efficacité** des mesures d'adaptation 
- **Intégrer les projections climatiques** dans la planification économique
- **Fournir une base scientifique** pour les décisions d'investissement

### **1.2 Avantages pour la Côte d'Ivoire**

Pour le contexte ivoirien, CLIMADA présente plusieurs avantages stratégiques :

**Conformité internationale :**
- Réponse aux exigences du FMI (Facilité de Résilience et Durabilité)
- Standard reconnu par la Banque Mondiale et les bailleurs internationaux
- Méthodologie transparente et reproductible

**Adaptation au contexte local :**
- Possibilité d'intégrer des données SODEXAM et ONPC
- Calibration avec l'historique des sinistres ivoiriens
- Prise en compte des spécificités économiques sectorielles

**Support à la décision :**
- Quantification des risques budgétaires
- Priorisation des investissements d'adaptation
- Évaluation coût-bénéfice des mesures préventives

### **1.3 Architecture générale**

CLIMADA repose sur l'équation fondamentale du risque :

**Risque = Aléa × Exposition × Vulnérabilité**

Où :
- **Aléa** : Probabilité et intensité des événements climatiques
- **Exposition** : Valeur des actifs exposés aux aléas
- **Vulnérabilité** : Degré de dommage en fonction de l'intensité

---

## **2. Installation et configuration**

### **2.1 Prérequis système**

**Configuration matérielle minimale :**
- Processeur : Intel i5 ou équivalent AMD
- Mémoire RAM : 8 GB minimum, 16 GB recommandé
- Espace disque : 10 GB libres
- Connexion Internet stable pour téléchargements

**Systèmes d'exploitation supportés :**
- Windows 10/11 (64-bit)
- macOS 10.14 ou plus récent
- Linux Ubuntu 18.04+ / CentOS 7+

### **2.2 Installation de l'environnement Python**

#### **Étape 1 : Installation de Miniconda**

```bash
# Télécharger Miniconda (version adaptée à votre OS)
# Windows
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe

# Linux
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# macOS
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
```

#### **Étape 2 : Création de l'environnement CLIMADA**

```bash
# Création environnement dédié
conda create -n climada_env python=3.9

# Activation de l'environnement
conda activate climada_env

# Installation CLIMADA via conda-forge
conda install -c conda-forge climada

# Installation outils complémentaires
conda install -c conda-forge jupyter notebook ipykernel
conda install -c conda-forge matplotlib seaborn plotly
conda install -c conda-forge geopandas cartopy
pip install xlsxwriter openpyxl
```

#### **Étape 3 : Vérification de l'installation**

```python
# Test dans un terminal Python
python -c "import climada; print('CLIMADA version:', climada.__version__)"

# Test dans Jupyter
jupyter notebook
# Créer un nouveau notebook et exécuter :
import climada.engine as ce
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
print("Installation réussie !")
```

### **2.3 Configuration pour la Côte d'Ivoire**

#### **Structure des répertoires recommandée**

```
climada_ci/
├── data/
│   ├── hazards/          # Données d'aléas SODEXAM
│   ├── exposures/        # Données économiques et démographiques
│   ├── impacts/          # Données historiques de dommages ONPC
│   └── calibration/      # Paramètres calibrés localement
├── scripts/
│   ├── preprocessing/    # Scripts de préparation données
│   ├── analysis/         # Scripts d'analyse sectoriels
│   └── reporting/        # Scripts de génération rapports
├── results/
│   ├── maps/            # Cartes de risque
│   ├── tables/          # Tableaux de résultats
│   └── reports/         # Rapports automatisés
└── notebooks/           # Jupyter notebooks pédagogiques
```

#### **Configuration des chemins**

```python
# Fichier config_ci.py
import os
from pathlib import Path

# Chemins de base
BASE_DIR = Path("/path/to/climada_ci")
DATA_DIR = BASE_DIR / "data"
RESULTS_DIR = BASE_DIR / "results"

# Sources de données ivoiriennes
SODEXAM_API = "http://api.sodexam.ci"  # À adapter selon API réelle
ONPC_DATABASE = DATA_DIR / "impacts" / "onpc_disasters.csv"
DGSTATS_DATA = DATA_DIR / "exposures" / "economic_sectors.shp"

# Paramètres par défaut Côte d'Ivoire
CI_BOUNDS = {
    'min_lat': 4.0, 'max_lat': 10.5,
    'min_lon': -8.5, 'max_lon': -2.5
}

# Secteurs économiques prioritaires
PRIORITY_SECTORS = [
    'agriculture', 'industry', 'services', 
    'infrastructure', 'residential'
]
```

---

## **3. Architecture et concepts fondamentaux**

### **3.1 Les trois piliers de CLIMADA**

#### **3.1.1 Hazard (Aléa)**
L'objet `Hazard` contient les événements climatiques avec leurs caractéristiques :

```python
from climada.hazard import Hazard

# Structure d'un hazard
hazard = Hazard()
hazard.tag = {'haz_type': 'FL', 'description': 'Inondations Côte d\'Ivoire'}
hazard.units = 'm'  # Unité d'intensité (hauteur d'eau en mètres)
hazard.event_id = np.array([1, 2, 3, ...])  # Identifiants événements
hazard.frequency = np.array([0.1, 0.05, 0.02, ...])  # Fréquence annuelle
hazard.intensity = sparse_matrix  # Matrice intensité (événements × centroïdes)
hazard.centroids = centroids_grid  # Grille spatiale
```

**Attributs clés :**
- `tag` : Métadonnées (type d'aléa, description, source)
- `units` : Unité de mesure de l'intensité
- `event_id` : Identifiants uniques des événements
- `frequency` : Fréquence annuelle d'occurrence (probabilité)
- `intensity` : Matrice creuse intensité spatiale
- `centroids` : Points géographiques de la grille

#### **3.1.2 Exposures (Exposition)**
L'objet `Exposures` représente les actifs exposés aux aléas :

```python
from climada.entity import Exposures

# Structure d'une exposition
exposure = Exposures()
exposure.gdf = geopandas.GeoDataFrame({
    'value': [1e6, 5e5, 2e6, ...],        # Valeur économique (FCFA)
    'geometry': [Point(...), ...],        # Localisation géographique
    'category_id': [1, 2, 1, ...],        # Catégorie (résidentiel, commercial, etc.)
    'region_id': [101, 102, 101, ...],    # Code région administrative
    'impf_FL': [1, 1, 2, ...]            # ID fonction d'impact inondation
})
```

**Colonnes obligatoires :**
- `value` : Valeur économique de l'actif
- `geometry` : Coordonnées géographiques (Point Shapely)
- `impf_{HAZ}` : Identifiant fonction d'impact pour chaque type d'aléa

#### **3.1.3 Impact Functions (Fonctions de vulnérabilité)**
Les fonctions d'impact relient l'intensité de l'aléa aux dommages :

```python
from climada.entity import ImpactFunc, ImpactFuncSet

# Création fonction d'impact
impact_func = ImpactFunc()
impact_func.id = 1
impact_func.name = 'Résidentiel_inondation_CI'
impact_func.intensity_unit = 'm'
impact_func.haz_type = 'FL'

# Définition courbe dommage (piecewise linear)
intensities = [0, 0.5, 1.0, 2.0, 3.0]  # Hauteur eau (m)
mdd = [0, 0.1, 0.3, 0.6, 0.8]          # Mean Damage Degree
paa = [0, 0.8, 1.0, 1.0, 1.0]          # Percentage of Affected Assets

impact_func.intensity = np.array(intensities)
impact_func.mdd = np.array(mdd)
impact_func.paa = np.array(paa)
```

### **3.2 Workflow de calcul d'impact**

#### **Processus standard**
1. **Chargement/création des données** (Hazard, Exposures, Impact Functions)
2. **Appariement spatial** entre centroïdes et expositions
3. **Calcul des dommages** pour chaque événement et actif
4. **Agrégation** des résultats par région/secteur
5. **Analyse statistique** (moyennes, percentiles, courbes de risque)

#### **Code type**
```python
from climada.engine import ImpactCalc

# Calcul d'impact
impact_calc = ImpactCalc(
    exposures=exposure,
    impfset=impact_func_set,
    hazard=hazard
)
impact = impact_calc.impact()

# Résultats principaux
print(f"Perte annuelle moyenne : {impact.aai_agg:.0f} FCFA")
print(f"Perte maximale probable : {impact.impact_at_reg().max():.0f} FCFA")
```

---

## **4. Module 1 : Gestion des aléas (Hazards)**

### **4.1 Types d'aléas prioritaires pour la Côte d'Ivoire**

#### **4.1.1 Inondations côtières et urbaines (FL)**

Les inondations constituent le principal risque climatique en Côte d'Ivoire, particulièrement dans les zones urbaines côtières.

**Sources de données :**
- **SODEXAM** : Données pluviométriques historiques (1960-2024)
- **IRD** : Modèles hydrologiques régionaux
- **Copernicus** : Données satellite précipitations (GPM, TRMM)

**Exemple d'implémentation :**

```python
import pandas as pd
import numpy as np
from climada.hazard import Hazard
from climada.util.coordinates import get_grid_points

def create_flood_hazard_abidjan():
    """
    Créer un hazard inondation pour la région d'Abidjan
    basé sur données SODEXAM et projections hydrologiques
    """
    
    # 1. Définition grille spatiale Abidjan
    bounds = {
        'min_lat': 5.0, 'max_lat': 5.6,
        'min_lon': -4.2, 'max_lon': -3.8
    }
    
    centroids = get_grid_points(
        bounds['min_lat'], bounds['min_lon'],
        bounds['max_lat'], bounds['max_lon'],
        res_km=1  # Résolution 1 km
    )
    
    # 2. Chargement données historiques SODEXAM
    rainfall_data = pd.read_csv('data/sodexam_rainfall_abidjan_1980_2024.csv')
    
    # 3. Identification événements extrêmes (>percentile 95)
    threshold_95 = rainfall_data['daily_rain'].quantile(0.95)
    extreme_events = rainfall_data[
        rainfall_data['daily_rain'] > threshold_95
    ].copy()
    
    # 4. Modèle simple pluie → hauteur d'eau
    # Calibré avec données ONPC sur inondations historiques
    def rainfall_to_flood_depth(rainfall_mm, drainage_capacity=50):
        """
        Modèle simple: hauteur inondation = excès pluie / drainage
        """
        excess_rain = max(0, rainfall_mm - drainage_capacity)
        # Coefficient empirique calibré Abidjan
        flood_depth = excess_rain * 0.015  # mm → m
        return min(flood_depth, 3.0)  # Limite physique 3m
    
    # 5. Calcul intensités pour chaque événement
    n_events = len(extreme_events)
    n_centroids = len(centroids)
    
    intensity_matrix = np.zeros((n_events, n_centroids))
    
    for i, (idx, event) in enumerate(extreme_events.iterrows()):
        base_depth = rainfall_to_flood_depth(event['daily_rain'])
        
        # Variation spatiale selon topographie et drainage
        for j, centroid in enumerate(centroids):
            # Facteur topographique (plus bas = plus inondé)
            topo_factor = get_elevation_factor(centroid)
            # Facteur drainage urbain
            drainage_factor = get_drainage_factor(centroid)
            
            intensity_matrix[i, j] = base_depth * topo_factor * drainage_factor
    
    # 6. Calcul fréquences (méthode POT - Peaks Over Threshold)
    frequencies = compute_frequencies_pot(extreme_events, threshold_95)
    
    # 7. Construction objet Hazard
    hazard = Hazard()
    hazard.tag = {
        'haz_type': 'FL',
        'description': 'Inondations urbaines Abidjan',
        'file_name': 'flood_abidjan_sodexam_2024.hdf5'
    }
    hazard.units = 'm'
    hazard.centroids.set_lat_lon(
        centroids[:, 1], centroids[:, 0]  # lat, lon
    )
    hazard.event_id = np.arange(1, n_events + 1)
    hazard.frequency = frequencies
    hazard.intensity = sparse.csr_matrix(intensity_matrix)
    hazard.date = pd.to_datetime(extreme_events['date'])
    
    # 8. Validation et sauvegarde
    hazard.check()
    hazard.write_hdf5('data/hazards/flood_abidjan_historical.hdf5')
    
    return hazard

# Fonctions auxiliaires
def get_elevation_factor(centroid):
    """Facteur topographique basé sur MNT"""
    # À implémenter avec DEM SRTM ou équivalent
    # Facteur [0.5, 2.0] selon altitude relative
    pass

def get_drainage_factor(centroid):
    """Facteur capacité drainage selon urbanisation"""
    # À implémenter avec données OSM ou urbanisation
    # Facteur [0.5, 1.5] selon densité infrastructure
    pass

def compute_frequencies_pot(events, threshold):
    """Calcul fréquences méthode Peaks Over Threshold"""
    # Distribution généralisée de Pareto pour extrêmes
    from scipy.stats import genpareto
    
    exceedances = events['daily_rain'] - threshold
    params = genpareto.fit(exceedances)
    
    # Fréquences annuelles
    annual_rate = len(events) / (events['date'].dt.year.max() - 
                                events['date'].dt.year.min())
    
    frequencies = []
    for excess in exceedances:
        prob_exceed = 1 - genpareto.cdf(excess, *params)
        frequency = annual_rate * prob_exceed
        frequencies.append(frequency)
    
    return np.array(frequencies)
```

#### **4.1.2 Sécheresses agricoles (DR)**

Les sécheresses affectent particulièrement les zones agricoles du nord et centre du pays.

```python
def create_drought_hazard_northern_ci():
    """
    Créer hazard sécheresse pour zones agricoles nord CI
    Basé sur indice SPI (Standardized Precipitation Index)
    """
    
    # 1. Zone d'étude (régions Savanes, Zanzan, Vallée du Bandama)
    bounds = {
        'min_lat': 6.5, 'max_lat': 10.5,
        'min_lon': -7.5, 'max_lon': -2.5
    }
    
    centroids = get_grid_points(
        bounds['min_lat'], bounds['min_lon'],
        bounds['max_lat'], bounds['max_lon'],
        res_km=5  # Résolution 5 km pour zone rurale
    )
    
    # 2. Calcul SPI à partir données SODEXAM
    rainfall_monthly = pd.read_csv('data/sodexam_monthly_rainfall_north.csv')
    
    def calculate_spi(rainfall_series, window=3):
        """
        Calcul Standardized Precipitation Index
        window: période accumulation (mois)
        """
        from scipy.stats import gamma
        
        # Accumulation sur fenêtre glissante
        rolling_sum = rainfall_series.rolling(window=window).sum()
        
        # Ajustement distribution gamma
        valid_data = rolling_sum.dropna()
        alpha, loc, beta = gamma.fit(valid_data)
        
        # Transformation vers SPI
        cdf_values = gamma.cdf(valid_data, alpha, loc, beta)
        from scipy.stats import norm
        spi_values = norm.ppf(cdf_values)
        
        return spi_values
    
    # 3. Identification épisodes sécheresse (SPI < -1.0)
    spi_3m = calculate_spi(rainfall_monthly['precipitation'], window=3)
    drought_events = spi_3m[spi_3m < -1.0]
    
    # 4. Classification intensité sécheresse
    def classify_drought_intensity(spi):
        """Classification intensité selon SPI"""
        if spi >= -1.0:
            return 0  # Pas de sécheresse
        elif spi >= -1.5:
            return 1  # Sécheresse modérée
        elif spi >= -2.0:
            return 2  # Sécheresse sévère
        else:
            return 3  # Sécheresse extrême
    
    # 5. Construction matrice intensité
    # Intensité = classe sécheresse (0-3)
    n_events = len(drought_events)
    n_centroids = len(centroids)
    
    intensity_matrix = np.zeros((n_events, n_centroids))
    
    for i, spi_val in enumerate(drought_events):
        intensity = classify_drought_intensity(spi_val)
        # Variation spatiale selon zone climatique
        for j, centroid in enumerate(centroids):
            zone_factor = get_climate_zone_factor(centroid)
            intensity_matrix[i, j] = intensity * zone_factor
    
    # 6. Fréquences basées sur analyse historique
    return_periods = [2, 5, 10, 20, 50]  # années
    frequencies = [1/rp for rp in return_periods]
    
    # 7. Objet Hazard sécheresse
    hazard = Hazard()
    hazard.tag = {
        'haz_type': 'DR',
        'description': 'Sécheresses agricoles Nord Côte d\'Ivoire',
        'file_name': 'drought_northern_ci.hdf5'
    }
    hazard.units = 'SPI'
    hazard.centroids.set_lat_lon(
        centroids[:, 1], centroids[:, 0]
    )
    hazard.event_id = np.arange(1, n_events + 1)
    hazard.frequency = np.tile(frequencies, n_events // len(frequencies) + 1)[:n_events]
    hazard.intensity = sparse.csr_matrix(intensity_matrix)
    
    return hazard
```

#### **4.1.3 Cyclones tropicaux (TC)**

Bien que rares, les cyclones peuvent affecter la côte ivoirienne.

```python
def create_tropical_cyclone_hazard_ci():
    """
    Hazard cyclones tropicaux pour côte CI
    Basé sur données IBTrACS et modèles de vent
    """
    
    # Utilisation données IBTrACS pour Atlantique tropical
    from climada.hazard import TCTracks
    
    # 1. Chargement pistes cycloniques historiques
    tracks = TCTracks()
    tracks.read_ibtracs_netcdf(
        'data/IBTrACS.ALL.v04r00.nc',
        basin='NA'  # North Atlantic
    )
    
    # 2. Sélection cyclones passant près CI (rayon 500 km)
    ci_center = (7.5, -5.5)  # Centre approximatif CI
    
    tracks_near_ci = tracks.select(
        method='dist_to_coast',
        country_names=['Côte d\'Ivoire'],
        dist_threshold=500  # km
    )
    
    # 3. Génération champ de vent
    from climada.hazard import TropCyclone
    
    hazard = TropCyclone()
    hazard.set_from_tracks(
        tracks_near_ci,
        centroids_kwargs={
            'country_names': ['Côte d\'Ivoire'],
            'res_km': 2
        }
    )
    
    return hazard
```

### **4.2 Intégration de données locales**

#### **4.2.1 Interface avec SODEXAM**

```python
class SODEXAMDataLoader:
    """Interface pour données météorologiques SODEXAM"""
    
    def __init__(self, api_url="http://api.sodexam.ci"):
        self.api_url = api_url
        self.stations = self.load_stations()
    
    def load_stations(self):
        """Chargement liste stations SODEXAM"""
        stations = {
            'ABIDJAN_PORT': {'lat': 5.25, 'lon': -3.93, 'id': 'ABJ001'},
            'YAMOUSSOUKRO': {'lat': 6.90, 'lon': -5.28, 'id': 'YAM001'},
            'BOUAKE': {'lat': 7.69, 'lon': -5.03, 'id': 'BKE001'},
            'KORHOGO': {'lat': 9.46, 'lon': -5.63, 'id': 'KOR001'},
            'SAN_PEDRO': {'lat': 4.75, 'lon': -6.64, 'id': 'SPD001'},
            'TABOU': {'lat': 4.42, 'lon': -7.35, 'id': 'TAB001'},
            'BONDOUKOU': {'lat': 8.04, 'lon': -2.80, 'id': 'BDK001'},
            'FERKESSEDOUGOU': {'lat': 9.60, 'lon': -5.20, 'id': 'FER001'},
        }
        return stations
    
    def get_daily_rainfall(self, station_id, start_date, end_date):
        """Récupération données pluie quotidiennes"""
        # Implémentation selon API SODEXAM réelle
        pass
    
    def get_temperature_data(self, station_id, start_date, end_date):
        """Récupération données température"""
        pass
    
    def compute_drought_indices(self, station_id, period_years=30):
        """Calcul indices sécheresse (SPI, SPEI)"""
        pass
```

#### **4.2.2 Projections climatiques futures**

```python
def load_climate_projections_ci():
    """
    Chargement projections climatiques pour CI
    Sources : CORDEX Africa, CMIP6
    """
    
    projections = {}
    
    # Scénarios SSP (remplacent RCP)
    scenarios = ['ssp126', 'ssp245', 'ssp585']
    
    for scenario in scenarios:
        # Température
        temp_file = f'data/projections/temp_{scenario}_ci_2025_2100.nc'
        temp_data = xr.open_dataset(temp_file)
        
        # Précipitations  
        precip_file = f'data/projections/precip_{scenario}_ci_2025_2100.nc'
        precip_data = xr.open_dataset(precip_file)
        
        projections[scenario] = {
            'temperature': temp_data,
            'precipitation': precip_data
        }
    
    return projections

def generate_future_hazard_scenarios(baseline_hazard, projections, scenario='ssp245'):
    """
    Génération scénarios futurs basés sur projections climatiques
    """
    
    # Facteurs de changement climatique
    temp_change = projections[scenario]['temperature'].sel(
        time=slice('2041', '2070')
    ).mean() - projections[scenario]['temperature'].sel(
        time=slice('1981', '2010')
    ).mean()
    
    precip_change = (projections[scenario]['precipitation'].sel(
        time=slice('2041', '2070')
    ).mean() / projections[scenario]['precipitation'].sel(
        time=slice('1981', '2010')
    ).mean()) - 1
    
    # Application facteurs changement selon type aléa
    future_hazard = baseline_hazard.copy()
    
    if baseline_hazard.tag['haz_type'] == 'FL':
        # Inondations : augmentation intensité avec précipitations
        future_hazard.intensity *= (1 + precip_change * 0.5)
        # Augmentation fréquence
        future_hazard.frequency *= (1 + precip_change * 0.3)
        
    elif baseline_hazard.tag['haz_type'] == 'DR':
        # Sécheresses : augmentation avec température, baisse précipitations
        temp_factor = 1 + temp_change * 0.1
        precip_factor = 1 - precip_change * 0.2
        future_hazard.intensity *= temp_factor * precip_factor
    
    return future_hazard
```

### **4.3 Validation et qualité des données**

```python
def validate_hazard_quality(hazard):
    """
    Validation qualité et cohérence d'un objet Hazard
    """
    
    validation_report = {
        'valid': True,
        'warnings': [],
        'errors': []
    }
    
    # 1. Vérifications structure
    required_attrs = ['event_id', 'frequency', 'intensity', 'centroids']
    for attr in required_attrs:
        if not hasattr(hazard, attr):
            validation_report['errors'].append(f"Attribut manquant: {attr}")
            validation_report['valid'] = False
    
    # 2. Cohérence dimensions
    n_events = len(hazard.event_id)
    n_centroids = hazard.centroids.size
    
    if hazard.intensity.shape != (n_events, n_centroids):
        validation_report['errors'].append(
            f"Incohérence dimensions intensité: {hazard.intensity.shape} "
            f"≠ ({n_events}, {n_centroids})"
        )
    
    # 3. Validation fréquences
    if np.any(hazard.frequency < 0):
        validation_report['errors'].append("Fréquences négatives détectées")
    
    if np.any(hazard.frequency > 1):
        validation_report['warnings'].append(
            "Fréquences > 1 détectées (événements très fréquents)"
        )
    
    # 4. Validation intensités
    if np.any(hazard.intensity.data < 0):
        validation_report['warnings'].append("Intensités négatives détectées")
    
    # 5. Couverture géographique
    bounds_ci = {'min_lat': 4.0, 'max_lat': 10.5, 'min_lon': -8.5, 'max_lon': -2.5}
    
    lat_range = (hazard.centroids.lat.min(), hazard.centroids.lat.max())
    lon_range = (hazard.centroids.lon.min(), hazard.centroids.lon.max())
    
    if not (bounds_ci['min_lat'] <= lat_range[0] and lat_range[1] <= bounds_ci['max_lat']):
        validation_report['warnings'].append(
            f"Couverture latitude hors CI: {lat_range}"
        )
    
    return validation_report

# Exemple d'usage
hazard = create_flood_hazard_abidjan()
validation = validate_hazard_quality(hazard)

if validation['valid']:
    print("Hazard validé avec succès")
    if validation['warnings']:
        print("Avertissements:", validation['warnings'])
else:
    print("Erreurs de validation:", validation['errors'])
```

---

## **5. Module 2 : Modélisation de l'exposition (Exposures)**

### **5.1 Sources de données d'exposition pour la Côte d'Ivoire**

#### **5.1.1 Données démographiques et résidentielles**

```python
def create_residential_exposure_ci():
    """
    Création exposition résidentielle basée sur RGPH 2021
    et données de valeur immobilière
    """
    
    # 1. Chargement données RGPH 2021 par localité
    rgph_data = pd.read_csv('data/rgph_2021_localities.csv')
    
    # Structure attendue :
    # locality_id, name, region, population, households, lat, lon
    
    # 2. Estimation valeur logements par région
    regional_values = {
        'Abidjan': 15000000,      # FCFA/logement
        'Yamoussoukro': 8000000,
        'Bouaké': 6000000,
        'San-Pédro': 7000000,
        'Korhogo': 4500000,
        'Daloa': 5000000,
        'autres': 3500000
    }
    
    def estimate_housing_value(region, urban_rural, building_type='standard'):
        """Estimation valeur logement selon contexte"""
        base_value = regional_values.get(region, regional_values['autres'])
        
        # Facteur urbain/rural
        if urban_rural == 'urban':
            urban_factor = 1.5
        else:
            urban_factor = 0.7
        
        # Facteur type construction
        type_factors = {
            'traditional': 0.5,
            'standard': 1.0,
            'modern': 2.0,
            'luxury': 5.0
        }
        
        return base_value * urban_factor * type_factors[building_type]
    
    # 3. Construction GeoDataFrame exposition
    exposure_data = []
    
    for idx, locality in rgph_data.iterrows():
        n_households = locality['households']
        
        # Classification urbain/rural selon population
        urban_rural = 'urban' if locality['population'] > 10000 else 'rural'
        
        # Distribution types logements (à calibrer avec enquêtes)
        building_types = {
            'traditional': 0.4,
            'standard': 0.5,
            'modern': 0.08,
            'luxury': 0.02
        }
        
        for building_type, proportion in building_types.items():
            n_buildings = int(n_households * proportion)
            
            if n_buildings > 0:
                unit_value = estimate_housing_value(
                    locality['region'], urban_rural, building_type
                )
                
                exposure_data.append({
                    'value': unit_value * n_buildings,
                    'lat': locality['lat'],
                    'lon': locality['lon'],
                    'category_id': 1,  # Résidentiel
                    'region_id': locality['region_id'],
                    'building_type': building_type,
                    'urban_rural': urban_rural,
                    'impf_FL': 1,  # Fonction impact inondation
                    'impf_TC': 1,  # Fonction impact cyclone
                    'impf_DR': 0   # Pas d'impact direct sécheresse
                })
    
    # 4. Création GeoDataFrame
    gdf = gpd.GeoDataFrame(exposure_data)
    gdf['geometry'] = gpd.points_from_xy(gdf['lon'], gdf['lat'])
    gdf = gdf.drop(['lat', 'lon'], axis=1)
    
    # 5. Objet Exposures CLIMADA
    exposure = Exposures(gdf)
    exposure.tag = {
        'description': 'Exposition résidentielle Côte d\'Ivoire RGPH 2021',
        'category': 'residential'
    }
    exposure.value_unit = 'FCFA'
    exposure.check()
    
    return exposure
```

#### **5.1.2 Exposition agricole**

```python
def create_agricultural_exposure_ci():
    """
    Exposition agricole basée sur données ANADER et statistiques DGPE
    """
    
    # 1. Données cultures par région (DGPE/ANADER)
    agricultural_data = pd.read_csv('data/agricultural_statistics_2023.csv')
    
    # Structure : region, crop_type, area_ha, production_tons, value_fcfa_per_ha
    
    # 2. Géolocalisation zones agricoles
    # Utilisation land cover maps ou données GPS ANADER
    agricultural_zones = gpd.read_file('data/agricultural_zones_ci.shp')
    
    exposure_data = []
    
    # 3. Valeur par type de culture
    crop_values = {
        'cacao': 1200000,      # FCFA/ha (données DGPE)
        'cafe': 800000,
        'coton': 600000,
        'riz': 400000,
        'mais': 350000,
        'igname': 500000,
        'plantain': 450000,
        'palmier': 1500000,
        'hevea': 2000000
    }
    
    for idx, zone in agricultural_zones.iterrows():
        crop_type = zone['crop_type']
        area_ha = zone['area_ha']
        
        if crop_type in crop_values:
            total_value = area_ha * crop_values[crop_type]
            
            # Vulnérabilité selon type culture
            vulnerability_mapping = {
                'cacao': {'DR': 2, 'FL': 1, 'TC': 2},
                'cafe': {'DR': 2, 'FL': 1, 'TC': 2},
                'coton': {'DR': 3, 'FL': 2, 'TC': 2},
                'riz': {'DR': 1, 'FL': 3, 'TC': 1},
                'mais': {'DR': 2, 'FL': 2, 'TC': 2},
                'palmier': {'DR': 1, 'FL': 1, 'TC': 3},
                'hevea': {'DR': 2, 'FL': 1, 'TC': 3}
            }
            
            vulns = vulnerability_mapping.get(crop_type, {'DR': 1, 'FL': 1, 'TC': 1})
            
            exposure_data.append({
                'value': total_value,
                'geometry': zone['geometry'].centroid,
                'category_id': 2,  # Agricole
                'region_id': zone['region_id'],
                'crop_type': crop_type,
                'area_ha': area_ha,
                'impf_DR': vulns['DR'],
                'impf_FL': vulns['FL'],
                'impf_TC': vulns['TC']
            })
    
    # Construction exposition
    gdf = gpd.GeoDataFrame(exposure_data)
    exposure = Exposures(gdf)
    exposure.tag = {
        'description': 'Exposition agricole Côte d\'Ivoire',
        'category': 'agricultural'
    }
    exposure.value_unit = 'FCFA'
    
    return exposure
```

#### **5.1.3 Infrastructures stratégiques**

```python
def create_infrastructure_exposure_ci():
    """
    Exposition infrastructures critiques (ports, aéroports, routes, énergie)
    """
    
    infrastructure_data = []
    
    # 1. Ports
    ports = [
        {
            'name': 'Port Autonome Abidjan',
            'lat': 5.244, 'lon': -3.958,
            'value': 500e9,  # 500 milliards FCFA
            'type': 'port_commercial',
            'capacity_teu': 800000
        },
        {
            'name': 'Port San-Pédro',
            'lat': 4.747, 'lon': -6.636,
            'value': 150e9,
            'type': 'port_commercial',
            'capacity_teu': 100000
        },
        {
            'name': 'Port pêche Abidjan',
            'lat': 5.241, 'lon': -3.965,
            'value': 20e9,
            'type': 'port_peche'
        }
    ]
    
    for port in ports:
        infrastructure_data.append({
            'value': port['value'],
            'geometry': Point(port['lon'], port['lat']),
            'category_id': 3,  # Infrastructure
            'region_id': get_region_id(port['lat'], port['lon']),
            'infrastructure_type': port['type'],
            'name': port['name'],
            'impf_FL': 3,  # Très vulnérable inondations
            'impf_TC': 2,  # Vulnérable cyclones
            'impf_DR': 0   # Pas vulnérable sécheresse
        })
    
    # 2. Aéroports
    airports = [
        {
            'name': 'Aéroport Félix Houphouët-Boigny',
            'lat': 5.261, 'lon': -3.926,
            'value': 200e9,
            'passengers_annual': 2000000
        },
        {
            'name': 'Aéroport Bouaké',
            'lat': 7.738, 'lon': -5.073,
            'value': 50e9,
            'passengers_annual': 100000
        }
    ]
    
    for airport in airports:
        infrastructure_data.append({
            'value': airport['value'],
            'geometry': Point(airport['lon'], airport['lat']),
            'category_id': 3,
            'region_id': get_region_id(airport['lat'], airport['lon']),
            'infrastructure_type': 'airport',
            'name': airport['name'],
            'impf_FL': 2,
            'impf_TC': 3,
            'impf_DR': 0
        })
    
    # 3. Centrales électriques
    power_plants = [
        {
            'name': 'Barrage Kossou',
            'lat': 7.500, 'lon': -5.300,
            'value': 300e9,
            'capacity_mw': 174,
            'type': 'hydro'
        },
        {
            'name': 'Barrage Taabo',
            'lat': 6.233, 'lon': -5.100,
            'value': 150e9,
            'capacity_mw': 210,
            'type': 'hydro'
        },
        {
            'name': 'Centrale Azito',
            'lat': 5.328, 'lon': -4.015,
            'value': 400e9,
            'capacity_mw': 460,
            'type': 'gas'
        }
    ]
    
    for plant in power_plants:
        # Vulnérabilité selon type
        if plant['type'] == 'hydro':
            vulns = {'DR': 3, 'FL': 2, 'TC': 1}  # Très sensible sécheresse
        else:
            vulns = {'DR': 1, 'FL': 2, 'TC': 2}
        
        infrastructure_data.append({
            'value': plant['value'],
            'geometry': Point(plant['lon'], plant['lat']),
            'category_id': 3,
            'region_id': get_region_id(plant['lat'], plant['lon']),
            'infrastructure_type': f"power_{plant['type']}",
            'name': plant['name'],
            'capacity_mw': plant['capacity_mw'],
            'impf_DR': vulns['DR'],
            'impf_FL': vulns['FL'],
            'impf_TC': vulns['TC']
        })
    
    # 4. Routes principales
    roads_shapefile = gpd.read_file('data/roads_main_ci.shp')
    
    for idx, road in roads_shapefile.iterrows():
        if road['category'] in ['autoroute', 'nationale']:
            # Valeur route selon catégorie et longueur
            value_per_km = {
                'autoroute': 2e9,    # 2 milliards FCFA/km
                'nationale': 800e6   # 800 millions FCFA/km
            }
            
            length_km = road['geometry'].length / 1000  # Conversion m → km
            total_value = length_km * value_per_km[road['category']]
            
            infrastructure_data.append({
                'value': total_value,
                'geometry': road['geometry'].centroid,
                'category_id': 3,
                'region_id': road['region_id'],
                'infrastructure_type': f"road_{road['category']}",
                'name': road['name'],
                'length_km': length_km,
                'impf_FL': 2,  # Routes vulnérables inondations
                'impf_TC': 1,
                'impf_DR': 0
            })
    
    # Construction exposition infrastructure
    gdf = gpd.GeoDataFrame(infrastructure_data)
    exposure = Exposures(gdf)
    exposure.tag = {
        'description': 'Infrastructures critiques Côte d\'Ivoire',
        'category': 'infrastructure'
    }
    exposure.value_unit = 'FCFA'
    
    return exposure

def get_region_id(lat, lon):
    """Détermination région administrative selon coordonnées"""
    # À implémenter avec shapefile régions administratives
    pass
```

### **5.2 Intégration multi-sectorielle**

```python
def create_comprehensive_exposure_ci():
    """
    Exposition complète multi-sectorielle pour la Côte d'Ivoire
    """
    
    # 1. Chargement expositions sectorielles
    residential = create_residential_exposure_ci()
    agricultural = create_agricultural_exposure_ci()
    infrastructure = create_infrastructure_exposure_ci()
    
    # 2. Exposition commerciale/industrielle
    commercial = create_commercial_exposure_ci()
    
    # 3. Consolidation
    all_exposures = [residential, agricultural, infrastructure, commercial]
    
    # Concaténation des GeoDataFrames
    combined_gdf = pd.concat([exp.gdf for exp in all_exposures], 
                            ignore_index=True)
    
    # 4. Harmonisation des colonnes
    # Assurer compatibilité entre secteurs
    required_columns = ['value', 'geometry', 'category_id', 'region_id',
                       'impf_FL', 'impf_DR', 'impf_TC']
    
    for col in required_columns:
        if col not in combined_gdf.columns:
            combined_gdf[col] = 0
    
    # 5. Validation géographique
    # Vérifier que tous les points sont en Côte d'Ivoire
    ci_bounds = {'min_lat': 4.0, 'max_lat': 10.5, 'min_lon': -8.5, 'max_lon': -2.5}
    
    combined_gdf = combined_gdf[
        (combined_gdf.geometry.y >= ci_bounds['min_lat']) &
        (combined_gdf.geometry.y <= ci_bounds['max_lat']) &
        (combined_gdf.geometry.x >= ci_bounds['min_lon']) &
        (combined_gdf.geometry.x <= ci_bounds['max_lon'])
    ]
    
    # 6. Création exposition finale
    exposure = Exposures(combined_gdf)
    exposure.tag = {
        'description': 'Exposition économique complète Côte d\'Ivoire',
        'sectors': ['residential', 'agricultural', 'infrastructure', 'commercial'],
        'reference_year': 2024,
        'currency': 'FCFA'
    }
    exposure.value_unit = 'FCFA'
    
    # 7. Statistiques de validation
    sector_stats = combined_gdf.groupby('category_id')['value'].agg(['sum', 'count'])
    print("Statistiques par secteur:")
    print(sector_stats)
    
    total_value = combined_gdf['value'].sum()
    print(f"\nValeur totale exposée: {total_value:,.0f} FCFA")
    print(f"Soit environ {total_value/1e12:.1f} milliards FCFA")
    
    return exposure

def create_commercial_exposure_ci():
    """Exposition secteur commercial et industriel"""
    
    # Données entreprises selon registre commerce
    # et base données investissements DGPE
    
    commercial_zones = gpd.read_file('data/commercial_zones_ci.shp')
    
    exposure_data = []
    
    for idx, zone in commercial_zones.iterrows():
        zone_type = zone['type']  # commercial, industrial, service
        n_enterprises = zone['enterprises_count']
        
        # Valeur moyenne par entreprise selon type
        enterprise_values = {
            'commercial': 50e6,     # 50 millions FCFA
            'industrial': 500e6,    # 500 millions FCFA
            'service': 100e6,       # 100 millions FCFA
            'agro_processing': 200e6 # 200 millions FCFA
        }
        
        total_value = n_enterprises * enterprise_values.get(zone_type, 50e6)
        
        exposure_data.append({
            'value': total_value,
            'geometry': zone['geometry'].centroid,
            'category_id': 4,  # Commercial
            'region_id': zone['region_id'],
            'zone_type': zone_type,
            'enterprises_count': n_enterprises,
            'impf_FL': 2,
            'impf_TC': 2,
            'impf_DR': 1
        })
    
    gdf = gpd.GeoDataFrame(exposure_data)
    exposure = Exposures(gdf)
    
    return exposure
```

### **5.3 Désagrégation spatiale et temporelle**

```python
def disaggregate_exposure_spatially(exposure, target_resolution_km=1):
    """
    Désagrégation spatiale de l'exposition pour analyse fine
    """
    
    # 1. Création grille cible
    bounds = exposure.gdf.total_bounds  # min_x, min_y, max_x, max_y
    
    # Conversion résolution km en degrés (approximation)
    deg_per_km = 1 / 111.32  # à l'équateur
    res_deg = target_resolution_km * deg_per_km
    
    # Grille régulière
    x_coords = np.arange(bounds[0], bounds[2], res_deg)
    y_coords = np.arange(bounds[1], bounds[3], res_deg)
    
    grid_points = []
    for x in x_coords:
        for y in y_coords:
            grid_points.append(Point(x, y))
    
    # 2. Allocation valeur selon proximité ou densité
    disaggregated_data = []
    
    for grid_point in grid_points:
        # Recherche expositions dans rayon d'influence
        buffer_radius = res_deg * 1.5  # Zone d'influence
        buffer_geom = grid_point.buffer(buffer_radius)
        
        # Expositions intersectant
        intersecting = exposure.gdf[
            exposure.gdf.intersects(buffer_geom)
        ]
        
        if len(intersecting) > 0:
            # Répartition proportionnelle selon distance
            total_weight = 0
            weighted_value = 0
            
            for idx, exp in intersecting.iterrows():
                distance = grid_point.distance(exp.geometry)
                weight = 1 / (1 + distance)  # Poids inverse distance
                
                total_weight += weight
                weighted_value += exp['value'] * weight
            
            if total_weight > 0:
                allocated_value = weighted_value / total_weight
                
                # Éviter double comptage en divisant par nb points
                n_points_in_buffer = len(grid_points)  # Approximation
                adjusted_value = allocated_value / n_points_in_buffer
                
                disaggregated_data.append({
                    'value': adjusted_value,
                    'geometry': grid_point,
                    'category_id': intersecting['category_id'].mode()[0],
                    'region_id': intersecting['region_id'].mode()[0],
                    'impf_FL': intersecting['impf_FL'].mode()[0],
                    'impf_DR': intersecting['impf_DR'].mode()[0],
                    'impf_TC': intersecting['impf_TC'].mode()[0]
                })
    
    # 3. Construction exposition désagrégée
    disagg_gdf = gpd.GeoDataFrame(disaggregated_data)
    disagg_exposure = Exposures(disagg_gdf)
    
    return disagg_exposure

def project_exposure_future(exposure, growth_scenarios, target_year=2050):
    """
    Projection exposition future selon scénarios croissance économique
    """
    
    base_year = 2024
    years_projection = target_year - base_year
    
    # Taux de croissance par secteur et région
    growth_rates = {
        'residential': {
            'Abidjan': 0.04,      # 4% croissance annuelle
            'urban_other': 0.035,  # 3.5%
            'rural': 0.02         # 2%
        },
        'agricultural': {
            'cacao': 0.025,       # 2.5%
            'other_cash': 0.03,   # 3%
            'food_crops': 0.035   # 3.5%
        },
        'infrastructure': 0.045,  # 4.5%
        'commercial': 0.04        # 4%
    }
    
    future_exposure = exposure.copy()
    
    for idx, row in future_exposure.gdf.iterrows():
        category = row['category_id']
        
        # Détermination taux croissance
        if category == 1:  # Résidentiel
            region = row.get('urban_rural', 'urban_other')
            growth_rate = growth_rates['residential'].get(region, 0.03)
        elif category == 2:  # Agricole
            crop = row.get('crop_type', 'other_cash')
            if crop == 'cacao':
                growth_rate = growth_rates['agricultural']['cacao']
            elif crop in ['cafe', 'hevea', 'palmier']:
                growth_rate = growth_rates['agricultural']['other_cash']
            else:
                growth_rate = growth_rates['agricultural']['food_crops']
        elif category == 3:  # Infrastructure
            growth_rate = growth_rates['infrastructure']
        else:  # Commercial
            growth_rate = growth_rates['commercial']
        
        # Application croissance composée
        growth_factor = (1 + growth_rate) ** years_projection
        future_exposure.gdf.loc[idx, 'value'] *= growth_factor
    
    future_exposure.tag['projection_year'] = target_year
    future_exposure.tag['base_year'] = base_year
    
    return future_exposure
```

---

## **6. Module 3 : Fonctions de vulnérabilité (Impact Functions)**

### **6.1 Développement de fonctions adaptées au contexte ivoirien**

#### **6.1.1 Fonctions pour inondations urbaines**

```python
def create_flood_impact_functions_ci():
    """
    Fonctions d'impact inondation adaptées contexte ivoirien
    Basées sur études post-catastrophe et données assurance
    """
    
    impact_funcs = []
    
    # 1. Résidentiel urbain - Construction moderne
    impf_res_modern = ImpactFunc()
    impf_res_modern.id = 1
    impf_res_modern.name = 'Résidentiel_moderne_inondation_CI'
    impf_res_modern.intensity_unit = 'm'
    impf_res_modern.haz_type = 'FL'
    
    # Courbe calibrée avec données post-inondations Abidjan 2018-2022
    intensities = np.array([0, 0.2, 0.5, 1.0, 1.5, 2.0, 3.0])  # Hauteur eau (m)
    
    # Mean Damage Degree - basé sur évaluations post-sinistre ONPC
    mdd = np.array([0, 0.05, 0.15, 0.35, 0.55, 0.70, 0.85])
    
    # Percentage Affected Assets - basé sur données assurance
    paa = np.array([0, 0.7, 0.9, 1.0, 1.0, 1.0, 1.0])
    
    impf_res_modern.intensity = intensities
    impf_res_modern.mdd = mdd
    impf_res_modern.paa = paa
    impact_funcs.append(impf_res_modern)
    
    # 2. Résidentiel urbain - Construction traditionnelle
    impf_res_trad = ImpactFunc()
    impf_res_trad.id = 2
    impf_res_trad.name = 'Résidentiel_traditionnel_inondation_CI'
    impf_res_trad.intensity_unit = 'm'
    impf_res_trad.haz_type = 'FL'
    
    # Plus vulnérable que construction moderne
    mdd_trad = np.array([0, 0.1, 0.25, 0.5, 0.7, 0.85, 0.95])
    paa_trad = np.array([0, 0.8, 0.95, 1.0, 1.0, 1.0, 1.0])
    
    impf_res_trad.intensity = intensities
    impf_res_trad.mdd = mdd_trad
    impf_res_trad.paa = paa_trad
    impact_funcs.append(impf_res_trad)
    
    # 3. Commercial/Industriel
    impf_commercial = ImpactFunc()
    impf_commercial.id = 3
    impf_commercial.name = 'Commercial_inondation_CI'
    impf_commercial.intensity_unit = 'm'
    impf_res_trad.haz_type = 'FL'
    
    # Inclut pertes stock, équipement, interruption activité
    mdd_com = np.array([0, 0.15, 0.35, 0.6, 0.8, 0.9, 0.95])
    paa_com = np.array([0, 0.6, 0.85, 1.0, 1.0, 1.0, 1.0])
    
    impf_commercial.intensity = intensities
    impf_commercial.mdd = mdd_com
    impf_commercial.paa = paa_com
    impact_funcs.append(impf_commercial)
    
    # 4. Infrastructure portuaire
    impf_port = ImpactFunc()
    impf_port.id = 4
    impf_port.name = 'Infrastructure_portuaire_inondation_CI'
    impf_port.intensity_unit = 'm'
    impf_port.haz_type = 'FL'
    
    # Basé sur analyses vulnérabilité Port Autonome d'Abidjan
    intensities_port = np.array([0, 0.5, 1.0, 2.0, 3.0, 4.0])
    mdd_port = np.array([0, 0.1, 0.25, 0.5, 0.75, 0.9])
    paa_port = np.array([0, 0.3, 0.6, 0.9, 1.0, 1.0])
    
    impf_port.intensity = intensities_port
    impf_port.mdd = mdd_port
    impf_port.paa = paa_port
    impact_funcs.append(impf_port)
    
    return impact_funcs

def calibrate_flood_functions_with_historical_data():
    """
    Calibration fonctions inondation avec données historiques CI
    """
    
    # 1. Chargement données sinistres ONPC
    historical_damage = pd.read_csv('data/onpc_flood_damage_2010_2024.csv')
    
    # Structure attendue:
    # date, location, flood_depth_m, damage_amount_fcfa, building_type, affected_assets
    
    # 2. Préparation données calibration
    calibration_data = []
    
    for idx, event in historical_damage.iterrows():
        if pd.notna(event['flood_depth_m']) and pd.notna(event['damage_amount_fcfa']):
            # Calcul damage ratio observé
            total_exposed_value = estimate_exposed_value(
                event['location'], event['building_type']
            )
            
            if total_exposed_value > 0:
                damage_ratio = event['damage_amount_fcfa'] / total_exposed_value
                
                calibration_data.append({
                    'intensity': event['flood_depth_m'],
                    'damage_ratio': min(damage_ratio, 1.0),  # Cap à 100%
                    'building_type': event['building_type'],
                    'event_date': event['date']
                })
    
    calib_df = pd.DataFrame(calibration_data)
    
    # 3. Calibration par type de bâtiment
    building_types = calib_df['building_type'].unique()
    
    calibrated_functions = {}
    
    for building_type in building_types:
        type_data = calib_df[calib_df['building_type'] == building_type]
        
        if len(type_data) >= 5:  # Minimum points pour calibration
            # Régression polynomiale ou spline
            from scipy.interpolate import UnivariateSpline
            
            intensities = type_data['intensity'].values
            damages = type_data['damage_ratio'].values
            
            # Spline lissée
            spline = UnivariateSpline(intensities, damages, s=0.1)
            
            # Génération courbe calibrée
            intensity_range = np.linspace(0, intensities.max(), 20)
            damage_curve = np.maximum(0, spline(intensity_range))
            damage_curve = np.minimum(1, damage_curve)  # Cap 0-1
            
            calibrated_functions[building_type] = {
                'intensity': intensity_range,
                'damage': damage_curve,
                'n_observations': len(type_data),
                'r_squared': calculate_r_squared(type_data, spline)
            }
    
    return calibrated_functions

def estimate_exposed_value(location, building_type):
    """Estimation valeur exposée pour calibration"""
    # Implémentation basée sur données immobilières locales
    pass

def calculate_r_squared(data, fitted_function):
    """Calcul R² pour validation calibration"""
    observed = data['damage_ratio'].values
    predicted = fitted_function(data['intensity'].values)
    
    ss_res = np.sum((observed - predicted) ** 2)
    ss_tot = np.sum((observed - np.mean(observed)) ** 2)
    
    return 1 - (ss_res / ss_tot)
```

#### **6.1.2 Fonctions pour sécheresses agricoles**

```python
def create_drought_impact_functions_agriculture_ci():
    """
    Fonctions d'impact sécheresse pour agriculture ivoirienne
    Basées sur données ANADER et recherche agronomique
    """
    
    impact_funcs = []
    
    # 1. Cacao - Principal produit d'exportation
    impf_cacao = ImpactFunc()
    impf_cacao.id = 1
    impf_cacao.name = 'Cacao_sécheresse_CI'
    impf_cacao.intensity_unit = 'SPI'  # Standardized Precipitation Index
    impf_cacao.haz_type = 'DR'
    
    # Basé sur études CNRA (Centre National Recherche Agronomique)
    # et données rendement vs pluviométrie 1990-2023
    
    # SPI : -4 (sécheresse extrême) à 0 (normal)
    spi_values = np.array([-4, -3, -2.5, -2, -1.5, -1, -0.5, 0])
    
    # Perte rendement cacao selon intensité sécheresse
    # Calibré avec données production DGPE/ANADER
    yield_loss = np.array([0.9, 0.8, 0.7, 0.55, 0.35, 0.2, 0.1, 0])
    
    # Proportion plantations affectées
    affected_proportion = np.array([1.0, 1.0, 0.95, 0.9, 0.8, 0.6, 0.3, 0])
    
    # Conversion SPI négatif vers intensité positive
    drought_intensity = -spi_values
    drought_intensity = np.flip(drought_intensity)
    yield_loss = np.flip(yield_loss)
    affected_proportion = np.flip(affected_proportion)
    
    impf_cacao.intensity = drought_intensity
    impf_cacao.mdd = yield_loss
    impf_cacao.paa = affected_proportion
    impact_funcs.append(impf_cacao)
    
    # 2. Coton - Zone nord
    impf_coton = ImpactFunc()
    impf_coton.id = 2
    impf_coton.name = 'Coton_sécheresse_CI'
    impf_coton.intensity_unit = 'SPI'
    impf_coton.haz_type = 'DR'
    
    # Coton plus résistant que cacao mais sensible période critique
    yield_loss_coton = np.array([0.85, 0.7, 0.55, 0.4, 0.25, 0.15, 0.05, 0])
    affected_prop_coton = np.array([1.0, 0.95, 0.9, 0.8, 0.7, 0.5, 0.2, 0])
    
    impf_coton.intensity = drought_intensity
    impf_coton.mdd = np.flip(yield_loss_coton)
    impf_coton.paa = np.flip(affected_prop_coton)
    impact_funcs.append(impf_coton)
    
    # 3. Cultures vivrières (maïs, igname, riz pluvial)
    impf_vivriere = ImpactFunc()
    impf_vivriere.id = 3
    impf_vivriere.name = 'Cultures_vivrières_sécheresse_CI'
    impf_vivriere.intensity_unit = 'SPI'
    impf_vivriere.haz_type = 'DR'
    
    # Sensibilité variable selon type culture et période
    yield_loss_vivr = np.array([0.8, 0.65, 0.5, 0.35, 0.22, 0.12, 0.05, 0])
    affected_prop_vivr = np.array([1.0, 0.9, 0.8, 0.7, 0.6, 0.4, 0.2, 0])
    
    impf_vivriere.intensity = drought_intensity
    impf_vivriere.mdd = np.flip(yield_loss_vivr)
    impf_vivriere.paa = np.flip(affected_prop_vivr)
    impact_funcs.append(impf_vivriere)
    
    # 4. Palmier à huile
    impf_palmier = ImpactFunc()
    impf_palmier.id = 4
    impf_palmier.name = 'Palmier_huile_sécheresse_CI'
    impf_palmier.intensity_unit = 'SPI'
    impf_palmier.haz_type = 'DR'
    
    # Palmier relativement résistant sécheresse courte
    # Mais impact cumulatif sur plusieurs années
    yield_loss_palm = np.array([0.6, 0.45, 0.3, 0.2, 0.12, 0.06, 0.02, 0])
    affected_prop_palm = np.array([0.9, 0.8, 0.7, 0.6, 0.4, 0.25, 0.1, 0])
    
    impf_palmier.intensity = drought_intensity
    impf_palmier.mdd = np.flip(yield_loss_palm)
    impf_palmier.paa = np.flip(affected_prop_palm)
    impact_funcs.append(impf_palmier)
    
    return impact_funcs

def incorporate_seasonal_vulnerability():
    """
    Intégration vulnérabilité saisonnière dans fonctions sécheresse
    """
    
    # Périodes critiques par culture
    critical_periods = {
        'cacao': {
            'months': [11, 12, 1, 2, 3],  # Saison sèche
            'vulnerability_factor': 1.5
        },
        'coton': {
            'months': [7, 8, 9],  # Floraison
            'vulnerability_factor': 2.0
        },
        'mais': {
            'months': [6, 7, 8],  # Croissance
            'vulnerability_factor': 1.8
        },
        'riz': {
            'months': [8, 9, 10],  # Maturation
            'vulnerability_factor': 1.6
        }
    }
    
    def adjust_impact_function_seasonal(impact_func, crop_type, event_month):
        """Ajustement fonction selon période événement"""
        
        if crop_type in critical_periods:
            critical_months = critical_periods[crop_type]['months']
            factor = critical_periods[crop_type]['vulnerability_factor']
            
            if event_month in critical_months:
                # Augmentation vulnérabilité période critique
                adjusted_func = impact_func.copy()
                adjusted_func.mdd = np.minimum(
                    adjusted_func.mdd * factor, 
                    1.0  # Cap à 100%
                )
                return adjusted_func
        
        return impact_func
    
    return adjust_impact_function_seasonal

def validate_agricultural_functions_with_yield_data():
    """
    Validation fonctions agricoles avec données rendement historique
    """
    
    # 1. Chargement données rendement ANADER/DGPE
    yield_data = pd.read_csv('data/agricultural_yields_1990_2023.csv')
    
    # Structure: year, region, crop, yield_kg_ha, precipitation_mm, temperature_avg
    
    # 2. Calcul indices climatiques
    yield_data['spi_3m'] = calculate_spi_from_precipitation(
        yield_data['precipitation_mm']
    )
    
    # 3. Analyse corrélation rendement vs indices climatiques
    correlations = {}
    
    crops = yield_data['crop'].unique()
    
    for crop in crops:
        crop_data = yield_data[yield_data['crop'] == crop]
        
        # Calcul perte rendement relative
        mean_yield = crop_data['yield_kg_ha'].mean()
        crop_data['yield_loss'] = 1 - (crop_data['yield_kg_ha'] / mean_yield)
        crop_data['yield_loss'] = np.maximum(0, crop_data['yield_loss'])
        
        # Corrélation avec SPI
        correlation = np.corrcoef(
            crop_data['spi_3m'], 
            crop_data['yield_loss']
        )[0, 1]
        
        correlations[crop] = {
            'correlation_spi': correlation,
            'n_observations': len(crop_data),
            'mean_yield_kg_ha': mean_yield,
            'max_observed_loss': crop_data['yield_loss'].max()
        }
    
    return correlations

def calculate_spi_from_precipitation(precip_series, window=3):
    """Calcul SPI à partir série précipitations"""
    # Implémentation calcul SPI standard
    pass
```

#### **6.1.3 Fonctions pour cyclones tropicaux**

```python
def create_tropical_cyclone_impact_functions_ci():
    """
    Fonctions impact cyclones tropicaux adaptées Côte d'Ivoire
    Basées sur études régionales Afrique de l'Ouest
    """
    
    impact_funcs = []
    
    # 1. Résidentiel côtier - Construction moderne
    impf_res_modern_tc = ImpactFunc()
    impf_res_modern_tc.id = 1
    impf_res_modern_tc.name = 'Résidentiel_moderne_cyclone_CI'
    impf_res_modern_tc.intensity_unit = 'm/s'
    impf_res_modern_tc.haz_type = 'TC'
    
    # Vitesses vent (m/s) et dommages correspondants
    # Adaptées du modèle Emmanuel USA avec facteurs régionaux
    wind_speeds = np.array([0, 20, 25, 33, 42, 50, 58, 70])  # m/s
    
    # Dommages construction moderne béton/acier
    damage_modern = np.array([0, 0, 0.02, 0.1, 0.25, 0.5, 0.75, 0.95])
    affected_modern = np.array([0, 0, 0.1, 0.5, 0.8, 1.0, 1.0, 1.0])
    
    impf_res_modern_tc.intensity = wind_speeds
    impf_res_modern_tc.mdd = damage_modern
    impf_res_modern_tc.paa = affected_modern
    impact_funcs.append(impf_res_modern_tc)
    
    # 2. Résidentiel côtier - Construction traditionnelle
    impf_res_trad_tc = ImpactFunc()
    impf_res_trad_tc.id = 2
    impf_res_trad_tc.name = 'Résidentiel_traditionnel_cyclone_CI'
    impf_res_trad_tc.intensity_unit = 'm/s'
    impf_res_trad_tc.haz_type = 'TC'
    
    # Construction bois/terre plus vulnérable
    damage_trad = np.array([0, 0.05, 0.15, 0.35, 0.6, 0.8, 0.95, 1.0])
    affected_trad = np.array([0, 0.2, 0.4, 0.7, 0.9, 1.0, 1.0, 1.0])
    
    impf_res_trad_tc.intensity = wind_speeds
    impf_res_trad_tc.mdd = damage_trad
    impf_res_trad_tc.paa = affected_trad
    impact_funcs.append(impf_res_trad_tc)
    
    # 3. Infrastructure portuaire
    impf_port_tc = ImpactFunc()
    impf_port_tc.id = 3
    impf_port_tc.name = 'Infrastructure_portuaire_cyclone_CI'
    impf_port_tc.intensity_unit = 'm/s'
    impf_port_tc.haz_type = 'TC'
    
    # Grues portuaires, conteneurs, installations
    wind_speeds_port = np.array([0, 15, 25, 35, 45, 55, 70])
    damage_port = np.array([0, 0.01, 0.05, 0.2, 0.45, 0.7, 0.9])
    affected_port = np.array([0, 0.1, 0.3, 0.6, 0.8, 1.0, 1.0])
    
    impf_port_tc.intensity = wind_speeds_port
    impf_port_tc.mdd = damage_port
    impf_port_tc.paa = affected_port
    impact_funcs.append(impf_port_tc)
    
    # 4. Agriculture - Palmiers et plantations
    impf_agri_tc = ImpactFunc()
    impf_agri_tc.id = 4
    impf_agri_tc.name = 'Agriculture_plantations_cyclone_CI'
    impf_agri_tc.intensity_unit = 'm/s'
    impf_agri_tc.haz_type = 'TC'
    
    # Dommages arbres, défoliation, rupture branches
    damage_agri = np.array([0, 0, 0.1, 0.25, 0.45, 0.65, 0.8])
    affected_agri = np.array([0, 0.05, 0.2, 0.5, 0.8, 1.0, 1.0])
    
    impf_agri_tc.intensity = wind_speeds_port
    impf_agri_tc.mdd = damage_agri
    impf_agri_tc.paa = affected_agri
    impact_funcs.append(impf_agri_tc)
    
    return impact_funcs

def adapt_functions_for_coastal_exposure():
    """
    Adaptation fonctions selon distance côte et exposition marine
    """
    
    def coastal_vulnerability_factor(distance_to_coast_km):
        """
        Facteur vulnérabilité selon distance côte
        Plus proche = plus vulnérable (vent + surge)
        """
        if distance_to_coast_km <= 1:
            return 1.5  # Zone littorale directe
        elif distance_to_coast_km <= 5:
            return 1.3  # Zone côtière proche
        elif distance_to_coast_km <= 20:
            return 1.1  # Zone côtière
        else:
            return 1.0  # Zone intérieure
    
    def adjust_tc_function_coastal(impact_func, distance_to_coast):
        """Ajustement fonction selon exposition côtière"""
        
        coastal_factor = coastal_vulnerability_factor(distance_to_coast)
        
        adjusted_func = impact_func.copy()
        adjusted_func.mdd = np.minimum(
            adjusted_func.mdd * coastal_factor,
            1.0
        )
        
        return adjusted_func
    
    return adjust_tc_function_coastal
```

### **6.2 Ensemble de fonctions intégré**

```python
def create_comprehensive_impact_function_set_ci():
    """
    Ensemble complet de fonctions d'impact pour Côte d'Ivoire
    """
    
    # 1. Fonctions par type d'aléa
    flood_functions = create_flood_impact_functions_ci()
    drought_functions = create_drought_impact_functions_agriculture_ci()
    cyclone_functions = create_tropical_cyclone_impact_functions_ci()
    
    # 2. Consolidation dans ImpactFuncSet
    impact_func_set = ImpactFuncSet()
    
    # Ajout toutes les fonctions
    all_functions = flood_functions + drought_functions + cyclone_functions
    
    for func in all_functions:
        impact_func_set.append(func)
    
    # 3. Validation ensemble
    impact_func_set.check()
    
    # 4. Documentation et métadonnées
    impact_func_set.tag = {
        'description': 'Fonctions d\'impact Côte d\'Ivoire',
        'version': '1.0',
        'calibration_period': '1990-2024',
        'data_sources': ['ONPC', 'ANADER', 'SODEXAM', 'Assurances'],
        'hazards_covered': ['FL', 'DR', 'TC'],
        'sectors_covered': ['residential', 'agricultural', 'infrastructure', 'commercial']
    }
    
    # 5. Sauvegarde
    impact_func_set.write_hdf5('data/impact_functions/impact_func_set_ci.hdf5')
    
    return impact_func_set

def generate_uncertainty_bounds_impact_functions():
    """
    Génération bornes d'incertitude pour fonctions d'impact
    """
    
    # Facteurs d'incertitude selon type fonction
    uncertainty_factors = {
        'flood_residential': {'lower': 0.8, 'upper': 1.2},
        'flood_commercial': {'lower': 0.7, 'upper': 1.3},
        'drought_cacao': {'lower': 0.85, 'upper': 1.15},
        'drought_coton': {'lower': 0.75, 'upper': 1.25},
        'cyclone_all': {'lower': 0.6, 'upper': 1.4}
    }
    
    def create_uncertain_function_set(base_function_set, confidence_level=0.95):
        """
        Création ensemble fonctions avec bornes incertitude
        """
        
        lower_set = ImpactFuncSet()
        upper_set = ImpactFuncSet()
        
        for func in base_function_set:
            # Détermination type fonction
            func_type = determine_function_type(func)
            
            if func_type in uncertainty_factors:
                factors = uncertainty_factors[func_type]
                
                # Fonction borne inférieure
                lower_func = func.copy()
                lower_func.id = func.id + 1000  # Offset pour éviter conflits
                lower_func.name = func.name + '_lower'
                lower_func.mdd = func.mdd * factors['lower']
                lower_set.append(lower_func)
                
                # Fonction borne supérieure
                upper_func = func.copy()
                upper_func.id = func.id + 2000
                upper_func.name = func.name + '_upper'
                upper_func.mdd = func.mdd * factors['upper']
                upper_set.append(upper_func)
        
        return lower_set, upper_set
    
    return create_uncertain_function_set

def determine_function_type(impact_func):
    """Détermination type fonction pour application incertitude"""
    
    name = impact_func.name.lower()
    haz_type = impact_func.haz_type
    
    if 'résidentiel' in name and haz_type == 'FL':
        return 'flood_residential'
    elif 'commercial' in name and haz_type == 'FL':
        return 'flood_commercial'
    elif 'cacao' in name and haz_type == 'DR':
        return 'drought_cacao'
    elif 'coton' in name and haz_type == 'DR':
        return 'drought_coton'
    elif haz_type == 'TC':
        return 'cyclone_all'
    else:
        return 'unknown'
```

---

*Suite du manuel dans la partie 2...*