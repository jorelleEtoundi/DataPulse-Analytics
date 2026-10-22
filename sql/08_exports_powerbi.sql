-- Exports des indicateurs pour le tableau de bord

\copy (SELECT COUNT(*) AS total_clients, COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies, COUNT(*) FILTER (WHERE churn = 'No') AS clients_actifs, ROUND(100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*), 2) AS taux_resiliation_pct, ROUND(AVG(monthly_charges), 2) AS facture_mensuelle_moyenne, ROUND(AVG(tenure), 1) AS anciennete_moyenne_mois FROM telco_customers) TO 'data/processed/kpi_globaux.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy (SELECT contract, COUNT(*) AS nombre_clients, COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies, ROUND(100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*), 2) AS taux_resiliation_pct FROM telco_customers GROUP BY contract ORDER BY taux_resiliation_pct DESC) TO 'data/processed/churn_par_contrat.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy (SELECT internet_service, COUNT(*) AS nombre_clients, COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies, ROUND(100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*), 2) AS taux_resiliation_pct FROM telco_customers GROUP BY internet_service ORDER BY taux_resiliation_pct DESC) TO 'data/processed/churn_par_internet.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');
