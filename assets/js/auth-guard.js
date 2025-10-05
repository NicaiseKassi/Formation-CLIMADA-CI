/**
 * Auth Guard - Vérifie que l'utilisateur est authentifié
 * Redirige vers la page d'authentification si nécessaire
 */

(function () {
  const SESSION_KEY = "climada_manual_session";

  console.log("=== AUTH GUARD ACTIF ===");

  // Fonction pour vérifier l'authentification
  function checkAuth() {
    // Vérifier si Netlify Identity est chargé
    if (!window.netlifyIdentity) {
      console.error("Netlify Identity non chargé - redirection");
      redirectToAuth();
      return;
    }

    // Vérifier l'utilisateur actuel
    const user = netlifyIdentity.currentUser();
    console.log("Utilisateur actuel:", user ? user.email : "aucun");

    // Vérifier la session
    const session = localStorage.getItem(SESSION_KEY);
    console.log("Session:", session ? "active" : "inactive");

    if (!user || !session) {
      // Pas d'utilisateur ou pas de session - rediriger
      console.log("Authentification requise - redirection");
      redirectToAuth();
    } else {
      // Vérifier le rôle "user"
      const roles = user.app_metadata?.roles || [];
      if (!roles.includes("user")) {
        console.warn("Rôle insuffisant - redirection");
        redirectToAuth();
      } else {
        console.log("✅ Authentification valide");
      }
    }
  }

  // Fonction de redirection
  function redirectToAuth() {
    // Nettoyer la session
    localStorage.removeItem(SESSION_KEY);

    // Éviter les boucles de redirection
    if (!window.location.pathname.includes("index_auth")) {
      console.log("Redirection vers /index_auth.html");
      window.location.href = "/index_auth.html";
    }
  }

  // Attendre que Netlify Identity soit prêt
  if (window.netlifyIdentity) {
    netlifyIdentity.on("init", checkAuth);

    // Vérifier à chaque événement de déconnexion
    netlifyIdentity.on("logout", function () {
      console.log("Déconnexion détectée - redirection");
      redirectToAuth();
    });
  } else {
    // Si Netlify Identity n'est pas chargé, attendre un peu puis vérifier
    setTimeout(function () {
      if (!window.netlifyIdentity) {
        console.error("Netlify Identity toujours pas chargé après timeout");
        redirectToAuth();
      } else {
        checkAuth();
      }
    }, 2000);
  }

  // Vérifier également au chargement complet de la page
  window.addEventListener("load", checkAuth);
})();
