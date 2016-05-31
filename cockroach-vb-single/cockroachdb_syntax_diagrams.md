---
title: CockroachDB SQL Syntax Diagrams
layout: syntax
tags: 
keywords: CockroachDB, syntax, sql
last_updated: 
summary: "Sytnax diagrams of all CockroachDB SQL statements and associated clauses. Generated from the sql grammar yacc file (sql.y) via the generate utility as of 28th May 2016."
---

### Introduction

Each of these syntax diagrams would appear on the page for that statement, they wouldn't be lumped together like this. I've just done this so you can see them all together.

Some statements reference multiple syntax diagrams. `BEGIN TRANSACTION` and `CREATE TABLE` for example.

Some syntax clauses are referenced multiple times when they appear as part of different statements. For example the **table_constraint** clause appears in the `ALTER TABLE` and `CREATE TABLE` statements.

The idea is everything is resolved down such that only things like names and numbers remain. A user shouldn't have to leave the page to understand the major components of the syntax. On a couple of occasions I've stopped in-lining the syntax because the rabbit hole just goes too deep.

All of the diagrams have been produced  using CockroachDB's [generate](https://github.com/cockroachdb/docs/tree/gh-pages/generate) utility. It's my own version but the only difference is I've separated the data from the code by placing the specs struct into a file in JSON format. (as discussed with Matt J in [#251](https://github.com/cockroachdb/docs/issues/251)

For example, the `DROP DATABASE` command in the specs struct looks like:

~~~
{name: "drop_database", stmt: "drop_stmt", match: regexp.MustCompile("'DROP' 'DATABASE'")},
~~~

In the JSON file, it looks like:

~~~
 {
      "Name": "drop_database",
      "Stmt": "drop_stmt",
      "Inline": [],
      "Replace": null,
      "Match": "'DROP' 'DATABASE'",
      "Exclude": null
   },
~~~

Not a huge saving but it does avoid having to recompile every time a diagram gets added.

The links in the diagrams still reference the `sql-grammar.html` page as I didn't want to change the `generate` utility apart from seperating the diagram configurations. 


### ALTER DATABASE

**CHANGED:**
This diagram hasn't changed but I've renamed it to `ALTER DATABASE` from `RENAME DATABASE`. There is no `RENAME DATABASE` SQL statement, it's an option of `ALTER DATABASE`. 

**alter_database ::=**
{% include sql/diagrams/alter_database.html %}

<br><br> 
The only option at present is `RENAME`. I moved the current `RENAME DATABASE` command to `ALTER DATABASE` in anticipation of more `ALTER DATABASE` options in future.


### ALTER INDEX

**NEW:** We don't have an document entry for this statement.

**alter_index ::=**
{% include sql/diagrams/alter_index.html %}


### ALTER TABLE

**ORIGINAL:**

**alter_table ::=**
{% include sql/diagrams/alter_table.html %}

<br><br>
**NEW:** Removed `REFERENCES` clause. Added to `CREATE TABLE` as well.

**col_qual_list ::=**
{% include sql/diagrams/col_qual_list.html %}

<br><br>
**NEW:** Added to `CREATE TABLE` as well.

**table_constraint ::=**
{% include sql/diagrams/table_constraint.html %}


### BEGIN TRANSACTION

**CHANGED:**
Added `START TRANSACTION` as an alias. Expanded `user_priority`.

**begin_transaction ::=**
{% include sql/diagrams/begin.html %}

<br><br>
**NEW:** Added `iso_level`.

**iso_level ::=**
{% include sql/diagrams/iso_level.html %}


### COMMIT TRANSACTION

**CHANGED:**
Added `END` as an alias.

**commit_transaction ::=**
{% include sql/diagrams/commit.html %}


### CREATE DATABSE

**CHANGED:**
Expanded the `opt_encoding_clause`. Replaced `SCONST` with a hardcoded list of available encoding options.

**create_database ::=**
{% include sql/diagrams/create_database.html %}


### CREATE INDEX

**ORIGINAL:**

**create_index ::=**
{% include sql/diagrams/create_index.html %}

<br><br>
**NEW:** Added `opt_storing` expansion as a separate diagram.

**opt_storing ::=**
{% include sql/diagrams/opt_storing.html %}


### CREATE TABLE

**CHANGED:** Regenerated diagram now includes `family_def`. Expanded `column_def` 

**create_table ::=**
{% include sql/diagrams/create_table.html %}

<br><br>
**NEW:** Removed `REFERENCES` clause. Added to `ALTER TABLE` as well. 

**col_qual_list ::=**
{% include sql/diagrams/col_qual_list.html %}

<br><br>
**NEW:**

**index_def ::=**
{% include sql/diagrams/index_def.html %}

<br><br>
**NEW:**

**family_def ::=**
{% include sql/diagrams/family_def.html %}

<br><br>
This is a new clause that popped up a few days ago. Not sure what it is.

<br><br>
**NEW:** This should be included on the Data Definition page along with the `col_qual_list` diagram.

**table_constraint ::=**
{% include sql/diagrams/table_constraint.html %}


### DELETE

**ORIGINAL:**

**delete ::=**
{% include sql/diagrams/delete.html %}


### DROP DATABASE

**ORIGINAL:**

**drop_database ::=**
{% include sql/diagrams/drop_database.html %}


### DROP INDEX

**CHANGED:** Expanded `table_name_with_index_list`.

I'm not sure if `CASCADE` should be there for now.

**drop_index ::=**
{% include sql/diagrams/drop_index.html %}


