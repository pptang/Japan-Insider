-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Enum.UserRoleEnum exposing (UserRoleEnum(..), decoder, fromString, list, toString)

import Json.Decode as Decode exposing (Decoder)


{-| Names of available user roles
-}
type UserRoleEnum
    = Administrator
    | Author
    | Contributor
    | Editor
    | Subscriber


list : List UserRoleEnum
list =
    [ Administrator, Author, Contributor, Editor, Subscriber ]


decoder : Decoder UserRoleEnum
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "ADMINISTRATOR" ->
                        Decode.succeed Administrator

                    "AUTHOR" ->
                        Decode.succeed Author

                    "CONTRIBUTOR" ->
                        Decode.succeed Contributor

                    "EDITOR" ->
                        Decode.succeed Editor

                    "SUBSCRIBER" ->
                        Decode.succeed Subscriber

                    _ ->
                        Decode.fail ("Invalid UserRoleEnum type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : UserRoleEnum -> String
toString enum =
    case enum of
        Administrator ->
            "ADMINISTRATOR"

        Author ->
            "AUTHOR"

        Contributor ->
            "CONTRIBUTOR"

        Editor ->
            "EDITOR"

        Subscriber ->
            "SUBSCRIBER"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe UserRoleEnum
fromString enumString =
    case enumString of
        "ADMINISTRATOR" ->
            Just Administrator

        "AUTHOR" ->
            Just Author

        "CONTRIBUTOR" ->
            Just Contributor

        "EDITOR" ->
            Just Editor

        "SUBSCRIBER" ->
            Just Subscriber

        _ ->
            Nothing