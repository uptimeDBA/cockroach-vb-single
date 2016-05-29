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

The idea is everything is resolved down such that only things like names and numbers remain. The user shouldn't have to leave the page to understand the major components of the syntax. On a couple of occasions I've stopped in-lining the syntax because the rabbit hole just goes too deep.

All of the diagrams have been produced  using CockroachDB's [generate](https://github.com/cockroachdb/docs/tree/gh-pages/generate) utility. It's my own version but the only difference is I've seperated the data from the code by placing the specs struct into a file in JSON format.

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


### ALTER DATABASE

**alter_database ::=**
{% include sql/diagrams/alter_database.html %}

This is the same as the current rename_database. 


### ALTER INDEX

**alter_index ::=**
{% include sql/diagrams/alter_index.html %}


### ALTER TABLE

**alter_table ::=**
{% include sql/diagrams/alter_table.html %}

<br><br>
**col_qual_list ::=**
{% include sql/diagrams/col_qual_list.html %}

<br><br>
**table_constraint ::=**
{% include sql/diagrams/table_constraint.html %}


### BEGIN

**begin_transaction ::=**
{% include sql/diagrams/begin.html %}


`START TRANSACTION` added as alias.

<br><br>
**iso_level ::=**
{% include sql/diagrams/iso_level.html %}


### COMMIT

**commit_transaction ::=**
{% include sql/diagrams/commit.html %}

`END TRANSACTION` added as alias.


### CREATE DATABSE

**create_database ::=**
{% include sql/diagrams/create_database.html %}

Nice if we could have a list of valid encodings (currently only **UFT-8**) instead of `SCONST`.


### CREATE INDEX

**create_index ::=**
{% include sql/diagrams/create_index.html %}

<br><br>
**opt_storing ::=**
{% include sql/diagrams/opt_storing.html %}


### CREATE TABLE

**create_table ::=**
{% include sql/diagrams/create_table.html %}

<br><br>
**col_qual_list ::=**
{% include sql/diagrams/col_qual_list.html %}

Need to remove `REFERENCES` clause.

<br><br>
**index_def ::=**
{% include sql/diagrams/index_def.html %}

<br><br>
**family_def ::=**
{% include sql/diagrams/family_def.html %}

<br><br>
**table_constraint ::=**
{% include sql/diagrams/table_constraint.html %}


### DELETE

**delete ::=**
{% include sql/diagrams/delete.html %}


### DROP DATABASE

**drop_database ::=**
{% include sql/diagrams/drop_database.html %}


### DROP INDEX

**drop_index ::=**
{% include sql/diagrams/drop_index.html %}


### DROP TABLE

**drop_table ::=**
{% include sql/diagrams/drop_table.html %}

Removed `CASCADE`.


### EXPLAIN

**explain ::=**
{% include sql/diagrams/explain.html %}


### GRANT

**grant ::=**
{% include sql/diagrams/grant.html %}


### INSERT

**insert ::=**
{% include sql/diagrams/insert.html %}

<br><br>
**on_conflict ::=**
{% include sql/diagrams/on_conflict.html %}


### REVOKE

**revoke ::=**
{% include sql/diagrams/revoke.html %}


### ROLLBACK

**rollback_transaction ::=**
{% include sql/diagrams/rollback.html %}


### SAVEPOINT

**savepoint ::=**
{% include sql/diagrams/savepoint.html %}

This grammar seems odd. Is `SAVEPOINT SAVEPOINT <name>` intended?


### SELECT

**select ::=**
{% include sql/diagrams/select.html %}


### SET

The `SET` grammar is very messy. 

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

**show_all ::=**
{% include sql/diagrams/show_all.html %}


### SHOW IDENT

**show_ident ::=**
{% include sql/diagrams/show_ident.html %}


### SHOW DATABASE

**show_database ::=**
{% include sql/diagrams/show_database.html %}


### SHOW DATABASES

**show_databases ::=**
{% include sql/diagrams/show_databases.html %}


### SHOW COLUMNS

**show_columns ::=**
{% include sql/diagrams/show_columns.html %}


### SHOW CREATE

**show_create ::=**
{% include sql/diagrams/show_create.html %}

Only option at present is `TABLE`. Moved the `SHOW CREATE TABLE` command to `SHOW CREATE` in anticipation of more `SHOW CREATE` options in future.


### SHOW GRANTS

**show_grants ::=**
{% include sql/diagrams/show_grants.html %}


### SHOW INDEX

**show_index ::=**
{% include sql/diagrams/show_index.html %}

`KEYS` merged as alias. `INDEXES` added as alias.

String replaced *var_name* with *table_name* just to see how it would look as a more meaningful description.


### SHOW TABLES

**show_tables ::=**
{% include sql/diagrams/show_tables.html %}


### SHOW TIME ZONE

**show_time_zone ::=**
{% include sql/diagrams/show_time_zone.html %}


### SHOW TRANSACTION

**show_transaction ::=**
{% include sql/diagrams/show_transaction.html %}


### UPDATE

**update ::=**
{% include sql/diagrams/update.html %}


### UPSERT

**upsert ::=**
{% include sql/diagrams/upsert.html %}




