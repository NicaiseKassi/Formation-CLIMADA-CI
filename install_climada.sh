#!/bin/bash

################################################################################
# Script d'Installation Automatique - Formation CLIMADA
# 
# Ce script installe automatiquement l'environnement CLIMADA pour la formation
# sur l'analyse des risques climatiques en Côte d'Ivoire
#
# Usage: bash install_climada.sh
################################################################################

set -e  # Arrêter en cas d'erreur

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonctions d'affichage
print_header() {
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ ERREUR: $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Bannière de bienvenue
clear
echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║         INSTALLATION FORMATION CLIMADA                        ║
║         Analyse des Risques Climatiques - Côte d'Ivoire      ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

echo ""
print_info "Ce script va installer l'environnement CLIMADA complet"
echo ""
sleep 2

################################################################################
# ÉTAPE 1 : Vérification du système
################################################################################

print_header "ÉTAPE 1/6 : Vérification du système"

# Détecter l'OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

print_info "Système d'exploitation détecté : $MACHINE"

# Vérifier l'espace disque
AVAILABLE_SPACE=$(df -BG . | awk 'NR==2 {print $4}' | sed 's/G//')
if [ "$AVAILABLE_SPACE" -lt 10 ]; then
    print_warning "Espace disque faible : ${AVAILABLE_SPACE}GB disponible"
    print_warning "Au moins 10GB recommandés pour l'installation"
    read -p "Continuer quand même ? (o/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Oo]$ ]]; then
        exit 1
    fi
else
    print_success "Espace disque suffisant : ${AVAILABLE_SPACE}GB disponible"
fi

sleep 1

################################################################################
# ÉTAPE 2 : Vérification/Installation de Conda
################################################################################

print_header "ÉTAPE 2/6 : Vérification de Conda"

if command -v conda &> /dev/null; then
    CONDA_VERSION=$(conda --version | awk '{print $2}')
    print_success "Conda déjà installé (version $CONDA_VERSION)"
else
    print_warning "Conda n'est pas installé"
    echo ""
    read -p "Voulez-vous installer Miniconda maintenant ? (o/n) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        print_info "Téléchargement de Miniconda..."
        
        if [ "$MACHINE" = "Linux" ]; then
            wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
        elif [ "$MACHINE" = "Mac" ]; then
            curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
            mv Miniconda3-latest-MacOSX-x86_64.sh miniconda.sh
        else
            print_error "Installation automatique non supportée pour $MACHINE"
            print_info "Installez Miniconda manuellement depuis https://docs.conda.io/en/latest/miniconda.html"
            exit 1
        fi
        
        print_info "Installation de Miniconda..."
        bash miniconda.sh -b -p $HOME/miniconda3
        
        # Initialiser conda
        eval "$($HOME/miniconda3/bin/conda shell.bash hook)"
        conda init bash
        
        # Nettoyer
        rm miniconda.sh
        
        print_success "Miniconda installé avec succès"
        print_warning "Veuillez redémarrer votre terminal et relancer ce script"
        exit 0
    else
        print_error "Conda est requis pour continuer"
        print_info "Installez Conda/Miniconda puis relancez ce script"
        exit 1
    fi
fi

sleep 1

################################################################################
# ÉTAPE 3 : Configuration de Conda
################################################################################

print_header "ÉTAPE 3/6 : Configuration de Conda"

# Ajouter conda-forge
print_info "Configuration des canaux Conda..."
conda config --add channels conda-forge
conda config --set channel_priority strict

print_success "Canaux configurés"

sleep 1

################################################################################
# ÉTAPE 4 : Suppression de l'ancien environnement (si existe)
################################################################################

print_header "ÉTAPE 4/6 : Préparation de l'environnement"

if conda env list | grep -q "climada_formation"; then
    print_warning "L'environnement 'climada_formation' existe déjà"
    read -p "Voulez-vous le supprimer et le recréer ? (o/n) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        print_info "Suppression de l'ancien environnement..."
        conda env remove -n climada_formation -y
        print_success "Ancien environnement supprimé"
    else
        print_info "Conservation de l'environnement existant"
        print_info "Mise à jour de l'environnement..."
        conda env update -f environment_formation.yml --prune
        print_success "Environnement mis à jour"
        
        # Passer à l'étape de test
        print_header "ÉTAPE 6/6 : Test de l'installation"
        conda activate climada_formation
        
        # Test rapide
        python << EOF
import sys
try:
    import climada
    print("✅ CLIMADA installé et fonctionnel")
    sys.exit(0)
except ImportError:
    print("❌ Erreur d'importation CLIMADA")
    sys.exit(1)
EOF
        
        if [ $? -eq 0 ]; then
            print_success "Installation vérifiée avec succès !"
        else
            print_error "Problème détecté. Recréez l'environnement."
        fi
        exit 0
    fi
fi

sleep 1

################################################################################
# ÉTAPE 5 : Création de l'environnement CLIMADA
################################################################################

print_header "ÉTAPE 5/6 : Installation de l'environnement CLIMADA"

print_info "Cette étape peut prendre 15-30 minutes..."
print_info "Création de l'environnement depuis environment_formation.yml"
echo ""

# Vérifier que le fichier existe
if [ ! -f "environment_formation.yml" ]; then
    print_error "Fichier environment_formation.yml introuvable"
    print_info "Assurez-vous d'être dans le dossier Formation-CLIMADA-CI"
    exit 1
fi

# Créer l'environnement avec une barre de progression
conda env create -f environment_formation.yml

if [ $? -eq 0 ]; then
    print_success "Environnement créé avec succès !"
else
    print_error "Échec de la création de l'environnement"
    print_info "Essayez de nettoyer le cache : conda clean --all"
    print_info "Puis relancez ce script"
    exit 1
fi

sleep 1

################################################################################
# ÉTAPE 6 : Test de l'installation
################################################################################

print_header "ÉTAPE 6/6 : Test de l'installation"

print_info "Activation de l'environnement..."

# Activer l'environnement
eval "$(conda shell.bash hook)"
conda activate climada_formation

if [ $? -ne 0 ]; then
    print_error "Impossible d'activer l'environnement"
    exit 1
fi

print_success "Environnement activé"

# Test des imports principaux
print_info "Test des modules Python..."

python << 'PYEOF'
import sys

print("\n🔍 Vérification des modules...\n")

modules_test = {
    'climada': 'CLIMADA',
    'numpy': 'NumPy',
    'pandas': 'Pandas',
    'matplotlib': 'Matplotlib',
    'cartopy': 'Cartopy',
    'geopandas': 'GeoPandas',
    'xarray': 'Xarray',
    'netCDF4': 'NetCDF4',
    'rasterio': 'Rasterio',
    'shapely': 'Shapely'
}

echecs = []
for module, nom in modules_test.items():
    try:
        __import__(module)
        print(f"✅ {nom:15} : OK")
    except ImportError as e:
        print(f"❌ {nom:15} : ÉCHEC")
        echecs.append(nom)

if echecs:
    print(f"\n⚠️  Modules manquants : {', '.join(echecs)}")
    sys.exit(1)
else:
    print("\n✅ Tous les modules sont installés correctement !")
    sys.exit(0)
PYEOF

TEST_RESULT=$?

echo ""

if [ $TEST_RESULT -eq 0 ]; then
    print_success "Test d'installation réussi !"
else
    print_error "Certains modules n'ont pas pu être importés"
    print_info "Essayez de recréer l'environnement"
    exit 1
fi

################################################################################
# FINALISATION
################################################################################

echo ""
print_header "✅ INSTALLATION TERMINÉE AVEC SUCCÈS !"

echo ""
echo -e "${GREEN}🎉 Félicitations ! L'environnement CLIMADA est prêt.${NC}"
echo ""
echo "Pour commencer à utiliser CLIMADA :"
echo ""
echo -e "  ${BLUE}1.${NC} Activer l'environnement :"
echo -e "     ${YELLOW}conda activate climada_formation${NC}"
echo ""
echo -e "  ${BLUE}2.${NC} Lancer Jupyter Notebook :"
echo -e "     ${YELLOW}jupyter notebook${NC}"
echo ""
echo -e "  ${BLUE}3.${NC} Ou lancer Jupyter Lab :"
echo -e "     ${YELLOW}jupyter lab${NC}"
echo ""
echo -e "  ${BLUE}4.${NC} Ouvrir les notebooks de formation dans le dossier ${YELLOW}TP/${NC}"
echo ""
echo "📚 Consultez INSTALLATION.md pour plus d'informations"
echo ""

# Créer un fichier de test rapide
print_info "Création d'un script de test rapide..."

cat > test_climada.py << 'EOF'
#!/usr/bin/env python3
"""
Script de test rapide pour l'installation CLIMADA
"""

import sys

def test_installation():
    print("🔍 Test de l'installation CLIMADA\n")
    print("="*50)
    
    # Test 1: Import CLIMADA
    try:
        import climada
        version = climada.__version__
        print(f"✅ CLIMADA version {version}")
    except ImportError as e:
        print(f"❌ Erreur import CLIMADA: {e}")
        return False
    
    # Test 2: Modules essentiels
    modules = ['numpy', 'pandas', 'matplotlib', 'geopandas', 'xarray']
    for mod in modules:
        try:
            __import__(mod)
            print(f"✅ {mod}")
        except ImportError:
            print(f"❌ {mod} manquant")
            return False
    
    print("="*50)
    print("\n✅ Installation validée avec succès!")
    print("\nVous pouvez maintenant utiliser CLIMADA.")
    return True

if __name__ == '__main__':
    success = test_installation()
    sys.exit(0 if success else 1)
EOF

chmod +x test_climada.py

print_success "Script de test créé : test_climada.py"
print_info "Exécutez-le avec : python test_climada.py"

echo ""
print_success "Installation complète ! Bonne formation ! 🚀"
echo ""
