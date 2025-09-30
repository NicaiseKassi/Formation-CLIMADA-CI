# Présentation de Formation CLIMADA
## Évaluation probabiliste des risques climatiques et impacts économiques

### Formation destinée aux ingénieurs, statisticiens et économistes de la Direction Générale de l'Économie - Côte d'Ivoire

---

## **1. Contexte et justification**

### **Défi climatique pour la Côte d'Ivoire**
- **Impact économique estimé** : Réduction potentielle du PIB de 13% d'ici 2050 [24]
- **Secteurs vulnérables** : Cacao (26% de baisse des rendements), zones côtières, infrastructures
- **Obligation FMI** : Intégration des risques climatiques dans la Déclaration des Risques Budgétaires (DRB)

### **CLIMADA : L'outil de référence**
- Plateforme open-source développée par ETH Zurich [4]
- Utilisée par MeteoSwiss, Banque Mondiale, compagnies d'assurance [10]
- Modélisation probabiliste complète : aléa × exposition × vulnérabilité = risque

---

## **2. Objectifs pédagogiques**

### **Objectif général**
Maîtriser l'utilisation de CLIMADA pour quantifier les pertes économiques liées aux risques climatiques et intégrer ces analyses dans la planification macroéconomique.

### **Objectifs spécifiques**
1. **Installer et configurer** CLIMADA dans un environnement Python professionnel
2. **Modéliser les aléas** climatiques spécifiques à la Côte d'Ivoire
3. **Quantifier l'exposition** des actifs économiques stratégiques
4. **Développer des fonctions de vulnérabilité** adaptées au contexte local
5. **Calibrer les modèles** avec des données historiques ivoiriennes
6. **Évaluer les mesures d'adaptation** par analyse coût-bénéfice
7. **Intégrer les résultats** dans les outils de planification budgétaire

---

## **3. Méthodologie pédagogique**

### **Approche progressive**
- **30% théorie** : Concepts fondamentaux et méthodologie
- **50% pratique** : Travaux dirigés sur ordinateur
- **20% application** : Études de cas ivoiriennes réelles

### **Outils pédagogiques**
- **Jupyter Notebooks** interactifs avec exemples commentés
- **Données réelles** : SODEXAM, ONPC, statistiques économiques
- **Études de cas** : Inondations Abidjan, sécheresse Nord, érosion côtière
- **Projet fil rouge** : Évaluation complète d'un secteur économique

---

## **4. Programme détaillé**

### **JOUR 1 : Fondamentaux et installation**

#### **Matin : Concepts théoriques (3h)**
**Module 1.1 : Cadre conceptuel du risque climatique**
- Définitions : aléa, exposition, vulnérabilité, risque
- Approche probabiliste vs déterministe
- Exemples internationaux et applications en Côte d'Ivoire

**Module 1.2 : Introduction à CLIMADA**
- Architecture du logiciel (core vs petals)
- Workflow type : données → modélisation → résultats
- Avantages pour l'analyse économique

#### **Après-midi : Installation et prise en main (4h)**
**Module 1.3 : Configuration technique**
```bash
# Installation environnement
conda create -n climada_env -c conda-forge climada
conda activate climada_env
pip install jupyter matplotlib geopandas
```

**Module 1.4 : Premier exemple pratique**
```python
# Exemple : Cyclones Atlantique
from climada.engine import Hazard, Exposures, Impact
hazard = Hazard.from_predefined('cyclone_ATL')
exposure = Exposures.from_predefined('litpop_world')
impact = exposure.calc_impact(hazard, vulnerability)
print(f"Pertes moyennes annuelles : {impact.mean()}")
```

**TP 1 : Calcul d'impact simple**
- Chargement données prédéfinies
- Calcul pertes économiques cyclones Caraïbes
- Interprétation des résultats

---

### **JOUR 2 : Modélisation des aléas climatiques**

#### **Matin : Types d'aléas en Côte d'Ivoire (3h)**
**Module 2.1 : Aléas prioritaires**
- **Inondations côtières** : Abidjan, San-Pédro (données marégraphiques)
- **Sécheresses** : Nord du pays (indices SPI, PDSI)
- **Cyclones tropicaux** : Rare mais impact fort (2016-2020)
- **Érosion côtière** : 1,2m/an moyenne nationale [25]

