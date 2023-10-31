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

