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
    
    print_header "💾 Sauvegarde sur la branche main"
    
    cd "$REPO_DIR"
    
    # S'assurer qu'on est sur main
    git checkout main
    
    print_info "Ajout des modifications..."
    git add .
    
    print_info "Création du commit..."
    if git commit -m "$commit_message"; then
        print_success "Commit réussi sur main"
        
        print_info "Push vers origin/main..."
        if git push origin main; then
            print_success "Push réussi vers origin/main"
            return 0
        else
            print_error "Échec du push vers origin/main"
            return 1
        fi
    else
        print_warning "Aucune modification à commiter sur main"
        return 0
    fi
}

# 🚀 Déployer sur gh-pages
deploy_to_ghpages() {
    print_header "🚀 Déploiement sur gh-pages"
    
    cd "$REPO_DIR"
    
    # S'assurer qu'on est sur main
    git checkout main
    
    # Pull pour être sûr d'avoir la dernière version
    print_info "Récupération des dernières modifications..."
    git pull origin main || print_warning "Impossible de pull - continuons"
    
    # Aller dans le répertoire MkDocs
    cd "$MKDOCS_DIR"
    
    # Activer l'environnement conda si nécessaire
    if command -v conda &> /dev/null; then
        print_info "Activation de l'environnement conda..."
        source ~/anaconda3/etc/profile.d/conda.sh
        conda activate climada_formation 2>/dev/null || print_warning "Environnement climada_formation non trouvé, utilisation de l'environnement par défaut"
    fi
    
    # Construire le site PROPREMENT
    print_info "Nettoyage du site précédent..."
    rm -rf site/ || true
    
    print_info "Construction du site avec mkdocs..."
    if mkdocs build; then
        print_success "Site construit avec succès"
    else
        print_error "Échec de la construction mkdocs"
        return 1
    fi
    
    # Retourner à la racine du repo
    cd "$REPO_DIR"
    
    # Sauvegarder la branche actuelle
    current_branch=$(git branch --show-current)
    
    # Passer à gh-pages
    print_info "Passage à la branche gh-pages..."
    if git checkout gh-pages; then
        print_success "Sur la branche gh-pages"
    else
        print_warning "Création de la branche gh-pages..."
        git checkout -b gh-pages || {
            print_error "Impossible de créer/accéder à la branche gh-pages"
            return 1
        }
    fi
    
    # Nettoyer gh-pages (SAUF .git)
    print_info "Nettoyage de la branche gh-pages..."
    find . -mindepth 1 -not -path './.git*' -delete
    
    # Copier les fichiers générés depuis main
    print_info "Copie des fichiers du site..."
    cp -r "$MKDOCS_DIR/site/"* . || {
        print_error "Impossible de copier les fichiers du site"
        git checkout "$current_branch"
        return 1
    }
    
    # Ajouter un fichier .nojekyll pour GitHub Pages
    touch .nojekyll
    
    # Commiter et pousser vers gh-pages
    print_info "Ajout des fichiers sur gh-pages..."
    git add .
    
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    commit_message="🚀 Déploiement automatique du site - $timestamp"
    
    print_info "Commit sur gh-pages: $commit_message"
    if git commit -m "$commit_message"; then
        print_success "Commit réussi sur gh-pages"
        
        print_info "Push vers origin/gh-pages..."
        if git push origin gh-pages --force; then
            print_success "✅ Déploiement réussi sur gh-pages !"
            print_info "🌐 Site accessible sur: https://nicaisekassi.github.io/Formation-CLIMADA-CI/"
        else
            print_error "Échec du push vers gh-pages"
            git checkout "$current_branch"
            return 1
        fi
    else
        print_warning "Aucune modification à commiter sur gh-pages"
    fi
    
    # Retourner à la branche principale
    print_info "Retour à la branche $current_branch..."
    git checkout "$current_branch"
    
    print_success "✅ Déploiement terminé avec succès"
    return 0
}

# 🌐 Vérifier le déploiement
check_deployment() {
    print_header "🌐 Vérification du Déploiement"
    
    print_success "✅ Déploiement terminé !"
    print_info "Le site sera mis à jour dans 2-3 minutes à l'adresse:"
    echo -e "${CYAN}https://nicaisekassi.github.io/Formation-CLIMADA-CI/${NC}"
    echo ""
    print_info "💡 Conseils pour vérifier l'accès:"
    echo -e "  • Attendez 2-3 minutes pour la propagation"
    echo -e "  • Videz le cache de votre navigateur (Ctrl+F5)"
    echo -e "  • Testez en navigation privée"
    echo ""
    print_warning "⏰ Si l'utilisateur ne peut toujours pas accéder:"
    echo -e "  • Vérifiez que son nom GitHub est exact (sensible à la casse)"
    echo -e "  • Relancez ce script pour forcer une nouvelle construction"
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