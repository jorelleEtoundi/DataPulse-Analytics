
-- 1. Vue d'ensemble des résiliations
SELECT
    COUNT(*) AS total_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM telco_customers;


-- 2. Résiliations selon le type de contrat
SELECT
    contract,
    COUNT(*) AS total_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM telco_customers
GROUP BY contract
ORDER BY taux_resiliation_pct DESC;


-- 3. Résiliations selon l'ancienneté
SELECT
    groupe_anciennete,
    COUNT(*) AS total_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM telco_customers
GROUP BY groupe_anciennete
ORDER BY
    CASE groupe_anciennete
        WHEN '0-12 mois' THEN 1
        WHEN '13-24 mois' THEN 2
        WHEN '25-48 mois' THEN 3
        WHEN '49-72 mois' THEN 4
        ELSE 5
    END;


-- 4. Résiliations selon le niveau de facturation
SELECT
    groupe_facturation,
    COUNT(*) AS total_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE churn = 'Yes') / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM telco_customers
GROUP BY groupe_facturation
ORDER BY
    CASE groupe_facturation
        WHEN 'Faible (<= 35)' THEN 1
        WHEN 'Moyenne (>35 à 65)' THEN 2
        WHEN 'Élevée (>65)' THEN 3
        ELSE 4
    END;
