// Configuration GitHub OAuth
const GITHUB_CLIENT_ID = 'votre_client_id_ici'; // À remplacer par votre vrai Client ID
const GITHUB_REDIRECT_URI = 'https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/callback.html';

// Liste des utilisateurs autorisés (GitHub usernames)
const AUTHORIZED_USERS = [
    'NicaiseKassi',
    'participant1',
    'participant2',
    // Ajoutez les usernames GitHub des participants ici
];

// Vérifier si l'utilisateur est connecté
function checkAuth() {
    const token = localStorage.getItem('github_token');
    const user = localStorage.getItem('github_user');
    
    if (!token || !user) {
        redirectToLogin();
        return false;
    }
    
    const userData = JSON.parse(user);
    if (!AUTHORIZED_USERS.includes(userData.login)) {
        alert('Accès non autorisé. Contactez l\'administrateur.');
        logout();
        return false;
    }
    
    showUserInfo(userData);
    return true;
}

// Rediriger vers la page de connexion GitHub
function redirectToLogin() {
    const authUrl = `https://github.com/login/oauth/authorize?client_id=${GITHUB_CLIENT_ID}&redirect_uri=${encodeURIComponent(GITHUB_REDIRECT_URI)}&scope=user:email`;
    window.location.href = authUrl;
}

// Déconnexion
function logout() {
    localStorage.removeItem('github_token');
    localStorage.removeItem('github_user');
    redirectToLogin();
}

// Afficher les informations utilisateur
function showUserInfo(user) {
    const userInfo = document.getElementById('user-info');
    if (userInfo) {
        userInfo.innerHTML = `
            <div class="user-profile">
                <img src="${user.avatar_url}" alt="${user.name}" width="32" height="32" style="border-radius: 50%;">
                <span>Connecté en tant que <strong>${user.name || user.login}</strong></span>
                <button onclick="logout()" class="logout-btn">Déconnexion</button>
            </div>
        `;
        userInfo.style.display = 'block';
    }
}

// Traiter le callback GitHub
function handleGitHubCallback() {
    const urlParams = new URLSearchParams(window.location.search);
    const code = urlParams.get('code');
    
    if (code) {
        // Dans un vrai scénario, vous devriez échanger le code contre un token via votre serveur
        // Pour cette démo, nous simulons la récupération des données utilisateur
        fetchUserData(code);
    }
}

// Simuler la récupération des données utilisateur (remplacer par votre logique serveur)
async function fetchUserData(code) {
    try {
        // ATTENTION: Ceci est une simulation. Dans un vrai projet,
        // vous devez échanger le code contre un token via votre serveur backend
        
        // Pour cette démo, nous utilisons directement l'API GitHub
        // (non recommandé en production car cela expose votre client_secret)
        
        alert('Connexion réussie ! Redirection...');
        
        // Simulation des données utilisateur
        const simulatedUser = {
            login: 'NicaiseKassi',
            name: 'Nicaise Kassi',
            avatar_url: 'https://github.com/NicaiseKassi.png',
            email: 'nicaise@example.com'
        };
        
        localStorage.setItem('github_token', 'simulated_token');
        localStorage.setItem('github_user', JSON.stringify(simulatedUser));
        
        // Rediriger vers la page principale
        window.location.href = '../index.html';
        
    } catch (error) {
        console.error('Erreur d\'authentification:', error);
        alert('Erreur de connexion. Veuillez réessayer.');
    }
}

// Initialiser l'authentification au chargement de la page
document.addEventListener('DOMContentLoaded', function() {
    // Si on est sur la page de callback
    if (window.location.pathname.includes('callback.html')) {
        handleGitHubCallback();
        return;
    }
    
    // Sinon, vérifier l'authentification
    checkAuth();
});

// Ajouter les styles CSS pour l'interface utilisateur
const authStyles = `
<style>
.user-profile {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 10px;
    background: #f5f5f5;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin: 10px 0;
}

.logout-btn {
    background: #dc3545;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    cursor: pointer;
    font-size: 12px;
}

.logout-btn:hover {
    background: #c82333;
}

.auth-container {
    max-width: 400px;
    margin: 50px auto;
    padding: 20px;
    text-align: center;
    border: 1px solid #ddd;
    border-radius: 5px;
}

.github-login-btn {
    background: #333;
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    text-decoration: none;
    display: inline-block;
}

.github-login-btn:hover {
    background: #555;
}
</style>
`;

// Injecter les styles
document.head.insertAdjacentHTML('beforeend', authStyles);