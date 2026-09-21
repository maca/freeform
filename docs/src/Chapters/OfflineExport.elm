module Chapters.OfflineExport exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "4. Offline Data Export"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Implementing offline data export functionality for saving the responses as a CSV
or JSON file for standalone usage (without a back-office).

"""
