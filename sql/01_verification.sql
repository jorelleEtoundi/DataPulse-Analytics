/*requette qui permet de verifier les bases du SQL et de commencer à documenter le projet proprement */

SELECT 
    current_database() AS nom_base,
    current_user AS utilisateur,
    CURRENT_DATE AS date_verification;