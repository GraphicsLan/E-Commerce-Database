E_Commerce Database
Overview
The E_Commerce database is designed to support a modern online store with rich product information,
variations (like size and color), inventory management, and custom attributes for filtering and searching products.

Database structure.
🔹 brand
Stores brand information like name and description.

🔹 product_category
Classifies products into categories (e.g., Clothing, Electronics).

🔹 product
Core product data including name, brand, category, and base price.

🔹 product_image
Stores image URLs for each product.

🔹 color
Contains predefined color options used in product variations.

🔹 product_item
Represents actual sellable inventory — each product item corresponds to a specific variation.

🔹 product_variation
Links a product to its color and size. Each variation can have multiple items in stock.

🔹 size_category
Groups sizes into types (e.g., Clothing, Shoe).

🔹 size_option
Defines specific size values (e.g., S, M, L, 42).

🔹 attribute_category
Classifies product attributes (e.g., Technical, Physical).

🔹 attribute_type
Defines how attribute values are stored (e.g., Text, Number).

🔹 product_attribute
Stores product-specific custom attributes (e.g., Material, RAM, Weight).

Relationships as shown in ERD
product → brand, product_category

product_image → product

product_item → product, product_variation

product_variation → color, size_category, product

size_option → size_category

product_attribute → product_item, attribute_category, attribute_type
