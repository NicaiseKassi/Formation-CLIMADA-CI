# Guide d'illustration pour le Manuel CLIMADA Complet
## Emplacements précis pour exemples, figures et cas pratiques

---

## **CHAPITRE 1 : INTRODUCTION À CLIMADA**
### **Illustrations recommandées :**

**Section 1.1 - Qu'est-ce que CLIMADA ?**
- 🖼️ **FIGURE 1.1** : Schéma architecture CLIMADA (core modules + petals)
- 📊 **FIGURE 1.2** : Diagramme flux : Données → Modélisation → Résultats → Décision
- 🌍 **FIGURE 1.3** : Carte mondiale utilisateurs CLIMADA (institutions, pays)

**Section 1.2 - Avantages pour la Côte d'Ivoire**
- 📋 **ENCADRÉ 1.1** : Exigences FMI - Facilité Résilience Durabilité (texte + logos)
- 📊 **FIGURE 1.4** : Comparaison approches (CLIMADA vs méthodes traditionnelles)
- 🎯 **FIGURE 1.5** : Flowchart intégration CLIMADA → DRB → Budget national

---

## **CHAPITRE 2 : INSTALLATION ET CONFIGURATION**
### **Illustrations recommandées :**

**Section 2.2 - Installation environnement Python**
- 💻 **CAPTURE 2.1** : Terminal commandes installation Miniconda
- 💻 **CAPTURE 2.2** : Jupyter Notebook première exécution CLIMADA
- ⚠️ **ENCADRÉ 2.1** : Messages d'erreur courants + solutions

**Section 2.3 - Configuration pour Côte d'Ivoire**
- 📁 **FIGURE 2.1** : Arborescence répertoires projet CLIMADA CI
- 🗺️ **FIGURE 2.2** : Carte limites géographiques CI (bounds configuration)
- 📊 **TABLEAU 2.1** : Sources données ivoiriennes (SODEXAM, ONPC, DGSTATS)

---

## **CHAPITRE 3 : ARCHITECTURE ET CONCEPTS**
### **Illustrations recommandées :**

**Section 3.1 - Les trois piliers**
- 📊 **FIGURE 3.1** : Diagramme interactif "Risque = Aléa × Exposition × Vulnérabilité"
- 💻 **CODE 3.1** : Structure objet Hazard avec annotations
- 💻 **CODE 3.2** : Structure objet Exposures avec annotations
- 💻 **CODE 3.3** : Structure objet ImpactFunc avec annotations

**Section 3.2 - Workflow de calcul**
- 📊 **FIGURE 3.2** : Flowchart processus calcul impact (5 étapes)
- 🖼️ **FIGURE 3.3** : Visualisation appariement spatial centroïdes-expositions
- 💻 **CODE 3.4** : Exemple calcul impact complet avec sortie

---

## **CHAPITRE 4 : GESTION DES ALÉAS (HAZARDS)**
### **Illustrations recommandées :**

**Section 4.1.1 - Inondations côtières et urbaines**
- 🗺️ **CARTE 4.1** : Zones inondables Abidjan (modèle hydrologique)
- 📊 **GRAPHIQUE 4.1** : Série temporelle précipitations juin 2018
- 💻 **CODE 4.1** : Fonction create_flood_hazard_abidjan() complète
- 📊 **FIGURE 4.1** : Matrice intensité événements × centroïdes (heatmap)

**Section 4.1.2 - Sécheresses agricoles**
- 🗺️ **CARTE 4.2** : Zones vulnérables sécheresse Nord CI
- 📊 **GRAPHIQUE 4.2** : Évolution SPI 1990-2024 stations nord
- 💻 **CODE 4.2** : Calcul SPI et classification intensité sécheresse
- 📊 **FIGURE 4.2** : Corrélation rendements agricoles vs indices climatiques

**Section 4.1.3 - Cyclones tropicaux**
- 🗺️ **CARTE 4.3** : Trajectoires cyclones historiques Atlantique (rayon 500km CI)
- 📊 **GRAPHIQUE 4.3** : Distribution vitesses vent côte CI
- 💻 **CODE 4.3** : Génération champ vent cyclonique

**Section 4.2 - Intégration données locales**
- 📊 **TABLEAU 4.1** : Stations SODEXAM avec coordonnées et paramètres
- 💻 **CODE 4.4** : Classe SODEXAMDataLoader avec méthodes API
- 📊 **FIGURE 4.3** : Facteurs changement climatique SSP scenarios

**Section 4.3 - Validation qualité**
- ✅ **CHECKLIST 4.1** : Validation Hazard avec tests automatisés
- 📊 **GRAPHIQUE 4.4** : Métriques qualité données (complétude, cohérence)
- ⚠️ **ENCADRÉ 4.1** : Erreurs fréquentes et diagnostic

---

## **CHAPITRE 5 : MODÉLISATION EXPOSITION**
### **Illustrations recommandées :**

**Section 5.1.1 - Données démographiques**
- 🗺️ **CARTE 5.1** : Densité population CI par commune (RGPH 2021)
- 📊 **GRAPHIQUE 5.1** : Distribution valeurs immobilières par région
- 💻 **CODE 5.1** : Fonction create_residential_exposure_ci() 
- 📊 **TABLEAU 5.1** : Estimation valeurs logement par type et localisation

**Section 5.1.2 - Exposition agricole**
- 🗺️ **CARTE 5.2** : Couverture cultures principales CI (land use)
- 📊 **GRAPHIQUE 5.2** : Valeur économique par hectare selon culture
- 💻 **CODE 5.2** : Mapping vulnérabilité cultures par aléa
- 📊 **TABLEAU 5.2** : Productions agricoles par région (ANADER/DGPE)

