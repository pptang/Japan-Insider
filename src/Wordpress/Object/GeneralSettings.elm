-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.GeneralSettings exposing (dateFormat, description, email, language, startOfWeek, timeFormat, timezone, title, url)

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


{-| A date format for all date strings.
-}
dateFormat : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
dateFormat =
    Object.selectionForField "(Maybe String)" "dateFormat" [] (Decode.string |> Decode.nullable)


{-| Site tagline.
-}
description : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
description =
    Object.selectionForField "(Maybe String)" "description" [] (Decode.string |> Decode.nullable)


{-| This address is used for admin purposes, like new user notification.
-}
email : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
email =
    Object.selectionForField "(Maybe String)" "email" [] (Decode.string |> Decode.nullable)


{-| WordPress locale code.
-}
language : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
language =
    Object.selectionForField "(Maybe String)" "language" [] (Decode.string |> Decode.nullable)


{-| A day number of the week that the week should start on.
-}
startOfWeek : SelectionSet (Maybe Int) Wordpress.Object.GeneralSettings
startOfWeek =
    Object.selectionForField "(Maybe Int)" "startOfWeek" [] (Decode.int |> Decode.nullable)


{-| A time format for all time strings.
-}
timeFormat : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
timeFormat =
    Object.selectionForField "(Maybe String)" "timeFormat" [] (Decode.string |> Decode.nullable)


{-| A city in the same timezone as you.
-}
timezone : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
timezone =
    Object.selectionForField "(Maybe String)" "timezone" [] (Decode.string |> Decode.nullable)


{-| Site title.
-}
title : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
title =
    Object.selectionForField "(Maybe String)" "title" [] (Decode.string |> Decode.nullable)


{-| Site URL.
-}
url : SelectionSet (Maybe String) Wordpress.Object.GeneralSettings
url =
    Object.selectionForField "(Maybe String)" "url" [] (Decode.string |> Decode.nullable)
