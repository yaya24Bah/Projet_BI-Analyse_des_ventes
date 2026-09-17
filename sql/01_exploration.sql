-- =========================================================
-- 01 - Exploration des données
-- Projet BI - Analyse des ventes
-- =========================================================


-- 1. Vérifier les clients
SELECT *
FROM Client;


-- 2. Vérifier les produits
SELECT *
FROM Produit;


-- 3. Vérifier les ventes
SELECT *
FROM Vente;


-- 4. Nombre de clients
SELECT COUNT(*) AS nombre_clients
FROM Client;


-- 5. Nombre de produits
SELECT COUNT(*) AS nombre_produits
FROM Produit;


-- 6. Nombre de ventes
SELECT COUNT(*) AS nombre_ventes
FROM Vente;


-- 7. Chiffre d'affaires total
SELECT SUM(montant) AS chiffre_affaires_total
FROM Vente;

-- 8. Chiffre d'affaires par année
SELECT
    YEAR(date_vente) AS annee,
    SUM(montant) AS chiffre_affaires
FROM Vente
GROUP BY YEAR(date_vente)
ORDER BY annee;

-- 9. Chiffre d'affaires par catégorie de produit
SELECT
    p.categorie,
    SUM(v.montant) AS chiffre_affaires
FROM Vente v
INNER JOIN Produit p
    ON v.id_produit = p.id_produit
GROUP BY p.categorie
ORDER BY chiffre_affaires DESC;

-- 10. Chiffre d'affaires par produit
SELECT
    p.produit,
    p.categorie,
    SUM(v.montant) AS chiffre_affaires
FROM Vente v
INNER JOIN Produit p
    ON v.id_produit = p.id_produit
GROUP BY
    p.produit,
    p.categorie
ORDER BY chiffre_affaires DESC;

-- 11. Chiffre d'affaires par ville
SELECT
    c.ville,
    SUM(v.montant) AS chiffre_affaires
FROM Vente v
INNER JOIN Client c
    ON v.id_client = c.id_client
GROUP BY c.ville
ORDER BY chiffre_affaires DESC;

-- 12. Nombre de ventes et panier moyen par année
SELECT
    YEAR(date_vente) AS annee,
    COUNT(*) AS nombre_ventes,
    SUM(montant) AS chiffre_affaires,
    AVG(montant) AS panier_moyen
FROM Vente
GROUP BY YEAR(date_vente)
ORDER BY annee;
-- 13. Vérification des valeurs NULL dans les ventes
SELECT
    COUNT(*) AS total_lignes,
    COUNT(id_vente) AS ventes_renseignees,
    COUNT(id_client) AS clients_renseignes,
    COUNT(id_produit) AS produits_renseignes,
    COUNT(montant) AS montants_renseignes,
    COUNT(date_vente) AS dates_renseignees
FROM Vente;

-- 14. Vérification des doublons sur l'identifiant de vente
SELECT
    id_vente,
    COUNT(*) AS nombre_occurrences
FROM Vente
GROUP BY id_vente
HAVING COUNT(*) > 1;