**Module 2.2 : Sources de données**
- **SODEXAM** : Données historiques 1960-2024
- **ERA5** : Réanalyses climatiques haute résolution
- **Projections SSP** : Scénarios GIEC adaptés région

#### **Après-midi : Implémentation technique (4h)**
**Module 2.3 : Import et traitement des données**
```python
# Import données SODEXAM
import pandas as pd
import numpy as np
from climada.hazard import Hazard

# Création hazard inondation
flood_events = pd.read_csv('sodexam_floods_1980_2024.csv')
hazard = Hazard()
hazard.events = flood_events
hazard.centroids = coastal_grid_ci
```

**TP 2 : Modélisation inondations Abidjan**
- Import données pluviométriques SODEXAM
- Calibration modèle hydrologique simple
- Génération événements probabilistes
- Cartographie zones à risque

---

### **JOUR 3 : Exposition économique et vulnérabilité**

#### **Matin : Cartographie de l'exposition (3h)**
**Module 3.1 : Actifs économiques stratégiques**
- **Agriculture** : 2,4 millions hectares cultivés, 65% PIB rural
- **Infrastructures** : Ports (Abidjan, San-Pédro), routes, énergie
- **Zones urbaines** : 13 millions habitants, 70% PIB [24]
- **Industrie** : Transformation cacao, pétrole offshore

**Module 3.2 : Sources de données d'exposition**
- **RGPH 2021** : Population et habitat
- **Base DGEP** : Comptabilité nationale sectorielle
- **Images satellite** : Land use/land cover
- **Registres entreprises** : Localisation actifs productifs

#### **Après-midi : Fonctions de vulnérabilité (4h)**
**Module 3.3 : Développement fonctions de dommage**
```python
# Fonction de dommage cacao
from climada.entity import ImpactFunc

def cocoa_vulnerability():
    """Fonction dommage sécheresse cacao"""
    impf = ImpactFunc()
    # Seuils calibrés données ANADER 2010-2020
    intensities = [0, 0.5, 1.0, 1.5, 2.0]  # Indice sécheresse
    damages = [0, 0.1, 0.3, 0.6, 0.9]     # % perte rendement
    impf.set_pwl(intensities, damages)
    return impf
```

**TP 3 : Vulnérabilité secteur cacaoyer**
- Analyse historique pertes ANADER
- Calibration fonction dommage sécheresse
- Validation croisée avec assurances agricoles
- Projection pertes futures scénarios SSP

---

### **JOUR 4 : Calibration et mesures d'adaptation**

#### **Matin : Calibration avec données locales (3h)**
**Module 4.1 : Données historiques de calibration**
- **ONPC** : Sinistres et dommages 2000-2024
- **Assurances** : Indemnisations sectorielles
- **BCEAO** : Pertes économiques événements majeurs
- **ANADER** : Pertes agricoles géolocalisées

**Module 4.2 : Techniques de calibration**
```python
# Calibration bayésienne
from climada.util.calibrate import BayesianOptimizer
from sklearn.metrics import mean_squared_log_error

calibration_input = Input(
    hazard=hazard_ci,
    exposure=exposure_ci, 
    data=damage_data_onpc,
    bounds={"threshold": (10, 50), "slope": (0.1, 2.0)},
    cost_func=mean_squared_log_error
)
optimizer = BayesianOptimizer(calibration_input)
optimal_params = optimizer.run()
```

#### **Après-midi : Évaluation des adaptations (4h)**
**Module 4.3 : Types de mesures d'adaptation**
- **Infrastructurelles** : Digues, drainage urbain, bassins rétention
- **Écosystémiques** : Mangroves, reforestation, agriculture climato-intelligente
- **Financières** : Assurance indicielle, fonds catastrophes
- **Informationnelles** : Alerte précoce, formation agriculteurs

**TP 4 : Analyse coût-bénéfice système alerte précoce**
- Coût installation : 50 millions FCFA
- Réduction dommages : 15-30% inondations urbaines
- Bénéfices actualisés sur 20 ans
- Taux rentabilité interne (TRI)

---

### **JOUR 5 : Applications avancées et intégration**

#### **Matin : Automatisation et visualisation (3h)**
**Module 5.1 : Scripts automatisés**
```python
# Script automatique rapport mensuel
def rapport_risque_mensuel():
    """Génère rapport risque climatique DGE"""
    # Mise à jour données SODEXAM
    hazards = update_hazard_data()
    # Calcul impacts sectoriels
    impacts = compute_sectoral_impacts(hazards)
    # Génération cartes et graphiques
    create_risk_maps(impacts)
    # Export PDF rapport
    export_report(impacts, "rapport_risque_" + date.today())
```

