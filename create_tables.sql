
CREATE TABLE "author" (
    "author_id" serial   NOT NULL,
    "full_name" varchar(100)   NOT NULL,
    "last_name" varchar(50)   NULL,
    "first_name" varchar(50)   NULL,
    CONSTRAINT "pk_author" PRIMARY KEY (
        "author_id"
     )
);

CREATE TABLE "availability" (
    "availability_id" serial   NOT NULL,
    "availability_status" varchar(50)   NOT NULL,
    CONSTRAINT "pk_availability" PRIMARY KEY (
        "availability_id"
     )
);

CREATE TABLE "book" (
    "book_id" serial   NOT NULL,
    "internal_id" varchar(15)   NOT NULL,
    "title" text   NOT NULL,
    "description" text   NULL,
    "availability_id" int   NOT NULL,
    CONSTRAINT "pk_book" PRIMARY KEY (
        "book_id"
     )
);

CREATE TABLE "book_author_xref" (
    "book_id" int   NOT NULL,
    "author_id" int   NOT NULL
);

ALTER TABLE "book" ADD CONSTRAINT "fk_book_availability_id" FOREIGN KEY("availability_id")
REFERENCES "availability" ("availability_id");

ALTER TABLE "book_author_xref" ADD CONSTRAINT "fk_book_author_xref_book_id" FOREIGN KEY("book_id")
REFERENCES "book" ("book_id");

ALTER TABLE "book_author_xref" ADD CONSTRAINT "fk_book_author_xref_author_id" FOREIGN KEY("author_id")
REFERENCES "author" ("author_id");

