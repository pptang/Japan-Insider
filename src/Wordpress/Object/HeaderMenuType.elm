-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.HeaderMenuType exposing (label, type_, url)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Wordpress.InputObject
import Wordpress.Interface
import Wordpress.Object
import Wordpress.Scalar
import Wordpress.ScalarCodecs
import Wordpress.Union


{-| The URL label
-}
label : SelectionSet (Maybe String) Wordpress.Object.HeaderMenuType
label =
    Object.selectionForField "(Maybe String)" "label" [] (Decode.string |> Decode.nullable)


{-| internal or external
-}
type_ : SelectionSet (Maybe String) Wordpress.Object.HeaderMenuType
type_ =
    Object.selectionForField "(Maybe String)" "type" [] (Decode.string |> Decode.nullable)


{-| The URL
-}
url : SelectionSet (Maybe String) Wordpress.Object.HeaderMenuType
url =
    Object.selectionForField "(Maybe String)" "url" [] (Decode.string |> Decode.nullable)