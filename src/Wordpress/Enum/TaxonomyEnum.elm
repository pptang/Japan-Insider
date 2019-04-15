-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Enum.TaxonomyEnum exposing (TaxonomyEnum(..), decoder, fromString, list, toString)

import Json.Decode as Decode exposing (Decoder)


{-| Allowed taxonomies
-}
type TaxonomyEnum
    = Category
    | Tag


list : List TaxonomyEnum
list =
    [ Category, Tag ]


decoder : Decoder TaxonomyEnum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "CATEGORY" ->
                        Decode.succeed Category

                    "TAG" ->
                        Decode.succeed Tag

                    _ ->
                        Decode.fail ("Invalid TaxonomyEnum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : TaxonomyEnum -> String
toString enum =
    case enum of
        Category ->
            "CATEGORY"

        Tag ->
            "TAG"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe TaxonomyEnum
fromString enumString =
    case enumString of
        "CATEGORY" ->
            Just Category

        "TAG" ->
            Just Tag

        _ ->
            Nothing