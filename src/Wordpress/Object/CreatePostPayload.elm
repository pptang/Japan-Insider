-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.CreatePostPayload exposing (clientMutationId, post)

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


{-| -}
clientMutationId : SelectionSet String Wordpress.Object.CreatePostPayload
clientMutationId =
    Object.selectionForField "String" "clientMutationId" [] Decode.string


{-| -}
post : SelectionSet decodesTo Wordpress.Object.Post -> SelectionSet (Maybe decodesTo) Wordpress.Object.CreatePostPayload
post object_ =
    Object.selectionForCompositeField "post" [] object_ (identity >> Decode.nullable)
