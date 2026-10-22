-- Analyse du taux de résiliation par type de connexion internet

SELECT 
    internet_service,
    COUNT(*) AS nombre_clients,
    COUNT(*) FILTER (
        WHERE churn = 'Yes'
    ) AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER(
            WHERE churn = 'Yes'
        ) / COUNT(*), 
        2
    ) AS taux_resiliation_pct
FROM telco_customers
GROUP BY internet_service
ORDER BY taux_resiliation_pct DESC;