-- Projet BI - Analyse des ventes
-- Analyses commerciales
-- PostgreSQL

-- 1. Chiffre d'affaires total
SELECT
    SUM(montant) AS chiffre_affaires_total
FROM ventes;


-- 2. Chiffre d'affaires par année
SELECT
    EXTRACT(YEAR FROM date_vente) AS annee,
    SUM(montant) AS chiffre_affaires
FROM ventes
GROUP BY EXTRACT(YEAR FROM date_vente)
ORDER BY annee;


-- 3. Nombre de ventes par année
SELECT
    EXTRACT(YEAR FROM date_vente) AS annee,
    COUNT(*) AS nombre_ventes
FROM ventes
GROUP BY EXTRACT(YEAR FROM date_vente)
ORDER BY annee;


-- 4. CA, nombre de ventes et panier moyen par année
SELECT
    EXTRACT(YEAR FROM date_vente) AS annee,
    COUNT(*) AS nombre_ventes,
    SUM(montant) AS chiffre_affaires,
    ROUND(AVG(montant), 2) AS panier_moyen
FROM ventes
GROUP BY EXTRACT(YEAR FROM date_vente)
ORDER BY annee;


-- 5. Performance commerciale par produit
SELECT
    p.produit,
    p.categorie,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    ROUND(AVG(v.montant), 2) AS panier_moyen
FROM ventes v
JOIN produits p
    ON v.id_produit = p.id_produit
GROUP BY p.produit, p.categorie
ORDER BY chiffre_affaires DESC;


-- 6. Performance commerciale par catégorie
SELECT
    p.categorie,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    ROUND(AVG(v.montant), 2) AS panier_moyen
FROM ventes v
JOIN produits p
    ON v.id_produit = p.id_produit
GROUP BY p.categorie
ORDER BY chiffre_affaires DESC;


-- 7. Performance commerciale par client
SELECT
    c.id_client,
    c.nom,
    c.ville,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    ROUND(AVG(v.montant), 2) AS panier_moyen
FROM ventes v
JOIN clients c
    ON v.id_client = c.id_client
GROUP BY c.id_client, c.nom, c.ville
ORDER BY chiffre_affaires DESC;


-- 8. Performance commerciale par ville
SELECT
    c.ville,
    COUNT(v.id_vente) AS nombre_ventes,
    SUM(v.montant) AS chiffre_affaires,
    ROUND(AVG(v.montant), 2) AS panier_moyen
FROM ventes v
JOIN clients c
    ON v.id_client = c.id_client
GROUP BY c.ville
ORDER BY chiffre_affaires DESC;


-- 9. Analyse mensuelle
SELECT
    EXTRACT(YEAR FROM date_vente) AS annee,
    EXTRACT(MONTH FROM date_vente) AS mois,
    COUNT(*) AS nombre_ventes,
    SUM(montant) AS chiffre_affaires,
    ROUND(AVG(montant), 2) AS panier_moyen
FROM ventes
GROUP BY
    EXTRACT(YEAR FROM date_vente),
    EXTRACT(MONTH FROM date_vente)
ORDER BY annee, mois;
