CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT NULL NULL, "created_at" datetime DEFAULT NULL NULL, "updated_at" datetime DEFAULT NULL NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20080926131745');