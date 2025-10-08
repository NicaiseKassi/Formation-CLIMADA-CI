// Configuration GitHub OAuth
const GITHUB_CLIENT_ID = "Ov23liKn3F84EgMGpVnS"; // Votre Client ID GitHub
const GITHUB_REDIRECT_URI =
  "https://nicaisekassi.github.io/Formation-CLIMADA-CI/auth/callback.html";

// Mode de test (à désactiver en production)
const TEST_MODE = false; // Mode production activé - authentification réelle

// Liste des utilisateurs autorisés (GitHub usernames)
const AUTHORIZED_USERS = [
  "NicaiseKassi",
  "nicaisekassi", // En cas de variation de casse
  // Ajoutez ici les usernames GitHub des 27 participants
  // Exemples pour les ministères et institutions :
  "Matrice95",
  // 'participant-ddt',
  // 'participant-agriculture',
  // 'expert-climat-ci',
  // etc...
  "Participant-Test-Formation",
  "Expert-Test-2025",
  "Dr-Ministere-Environnement",
  "Expert-Agriculture-CI",
  "Participant-Universite",
  "kacouhub",
  "konan-remi2025",
  "OUATTCAS",
  "berengeredoukou-netizen",
  "makicha2014",
  "Sikha010925",
  "Yachouivi",
  "rogermoussan",
  "F-Bright",
  "oumardiabate63-maker",
  "ahitanoh",
  "danacyr10",
  "KOUASSI-KOFFI-JOSE-MARIA",
  "AbolDgeProject",
  "--deploy-only",
  "feby-hub",
  "gerallou",
];

// Vérifier si l'utilisateur est connecté
function checkAuth() {
  // Mode test : permettre l'accès sans authentification
  if (TEST_MODE) {
    const testUser = {
      login: "test-user",
      name: "Utilisateur Test",
      avatar_url: "https://github.com/github.png",
    };
    showUserInfo(testUser);
    return true;
  }

  const token = localStorage.getItem("github_token");
  const user = localStorage.getItem("github_user");

  if (!token || !user) {
    redirectToLogin();
    return false;
  }

  const userData = JSON.parse(user);
  if (!AUTHORIZED_USERS.includes(userData.login)) {
    alert("Accès non autorisé. Contactez l'administrateur.");
    logout();
    return false;
  }

  showUserInfo(userData);
  return true;
}

// Rediriger vers la page de connexion GitHub
function redirectToLogin() {
  const authUrl = `https://github.com/login/oauth/authorize?client_id=${GITHUB_CLIENT_ID}&redirect_uri=${encodeURIComponent(
    GITHUB_REDIRECT_URI
  )}&scope=user:email`;
  window.location.href = authUrl;
}

// Déconnexion
function logout() {
  localStorage.removeItem("github_token");
  localStorage.removeItem("github_user");
  redirectToLogin();
}

// Afficher les informations utilisateur
function showUserInfo(user) {
  const userInfo = document.getElementById("user-info");
  if (userInfo) {
    userInfo.innerHTML = `
            <div class="user-profile">
                <img src="${user.avatar_url}" alt="${
      user.name
    }" width="32" height="32" style="border-radius: 50%;">
                <span>Connecté en tant que <strong>${
                  user.name || user.login
                }</strong></span>
                <button onclick="logout()" class="logout-btn">Déconnexion</button>
            </div>
        `;
    userInfo.style.display = "block";
  }
}

// Traiter le callback GitHub
function handleGitHubCallback() {
  const urlParams = new URLSearchParams(window.location.search);
  const code = urlParams.get("code");

  if (code) {
    // Simuler la vérification - En production, vous devriez utiliser votre serveur
    // Pour cette démonstration, nous utilisons une approche côté client

    // Récupérer les informations utilisateur via l'API GitHub
    // Note: Ceci nécessite que l'utilisateur soit connecté à GitHub dans son navigateur
    fetchGitHubUserInfo(code);
  }
}

// Récupérer les informations utilisateur GitHub
async function fetchGitHubUserInfo(code) {
  try {
    // Récupérer directement les informations de l'utilisateur connecté à GitHub
    // via l'API publique (sans token - informations publiques uniquement)

    // Première approche : demander le username et valider via l'API
    const username = prompt(
      "Pour finaliser la connexion, veuillez confirmer votre nom d'utilisateur GitHub :"
    );

    if (!username) {
      alert("Nom d'utilisateur requis pour la vérification.");
      redirectToLogin();
      return;
    }

    // Vérifier si l'utilisateur est autorisé
    if (!AUTHORIZED_USERS.includes(username)) {
      alert(
        `Accès refusé. L'utilisateur "${username}" n'est pas dans la liste des participants autorisés à cette formation.`
      );
      redirectToLogin();
      return;
    }

    // Récupérer les informations publiques de l'utilisateur GitHub
    const response = await fetch(`https://api.github.com/users/${username}`);

    if (response.ok) {
      const userData = await response.json();

      // Sauvegarder les informations
      localStorage.setItem("github_token", "authenticated");
      localStorage.setItem("github_user", JSON.stringify(userData));

      alert(
        `Bienvenue ${
          userData.name || userData.login
        } ! Accès autorisé à la formation CLIMADA.`
      );

      // Rediriger vers la page principale
      window.location.href = "../index.html";
    } else if (response.status === 404) {
      alert(
        `L'utilisateur GitHub "${username}" n'existe pas. Veuillez vérifier l'orthographe de votre nom d'utilisateur.`
      );
      redirectToLogin();
    } else {
      alert(
        `Erreur lors de la vérification de l'utilisateur "${username}". Veuillez réessayer.`
      );
      redirectToLogin();
    }
  } catch (error) {
    console.error("Erreur d'authentification:", error);
    alert(
      "Erreur de connexion réseau. Veuillez vérifier votre connexion Internet et réessayer."
    );
    redirectToLogin();
  }
}

// Initialiser l'authentification au chargement de la page
document.addEventListener("DOMContentLoaded", function () {
  // Si on est sur la page de callback
  if (window.location.pathname.includes("callback.html")) {
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
document.head.insertAdjacentHTML("beforeend", authStyles);
