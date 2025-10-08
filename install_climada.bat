@echo off
REM ===============================================================================
REM Script d'Installation Automatique CLIMADA pour Windows
REM 
REM Ce script installe automatiquement l'environnement CLIMADA pour la formation
REM sur l'analyse des risques climatiques en Côte d'Ivoire
REM
REM Usage: install_climada.bat
REM        OU double-cliquer sur le fichier depuis l'explorateur Windows
REM ===============================================================================

setlocal enabledelayedexpansion

REM Couleurs pour Windows (simulation)
set "SUCCESS=[OK]"
set "ERROR=[ERREUR]"
set "WARNING=[ATTENTION]"
set "INFO=[INFO]"

cls
echo.
echo ========================================================================
echo.
echo         INSTALLATION FORMATION CLIMADA - WINDOWS
echo         Analyse des Risques Climatiques - Cote d'Ivoire
echo.
echo ========================================================================
echo.
echo Ce script va installer l'environnement CLIMADA complet
echo.
pause

REM ===============================================================================
REM ETAPE 1 : Verification du systeme
REM ===============================================================================

echo.
echo ========================================================================
echo ETAPE 1/6 : Verification du systeme
echo ========================================================================
echo.

REM Verifier l'espace disque (C:)
for /f "tokens=3" %%a in ('dir c:\ ^| find "octets libres"') do set FREE_SPACE=%%a
echo %INFO% Verification de l'espace disque...
echo %SUCCESS% Espace disque disponible sur C:\

timeout /t 2 /nobreak >nul

REM ===============================================================================
REM ETAPE 2 : Verification de Conda
REM ===============================================================================

echo.
echo ========================================================================
echo ETAPE 2/6 : Verification de Conda
echo ========================================================================
echo.

where conda >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo %ERROR% Conda n'est pas installe ou pas dans le PATH
    echo.
    echo SOLUTION :
    echo 1. Installez Miniconda depuis : https://docs.conda.io/en/latest/miniconda.html
    echo 2. OU ouvrez "Anaconda Prompt" au lieu de l'invite de commandes normale
    echo 3. Puis relancez ce script
    echo.
    pause
    exit /b 1
) else (
    for /f "tokens=2" %%a in ('conda --version') do set CONDA_VERSION=%%a
    echo %SUCCESS% Conda deja installe (version !CONDA_VERSION!)
)

timeout /t 2 /nobreak >nul

REM ===============================================================================
REM ETAPE 3 : Configuration de Conda
REM ===============================================================================

echo.
echo ========================================================================
echo ETAPE 3/6 : Configuration de Conda
echo ========================================================================
echo.

echo %INFO% Configuration des canaux Conda...
call conda config --add channels conda-forge
call conda config --set channel_priority strict

echo %SUCCESS% Canaux configures

timeout /t 2 /nobreak >nul

REM ===============================================================================
REM ETAPE 4 : Preparation de l'environnement
REM ===============================================================================

echo.
echo ========================================================================
echo ETAPE 4/6 : Preparation de l'environnement
echo ========================================================================
echo.

REM Verifier si l'environnement existe deja
call conda env list | find "climada_formation" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo %WARNING% L'environnement 'climada_formation' existe deja
    echo.
    set /p CHOICE="Voulez-vous le supprimer et le recreer ? (O/N) : "
    if /i "!CHOICE!"=="O" (
        echo %INFO% Suppression de l'ancien environnement...
        call conda env remove -n climada_formation -y
        echo %SUCCESS% Ancien environnement supprime
    ) else (
        echo %INFO% Conservation de l'environnement existant
        echo %INFO% Mise a jour de l'environnement...
        call conda env update -f environment_formation.yml --prune
        echo %SUCCESS% Environnement mis a jour
        goto TEST_INSTALLATION
    )
)

timeout /t 2 /nobreak >nul

REM ===============================================================================
REM ETAPE 5 : Creation de l'environnement CLIMADA
REM ===============================================================================

echo.
echo ========================================================================
echo ETAPE 5/6 : Installation de l'environnement CLIMADA
echo ========================================================================
echo.

echo %INFO% Cette etape peut prendre 15-30 minutes...
echo %INFO% Creation de l'environnement depuis environment_formation.yml
echo.

REM Verifier que le fichier existe
if not exist "environment_formation.yml" (
    echo %ERROR% Fichier environment_formation.yml introuvable
    echo %INFO% Assurez-vous d'etre dans le dossier Formation-CLIMADA-CI
    pause
    exit /b 1
)

