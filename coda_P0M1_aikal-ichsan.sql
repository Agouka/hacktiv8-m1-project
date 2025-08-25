-- Staging table
CREATE TABLE items (
	produk TEXT,
	tipe TEXT,
	harga FLOAT,
	rating FLOAT,
	review FLOAT
);

-- Mengisi table 'items' dengan data dari 'clothes-clean.csv'
COPY items (Produk, Tipe, Harga, Rating, Review)
FROM 'C:\Temp\p0-coda009-rmt-m1-Agouka\clothes-clean.csv'
DELIMITER ','
CSV HEADER;

-- Cek table items
SELECT * FROM items;

-- NORMALISASI
-- Membuat table product dan type
-- FK id_tipe yang mengacu id pada table type
CREATE TABLE product (
	id SERIAL PRIMARY KEY,
	produk TEXT,
	harga FLOAT,
	rating FLOAT,
	review FLOAT,
	id_tipe INT,
	FOREIGN KEY (id_tipe) REFERENCES type(id)
);

CREATE TABLE type (
	id SERIAL PRIMARY KEY,
	tipe TEXT
);

-- Memasukkan data tipe unique dari items ke table type
INSERT INTO type (tipe)
SELECT DISTINCT tipe from items;

-- Memasukkan ssa data dari table items
-- Merubah tipe menjadi id_tipe
INSERT INTO product (produk, harga, rating, review, id_tipe)
SELECT i.produk, i.harga, i.rating, i.review, t.id
FROM items i
JOIN type t
ON i.tipe = t.tipe;

-- Cek semua table terkait
SELECT * FROM type;
SELECT * FROM product;
SELECT * FROM items;