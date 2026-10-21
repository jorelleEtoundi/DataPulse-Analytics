-- Analyse 1 : Types de contrat comptant plus de 1000 clients

SELECT
    contract,
    COUNT(*) AS nombre_clients
FROM telco_customers
GROUP BY contract
HAVING COUNT(*) > 1000
ORDER BY nombre_clients DESC;



-- ANALYSE 2 : Répartition des clients selon leur ancienneté

SELECT
    categorie_anciennete,
    COUNT(*) AS nombre_clients,
    COUNT(*) FILTER (WHERE churn = 'Yes') AS clients_resilies,
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE churn = 'Yes')
        / COUNT(*),
        2
    ) AS taux_resiliation_pct
FROM (
    SELECT
        churn,
        CASE
            WHEN tenure < 12 THEN 'Moins de 1 an'
            WHEN tenure < 24 THEN '1 à moins de 2 ans'
            WHEN tenure < 48 THEN '2 à moins de 4 ans'
            ELSE '4 ans ou plus'
        END AS categorie_anciennete,
        CASE
            WHEN tenure < 12 THEN 1
            WHEN tenure < 24 THEN 2
            WHEN tenure < 48 THEN 3
            ELSE 4
        END AS ordre_anciennete
    FROM telco_customers
) AS clients_classes
GROUP BY categorie_anciennete, ordre_anciennete
ORDER BY ordre_anciennete;
