# **Chapitre 3 : Travaux Pratiques Détaillés**

Cette section est le cœur pratique du manuel. Pour chaque TP, nous suivons une démarche structurée :

1. **La Question Économique :** Quel problème cherchons-nous à résoudre ?
2. **L'Approche de Modélisation :** Comment allons-nous utiliser CLIMADA pour y répondre ?
3. **Les Étapes Clés :** Le guide pas à pas avec le code.
4. **L'Interprétation Économique :** Que signifient les résultats pour la DGE ?

---

## **TP 1 : Inondations Urbaines à Abidjan (2018)**

### **🎯 La Question Économique**

Quel a été le coût économique direct des inondations de juin 2018 sur le bâti à Abidjan, et notre modèle peut-il le reproduire de manière crédible ?

### **🔍 L'Approche de Modélisation**

Nous allons superposer une carte de l'aléa (hauteur d'eau) avec une carte de l'exposition (valeur des bâtiments) et appliquer une fonction de vulnérabilité pour calculer les dommages. Le résultat sera comparé aux estimations de l'ONPC pour valider le modèle.

### **📋 Les Étapes Clés**

**Fichier Notebook :** `TP1_Inondations_Abidjan_2018_Complet.ipynb`

Le notebook vous guidera à travers les étapes suivantes :

1. **Création d'un aléa synthétique d'inondation**

   - Chargement des données de hauteur d'eau (juin 2018)
   - Géoréférencement et projection sur Abidjan
   - Définition de l'intensité (hauteur d'eau en mètres)
   - Calcul de la période de retour estimée

2. **Génération de l'exposition économique avec LitPop**

   - Utilisation de la méthodologie LitPop (Lumières nocturnes + Population)
   - Calibration sur les données économiques d'Abidjan
   - Attribution de valeurs aux actifs bâtis par zone
   - Carte de distribution spatiale de la valeur économique

3. **Définition d'une fonction de dommage hauteur-dégâts**

   - Construction de la courbe de vulnérabilité (0-100% de perte)
   - Relation entre hauteur d'eau et taux de dommage
   - Calibration sur données empiriques (si disponibles)

4. **Calcul et cartographie des dommages totaux**

   - Application de la fonction Impact de CLIMADA
   - Calcul des dommages par zone administrative
   - Génération de cartes de dommages
   - Calcul de la **Perte Maximale Probable (PMP)** pour cet événement

5. **Analyse critique des résultats**
   - Comparaison avec les données historiques (ONPC, BNETD)
   - Analyse de sensibilité aux hypothèses
   - Identification des zones les plus vulnérables

### **💡 L'Interprétation Économique**

Ce TP permet de calibrer nos outils et de produire une première estimation de la **Perte Maximale Probable (PMP)** pour un événement de cette ampleur, une donnée clé pour :

- Dimensionner les fonds de contingence
- Justifier les investissements dans les infrastructures de drainage
- Évaluer le coût-bénéfice des mesures d'adaptation

---

## **TP 2 : Sécheresse Agricole et Impact sur l'Anacarde (2016)**

### **🎯 La Question Économique**

Quelles ont été les pertes de revenus pour la filière anacarde dues à la sécheresse de 2016 dans le Nord de la Côte d'Ivoire, et comment cela a-t-il impacté l'économie régionale ?

### **🔍 L'Approche de Modélisation**

Nous allons créer une carte de l'aléa (indice de sécheresse) et la croiser avec une carte d'exposition représentant la valeur de la production d'anacarde. Une fonction de vulnérabilité agronomique (perte de rendement vs. stress hydrique) nous donnera l'impact économique.

### **📋 Les Étapes Clés**

**Fichier Notebook :** `TP2_Secheresse_Agriculture_2016_Complet.ipynb`

Le notebook vous montrera comment :

1. **Modéliser un aléa de sécheresse basé sur un indice synthétique**

   - Calcul du SPI (Standardized Precipitation Index) ou SPEI
   - Données climatiques issues de SODEXAM ou réanalyses globales
   - Identification des zones affectées (seuils de sécheresse)
   - Périodes critiques pour le développement du cacao

2. **Créer une exposition agricole**

   - Cartographie des zones de production de cacao (Nord CI)
   - Valeur de la production par hectare et par région
   - Données de l'ANADER, du Conseil Café-Cacao
   - Intégration de données économiques (prix, volumes)

3. **Construire une fonction de dommage agronomique**

   - Relation entre stress hydrique et perte de rendement
   - Courbe de vulnérabilité basée sur études agronomiques
   - Seuils critiques de précipitation
   - Prise en compte des stades phénologiques sensibles

4. **Calculer les pertes économiques totales**

   - Application du modèle Impact de CLIMADA
   - Calcul des pertes par département (Korhogo, Ferkessédougou, etc.)
   - Estimation des pertes en revenus agricoles
   - Impact sur les recettes d'exportation

