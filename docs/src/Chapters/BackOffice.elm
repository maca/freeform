module Chapters.BackOffice exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "2. Back-Office and Back-End"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Database modeling of Campaigns, Surveys, Users and Roles and other resources,
[PostgREST](https://postgrest.org/) functions for admin login. Very simple ACL
model for defining survey
ownership and admin permissions for surveys, password and profile update.

The back-office is (will be) a web interface over the same database. Every table
becomes a browsable resource, with a tabular listing, a detail view per record
and a form for creating and editing. Listings can be filtered column by column
— equals, contains, greater or less than, ranges, or a choice from a list —
as well as searched, sorted and paged. Records can be imported in bulk from a
CSV file, with a preview and a report of the rows that don't fit, and exported
as CSV or JSON. The interface is generated from the database's own description
of itself, so a new table needs no extra wiring, and signing in uses the same
role-based access that guards the API.

The back-end depends only in [Postgres](https://www.postgresql.org/) database and
a PostgREST API, the latter
is a single process server that reads the database schema and creates a REST
API exposing specific tables and schemas, making the deployment very simple.
This can be on a VPS, or to [Supabase](https://supabase.com/), a claude provider
for Postgres/PostgREST.

The back-office relies on a generic PostgREST based admin interface
that will benefit from developing efforts devoted to this project:
[postgrest-admin](https://github.com/maca/postgrest-admin).

"""
