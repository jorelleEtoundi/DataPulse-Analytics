-- Analyse 1 :    Taux résiliation par moyen de paiement

SELECT 
    payment_method,
    COUNT(*) AS nombre_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER  (WHERE churn = 'Yes')
        / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM telco_customers
GROUP BY payment_method
ORDER BY taux_resiliation_pct DESC;

-- Analyse 2 : Comparaison des factures selon la résiliation

SELECT
    churn,
    COUNT(*) AS nombre_clients,
    ROUND(AVG(monthly_charges)) AS facture_mensuelle_moyenne,
    ROUND(AVG(total_charges)) AS facture_totale_moyenne
FROM telco_customers
GROUP BY churn
ORDER BY churn ASC;


-- Analyse 3 : Répartition des clients par type de connexion internet

SELECT
    internet_service,
    COUNT(*) AS nombre_clients,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM telco_customers),
        2
    ) AS part_des_clients_pct
FROM telco_customers
GROUP BY internet_service
ORDER BY nombre_clients DESC;

