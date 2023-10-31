CREATE TABLE "patients" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "date_of_birth" date
);

CREATE TABLE "medical_histories" (
  "id" integer PRIMARY KEY,
  "admitted_at" timestamp,
  "patient_id" integer,
  "status" varchar
);

CREATE TABLE "invoices" (
  "id" integer PRIMARY KEY,
  "total_amount" decimal,
  "generated_at" timestamp,
  "payed_at" timestamp,
  "medical_histories_id" integer
);

CREATE TABLE "invoices_items" (
  "id" integer PRIMARY KEY,
  "unit_price" decimal,
  "quantity" integer,
  "total_price" decimal,
  "invoice_id" integer,
  "treatment_id" integer
);

CREATE TABLE "treatments" (
  "id" integer PRIMARY KEY,
  "type" varchar,
  "name" varchar
);

ALTER TABLE "medical_histories" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "invoices" ADD FOREIGN KEY ("medical_histories_id") REFERENCES "medical_histories" ("id");

ALTER TABLE "invoices_items" ADD FOREIGN KEY ("invoice_id") REFERENCES "invoices" ("id");

ALTER TABLE "invoices_items" ADD FOREIGN KEY ("treatment_id") REFERENCES "treatments" ("id");

CREATE TABLE "treatments_medical_histories" (
  "treatments_id" integer,
  "medical_histories_id" integer,
  PRIMARY KEY ("treatments_id", "medical_histories_id")
);

ALTER TABLE "treatments_medical_histories" ADD FOREIGN KEY ("treatments_id") REFERENCES "treatments" ("id");

ALTER TABLE "treatments_medical_histories" ADD FOREIGN KEY ("medical_histories_id") REFERENCES "medical_histories" ("id");
