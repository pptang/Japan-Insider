-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.UserToRevisionConnection exposing (edges, nodes, pageInfo, postTypeInfo)

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


{-| Edges for the UserToRevisionConnection connection
-}
edges : SelectionSet decodesTo Wordpress.Object.UserToRevisionConnectionEdge -> SelectionSet (Maybe (List (Maybe decodesTo))) Wordpress.Object.UserToRevisionConnection
edges object_ =
    Object.selectionForCompositeField "edges" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| The nodes of the connection, without the edges
-}
nodes : SelectionSet decodesTo Wordpress.Object.Revision -> SelectionSet (Maybe (List (Maybe decodesTo))) Wordpress.Object.UserToRevisionConnection
nodes object_ =
    Object.selectionForCompositeField "nodes" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| Information about pagination in a connection.
-}
pageInfo : SelectionSet decodesTo Wordpress.Object.WPPageInfo -> SelectionSet (Maybe decodesTo) Wordpress.Object.UserToRevisionConnection
pageInfo object_ =
    Object.selectionForCompositeField "pageInfo" [] object_ (identity >> Decode.nullable)


{-| Information about the type of content being queried
-}
postTypeInfo : SelectionSet decodesTo Wordpress.Object.PostType -> SelectionSet (Maybe decodesTo) Wordpress.Object.UserToRevisionConnection
postTypeInfo object_ =
    Object.selectionForCompositeField "postTypeInfo" [] object_ (identity >> Decode.nullable)