5. **Analyser l'impact sur la filière**
   - Comparaison avec les statistiques officielles de production
   - Analyse de l'impact sur les revenus des producteurs
   - Conséquences sur les recettes fiscales (droits d'exportation)
   - Recommandations pour la politique agricole

### **💡 L'Interprétation Économique**

Ce TP quantifie la sensibilité d'un secteur clé aux chocs climatiques. Le résultat est une brique essentielle pour :

- Ajuster les prévisions de croissance du PIB agricole
- Modéliser l'impact sur les recettes fiscales
- Justifier les investissements dans l'irrigation et l'adaptation variétale
- Évaluer la nécessité de mécanismes d'assurance agricole

---

## **TP 3 : Érosion Côtière et Risques pour le Patrimoine à Grand-Bassam**

### **🎯 La Question Économique**

Quelle est la valeur du capital (touristique, résidentiel, patrimonial) menacé par l'érosion côtière à Grand-Bassam à un horizon 2050 si aucune mesure n'est prise ?

### **🔍 L'Approche de Modélisation**

C'est une analyse prospective. L'aléa est une carte binaire de la future zone "perdue" à cause de l'érosion (basée sur modèles de recul du trait de côte). L'exposition est la valeur des actifs situés dans cette zone. La vulnérabilité est de 100% (perte totale des actifs).

### **📋 Les Étapes Clés**

**Fichier Notebook :** `TP3_Erosion_Cotiere_Grand_Bassam.ipynb`

Ce cas prospectif vous apprendra à :

1. **Définir un aléa binaire représentant la future zone d'érosion**

   - Données de recul du trait de côte (études BNETD, projets côtiers)
   - Scénarios d'élévation du niveau de la mer (SSP scenarios)
   - Délimitation de la zone à risque à horizon 2050
   - Création d'un masque géographique d'exposition

2. **Générer l'exposition économique de la zone côtière**

   - Inventaire des actifs dans la zone littorale :
     - Hôtels et infrastructures touristiques
     - Résidences et habitations
     - Patrimoine culturel (Ville historique UNESCO)
     - Infrastructures publiques (routes, réseaux)
   - Estimation de la valeur des actifs par catégorie
   - Cartographie de la distribution spatiale

3. **Appliquer une fonction de dommage de perte totale**

   - Hypothèse : 100% de perte pour les actifs dans la zone d'érosion
   - Pas de gradation (actif détruit ou préservé)
   - Calcul direct de la valeur à risque

4. **Calculer la valeur totale des actifs à risque**

   - Agrégation des pertes potentielles par catégorie
   - Calcul du **coût de l'inaction** (montant total menacé)
   - Analyse de scénarios (optimiste, réaliste, pessimiste)
   - Cartographie interactive des zones à risque prioritaires

5. **Analyse coût-bénéfice des mesures de protection**
   - Coût estimé des ouvrages de protection (digues, épis, brise-lames)
   - Comparaison coût de protection vs. valeur sauvegardée
   - Calcul du ratio bénéfice/coût
   - Recommandations pour la planification territoriale

### **💡 L'Interprétation Économique**

Le résultat de ce TP est une estimation du **coût de l'inaction** à horizon 2050. C'est un argument puissant pour :

- Justifier les investissements préventifs dans la protection côtière
- Orienter les politiques d'aménagement du territoire
- Soutenir les demandes de financement international (Fonds Vert Climat)
- Prioriser les zones d'intervention (Grand-Bassam, mais aussi Jacqueville, Assinie)
- Évaluer les options de relocalisation vs. protection

---

## **📝 Recommandations Pratiques**

### **Pour Réussir les TP**

✅ **Travaillez par étapes** : Ne sautez pas les phases de compréhension des données

✅ **Documentez vos choix** : Notez toutes les hypothèses et sources de données

✅ **Visualisez à chaque étape** : Les cartes vous aident à identifier les erreurs

✅ **Comparez avec la réalité** : Confrontez vos résultats aux données officielles

✅ **Analysez la sensibilité** : Testez comment vos résultats varient si vous changez une hypothèse

### **Livrables Attendus**

Pour chaque TP, vous devrez produire :

1. **Un notebook Jupyter** complet et commenté
2. **Des cartes** de l'aléa, de l'exposition et de l'impact
3. **Un rapport synthétique** (2-3 pages) avec :
   - Résultats chiffrés (PAM, PMP, valeur à risque)
   - Interprétation économique
   - Recommandations pour la politique publique
   - Limites et incertitudes de l'analyse

---

_Le code détaillé et les fichiers de données pour chaque TP se trouvent dans les notebooks Jupyter fournis avec la formation._
