# DataPulse Analytics

## Présentation du projet

**DataPulse Analytics** est un projet de portfolio consacré à l'analyse de la résiliation des clients (*customer churn*) d'un opérateur de télécommunications.

L'objectif est d'explorer les données, de contrôler leur qualité, d'effectuer des analyses avec Python et PostgreSQL, puis de présenter les principaux indicateurs dans un tableau de bord Power BI Web.

Ce projet illustre une démarche d'analyse de données, de l'exploration initiale à la restitution des résultats.

## Objectifs

- Explorer un jeu de données clients et vérifier sa qualité.
- Identifier et traiter les problèmes de données nécessaires à l'analyse.
- Interroger les données avec SQL et PostgreSQL.
- Calculer des indicateurs clés de performance (KPI).
- Analyser la résiliation selon le type de contrat et le service Internet.
- Exporter les résultats pour leur visualisation dans Power BI.
- Dégager des pistes d'investigation utiles à la fidélisation des clients.

## Technologies utilisées

- **Python** : exploration des données.
- **pandas** : manipulation et analyse des données.
- **PostgreSQL et SQL** : vérifications, agrégations et calcul des indicateurs.
- **Power BI Web** : création de visualisations et d'un tableau de bord.
- **Git et GitHub** : gestion et versionnement du projet.

## Données et qualité

Le projet utilise un jeu de données de télécommunications comprenant **7 043 clients et 21 colonnes**.

Les vérifications initiales ont notamment permis de constater :
- 0 doublon détecté dans les données examinées.
- 11 valeurs vides ou non numériques dans la colonne `TotalCharges`, à traiter avant certaines analyses.

## Indicateurs clés

| Indicateur | Résultat |
|---|---:|
| Nombre total de clients | 7 043 |
| Clients résiliés | 1 869 |
| Clients actifs | 5 174 |
| Taux global de résiliation | 26,54 % |
| Facture mensuelle moyenne | 64,76 |
| Ancienneté moyenne | 32,4 mois |

## Principaux constats

Les analyses par segment mettent en évidence des différences de taux de résiliation :

- **Type de contrat** : le taux observé est de 42,71 % pour les contrats mensuels, de 11,27 % pour les contrats d'un an et de 2,83 % pour les contrats de deux ans.
- **Service Internet** : le taux observé est de 41,89 % pour la fibre optique, de 18,96 % pour le DSL et de 7,40 % pour les clients sans service Internet.

Ces résultats suggèrent des axes d'investigation pour mieux comprendre les facteurs associés à la résiliation. Ils décrivent des associations observées dans les données et ne démontrent pas, à eux seuls, de lien de causalité.

## Organisation du projet

```text
DataPulse-Analytics/
├── data/
│   ├── raw/          # Données sources
│   └── processed/    # Données préparées et exports CSV
├── python/
│   └── exploration.py
├── sql/
│   ├── 01_verification.sql
│   ├── 02_creation_table.sql
│   ├── 03_analyses.sql
│   ├── 04_analyses_complementaires.sql
│   ├── 05_analyse_segment.sql
│   ├── 06_churn_par_internet.sql
│   ├── 07_kpi_globaux.sql
│   └── 08_exports_powerbi.sql
└── README.md
```

## Tableau de bord Power BI

Un tableau de bord a été créé dans Power BI Web pour présenter les indicateurs clés et explorer la résiliation selon plusieurs caractéristiques des clients.

Le rapport est enregistré dans l'espace de travail Power BI. Son accessibilité à des personnes externes reste à vérifier.

## Pistes d'analyse métier

À partir des constats observés, plusieurs analyses complémentaires pourraient être menées :
- Étudier plus précisément les clients avec un contrat mensuel.
- Comparer l'ancienneté et les dépenses mensuelles des clients selon leur statut de résiliation.
- Approfondir l'analyse du segment utilisant la fibre optique.
- Évaluer des actions de fidélisation ciblées à l'aide d'indicateurs de suivi.

## Conclusion

DataPulse Analytics met en pratique plusieurs étapes d'un projet d'analyse de données : exploration avec Python et pandas, analyse SQL avec PostgreSQL, calcul d'indicateurs, export de résultats et visualisation avec Power BI Web.

Le projet vise à transformer des données clients en constats compréhensibles et en pistes d'analyse utiles à la prise de décision.
