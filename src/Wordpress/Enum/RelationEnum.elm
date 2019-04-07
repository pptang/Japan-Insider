-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Enum.RelationEnum exposing (RelationEnum(..), decoder, fromString, list, toString)

import Json.Decode as Decode exposing (Decoder)


{-| The logical relation between each item in the array when there are more than one.
-}
type RelationEnum
    = And
    | Or


list : List RelationEnum
list =
    [ And, Or ]


decoder : Decoder RelationEnum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "AND" ->
                        Decode.succeed And

                    "OR" ->
                        Decode.succeed Or

                    _ ->
                        Decode.fail ("Invalid RelationEnum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : RelationEnum -> String
toString enum =
    case enum of
        And ->
            "AND"

        Or ->
            "OR"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe RelationEnum
fromString enumString =
    case enumString of
        "AND" ->
            Just And

        "OR" ->
            Just Or

        _ ->
            Nothing
