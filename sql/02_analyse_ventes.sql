-- =========================================================
-- 02 - Analyse des ventes
-- Projet BI - Analyse des ventes
-- =========================================================
-- 1. Évolution du chiffre d'affaires par année

SELECT
    YEAR(date_vente) AS annee,
    SUM(montant) AS chiffre_affaires
FROM Vente
GROUP BY YEAR(date_vente)
ORDER BY annee;

-- 3. Produits générant le plus de chiffre d'affaires

SELECT
    p.id_produit,
    p.produit,
    p.categorie,
    SUM(v.montant) AS chiffre_affaires
FROM Vente v
INNER JOIN Produit p
    ON v.id_produit = p.id_produit
GROUP BY
    p.id_produit,
    p.produit,
    p.categorie
ORDER BY chiffre_affaires DESC;
-- 4. Chiffre d'affaires par ville

SELECT
    c.ville,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    AVG(v.montant) AS panier_moyen
FROM Vente v
INNER JOIN Client c
    ON v.id_client = c.id_client
GROUP BY c.ville
ORDER BY chiffre_affaires DESC;
-- 5. Analyse du chiffre d'affaires par client

SELECT
    c.id_client,
    c.nom,
    c.ville,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    AVG(v.montant) AS panier_moyen
FROM Vente v
INNER JOIN Client c
    ON v.id_client = c.id_client
GROUP BY
    c.id_client,
    c.nom,
    c.ville
ORDER BY chiffre_affaires DESC;
-- 6. Analyse annuelle des ventes

SELECT
    YEAR(date_vente) AS annee,
    COUNT(id_vente) AS nombre_ventes,
    SUM(montant) AS chiffre_affaires,
    AVG(montant) AS panier_moyen
FROM Vente
GROUP BY YEAR(date_vente)
ORDER BY annee;
-- 6. Analyse annuelle des ventes

SELECT
    YEAR(date_vente) AS annee,
    COUNT(id_vente) AS nombre_ventes,
    SUM(montant) AS chiffre_affaires,
    AVG(montant) AS panier_moyen
FROM Vente
GROUP BY YEAR(date_vente)
ORDER BY annee;
-- 8. Nombre de ventes par produit

SELECT
    p.id_produit,
    p.produit,
    p.categorie,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires
FROM Vente v
INNER JOIN Produit p
    ON v.id_produit = p.id_produit
GROUP BY
    p.id_produit,
    p.produit,
    p.categorie
ORDER BY nombre_ventes DESC;
-- 9. Évolution mensuelle du chiffre d'affaires

SELECT
    YEAR(date_vente) AS annee,
    MONTH(date_vente) AS mois,
    SUM(montant) AS chiffre_affaires
FROM Vente
GROUP BY
    YEAR(date_vente),
    MONTH(date_vente)
ORDER BY
    annee,
    mois;
-- 10. Chiffre d'affaires et part du CA par catégorie

SELECT
    p.categorie,
    SUM(v.montant) AS chiffre_affaires,
    SUM(v.montant) * 100.0 / (
        SELECT SUM(montant)
        FROM Vente
    ) AS part_du_ca
FROM Vente v
INNER JOIN Produit p
    ON v.id_produit = p.id_produit
GROUP BY p.categorie
ORDER BY chiffre_affaires DESC;
-- 11. Analyse du CA par tranche d'âge

SELECT
    CASE
        WHEN c.age < 30 THEN 'Moins de 30 ans'
        WHEN c.age BETWEEN 30 AND 39 THEN '30-39 ans'
        WHEN c.age BETWEEN 40 AND 49 THEN '40-49 ans'
        ELSE '50 ans et plus'
    END AS tranche_age,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    AVG(v.montant) AS panier_moyen
FROM Vente v
INNER JOIN Client c
    ON v.id_client = c.id_client
GROUP BY
    CASE
        WHEN c.age < 30 THEN 'Moins de 30 ans'
        WHEN c.age BETWEEN 30 AND 39 THEN '30-39 ans'
        WHEN c.age BETWEEN 40 AND 49 THEN '40-49 ans'
        ELSE '50 ans et plus'
    END
ORDER BY chiffre_affaires DESC;
