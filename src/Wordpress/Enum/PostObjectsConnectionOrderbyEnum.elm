-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Enum.PostObjectsConnectionOrderbyEnum exposing (PostObjectsConnectionOrderbyEnum(..), decoder, fromString, list, toString)

import Json.Decode as Decode exposing (Decoder)


{-| Field to order the connection by

  - Author - Order by author
  - Date - Order by publish date
  - In - Preserve the ID order given in the IN array
  - MenuOrder - Order by the menu order value
  - Modified - Order by last modified date
  - NameIn - Preserve slug order given in the NAME\_IN array
  - Parent - Order by parent ID
  - Slug - Order by slug
  - Title - Order by title

-}
type PostObjectsConnectionOrderbyEnum
    = Author
    | Date
    | In
    | MenuOrder
    | Modified
    | NameIn
    | Parent
    | Slug
    | Title


list : List PostObjectsConnectionOrderbyEnum
list =
    [ Author, Date, In, MenuOrder, Modified, NameIn, Parent, Slug, Title ]


decoder : Decoder PostObjectsConnectionOrderbyEnum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "AUTHOR" ->
                        Decode.succeed Author

                    "DATE" ->
                        Decode.succeed Date

                    "IN" ->
                        Decode.succeed In

                    "MENU_ORDER" ->
                        Decode.succeed MenuOrder

                    "MODIFIED" ->
                        Decode.succeed Modified

                    "NAME_IN" ->
                        Decode.succeed NameIn

                    "PARENT" ->
                        Decode.succeed Parent

                    "SLUG" ->
                        Decode.succeed Slug

                    "TITLE" ->
                        Decode.succeed Title

                    _ ->
                        Decode.fail ("Invalid PostObjectsConnectionOrderbyEnum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : PostObjectsConnectionOrderbyEnum -> String
toString enum =
    case enum of
        Author ->
            "AUTHOR"

        Date ->
            "DATE"

        In ->
            "IN"

        MenuOrder ->
            "MENU_ORDER"

        Modified ->
            "MODIFIED"

        NameIn ->
            "NAME_IN"

        Parent ->
            "PARENT"

        Slug ->
            "SLUG"

        Title ->
            "TITLE"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe PostObjectsConnectionOrderbyEnum
fromString enumString =
    case enumString of
        "AUTHOR" ->
            Just Author

        "DATE" ->
            Just Date

        "IN" ->
            Just In

        "MENU_ORDER" ->
            Just MenuOrder

        "MODIFIED" ->
            Just Modified

        "NAME_IN" ->
            Just NameIn

        "PARENT" ->
            Just Parent

        "SLUG" ->
            Just Slug

        "TITLE" ->
            Just Title

        _ ->
            Nothing
