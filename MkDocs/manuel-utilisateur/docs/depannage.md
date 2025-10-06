# Dépannage et Bonnes Pratiques

Cette section vous aidera à résoudre les problèmes les plus courants.

## Problèmes d'Installation Fréquents

**Erreur Microsoft Visual C++ (Windows)** : Ce problème survient souvent. La solution est d'installer les "Visual Studio Build Tools" depuis le site de Microsoft.

**Kernel climada_formation non visible dans Jupyter** : Si cela arrive, activez votre environnement (`conda activate climada_formation`) et réinstallez le kernel avec la commande :

```bash
python -m ipykernel install --user --name climada_formation --display-name "CLIMADA DGE"
```

## Bonnes Pratiques de Modélisation

- **Commencez simple** : Ne cherchez pas à tout modéliser d'un coup. Isoler un aléa et une zone géographique pour commencer.
- **Documentez tout** : Gardez une trace de vos sources de données, de vos hypothèses et des versions de vos codes. La reproductibilité est la clé.
- **Analysez la sensibilité** : Testez comment vos résultats changent si vous modifiez une hypothèse clé (ex: la fonction de vulnérabilité). Cela vous donnera une idée de la robustesse de vos conclusions.
- **Collaborez** : Une bonne analyse de risque est toujours pluridisciplinaire. Travaillez en étroite collaboration avec les experts sectoriels (météorologues, agronomes, ingénieurs).
