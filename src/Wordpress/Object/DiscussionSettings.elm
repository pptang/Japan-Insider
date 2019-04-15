-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.DiscussionSettings exposing (defaultCommentStatus, defaultPingStatus)

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


{-| Allow people to post comments on new articles.
-}
defaultCommentStatus : SelectionSet (Maybe String) Wordpress.Object.DiscussionSettings
defaultCommentStatus =
    Object.selectionForField "(Maybe String)" "defaultCommentStatus" [] (Decode.string |> Decode.nullable)


{-| Allow link notifications from other blogs (pingbacks and trackbacks) on new articles.
-}
defaultPingStatus : SelectionSet (Maybe String) Wordpress.Object.DiscussionSettings
defaultPingStatus =
    Object.selectionForField "(Maybe String)" "defaultPingStatus" [] (Decode.string |> Decode.nullable)