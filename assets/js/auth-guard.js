/**
 * Auth Guard - Vérifie que l'utilisateur est authentifié
 * Redirige vers la page d'authentification si nécessaire
 */

(function () {
  const SESSION_KEY = "climada_manual_session";
  const API_URL = "https://formation-climada-dge.netlify.app/.netlify/identity";
  let auth = null;

  console.log("=== AUTH GUARD ACTIF (GoTrue) ===");

  function initAuth() {
    if (!window.GoTrue) {
      console.warn("GoTrue non chargé - nouvelle tentative dans 500ms");
      setTimeout(initAuth, 500);
      return;
    }

    auth = new window.GoTrue({
      APIUrl: API_URL,
      setCookie: true,
    });

    checkAuth();
  }

  function getCurrentUser() {
    if (!auth) {
      return null;
    }

    try {
      return auth.currentUser();
    } catch (error) {
      console.error(
        "Erreur lors de la récupération de l'utilisateur courant",
        error
      );
      return null;
    }
  }

  function checkAuth() {
    const user = getCurrentUser();
    const session = localStorage.getItem(SESSION_KEY);

    console.log("Utilisateur courant:", user ? user.email : "aucun");
    console.log("Session:", session ? "active" : "inactive");

    if (!user || !session) {
      console.log("Authentification requise - redirection");
      redirectToAuth();
      return;
    }

    const roles = user.app_metadata?.roles || [];
    if (!roles.includes("user")) {
      console.warn("Rôle insuffisant - redirection");
      redirectToAuth();
      return;
    }

    console.log("✅ Authentification valide");
  }

  function redirectToAuth() {
    localStorage.removeItem(SESSION_KEY);

    if (!window.location.pathname.includes("index_auth")) {
      console.log("Redirection vers /index_auth.html");
      window.location.href = "/index_auth.html";
    }
  }

  function handleStorage(event) {
    if (event.key === SESSION_KEY && event.newValue === null) {
      console.log("Session supprimée depuis un autre onglet - redirection");
      redirectToAuth();
    }
  }

  // Vérifications périodiques pour s'assurer que la session reste valide
  function startPeriodicChecks() {
    setInterval(checkAuth, 3000);
  }

  window.addEventListener("load", checkAuth);
  window.addEventListener("focus", checkAuth);
  window.addEventListener("storage", handleStorage);

  initAuth();
  startPeriodicChecks();
})();
