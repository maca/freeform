module Main exposing (main)

import Chapters.BackOffice as BackOffice
import Chapters.FormBuilder as FormBuilder
import Chapters.FormFilling as FormFilling
import Chapters.Introduction as Introduction
import Chapters.OfflineExport as OfflineExport
import Chapters.OfflineSync as OfflineSync
import ElmBook exposing (Book, book)
import ElmBook.StatefulOptions as StatefulOptions


type alias Model =
    { formBuilder : FormBuilder.Model
    }


init : Model
init =
    { formBuilder = FormBuilder.init
    }


main : Book Model
main =
    book "Freeform"
        |> ElmBook.withStatefulOptions
            [ StatefulOptions.initialState init
            ]
        |> ElmBook.withChapterGroups
            [ ( "Freeform"
              , [ Introduction.chapter
                , FormBuilder.chapter
                , BackOffice.chapter
                , FormFilling.chapter
                , OfflineExport.chapter
                , OfflineSync.chapter
                ]
              )
            ]
