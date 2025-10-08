#!/bin/bash

# 🚀 Script de Push Automatique vers main
# Détecte et pousse automatiquement les nouveaux dossiers/fichiers
# Créé le 8 octobre 2025

set -e

# 🎨 Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# 📁 Configuration
REPO_DIR="/home/kassi/Documents/EXPERTISE/FORMATION_DGE_CLIMADA/Formation_CLIMADA"

# 🔧 Fonctions utilitaires
print_header() {
    echo -e "${PURPLE}=================================${NC}"
    echo -e "${PURPLE} $1 ${NC}"
    echo -e "${PURPLE}=================================${NC}"
}

print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
print_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }

# 🔍 Vérifier l'environnement
check_environment() {
    print_header "🔍 Vérification de l'Environnement"
    
    if [ ! -d "$REPO_DIR" ]; then
        print_error "Répertoire non trouvé: $REPO_DIR"
        exit 1
    fi
    
    cd "$REPO_DIR"
    print_success "Répertoire: $REPO_DIR"
    
    if [ ! -d ".git" ]; then
        print_error "Ce n'est pas un répertoire git"
        exit 1
    fi
    print_success "Repository Git détecté"
    
    # Vérifier la branche
    current_branch=$(git branch --show-current)
    print_info "Branche actuelle: $current_branch"
    
    if [ "$current_branch" != "main" ]; then
        print_warning "Passage à la branche main..."
        git checkout main || {
            print_error "Impossible de passer à la branche main"
            exit 1
        }
    fi
    print_success "Sur la branche main"
}

# 🔍 Détecter les changements
detect_changes() {
    print_header "🔍 Détection des Changements"
    
    cd "$REPO_DIR"
    
    # Vérifier s'il y a des modifications
    if git status --porcelain | grep -q .; then
        print_success "Modifications détectées !"
        
        echo -e "${BLUE}📋 Résumé des changements:${NC}"
        git status --short | while read status file; do
            case $status in
                "A ") echo -e "  ${GREEN}➕ Ajouté: $file${NC}" ;;
                "M ") echo -e "  ${YELLOW}📝 Modifié: $file${NC}" ;;
                "D ") echo -e "  ${RED}🗑️  Supprimé: $file${NC}" ;;
                "??") echo -e "  ${CYAN}❓ Nouveau: $file${NC}" ;;
                *) echo -e "  ${PURPLE}🔄 $status $file${NC}" ;;
            esac
        done
        
        # Compter les types de changements
        added_count=$(git status --porcelain | grep -c "^A " || echo "0")
        modified_count=$(git status --porcelain | grep -c "^M " || echo "0")
        untracked_count=$(git status --porcelain | grep -c "^??" || echo "0")
        
        echo ""
        print_info "📊 Statistiques:"
        echo -e "  • ${GREEN}$added_count fichier(s) ajouté(s)${NC}"
        echo -e "  • ${YELLOW}$modified_count fichier(s) modifié(s)${NC}"
        echo -e "  • ${CYAN}$untracked_count nouveau(x) fichier(s)${NC}"
        
        return 0
    else
        print_warning "Aucune modification détectée"
        print_info "Repository déjà à jour avec origin/main"
        return 1
    fi
}

# 📁 Analyser les nouveaux dossiers/fichiers
analyze_new_content() {
    print_header "📁 Analyse du Nouveau Contenu"
    
    cd "$REPO_DIR"
    
    # Détecter les nouveaux dossiers
    untracked_dirs=$(git status --porcelain | grep "^??" | cut -c4- | while read file; do
        dirname "$file"
    done | sort | uniq | grep -v "^\.$")
    
    if [ -n "$untracked_dirs" ]; then
        print_success "Nouveaux dossiers détectés:"
        echo "$untracked_dirs" | while read dir; do
            if [ -d "$dir" ]; then
                file_count=$(find "$dir" -type f | wc -l)
                print_info "  📁 $dir/ ($file_count fichiers)"
                
                # Afficher quelques exemples de fichiers
                find "$dir" -type f | head -3 | sed 's/^/    📄 /'
                if [ $file_count -gt 3 ]; then
                    echo "    ... et $((file_count - 3)) autres fichiers"
                fi
            fi
        done
    fi
    
    # Détecter les nouveaux fichiers à la racine
    untracked_files=$(git status --porcelain | grep "^??" | cut -c4- | while read file; do
        if [ -f "$file" ] && [ "$(dirname "$file")" = "." ]; then
            echo "$file"
        fi
    done)
    
    if [ -n "$untracked_files" ]; then
        print_success "Nouveaux fichiers à la racine:"
        echo "$untracked_files" | sed 's/^/  📄 /'
    fi
}

# ➕ Ajouter les changements
add_changes() {
    print_header "➕ Ajout des Changements"
    
    cd "$REPO_DIR"
    
    print_info "Ajout de tous les fichiers..."
    git add . --all
    
    # Vérifier ce qui a été ajouté
    staged_files=$(git diff --cached --name-only | wc -l)
    if [ $staged_files -gt 0 ]; then
        print_success "$staged_files fichier(s) ajouté(s) au staging"
        
        print_info "Fichiers en staging:"
        git diff --cached --name-only | head -10 | sed 's/^/  📄 /'
        if [ $staged_files -gt 10 ]; then
            echo "  ... et $((staged_files - 10)) autres fichiers"
        fi
    else
        print_warning "Aucun fichier en staging"
        return 1
    fi
}