REM Creer l'environnement
call conda env create -f environment_formation.yml

if %ERRORLEVEL% NEQ 0 (
    echo %ERROR% Echec de la creation de l'environnement
    echo.
    echo SOLUTIONS :
    echo 1. Nettoyez le cache : conda clean --all
    echo 2. Verifiez votre connexion Internet
    echo 3. Relancez ce script
    echo.
    pause
    exit /b 1
) else (
    echo %SUCCESS% Environnement cree avec succes !
)

timeout /t 2 /nobreak >nul

REM ===============================================================================
REM ETAPE 6 : Test de l'installation
REM ===============================================================================

:TEST_INSTALLATION

echo.
echo ========================================================================
echo ETAPE 6/6 : Test de l'installation
echo ========================================================================
echo.

echo %INFO% Activation de l'environnement...

REM Activer l'environnement
call conda activate climada_formation

if %ERRORLEVEL% NEQ 0 (
    echo %ERROR% Impossible d'activer l'environnement
    pause
    exit /b 1
)

echo %SUCCESS% Environnement active

REM Test des imports principaux
echo %INFO% Test des modules Python...
echo.

python -c "import sys; print('\nVerification des modules...\n'); modules_test = {'climada': 'CLIMADA', 'numpy': 'NumPy', 'pandas': 'Pandas', 'matplotlib': 'Matplotlib', 'cartopy': 'Cartopy', 'geopandas': 'GeoPandas', 'xarray': 'Xarray', 'netCDF4': 'NetCDF4', 'rasterio': 'Rasterio', 'shapely': 'Shapely'}; echecs = []; [echecs.append(nom) if __import__(module) is None else print(f'[OK] {nom:15}') for module, nom in modules_test.items()]; print(f'\n[OK] Tous les modules sont installes correctement !') if not echecs else print(f'\n[ERREUR] Modules manquants : {echecs}'); sys.exit(0 if not echecs else 1)"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo %ERROR% Certains modules n'ont pas pu etre importes
    echo %INFO% Essayez de recreer l'environnement
    pause
    exit /b 1
)

REM ===============================================================================
REM FINALISATION
REM ===============================================================================

echo.
echo ========================================================================
echo          INSTALLATION TERMINEE AVEC SUCCES !
echo ========================================================================
echo.
echo Felicitations ! L'environnement CLIMADA est pret.
echo.
echo Pour commencer a utiliser CLIMADA :
echo.
echo   1. Activer l'environnement :
echo      conda activate climada_formation
echo.
echo   2. Lancer Jupyter Notebook :
echo      jupyter notebook
echo.
echo   3. Ou lancer Jupyter Lab :
echo      jupyter lab
echo.
echo   4. Ouvrir les notebooks de formation dans le dossier TP\
echo.
echo Consultez INSTALLATION_WINDOWS.md pour plus d'informations
echo.

REM Creer un script de test rapide
echo %INFO% Creation d'un script de test rapide...

echo import sys > test_climada_quick.py
echo. >> test_climada_quick.py
echo print("Test rapide de l'installation CLIMADA\n") >> test_climada_quick.py
echo print("="*50) >> test_climada_quick.py
echo. >> test_climada_quick.py
echo try: >> test_climada_quick.py
echo     import climada >> test_climada_quick.py
echo     print("[OK] CLIMADA installe") >> test_climada_quick.py
echo except: >> test_climada_quick.py
echo     print("[ERREUR] CLIMADA non installe") >> test_climada_quick.py
echo     sys.exit(1) >> test_climada_quick.py
echo. >> test_climada_quick.py
echo print("\n[OK] Installation validee !") >> test_climada_quick.py

echo %SUCCESS% Script de test cree : test_climada_quick.py
echo %INFO% Executez-le avec : python test_climada_quick.py

echo.
echo ========================================================================
echo Installation complete ! Bonne formation !
echo ========================================================================
echo.

REM Creer un fichier batch pour lancer facilement Jupyter
echo @echo off > lancer_jupyter.bat
echo call conda activate climada_formation >> lancer_jupyter.bat
echo jupyter lab >> lancer_jupyter.bat

echo %SUCCESS% Raccourci cree : lancer_jupyter.bat
echo %INFO% Double-cliquez sur lancer_jupyter.bat pour demarrer Jupyter Lab
echo.

pause
