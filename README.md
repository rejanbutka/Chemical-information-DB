**Is it possible to only show unique results? If yes,  how does the query needs to be modified?**

* By adding the DISTINCT keyword (already in the code)

**If you do not have to consider the additional information, how would you change the database?**

* If no more properties are taken into consideration, we could have simplified the database 
by turning the ChemicalProduct table into a column on the Chemical table, since we only store its ID.

**Please write a few sentences about the thoughts behind the solution.**

* The design aims for clarity, separation of concerns, and flexibility. Using foreign keys ensures data integrity.
* Queries are structured to retrieve information efficiently and handle the distinctions between verified and unverified chemicals.
* The indicator column in the combined list helps easily identify the source of each chemical.