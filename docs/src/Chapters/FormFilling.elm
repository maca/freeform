module Chapters.FormFilling exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "3. Form Filling Application"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Building a form filling application, for online filling or to be distributed as
a static html file.

"""
