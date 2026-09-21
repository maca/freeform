module Chapters.BackOffice exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "2. Back-Office"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Database modeling of Campaigns, Surveys, Users and Roles and other resources,
PostgREST functions for admin login. Very simple ACL model for defining survey
ownership and admin permissions for surveys, password and profile update.

"""
