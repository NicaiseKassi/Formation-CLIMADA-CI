#!/usr/bin/env python3
"""
Script de test pour vérifier l'installation CLIMADA
Formation - Analyse des Risques Climatiques - Côte d'Ivoire
"""

import sys

def print_header(text):
    print("\n" + "="*60)
    print(f"  {text}")
    print("="*60 + "\n")

def test_module(module_name, display_name=None):
    """Test l'import d'un module"""
    if display_name is None:
        display_name = module_name
    
    try:
        mod = __import__(module_name)
        version = getattr(mod, '__version__', 'version inconnue')
        print(f"✅ {display_name:20} : OK (v{version})")
        return True
    except ImportError as e:
        print(f"❌ {display_name:20} : ÉCHEC - {e}")
        return False
    except Exception as e:
        print(f"⚠️  {display_name:20} : Importé avec avertissement - {e}")
        return True

def test_climada_components():
    """Test des composants principaux de CLIMADA"""
    print("\n🔧 Test des composants CLIMADA...")
    
    components = [
        ('climada.hazard', 'Hazard'),
        ('climada.entity', 'Entity'),
        ('climada.engine', 'Engine'),
        ('climada.util', 'Utilities')
    ]
    
    all_ok = True
    for module, name in components:
        try:
            __import__(module)
            print(f"✅ CLIMADA {name:15} : OK")
        except ImportError as e:
            print(f"❌ CLIMADA {name:15} : ÉCHEC")
            all_ok = False
    
    return all_ok

def test_data_science_stack():
    """Test de la stack data science"""
    print("\n📊 Test des bibliothèques data science...")
    
    modules = [
        ('numpy', 'NumPy'),
        ('pandas', 'Pandas'),
        ('matplotlib', 'Matplotlib'),
        ('scipy', 'SciPy'),
        ('sklearn', 'Scikit-learn')
    ]
    
    results = [test_module(mod, name) for mod, name in modules]
    return all(results)

def test_geo_stack():
    """Test de la stack géospatiale"""
    print("\n🗺️  Test des bibliothèques géospatiales...")
    
    modules = [
        ('geopandas', 'GeoPandas'),
        ('shapely', 'Shapely'),
        ('rasterio', 'Rasterio'),
        ('fiona', 'Fiona'),
        ('cartopy', 'Cartopy'),
        ('pyproj', 'PyProj')
    ]
    
    results = [test_module(mod, name) for mod, name in modules]
    return all(results)

def test_climate_stack():
    """Test de la stack climat/météo"""
    print("\n🌡️  Test des bibliothèques climatiques...")
    
    modules = [
        ('xarray', 'Xarray'),
        ('netCDF4', 'NetCDF4'),
        ('h5py', 'HDF5'),
        ('cftime', 'CFTime')
    ]
    
    results = [test_module(mod, name) for mod, name in modules]
    return all(results)

def test_jupyter():
    """Test de Jupyter"""
    print("\n📓 Test de Jupyter...")
    
    modules = [
        ('notebook', 'Jupyter Notebook'),
        ('jupyterlab', 'Jupyter Lab'),
        ('ipykernel', 'IPython Kernel'),
        ('ipywidgets', 'IPyWidgets')
    ]
    
    results = [test_module(mod, name) for mod, name in modules]
    return all(results)

def test_climada_basic_functionality():
    """Test basique de fonctionnalité CLIMADA"""
    print("\n🧪 Test de fonctionnalité CLIMADA...")
    
    try:
        from climada.hazard import Hazard
        from climada.entity import Exposures
        print("✅ Classes principales importées")
        
        # Test création d'un hazard vide
        haz = Hazard('FL')  # Flood hazard
        print("✅ Création d'un objet Hazard")
        
        # Test création d'exposures vides
        exp = Exposures()
        print("✅ Création d'un objet Exposures")
        
        return True
    except Exception as e:
        print(f"❌ Erreur de fonctionnalité : {e}")
        return False

def generate_report(results):
    """Génère un rapport final"""
    print_header("📋 RAPPORT FINAL")
    
    total = len(results)
    passed = sum(results.values())
    failed = total - passed
    
    print(f"Tests exécutés : {total}")
    print(f"✅ Réussis     : {passed}")
    print(f"❌ Échoués     : {failed}")
    print(f"Taux de succès : {(passed/total)*100:.1f}%")
    
    if failed == 0:
        print("\n🎉 TOUTES LES VÉRIFICATIONS ONT RÉUSSI !")
        print("\nVotre environnement CLIMADA est prêt à l'emploi.")
        print("\nPour commencer :")
        print("  1. Lancez Jupyter : jupyter lab")
        print("  2. Ouvrez un notebook de TP dans le dossier TP/")
        print("  3. Bonne formation ! 🚀")
        return True
    else:
        print("\n⚠️  CERTAINES VÉRIFICATIONS ONT ÉCHOUÉ")
        print("\nSolutions possibles :")
        print("  1. Recréer l'environnement : conda env create -f environment_formation.yml --force")
        print("  2. Nettoyer le cache : conda clean --all")
        print("  3. Consulter INSTALLATION.md pour plus d'aide")
        return False

def main():
    """Fonction principale"""
    print_header("🔍 VÉRIFICATION DE L'INSTALLATION CLIMADA")
    
    print("Formation : Analyse des Risques Climatiques - Côte d'Ivoire")
    print("Environnement : climada_formation")
    
    # Exécuter tous les tests
    results = {
        'CLIMADA Core': test_module('climada', 'CLIMADA'),
        'CLIMADA Components': test_climada_components(),
        'Data Science Stack': test_data_science_stack(),
        'Geo Stack': test_geo_stack(),
        'Climate Stack': test_climate_stack(),
        'Jupyter': test_jupyter(),
        'CLIMADA Functionality': test_climada_basic_functionality()
    }
    
    # Générer le rapport
    success = generate_report(results)
    
    return 0 if success else 1

if __name__ == '__main__':
    try:
        exit_code = main()
        sys.exit(exit_code)
    except KeyboardInterrupt:
        print("\n\n⚠️  Test interrompu par l'utilisateur")
        sys.exit(1)
    except Exception as e:
        print(f"\n\n❌ Erreur inattendue : {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
