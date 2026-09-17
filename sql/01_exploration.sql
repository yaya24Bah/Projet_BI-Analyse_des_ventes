-- Projet BI - Analyse des ventes
-- Exploration initiale des données
-- PostgreSQL

-- 1. Vérifier le nombre de clients
SELECT COUNT(*) AS nombre_clients
FROM clients;

-- 2. Vérifier le nombre de produits
SELECT COUNT(*) AS nombre_produits
FROM produits;

-- 3. Vérifier le nombre de ventes
SELECT COUNT(*) AS nombre_ventes
FROM ventes;

-- 4. Vérifier les premières ventes
SELECT *
FROM ventes
ORDER BY id_vente
LIMIT 10;

-- 5. Vérifier les ventes sans client correspondant
SELECT COUNT(*) AS ventes_sans_client
FROM ventes v
LEFT JOIN clients c
    ON v.id_client = c.id_client
WHERE c.id_client IS NULL;

-- 6. Vérifier les ventes sans produit correspondant
SELECT COUNT(*) AS ventes_sans_produit
FROM ventes v
LEFT JOIN produits p
    ON v.id_produit = p.id_produit
WHERE p.id_produit IS NULL;
