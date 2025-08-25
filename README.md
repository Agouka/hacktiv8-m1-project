# hacktiv8-m1-project
ETL Pipeline – Uniqlo Men’s Tops

Built a web‑scraping pipeline to extract product name, type (male/unisex), price, rating, and review count from Uniqlo’s site.

Transformed data with pandas: cleaned/standardized product names & types (strings), parsed/cleaned price & rating (floats), and review count (integer); handled missing values and duplicates.

Loaded cleaned data into PostgreSQL using a normalized schema (e.g., products, product_types, reviews) with proper primary/foreign keys for efficient queries and analysis.