**Module 5.2 : Visualisation avancée**
- Cartes interactives avec Plotly
- Tableaux de bord temps réel
- Graphiques d'incertitude et sensibilité

#### **Après-midi : Intégration dans la planification (4h)**
**Module 5.3 : Intégration DRB (Déclaration Risques Budgétaires)**
- Format requis par le FMI
- Indicateurs clés : Pertes Annuelles Moyennes (PAM), Value-at-Risk
- Scénarios de stress climatique
- Recommandations budgétaires

**Projet final : Étude de cas complète**
Les participants choisissent un secteur :
1. **Secteur portuaire** : Érosion côtière ports Abidjan/San-Pédro
2. **Agriculture** : Sécheresse zone cotonnière Nord
3. **Énergie** : Inondations barrages hydroélectriques

**Livrables attendus :**
- Modèle CLIMADA calibré
- Analyse économique quantifiée
- Recommandations d'adaptation
- Présentation 15 minutes

---

## **5. Ressources pédagogiques**

### **Supports fournis**
- **Manuel utilisateur CLIMADA** adapté contexte ivoirien
- **Notebooks Jupyter** avec exercices progressifs
- **Jeux de données** : SODEXAM, ONPC, statistiques économiques
- **Codes sources** : Scripts adaptés aux besoins DGE

### **Données d'exemple**
- **Climatiques** : Séries temporelles 1980-2024, projections 2025-2100
- **Économiques** : PIB sectoriel, emploi, investissements par région
- **Dommages** : Base sinistres ONPC, indemnisations assurances

### **Outils techniques**
- **Environnement Conda** pré-configuré
- **Extensions CLIMADA** adaptées Afrique de l'Ouest
- **API SODEXAM** pour mise à jour automatique données

---

## **6. Évaluation et certification**

### **Modalités d'évaluation**
- **Contrôle continu** : 40% (TP quotidiens)
- **Projet final** : 40% (étude de cas complète)
- **Présentation orale** : 20% (défense projet)

### **Critères d'évaluation**
- **Maîtrise technique** : Installation, manipulation CLIMADA
- **Analyse économique** : Quantification pertes, coût-bénéfice
- **Adaptation contexte** : Pertinence données et méthodes ivoiriennes
- **Communication** : Clarté présentation, recommandations actionables

### **Certification**
- **Attestation de formation** délivrée par la DGE
- **Niveau atteint** : Utilisateur autonome CLIMADA
- **Compétences certifiées** : Évaluation risque climatique économique

---

## **7. Perspectives et suivi**

### **Formation continue**
- **Mise à jour annuelle** : Nouvelles fonctionnalités CLIMADA
- **Réseau utilisateurs** : Échange pratiques avec autres institutions
- **Support technique** : Assistance post-formation 6 mois

### **Applications institutionnelles**
- **Intégration DRB** : Rapport trimestriel risques climatiques
- **Planification budgétaire** : Provisionnement catastrophes
- **Coopération régionale** : Partage méthodologies UEMOA
- **Formation en cascade** : Autres ministères et administrations

### **Développements futurs**
- **API temps réel** : Interface SODEXAM-CLIMADA
- **Tableaux de bord** : Monitoring continu risques sectoriels
- **Intelligence artificielle** : Prévision automatisée dommages
- **Collaboration recherche** : Partenariats universités et centres recherche

---

## **Contact et ressources**

### **Équipe formation**
- **Responsable scientifique** : Expert agrométéorologie/CLIMADA
- **Support technique** : Ingénieur informatique Python/GIS
- **Coordinateur pédagogique** : Formation professionnelle continue

### **Ressources en ligne**
- **Documentation CLIMADA** : https://climada-python.readthedocs.io
- **Dépôt GitHub formation** : Scripts et données exercices
- **Forum utilisateurs** : Support communautaire post-formation
- **Webinaires mensuels** : Actualités et bonnes pratiques

---

*Cette formation s'inscrit dans le cadre du renforcement des capacités pour la mise en œuvre de la Facilité de Résilience et Durabilité (FRD) du FMI, contribuant à l'objectif de la Côte d'Ivoire de devenir un pays à revenu intermédiaire supérieur d'ici 2030.*