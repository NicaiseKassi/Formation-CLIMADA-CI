#!/bin/bash

# 🔐 Script d'Ajout Automatique d'Utilisateurs GitHub OAuth
# Formation CLIMADA CI - Déploiement Automatisé
# Créé le 7 octobre 2025

set -e  # Arrêter le script en cas d'erreur

# 🎨 Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 📁 Configuration des chemins
REPO_DIR="/home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA"
MKDOCS_DIR="$REPO_DIR/MkDocs/manuel-utilisateur"
AUTH_FILE="$MKDOCS_DIR/docs/auth/auth.js"
BACKUP_DIR="$REPO_DIR/backups"

# 🔧 Fonctions utilitaires
print_header() {
    echo -e "${PURPLE}=================================${NC}"
    echo -e "${PURPLE} $1 ${NC}"
    echo -e "${PURPLE}=================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ Erreur: $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# 🕒 Créer un backup avec timestamp
create_backup() {
    print_info "Création d'un backup de auth.js..."
    mkdir -p "$BACKUP_DIR"
    timestamp=$(date +"%Y%m%d_%H%M%S")
    cp "$AUTH_FILE" "$BACKUP_DIR/auth_backup_$timestamp.js"
    print_success "Backup créé: auth_backup_$timestamp.js"
}

# 🔍 Vérifier l'environnement
check_environment() {
    print_header "Vérification de l'environnement"
    
    # Vérifier si on est dans le bon répertoire
    if [ ! -d "$REPO_DIR" ]; then
        print_error "Répertoire du projet non trouvé: $REPO_DIR"
        exit 1
    fi
    
    cd "$REPO_DIR"
    print_success "Répertoire du projet: $REPO_DIR"
    
    # Vérifier si c'est un repo git
    if [ ! -d ".git" ]; then
        print_error "Ce n'est pas un répertoire git"
        exit 1
    fi
    print_success "Dépôt Git détecté"
    
    # Vérifier si le fichier auth.js existe
    if [ ! -f "$AUTH_FILE" ]; then
        print_error "Fichier auth.js non trouvé: $AUTH_FILE"
        exit 1
    fi
    print_success "Fichier auth.js trouvé"
    
    # Vérifier la branche actuelle
    current_branch=$(git branch --show-current)
    print_info "Branche actuelle: $current_branch"
    
    # S'assurer qu'on est sur main
    if [ "$current_branch" != "main" ]; then
        print_warning "Passage à la branche main..."
        git checkout main || {
            print_error "Impossible de passer à la branche main"
            exit 1
        }
    fi
    print_success "Sur la branche main"
}

# 📝 Afficher la liste actuelle des utilisateurs
show_current_users() {
    print_header "Utilisateurs actuellement autorisés"
    
    # Extraire la liste des utilisateurs de auth.js
    grep -A 20 "AUTHORIZED_USERS" "$AUTH_FILE" | grep -E "^\s*\".*\"," | sed 's/.*"\(.*\)".*/\1/' | nl
    echo ""
}

# ➕ Ajouter un nouvel utilisateur
add_user() {
    local new_user="$1"
    
    print_info "Ajout de l'utilisateur: $new_user"
    
    # Vérifier si l'utilisateur existe déjà
    if grep -q "\"$new_user\"" "$AUTH_FILE"; then
        print_warning "L'utilisateur '$new_user' existe déjà dans la liste"
        return 1
    fi
    
    # Créer un backup avant modification
    create_backup
    
    # Ajouter l'utilisateur avant la ligne de fermeture du tableau
    # Chercher la ligne avec ]; et ajouter l'utilisateur avant
    sed -i "/];/i\\  \"$new_user\"," "$AUTH_FILE"
    
    print_success "Utilisateur '$new_user' ajouté au fichier auth.js"
    return 0
}

# 💾 Sauvegarder sur main
save_to_main() {
    local commit_message="$1"
    
    print_header "Sauvegarde sur la branche main"
    
    print_info "Ajout des modifications..."
    git add .
    
    print_info "Création du commit..."
    git commit -m "$commit_message" || {
        print_warning "Aucune modification à commiter"
        return 1
    }
    
    print_info "Push vers origin/main..."
    git push origin main
    
    print_success "Modifications sauvegardées sur main"
    return 0
}

# 🚀 Déployer sur gh-pages
deploy_to_ghpages() {
    print_header "Déploiement sur gh-pages"
    
    cd "$MKDOCS_DIR"
    
    # Activer l'environnement conda si nécessaire
    if command -v conda &> /dev/null; then
        print_info "Activation de l'environnement conda..."
        source ~/anaconda3/etc/profile.d/conda.sh
        conda activate climada_formation 2>/dev/null || print_warning "Environnement climada_formation non trouvé, utilisation de l'environnement par défaut"
    fi
    
    # Construire le site
    print_info "Construction du site avec mkdocs..."
    mkdocs build || {
        print_error "Échec de la construction mkdocs"
        return 1
    }
    print_success "Site construit avec succès"
    
    # Passer à gh-pages
    print_info "Passage à la branche gh-pages..."
    git checkout gh-pages || {
        print_error "Impossible de passer à la branche gh-pages"
        return 1
    }
    
    # Copier les fichiers générés
    print_info "Copie des fichiers générés..."
    cp -r site/* .
    
    # Commiter et pousser
    print_info "Ajout des fichiers modifiés..."
    git add .
    
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    print_info "Création du commit de déploiement..."
    
    # Forcer le commit même s'il n'y a pas de changements visibles
    if git commit -m "🚀 Déploiement authentification - $timestamp" || git commit --allow-empty -m "🚀 Déploiement forcé authentification - $timestamp"; then
        print_info "Push vers origin/gh-pages..."
        git push origin gh-pages
        print_success "Déploiement terminé avec succès!"
    else
        print_warning "Aucune modification à déployer, forçage du déploiement..."
        git commit --allow-empty -m "🚀 Déploiement forcé authentification - $timestamp"
        git push origin gh-pages
        print_success "Déploiement forcé terminé!"
    fi
    
    # Retourner sur main
    print_info "Retour sur la branche main..."
    git checkout main
    
    return 0
}

# 🌐 Vérifier le déploiement
check_deployment() {
    print_header "Vérification du déploiement"
    
    print_info "Le site sera mis à jour dans 2-3 minutes à l'adresse:"
    echo -e "${CYAN}https://nicaisekassi.github.io/Formation-CLIMADA-CI/${NC}"
    echo ""
    print_info "Pour tester la connexion du nouvel utilisateur:"
    echo -e "${CYAN}https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/login.html${NC}"
    echo ""
    print_warning "N'oubliez pas de vider le cache du navigateur si nécessaire"
}

# 📋 Mode interactif pour ajouter des utilisateurs
interactive_mode() {
    print_header "Mode Interactif - Ajout d'Utilisateurs"
    
    show_current_users
    
    echo -e "${YELLOW}Entrez les noms d'utilisateurs GitHub à ajouter${NC}"
    echo -e "${YELLOW}(un par ligne, tapez 'fin' pour terminer)${NC}"
    echo ""
    
    new_users=()
    while true; do
        echo -n -e "${BLUE}Utilisateur GitHub: ${NC}"
        read username
        
        if [ "$username" = "fin" ] || [ "$username" = "FIN" ]; then
            break
        fi
        
        if [ -n "$username" ]; then
            new_users+=("$username")
            print_success "Ajouté à la liste: $username"
        fi
    done
    
    if [ ${#new_users[@]} -eq 0 ]; then
        print_warning "Aucun utilisateur à ajouter"
        exit 0
    fi
    
    # Confirmer avant de procéder
    echo ""
    print_header "Confirmation"
    echo -e "${YELLOW}Utilisateurs à ajouter:${NC}"
    for user in "${new_users[@]}"; do
        echo -e "  ${GREEN}- $user${NC}"
    done
    echo ""
    echo -n -e "${YELLOW}Continuer? (o/N): ${NC}"
    read confirm
    
    if [ "$confirm" != "o" ] && [ "$confirm" != "O" ] && [ "$confirm" != "oui" ]; then
        print_warning "Opération annulée"
        exit 0
    fi
    
    return 0
}

# 📖 Afficher l'aide
show_help() {
    echo -e "${CYAN}🔐 Script d'Ajout Automatique d'Utilisateurs GitHub OAuth${NC}"
    echo -e "${CYAN}Formation CLIMADA CI - Script Automatisé${NC}"
    echo ""
    echo -e "${YELLOW}UTILISATION:${NC}"
    echo -e "  ${GREEN}$0${NC}                           # Mode interactif"
    echo -e "  ${GREEN}$0${NC} utilisateur1              # Ajouter un utilisateur"
    echo -e "  ${GREEN}$0${NC} user1 user2 user3         # Ajouter plusieurs utilisateurs"
    echo -e "  ${GREEN}$0${NC} --help                     # Afficher cette aide"
    echo ""
    echo -e "${YELLOW}EXEMPLES:${NC}"
    echo -e "  ${GREEN}$0${NC}                           # Le script vous guide"
    echo -e "  ${GREEN}$0${NC} \"Jean-Dupont-CI\"          # Ajouter Jean-Dupont-CI"
    echo -e "  ${GREEN}$0${NC} \"Dr-Kouame\" \"Expert-CI\"   # Ajouter plusieurs utilisateurs"
    echo ""
    echo -e "${YELLOW}PROCESSUS AUTOMATIQUE:${NC}"
    echo -e "  1. Backup automatique du fichier auth.js"
    echo -e "  2. Ajout des utilisateurs dans AUTHORIZED_USERS"
    echo -e "  3. Commit et push sur la branche main"
    echo -e "  4. Construction du site avec mkdocs"
    echo -e "  5. Déploiement automatique sur gh-pages"
    echo ""
    echo -e "${YELLOW}RÉSULTAT:${NC}"
    echo -e "  Les nouveaux utilisateurs peuvent se connecter sur:"
    echo -e "  ${CYAN}https://nicaisekassi.github.io/Formation-CLIMADA-CI/${NC}"
    echo ""
}

# 🎯 Fonction principale
main() {
    # Vérifier les options d'aide
    for arg in "$@"; do
        if [ "$arg" = "--help" ] || [ "$arg" = "-h" ] || [ "$arg" = "help" ]; then
            show_help
            exit 0
        fi
    done
    
    print_header "🔐 Ajout Automatique d'Utilisateurs GitHub OAuth"
    echo -e "${CYAN}Formation CLIMADA CI - Script Automatisé${NC}"
    echo ""
    
    # Vérifier l'environnement
    check_environment
    
    # Mode interactif ou arguments
    if [ $# -eq 0 ]; then
        interactive_mode
    else
        new_users=("$@")
    fi
    
    # Traitement des utilisateurs
    added_users=()
    for user in "${new_users[@]}"; do
        if add_user "$user"; then
            added_users+=("$user")
        fi
    done
    
    if [ ${#added_users[@]} -eq 0 ]; then
        print_warning "Aucun nouvel utilisateur ajouté"
        exit 0
    fi
    
    # Préparer le message de commit
    if [ ${#added_users[@]} -eq 1 ]; then
        commit_msg="🔐 Ajout utilisateur autorisé: ${added_users[0]}"
    else
        commit_msg="🔐 Ajout ${#added_users[@]} nouveaux utilisateurs autorisés"
    fi
    
    # Sauvegarder sur main
    if save_to_main "$commit_msg"; then
        print_success "Modifications sauvegardées sur main"
    else
        print_error "Échec de la sauvegarde sur main"
        exit 1
    fi
    
    # Déployer sur gh-pages
    if deploy_to_ghpages; then
        print_success "Déploiement réussi!"
    else
        print_error "Échec du déploiement"
        exit 1
    fi
    
    # Vérification finale
    check_deployment
    
    print_header "🎉 Processus Terminé avec Succès!"
    echo -e "${GREEN}✅ ${#added_users[@]} utilisateur(s) ajouté(s) et déployé(s)${NC}"
    for user in "${added_users[@]}"; do
        echo -e "${GREEN}   - $user${NC}"
    done
    echo ""
    print_info "Les nouveaux utilisateurs peuvent maintenant se connecter!"
}

# 🚀 Lancement du script
main "$@"