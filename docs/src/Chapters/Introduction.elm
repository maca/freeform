module Chapters.Introduction exposing (chapter)

import ElmBook.Chapter as Chapter exposing (Chapter)


chapter : Chapter state
chapter =
    Chapter.chapter "Freeform"
        |> Chapter.render markdownContent


markdownContent : String
markdownContent =
    """
Freeform is (will be) an offline-first and OSS alternative to Google Forms. It provides tools
to build complex questionnaires, surveys and forms, with a rich set of data types
and field types; conditional logic and repeatable fields for collecting
variable-length lists such as family members, employment history, references, or
itemised expenses; and rich interpolation of data and rendering for participant
feedback, both for survey creators and for software developers. All while putting
an emphasis on independence from big tech, field usage with limited internet
access, easy to self-host API, form styling and basic CMS capabilities.

It comes as three distinct pieces that can be used independently or in
combination: a drag-and-drop form builder web application, a web app for filling
the forms, and a back-office interface for managing the survey projects. The
back-end is optional, and as simple as possible to self-host.

Currently under development, the progress will be documented and communicated
through this website, the content will be replaced with documentation as this
becomes available. As part of the development a few libraries, packages and
dependency apps will be improving, potentially benefiting a broader audience.



## Development plan

The development is projected with a span of 2 months, consisting of a development
and a validation, documentation and improvements phase: 


1. Building a [form builder](/freeform/1--form-builder) application, including
   functionality to generate and download an offline survey as a static html file,
   as well as saving the form schema to the back-office. Implementing conditional
   fields, multiple step surveys and file uploads.
2. [Back-office](/freeform/2--back-office-and-back-end) development: Database
   modeling of
   Campaigns, Surveys, Users and Roles and other resources, PostgREST functions for
   admin login. Very simple ACL model for defining survey ownership and admin
   permissions for surveys, password and profile update.
3. Building a [form filling application](/freeform/3--form-filling-application), for
   online filling or to be distributed as a static html file.
4. Implementing [offline data export](/freeform/4--offline-data-export)
   functionality for saving the responses as a CSV or JSON file for standalone
   usage (without a back-office)
5. Explore and implement
   [offline data synchronisation](/freeform/5--offline-data-synchronisation) to a
   back-office.

**Stage 2** (1 month)

1. Feedback from social sciences researchers for further improvements.
2. Request accessibility audit and implement suggestions
3. Request security audit for the back-office API and implement suggestions.
4. Document features, usage and deployment cookbooks.

"""
