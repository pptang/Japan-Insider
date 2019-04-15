-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.UpdateSettingsPayload exposing (allSettings, clientMutationId, discussionSettings, generalSettings, readingSettings, writingSettings)

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
allSettings : SelectionSet decodesTo Wordpress.Object.Settings -> SelectionSet (Maybe decodesTo) Wordpress.Object.UpdateSettingsPayload
allSettings object_ =
    Object.selectionForCompositeField "allSettings" [] object_ (identity >> Decode.nullable)


{-| -}
clientMutationId : SelectionSet String Wordpress.Object.UpdateSettingsPayload
clientMutationId =
    Object.selectionForField "String" "clientMutationId" [] Decode.string


{-| -}
discussionSettings : SelectionSet decodesTo Wordpress.Object.DiscussionSettings -> SelectionSet (Maybe decodesTo) Wordpress.Object.UpdateSettingsPayload
discussionSettings object_ =
    Object.selectionForCompositeField "discussionSettings" [] object_ (identity >> Decode.nullable)


{-| -}
generalSettings : SelectionSet decodesTo Wordpress.Object.GeneralSettings -> SelectionSet (Maybe decodesTo) Wordpress.Object.UpdateSettingsPayload
generalSettings object_ =
    Object.selectionForCompositeField "generalSettings" [] object_ (identity >> Decode.nullable)


{-| -}
readingSettings : SelectionSet decodesTo Wordpress.Object.ReadingSettings -> SelectionSet (Maybe decodesTo) Wordpress.Object.UpdateSettingsPayload
readingSettings object_ =
    Object.selectionForCompositeField "readingSettings" [] object_ (identity >> Decode.nullable)


{-| -}
writingSettings : SelectionSet decodesTo Wordpress.Object.WritingSettings -> SelectionSet (Maybe decodesTo) Wordpress.Object.UpdateSettingsPayload
writingSettings object_ =
    Object.selectionForCompositeField "writingSettings" [] object_ (identity >> Decode.nullable)