-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.Menu exposing (MenuItemsOptionalArguments, count, id, menuId, menuItems, name, slug)

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


{-| The number of items in the menu
-}
count : SelectionSet (Maybe Int) Wordpress.Object.Menu
count =
    Object.selectionForField "(Maybe Int)" "count" [] (Decode.int |> Decode.nullable)


{-| ID of the nav menu.
-}
id : SelectionSet Wordpress.ScalarCodecs.Id Wordpress.Object.Menu
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Wordpress.ScalarCodecs.codecs |> Wordpress.Scalar.unwrapCodecs |> .codecId |> .decoder)


type alias MenuItemsOptionalArguments =
    { first : OptionalArgument Int
    , last : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , where_ : OptionalArgument Wordpress.InputObject.MenuToMenuItemConnectionWhereArgs
    }


{-| Connection between the Menu type and the Menu type

  - first - The number of items to return after the referenced "after" cursor
  - after - Cursor used along with the "first" argument to reference where in the dataset to get data
  - before - Cursor used along with the "last" argument to reference where in the dataset to get data
  - where\_ - Arguments for filtering the connection

-}
menuItems : (MenuItemsOptionalArguments -> MenuItemsOptionalArguments) -> SelectionSet decodesTo Wordpress.Object.MenuToMenuItemConnection -> SelectionSet (Maybe decodesTo) Wordpress.Object.Menu
menuItems fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, last = Absent, after = Absent, before = Absent, where_ = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "where" filledInOptionals.where_ Wordpress.InputObject.encodeMenuToMenuItemConnectionWhereArgs ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "menuItems" optionalArgs object_ (identity >> Decode.nullable)


{-| WP ID of the nav menu.
-}
menuId : SelectionSet (Maybe Int) Wordpress.Object.Menu
menuId =
    Object.selectionForField "(Maybe Int)" "menuId" [] (Decode.int |> Decode.nullable)


{-| Display name of the menu. Equivalent to WP\_Term-&gt;name.
-}
name : SelectionSet (Maybe String) Wordpress.Object.Menu
name =
    Object.selectionForField "(Maybe String)" "name" [] (Decode.string |> Decode.nullable)


{-| The url friendly name of the menu. Equivalent to WP\_Term-&gt;slug
-}
slug : SelectionSet (Maybe String) Wordpress.Object.Menu
slug =
    Object.selectionForField "(Maybe String)" "slug" [] (Decode.string |> Decode.nullable)