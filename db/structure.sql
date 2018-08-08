CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "customers_products" ("customer_id" integer NOT NULL, "product_id" integer NOT NULL);
CREATE TABLE "product_1s" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "price" decimal(5,2), "supplier_type" varchar, "supplier_id" integer);
CREATE INDEX "index_product_1s_on_supplier_type_and_supplier_id" ON "product_1s" ("supplier_type", "supplier_id");
CREATE TABLE "bests_tests" ("test_id" integer NOT NULL, "best_id" integer NOT NULL);
CREATE INDEX "index_bests_tests_on_test_id" ON "bests_tests" ("test_id");
CREATE INDEX "index_bests_tests_on_best_id" ON "bests_tests" ("best_id");
CREATE TABLE "tests" ("id" integer NOT NULL PRIMARY KEY, "part_number" text DEFAULT NULL);
CREATE INDEX "index_tests_on_part_number" ON "tests" ("part_number");
CREATE TABLE "products" ("id" integer NOT NULL PRIMARY KEY, "name" varchar NOT NULL, "description" text DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "part_number" varchar DEFAULT NULL, "price" decimal DEFAULT NULL, "user_id" integer DEFAULT NULL, "approved" boolean DEFAULT 0);
CREATE INDEX "index_products_on_user_id" ON "products" ("user_id");
CREATE TABLE "examples" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL);
CREATE TABLE "apples" ("id" integer NOT NULL PRIMARY KEY, "variety" varchar DEFAULT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20180727092141'),
('20180728070529'),
('20180728071433'),
('20180728071843'),
('20180728072142'),
('20180728072541'),
('20180728074347'),
('20180728074509'),
('20181730070845'),
('20181730070846'),
('20181730070847'),
('20181730070848'),
('20181730070849'),
('20181730070850'),
('20181730070851'),
('20181730070852'),
('20181730070853'),
('20181730070854');