# 💾 Créer le commit
create_commit() {
    print_header "💾 Création du Commit"
    
    cd "$REPO_DIR"
    
    # Générer un message de commit intelligent
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Analyser les types de changements pour le message
    added_count=$(git diff --cached --name-only | wc -l)
    
    # Détecter le type de contenu principal
    commit_message="📦 Mise à jour du projet"
    
    if git diff --cached --name-only | grep -q "TP/"; then
        commit_message="📓 Mise à jour des TP"
    elif git diff --cached --name-only | grep -q "Cours/"; then
        commit_message="📚 Mise à jour des cours"
    elif git diff --cached --name-only | grep -q "MkDocs/"; then
        commit_message="🌐 Mise à jour de la documentation"
    elif git diff --cached --name-only | grep -q "\.yml$"; then
        commit_message="🐍 Mise à jour de l'environnement"
    fi
    
    commit_message="$commit_message ($added_count fichiers) - $timestamp"
    
    print_info "Message de commit: $commit_message"
    
    if git commit -m "$commit_message"; then
        print_success "Commit créé avec succès !"
        
        # Afficher le hash du commit
        commit_hash=$(git rev-parse --short HEAD)
        print_info "Hash du commit: $commit_hash"
        
        return 0
    else
        print_error "Échec de la création du commit"
        return 1
    fi
}

# 🚀 Pousser vers GitHub
push_to_github() {
    print_header "🚀 Push vers GitHub"
    
    cd "$REPO_DIR"
    
    print_info "Push vers origin/main..."
    
    if git push origin main; then
        print_success "Push réussi vers GitHub !"
        
        # Afficher l'URL du repository
        repo_url=$(git remote get-url origin | sed 's/\.git$//')
        print_info "Repository: $repo_url"
        
        return 0
    else
        print_error "Échec du push vers GitHub"
        print_warning "Vérifiez votre connexion et vos permissions"
        return 1
    fi
}

# 📊 Résumé final
final_summary() {
    print_header "📊 Résumé Final"
    
    cd "$REPO_DIR"
    
    # Afficher les derniers commits
    print_info "Derniers commits:"
    git log --oneline -3 | sed 's/^/  🔄 /'
    
    echo ""
    print_success "✅ Synchronisation terminée avec succès !"
    print_info "Votre repository GitHub est maintenant à jour"
    
    # Afficher le statut final
    if git status --porcelain | grep -q .; then
        print_warning "Il reste encore des modifications non commitées"
        git status --short | sed 's/^/  /'
    else
        print_success "Repository propre - tout est synchronisé !"
    fi
}

# 🎯 Fonction principale
main() {
    print_header "🚀 Push Automatique vers Main"
    echo -e "${CYAN}Détection et synchronisation automatique des changements${NC}"
    echo ""
    
    # 1. Vérifier l'environnement
    check_environment
    
    # 2. Détecter les changements
    if ! detect_changes; then
        print_info "Rien à synchroniser, repository déjà à jour"
        exit 0
    fi
    
    # 3. Analyser le nouveau contenu
    analyze_new_content
    
    # 4. Demander confirmation (sauf si --auto)
    if [ "$1" != "--auto" ]; then
        echo ""
        read -p "$(echo -e ${YELLOW}Procéder à la synchronisation? [o/N]: ${NC})" confirm
        if [ "$confirm" != "o" ] && [ "$confirm" != "O" ]; then
            print_warning "Synchronisation annulée"
            exit 0
        fi
    fi
    
    # 5. Ajouter les changements
    if ! add_changes; then
        print_error "Impossible d'ajouter les changements"
        exit 1
    fi
    
    # 6. Créer le commit
    if ! create_commit; then
        print_error "Impossible de créer le commit"
        exit 1
    fi
    
    # 7. Pousser vers GitHub
    if ! push_to_github; then
        print_error "Impossible de pousser vers GitHub"
        exit 1
    fi
    
    # 8. Résumé final
    final_summary
}

# 📝 Afficher l'aide
show_help() {
    echo -e "${PURPLE}🚀 Script de Push Automatique vers Main${NC}"
    echo -e "${CYAN}Détecte et synchronise automatiquement les nouveaux dossiers/fichiers${NC}"
    echo ""
    echo -e "${YELLOW}UTILISATION:${NC}"
    echo "  ./push_to_main.sh                    # Mode interactif (demande confirmation)"
    echo "  ./push_to_main.sh --auto             # Mode automatique (sans confirmation)"
    echo "  ./push_to_main.sh --help             # Afficher cette aide"
    echo ""
    echo -e "${YELLOW}FONCTIONNALITÉS:${NC}"
    echo "  • Détection automatique des nouveaux fichiers/dossiers"
    echo "  • Analyse intelligente du contenu"
    echo "  • Messages de commit automatiques et descriptifs"
    echo "  • Push automatique vers GitHub"
    echo "  • Rapport détaillé des changements"
    echo ""
    echo -e "${YELLOW}EXEMPLES:${NC}"
    echo "  ./push_to_main.sh                    # Vérifier et synchroniser avec confirmation"
    echo "  ./push_to_main.sh --auto             # Synchronisation automatique"
    echo ""
    echo -e "${GREEN}RÉSULTAT:${NC}"
    echo "  Tous vos nouveaux dossiers et fichiers seront automatiquement"
    echo "  commitées et poussés vers la branche main de votre repository GitHub."
}

# 🚀 Point d'entrée
case "${1:-}" in
    --help|-h)
        show_help
        ;;
    *)
        main "$@"
        ;;
esac