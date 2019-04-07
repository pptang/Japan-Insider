-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.UserToPageConnectionEdge exposing (cursor, node)

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


{-| A cursor for use in pagination
-}
cursor : SelectionSet (Maybe String) Wordpress.Object.UserToPageConnectionEdge
cursor =
    Object.selectionForField "(Maybe String)" "cursor" [] (Decode.string |> Decode.nullable)


{-| The item at the end of the edge
-}
node : SelectionSet decodesTo Wordpress.Object.Page -> SelectionSet (Maybe decodesTo) Wordpress.Object.UserToPageConnectionEdge
node object_ =
    Object.selectionForCompositeField "node" [] object_ (identity >> Decode.nullable)
