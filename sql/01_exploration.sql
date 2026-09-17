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
