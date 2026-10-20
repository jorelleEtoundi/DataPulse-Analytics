from pathlib import Path
import pandas as pd

# Chemin vers le fichier source
project_dir = Path(__file__).resolve().parent.parent
data_path = (
    project_dir
    /"data"
    /"raw"
    / "WA_Fn-UseC_-Telco-Customer-Churn.csv"
)

## je verifie que le fichier existe
if not data_path.exists():
    raise FileNotFoundError(
        f"Fichier introuvable : {data_path}"
    )
    
## Je charge les données
df = pd.read_csv(data_path)

## J'examine les premières lignes
print("Dimensions du jeu de données :", df.shape)
print("\nPremières lignes :")
print(df.head())

print("Colonnes disponibles :")
print(df.columns.tolist())

print("\nTypes et valeurs non nulles :")
df.info()

print("\nvaleurs manquantes par colonnes :")
print(df.isna().sum())

# Controles complémentaires de qualité des données
print("\n--- Controle des identifiants ---")
print("Identification dupliqués :", df["customerID"].duplicated().sum())

print("\n--- Controle de TotalCharges ---")

## Je detecte les chaines vides contenant uniquement les espaces
total_charges_nettoye = df["TotalCharges"].astype("string").str.strip()

print(
    "valeurs vides ou composées d'espaces :",
    total_charges_nettoye.eq("").sum()
)

## Je verifie quelles valeurs peuvent etre converties en nombres
total_charges_numériques = pd.to_numeric(
    total_charges_nettoye,
    errors="coerce"
)

print(
    "valeurs non convertibles en nombres :",
    total_charges_numériques.isna().sum()
)

print("\n--- Réparation des résiliations ---")
print(df["Churn"].value_counts())

print("\n--- Taux de résiliation ---")
taux_resiliation = (
    df["Churn"].eq("Yes").mean() * 100
)
print(f"Taux de résiliation : {taux_resiliation:.2f} %")

## J'identifie les lignes où TotalCharges est vide
print("\n--- clients avec TotalChrages vide ---")

total_charges_nettoye = df["TotalCharges"].astype("string").str.strip()

lignes_vides = df[total_charges_nettoye.eq("")]

print(
    lignes_vides[
        ["customerID", "tenure", "MonthlyCharges", "TotalCharges", "Churn"]
    ].to_string(index=False)
)

# Nettoyage de TotalCharges
print("\n--- Nettoyage de TotalCharges ---")

## Je supprime les exports au debut et à la fin
df["TotalCharges"] = df["TotalCharges"].str.strip()

## Je convertis en numérique: les chaines vides deviennent NaN
df["TotalCharges"] = pd.to_numeric(
    df["TotalCharges"],
    errors="coerce"
)

print("Type après conersion :", df["TotalCharges"].dtype)
print("Valeurs manquantes après conversion :", df["TotalCharges"].isna().sum())

print("\nExemple des données néttoyées :")
print(df[["customerID", "tenure", "TotalCharges"]].head())