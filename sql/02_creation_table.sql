
-- Supprimer la table si elle existe déjà
DROP TABLE IF EXISTS telco_customers;

-- Créer la table des clients
CREATE TABLE telco_customers (
    customer_id       VARCHAR(20) PRIMARY KEY,
    gender            VARCHAR(10),
    senior_citizen    INTEGER,
    partner           VARCHAR(5),
    dependents        VARCHAR(5),
    tenure            INTEGER,
    phone_service     VARCHAR(25),
    multiple_lines    VARCHAR(25),
    internet_service  VARCHAR(20),
    online_security   VARCHAR(25),
    online_backup     VARCHAR(25),
    device_protection VARCHAR(25),
    tech_support      VARCHAR(25),
    streaming_tv      VARCHAR(25),
    streaming_movies  VARCHAR(25),
    contract          VARCHAR(25),
    paperless_billing VARCHAR(5),
    payment_method    VARCHAR(40),
    monthly_charges   NUMERIC(10,2),
    total_charges     NUMERIC(10,2),
    churn             VARCHAR(5),
    groupe_anciennete VARCHAR(20),
    groupe_facturation VARCHAR(25)
);
