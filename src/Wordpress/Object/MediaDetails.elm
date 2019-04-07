-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.MediaDetails exposing (file, height, meta, sizes, width)

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


{-| The height of the mediaItem
-}
file : SelectionSet (Maybe String) Wordpress.Object.MediaDetails
file =
    Object.selectionForField "(Maybe String)" "file" [] (Decode.string |> Decode.nullable)


{-| The height of the mediaItem
-}
height : SelectionSet (Maybe Int) Wordpress.Object.MediaDetails
height =
    Object.selectionForField "(Maybe Int)" "height" [] (Decode.int |> Decode.nullable)


{-| -}
meta : SelectionSet decodesTo Wordpress.Object.MediaItemMeta -> SelectionSet (Maybe decodesTo) Wordpress.Object.MediaDetails
meta object_ =
    Object.selectionForCompositeField "meta" [] object_ (identity >> Decode.nullable)


{-| The available sizes of the mediaItem
-}
sizes : SelectionSet decodesTo Wordpress.Object.MediaSize -> SelectionSet (Maybe (List (Maybe decodesTo))) Wordpress.Object.MediaDetails
sizes object_ =
    Object.selectionForCompositeField "sizes" [] object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| The width of the mediaItem
-}
width : SelectionSet (Maybe Int) Wordpress.Object.MediaDetails
width =
    Object.selectionForField "(Maybe Int)" "width" [] (Decode.int |> Decode.nullable)