**Section 5.1.3 - Infrastructures stratégiques**
- 🗺️ **CARTE 5.3** : Localisation infrastructures critiques CI
- 📷 **PHOTOS 5.1** : Port Abidjan, Aéroport, Centrales électriques
- 💻 **CODE 5.3** : Base données infrastructures avec vulnérabilités
- 💰 **TABLEAU 5.3** : Valorisation actifs infrastructure par type

**Section 5.2 - Intégration multi-sectorielle**
- 📊 **FIGURE 5.1** : Répartition exposition totale par secteur (camembert)
- 🗺️ **CARTE 5.4** : Exposition économique totale CI (densité valeur)
- 💻 **CODE 5.4** : Validation géographique et statistiques sectorielles

**Section 5.3 - Désagrégation spatiale**
- 🗺️ **FIGURE 5.2** : Grille désagrégation 1km (avant/après)
- 📊 **GRAPHIQUE 5.3** : Distribution poids allocation spatiale
- 💻 **CODE 5.5** : Algorithme désagrégation par proximité/densité
- 📈 **FIGURE 5.3** : Projections exposition futures 2050 (scénarios croissance)

---

## **CHAPITRE 6 : FONCTIONS DE VULNÉRABILITÉ**
### **Illustrations recommandées :**

**Section 6.1.1 - Fonctions inondations urbaines**
- 📊 **GRAPHIQUE 6.1** : Courbes dommage résidentiel (moderne vs traditionnel)
- 📊 **GRAPHIQUE 6.2** : Fonctions impact commercial/industriel/portuaire
- 💻 **CODE 6.1** : Création ImpactFunc avec calibration ONPC
- 📊 **FIGURE 6.1** : Validation fonctions avec données historiques (scatter plots)

**Section 6.1.2 - Fonctions sécheresses agricoles**
- 📊 **GRAPHIQUE 6.3** : Courbes perte rendement par culture vs SPI
- 🗓️ **FIGURE 6.2** : Vulnérabilité saisonnière (périodes critiques)
- 💻 **CODE 6.2** : Ajustement saisonnier fonctions impact
- 📊 **GRAPHIQUE 6.4** : Corrélations rendement-climat par culture (matrices)

**Section 6.1.3 - Fonctions cyclones tropicaux**
- 📊 **GRAPHIQUE 6.5** : Courbes dommage selon vitesse vent par type actif
- 🗺️ **FIGURE 6.3** : Facteur vulnérabilité selon distance côte
- 💻 **CODE 6.3** : Ajustement côtier fonctions cyclones

**Section 6.2 - Ensemble fonctions intégré**
- 📊 **TABLEAU 6.1** : Catalogue complet fonctions impact CI
- 💻 **CODE 6.4** : ImpactFuncSet validation et métadonnées
- 📊 **FIGURE 6.4** : Bornes d'incertitude fonctions (confidence intervals)

---

## **CHAPITRES 7-14 : STRUCTURE SIMILAIRE**
### **Illustrations par chapitre (modèle type) :**

**Chaque chapitre doit contenir :**
- 2-3 cartes géographiques CI
- 3-4 graphiques/visualisations données
- 5-7 blocs code Python commentés
- 1-2 tableaux de synthèse
- 1 encadré "bonnes pratiques"

---

## **CAS PRATIQUES INTÉGRÉS**

### **CAS 1 : Inondations Abidjan juin 2018** (chapitres 4, 5, 7)
- 📁 Données : [inondations_abidjan_juin_2018.csv](sandbox:/code_file:93)
- 🗺️ Cartes : Zones inondées, exposition par commune
- 📊 Résultats : 18 milliards FCFA dommages (validation)

### **CAS 2 : Sécheresse agriculture 2016** (chapitres 4, 6, 8)
- 📁 Données : [secheresse_agriculture_2016.csv](sandbox:/code_file:94)
- 📊 Analyses : SPI, pertes rendement, impact économique
- 🌾 Focus : Coton, maïs, cultures vivrières nord CI

### **CAS 3 : Érosion côtière ports** (chapitres 5, 9, 12)
- 🗺️ Projection : Élévation niveau mer 2050
- 💰 Impact : Infrastructure portuaire (800+ milliards FCFA)
- ⚓ Adaptation : Mesures protection côtière

---

## **APPENDICES VISUELS**

### **Appendice A : Datasets de référence**
- 📊 Catalogue sources données CI
- 🗺️ Cartes de référence (régions, stations météo)
- 📋 Formats fichiers et structures

### **Appendice B : Scripts utilitaires**
- 💻 Fonctions helpers (validation, conversion, export)
- 🔧 Outils de diagnostic et débogage
- 🔄 Scripts mise à jour automatique données

### **Appendice C : Ressources externes**
- 🌐 Links documentation CLIMADA officielle
- 📚 Références académiques risque climatique CI
- 🤝 Contacts SODEXAM, ONPC, institutions partenaires

---

## **RECOMMANDATIONS TECHNIQUES FIGURES**

### **Standards visualisation :**
- **Cartes** : Projection UTM Zone 30N (CI), échelle 1:2,000,000
- **Graphiques** : Résolution 300 DPI minimum
- **Code** : Syntax highlighting Python, largeur 80 caractères
- **Couleurs** : Palette cohérente (voir guide présentation)

### **Numérotation :**
- Figures : numérotées par chapitre (ex: Figure 4.3)
- Codes : numérotés par chapitre (ex: Code 5.2)
- Tableaux : numérotés par chapitre (ex: Tableau 6.1)

### **Légendes obligatoires :**
- Source des données (SODEXAM, ONPC, etc.)
- Année de référence
- Unités et symboles
- Méthodes de calcul si pertinentes