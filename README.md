# library_etl

I enjoy reading mystery novels.  So I created an ETL project to retrieve mystery novels, in book format, from my local library branch so I can identify titles and their availability before my next trip.

This project uses the following features to extract public library book data and load it into a relational database.

* Consumes a public API to retrieve book data in JSON format.  Uses requests library to post to the webservice.
* Uses the pymongo library and underlying MongoDB database to create and store the results in JSON data.
* Uses psycopg2 library and underlying PostgreSQL database to create and store the relational book data.
* Uses pandas to create DataFrames for in-memory data lookups for satisfying foreign key constraints during data load.

The high-level workflow of this project consists of the following:

* Execute the initial API call to determine the number of results pages that will be retured.
* Store the first page of results in an underlying MongoDB database.
* Iterate over the remaining pages of the results, storing that data in the MongoDB as well.
* Once data has been retrieved, create the PostgreSQL database and supporting tables.
* Insert the data in the PostgreSQL tables, satisfying the foreign key constraints.

Limitations:

* The data being returned is limited to a local branch, in book format, in the mystery genere.  Loading up the entire library's card catalog would have been feasible, but also time and resource intensive.
* The data model only focuses on the book's title, description, author, and availability status.  There are many more fields returned with the API request that could have been captured/modeled.

