CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "apples" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "variety" varchar);
CREATE TABLE "bests_tests" ("test_id" integer NOT NULL, "best_id" integer NOT NULL);
CREATE INDEX "index_bests_tests_on_best_id" ON "bests_tests" ("best_id");
CREATE INDEX "index_bests_tests_on_test_id" ON "bests_tests" ("test_id");
CREATE TABLE "customers_products" ("customer_id" integer NOT NULL, "product_id" integer NOT NULL);
CREATE TABLE "examples" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL);
CREATE TABLE "product_1s" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "description" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "price" decimal(5,2), "supplier_type" varchar, "supplier_id" integer);
CREATE INDEX "index_product_1s_on_supplier_type_and_supplier_id" ON "product_1s" ("supplier_type", "supplier_id");
CREATE TABLE "tests" ("id" integer NOT NULL PRIMARY KEY, "part_number" text DEFAULT NULL, "size" varchar);
CREATE INDEX "index_tests_on_part_number" ON "tests" ("part_number");
CREATE TABLE "products" ("id" integer NOT NULL PRIMARY KEY, "name" varchar DEFAULT 'soap' NOT NULL, "description" text DEFAULT 'yes', "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "part_number" varchar DEFAULT 'TRUE', "price" decimal DEFAULT 5.2, "approved" boolean DEFAULT '0', "test_id" integer DEFAULT NULL, "test_int" integer);
CREATE INDEX "index_products_on_test_id" ON "products" ("test_id");
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "login" varchar, "email" varchar, "location" varchar);
CREATE TABLE "authors" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "books_count" integer);
CREATE TABLE "books" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "author_id" integer, "published_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_books_on_author_id" ON "books" ("author_id");
CREATE TABLE "suppliers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "accounts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "account_number" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "supplier_id" integer, CONSTRAINT "fk_rails_530e87101a"
FOREIGN KEY ("supplier_id")
  REFERENCES "suppliers" ("id")
);
CREATE UNIQUE INDEX "index_accounts_on_supplier_id" ON "accounts" ("supplier_id");
CREATE TABLE "appointments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "physician_id" integer, "patient_id" integer, "appointment_date" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_appointments_on_physician_id" ON "appointments" ("physician_id");
CREATE INDEX "index_appointments_on_patient_id" ON "appointments" ("patient_id");
CREATE TABLE "patients" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "physicians" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "documents" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "paragraphs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar, "content" varchar, "section_id" integer, CONSTRAINT "fk_rails_9bd6b24ac1"
FOREIGN KEY ("section_id")
  REFERENCES "sections" ("id")
);
CREATE INDEX "index_paragraphs_on_section_id" ON "paragraphs" ("section_id");
CREATE TABLE "sections" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar, "document_id" integer, CONSTRAINT "fk_rails_a6d8273870"
FOREIGN KEY ("document_id")
  REFERENCES "documents" ("id")
);
CREATE INDEX "index_sections_on_document_id" ON "sections" ("document_id");
CREATE TABLE "assemblies_parts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "assembly_id" integer, "part_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_assemblies_parts_on_assembly_id" ON "assemblies_parts" ("assembly_id");
CREATE INDEX "index_assemblies_parts_on_part_id" ON "assemblies_parts" ("part_id");
CREATE TABLE "assemblies" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar);
CREATE TABLE "parts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar);
CREATE TABLE "pictures" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "imageable_type" varchar, "imageable_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_pictures_on_imageable_type_and_imageable_id" ON "pictures" ("imageable_type", "imageable_id");
CREATE TABLE "employees" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "workers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "manager_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_workers_on_manager_id" ON "workers" ("manager_id");
CREATE TABLE "jasps" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "vehicles" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar, "color" varchar, "price" decimal(10,2), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "jaspreets" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "jasp_id" integer);
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
('20181730070854'),
('20181730070855'),
('20181730070856'),
('20181730070857'),
('20181730070858'),
('20181730070859'),
('20181730070860'),
('20181730070861'),
('20181730070862'),
('20181730070863'),
('20181730070864'),
('20181730070865'),
('20181730070866'),
('20181730070867'),
('20181730070868'),
('20181730070869'),
('20181730070870');


