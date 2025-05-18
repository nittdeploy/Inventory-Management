---
--
-- @file        createdb.sql
--
-- @brief       Create database
--
-- @detailed    Create the database and its tables. The SQL dialect is the
--              mysql-based syntax.
--
-- @author      Timur Nitt <tn.devel@nittix.info>
--
-- @copyright   © 2025 Timur Nitt
--
-- @version     0.1
--
-- @date        2025-05-18
--              - Initial step.
--

-- Create the database and use it for the next statements. The name
-- 'inventory' is just an example.
--
CREATE DATABASE inventory;
USE inventory;

-- Create the items table. Adapt the max. number of chars in VARCHAR if needed.
--
--              id: The auto-incremented primary key to identify an entry.
--            name: Name of the tool, material or a special kind of component.
--            type: Enumerator describes which kind of thing it is.
--        keywords: A comma-separated list of words to help searching an item
--                  by the client.
--  purchase_price: Price of an item.
--           owner: Owner of an item.
--      image_path: Image path of a bitmap photo of an item.
--    manufacturer: Manufacturer of an item.
--    purchased_at: Where the item is bought.
--        quantity: Number of items.
--     location_id: Reference of the location.
--
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('tool', 'material') NOT NULL,
    keywords TEXT,
    purchase_price DECIMAL(10,2),
    owner VARCHAR(100),
    image_path VARCHAR(255),
    manufacturer VARCHAR(100),
    purchased_at VARCHAR(100),
    quantity INT DEFAULT 1,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES locations(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create an optional item keyword table if needed. Only use if you want to
-- maintain and filter keywords separately (e.g. full-text search or tag-based
-- search).
--
-- item_id: Identify an entry.
-- keyword: The keyword. Both of them represent the primary key.
--
CREATE TABLE item_keywords (
    item_id INT,
    keyword VARCHAR(100),
    FOREIGN KEY (item_id) REFERENCES items(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (item_id, keyword)
);
