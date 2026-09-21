module Chapters.OfflineSync exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "5. Offline Data Synchronisation"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Explore and implement offline data synchronisation to a back-office.

"""
