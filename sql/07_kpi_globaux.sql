-- Indicateur pour le tableau de bord

SELECT
    COUNT(*) AS total_clients,
    COUNT(*) FILTER (
        WHERE churn = 'Yes'
    ) AS clients_resilies,

    COUNT(*) FILTER (
        WHERE churn = 'No'
    ) AS clients_actifs,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE churn = 'Yes'
        ) / COUNT(*),
        2
    ) AS taux_resiliation_pct,

    ROUND(AVG(monthly_charges), 2)
        AS facture_mensuelle_moyenne,

    ROUND(AVG(tenure), 1)
        AS anciennete_moyenne_mois

FROM telco_customers;