### DROP TABLE

**CHANGED:** Expanded `opt_drop_behaviour` and removed the `CASCADE` option.

**drop_table ::=**
{% include sql/diagrams/drop_table.html %}

<br><br>
I removed the `CASCADE` option as it relates to foreign keys and to see how easy it would be. Ideally it would be flagged as `{ unimplemented() }` in `sql.y` but you can use **Replace:** in the JSON statement definition like:

~~~
 {
      "Name": "drop_table",
      "Stmt": "drop_stmt",
      "Inline": [
         "opt_drop_behavior"
      ],
      "Replace": [
         [
             "'CASCADE' |",
             ""
         ]
      ],
      "Match": "'DROP' 'TABLE'",
      "Exclude": null
   },
~~~

**Exclude:** won't work as it completely removes the entire matching statement.



### EXPLAIN

**ORIGINAL:**

**explain ::=**
{% include sql/diagrams/explain.html %}


### GRANT

**ORIGINAL:**

**grant ::=**
{% include sql/diagrams/grant.html %}


### INSERT

**ORIGINAL:**

**insert ::=**
{% include sql/diagrams/insert.html %}

<br><br>
**NEW:** 

**on_conflict ::=**
{% include sql/diagrams/on_conflict.html %}


### RELEASE SAVEPOINT

**ORIGINAL:**

**release_savepoint ::=**
{% include sql/diagrams/release_savepoint.html %}


### REVOKE

**ORIGINAL:**

**revoke ::=**
{% include sql/diagrams/revoke.html %}


### ROLLBACK

**CHANGED:** Expanded `opt_to_savepoint`

**rollback_transaction ::=**
{% include sql/diagrams/rollback.html %}


### SAVEPOINT

**NEW:** This SQL statement is not documented. 

**savepoint ::=**
{% include sql/diagrams/savepoint.html %}

<br><br>
This grammar seems odd. Is `SAVEPOINT SAVEPOINT <name>` intended?


### SELECT

**ORIGINAL:**

**select ::=**
{% include sql/diagrams/select.html %}

<br><br>
I haven't touched this. Not brave enough.

### SET

**ORIGINAL:** The `SET` grammar seems messy. (Something to do with the `set_rest` and `set_rest_more` definitions doesn't look clean.)

I can't get nice clean diagrams from the grammar so I won't touch `SET` for now. Please ignore all `SET` diagrams here.

`SHOW` is much cleaner and easier to parse. Any chance of refactoring the `SET` grammar to match (or be similar to) `SHOW`?

{% include sql/diagrams/set.html %}


### SET LOCAL

**set_local ::=**
{% include sql/diagrams/set_local.html %}


### SET SESSION

**set_session ::=**
{% include sql/diagrams/set_session.html %}


### SET TIME ZONE

**set_time_zone ::=**
{% include sql/diagrams/set_time_zone.html %}


### SET TRANSACTION

**set_transaction ::=**
{% include sql/diagrams/set_transaction.html %}


### SHOW ALL

**NEW:** This SQL statement is not documented. 

**show_all ::=**
{% include sql/diagrams/show_all.html %}

<br><br>
`SHOW` is nice. I wish `SET` would be just as well behaved. :)


### SHOW IDENT

**NEW:** This SQL statement is not documented. 

**show_ident ::=**
{% include sql/diagrams/show_ident.html %}


### SHOW DATABASE

**NEW:** This SQL statement is not documented. 

**show_database ::=**
{% include sql/diagrams/show_database.html %}


### SHOW DATABASES

**ORIGINAL:**

**show_databases ::=**
{% include sql/diagrams/show_databases.html %}


### SHOW COLUMNS

**ORIGINAL:**

**show_columns ::=**
{% include sql/diagrams/show_columns.html %}


### SHOW CREATE

**NEW:** This SQL statement is not documented. 

**show_create ::=**
{% include sql/diagrams/show_create.html %}

<br><br>
The only option at present is `TABLE`. I moved the `SHOW CREATE TABLE` command to `SHOW CREATE` in anticipation of more `SHOW CREATE` options in future. Eg; **SHOW CREATE [ TABLE | INDEX | DATABASE | *and_other_stuff* ] any_name**


### SHOW GRANTS

**ORIGINAL:**

**show_grants ::=**
{% include sql/diagrams/show_grants.html %}


### SHOW INDEX

**CHANGED:** Merged `KEYS` as an alias and added `INDEXES` as an alias.

**show_index ::=**
{% include sql/diagrams/show_index.html %}

Just to see how it would look as a more meaningful description, I replaced *var_name* with *table_name*.  


### SHOW TABLES

**ORIGINAL:**

**show_tables ::=**
{% include sql/diagrams/show_tables.html %}


### SHOW TIME ZONE

**ORIGINAL:**

**show_time_zone ::=**
{% include sql/diagrams/show_time_zone.html %}


### SHOW TRANSACTION

**ORIGINAL:**

**show_transaction ::=**
{% include sql/diagrams/show_transaction.html %}


### TRUNCATE

**ORIGINAL:** Should probably expand `opt_drop_behavior` at some stage.

**truncate ::=**
{% include sql/diagrams/truncate.html %}


### UPDATE

**ORIGINAL:**

**update ::=**
{% include sql/diagrams/update.html %}


### UPSERT

**ORIGINAL:**

**upsert ::=**
{% include sql/diagrams/upsert.html %}


### VALUES

**ORIGINAL:**

**values ::=**
{% include sql/diagrams/values.html %}




