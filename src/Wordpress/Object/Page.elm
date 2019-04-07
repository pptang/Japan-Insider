-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Wordpress.Object.Page exposing (AncestorsOptionalArguments, ChildPagesOptionalArguments, CommentsOptionalArguments, ContentOptionalArguments, ExcerptOptionalArguments, TermNamesOptionalArguments, TermSlugsOptionalArguments, TermsOptionalArguments, TitleOptionalArguments, ancestors, author, childPages, commentCount, commentStatus, comments, content, date, dateGmt, desiredSlug, editLast, editLock, enclosure, excerpt, featuredImage, guid, id, link, menuOrder, modified, modifiedGmt, pageId, parent, pingStatus, pinged, slug, status, termNames, termSlugs, terms, title, toPing, uri)

import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Wordpress.Enum.PostObjectFieldFormatEnum
import Wordpress.Enum.PostTypeEnum
import Wordpress.Enum.TaxonomyEnum
import Wordpress.InputObject
import Wordpress.Interface
import Wordpress.Object
import Wordpress.Scalar
import Wordpress.ScalarCodecs
import Wordpress.Union


type alias AncestorsOptionalArguments =
    { types : OptionalArgument (List (Maybe Wordpress.Enum.PostTypeEnum.PostTypeEnum)) }


{-| Ancestors of the object

  - types - The types of ancestors to check for. Defaults to the same type as the current object

-}
ancestors : (AncestorsOptionalArguments -> AncestorsOptionalArguments) -> SelectionSet decodesTo Wordpress.Union.PostObjectUnion -> SelectionSet (Maybe (List (Maybe decodesTo))) Wordpress.Object.Page
ancestors fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { types = Absent }

        optionalArgs =
            [ Argument.optional "types" filledInOptionals.types (Encode.enum Wordpress.Enum.PostTypeEnum.toString |> Encode.maybe |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "ancestors" optionalArgs object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


{-| The author field will return a queryable User type matching the post&#039;s author.
-}
author : SelectionSet decodesTo Wordpress.Object.User -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
author object_ =
    Object.selectionForCompositeField "author" [] object_ (identity >> Decode.nullable)


type alias ChildPagesOptionalArguments =
    { first : OptionalArgument Int
    , last : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , where_ : OptionalArgument Wordpress.InputObject.PageToPageConnectionWhereArgs
    }


{-| Connection between the page type and the page type

  - first - The number of items to return after the referenced "after" cursor
  - after - Cursor used along with the "first" argument to reference where in the dataset to get data
  - before - Cursor used along with the "last" argument to reference where in the dataset to get data
  - where\_ - Arguments for filtering the connection

-}
childPages : (ChildPagesOptionalArguments -> ChildPagesOptionalArguments) -> SelectionSet decodesTo Wordpress.Object.PageToPageConnection -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
childPages fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, last = Absent, after = Absent, before = Absent, where_ = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "where" filledInOptionals.where_ Wordpress.InputObject.encodePageToPageConnectionWhereArgs ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "childPages" optionalArgs object_ (identity >> Decode.nullable)


{-| The number of comments. Even though WPGraphQL denotes this field as an integer, in WordPress this field should be saved as a numeric string for compatibility.
-}
commentCount : SelectionSet (Maybe Int) Wordpress.Object.Page
commentCount =
    Object.selectionForField "(Maybe Int)" "commentCount" [] (Decode.int |> Decode.nullable)


type alias CommentsOptionalArguments =
    { first : OptionalArgument Int
    , last : OptionalArgument Int
    , after : OptionalArgument String
    , before : OptionalArgument String
    , where_ : OptionalArgument Wordpress.InputObject.PageToCommentConnectionWhereArgs
    }


{-| Connection between the page type and the page type

  - first - The number of items to return after the referenced "after" cursor
  - after - Cursor used along with the "first" argument to reference where in the dataset to get data
  - before - Cursor used along with the "last" argument to reference where in the dataset to get data
  - where\_ - Arguments for filtering the connection

-}
comments : (CommentsOptionalArguments -> CommentsOptionalArguments) -> SelectionSet decodesTo Wordpress.Object.PageToCommentConnection -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
comments fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, last = Absent, after = Absent, before = Absent, where_ = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "where" filledInOptionals.where_ Wordpress.InputObject.encodePageToCommentConnectionWhereArgs ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "comments" optionalArgs object_ (identity >> Decode.nullable)


{-| Whether the comments are open or closed for this particular post.
-}
commentStatus : SelectionSet (Maybe String) Wordpress.Object.Page
commentStatus =
    Object.selectionForField "(Maybe String)" "commentStatus" [] (Decode.string |> Decode.nullable)


type alias ContentOptionalArguments =
    { format : OptionalArgument Wordpress.Enum.PostObjectFieldFormatEnum.PostObjectFieldFormatEnum }


{-| The content of the post.

  - format - Format of the field output

-}
content : (ContentOptionalArguments -> ContentOptionalArguments) -> SelectionSet (Maybe String) Wordpress.Object.Page
content fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { format = Absent }

        optionalArgs =
            [ Argument.optional "format" filledInOptionals.format (Encode.enum Wordpress.Enum.PostObjectFieldFormatEnum.toString) ]
                |> List.filterMap identity
    in
    Object.selectionForField "(Maybe String)" "content" optionalArgs (Decode.string |> Decode.nullable)


{-| Post publishing date.
-}
date : SelectionSet (Maybe String) Wordpress.Object.Page
date =
    Object.selectionForField "(Maybe String)" "date" [] (Decode.string |> Decode.nullable)


{-| The publishing date set in GMT.
-}
dateGmt : SelectionSet (Maybe String) Wordpress.Object.Page
dateGmt =
    Object.selectionForField "(Maybe String)" "dateGmt" [] (Decode.string |> Decode.nullable)


{-| The desired slug of the post
-}
desiredSlug : SelectionSet (Maybe String) Wordpress.Object.Page
desiredSlug =
    Object.selectionForField "(Maybe String)" "desiredSlug" [] (Decode.string |> Decode.nullable)


{-| The user that most recently edited the object
-}
editLast : SelectionSet decodesTo Wordpress.Object.User -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
editLast object_ =
    Object.selectionForCompositeField "editLast" [] object_ (identity >> Decode.nullable)


{-| If a user has edited the object within the past 15 seconds, this will return the user and the time they last edited. Null if the edit lock doesn&#039;t exist or is greater than 15 seconds
-}
editLock : SelectionSet decodesTo Wordpress.Object.EditLock -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
editLock object_ =
    Object.selectionForCompositeField "editLock" [] object_ (identity >> Decode.nullable)


{-| The RSS enclosure for the object
-}
enclosure : SelectionSet (Maybe String) Wordpress.Object.Page
enclosure =
    Object.selectionForField "(Maybe String)" "enclosure" [] (Decode.string |> Decode.nullable)


type alias ExcerptOptionalArguments =
    { format : OptionalArgument Wordpress.Enum.PostObjectFieldFormatEnum.PostObjectFieldFormatEnum }


{-| The excerpt of the post.

  - format - Format of the field output

-}
excerpt : (ExcerptOptionalArguments -> ExcerptOptionalArguments) -> SelectionSet (Maybe String) Wordpress.Object.Page
excerpt fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { format = Absent }

        optionalArgs =
            [ Argument.optional "format" filledInOptionals.format (Encode.enum Wordpress.Enum.PostObjectFieldFormatEnum.toString) ]
                |> List.filterMap identity
    in
    Object.selectionForField "(Maybe String)" "excerpt" optionalArgs (Decode.string |> Decode.nullable)


{-| The featured image for the object
-}
featuredImage : SelectionSet decodesTo Wordpress.Object.MediaItem -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
featuredImage object_ =
    Object.selectionForCompositeField "featuredImage" [] object_ (identity >> Decode.nullable)


{-| The global unique identifier for this post. This currently matches the value stored in WP\_Post-&gt;guid and the guid column in the &quot;post\_objects&quot; database table.
-}
guid : SelectionSet (Maybe String) Wordpress.Object.Page
guid =
    Object.selectionForField "(Maybe String)" "guid" [] (Decode.string |> Decode.nullable)


{-| The globally unique ID for the object
-}
id : SelectionSet Wordpress.ScalarCodecs.Id Wordpress.Object.Page
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Wordpress.ScalarCodecs.codecs |> Wordpress.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| The permalink of the post
-}
link : SelectionSet (Maybe String) Wordpress.Object.Page
link =
    Object.selectionForField "(Maybe String)" "link" [] (Decode.string |> Decode.nullable)


{-| A field used for ordering posts. This is typically used with nav menu items or for special ordering of hierarchical content types.
-}
menuOrder : SelectionSet (Maybe Int) Wordpress.Object.Page
menuOrder =
    Object.selectionForField "(Maybe Int)" "menuOrder" [] (Decode.int |> Decode.nullable)


{-| The local modified time for a post. If a post was recently updated the modified field will change to match the corresponding time.
-}
modified : SelectionSet (Maybe String) Wordpress.Object.Page
modified =
    Object.selectionForField "(Maybe String)" "modified" [] (Decode.string |> Decode.nullable)


{-| The GMT modified time for a post. If a post was recently updated the modified field will change to match the corresponding time in GMT.
-}
modifiedGmt : SelectionSet (Maybe String) Wordpress.Object.Page
modifiedGmt =
    Object.selectionForField "(Maybe String)" "modifiedGmt" [] (Decode.string |> Decode.nullable)


{-| The id field matches the WP\_Post-&gt;ID field.
-}
pageId : SelectionSet Int Wordpress.Object.Page
pageId =
    Object.selectionForField "Int" "pageId" [] Decode.int


{-| The parent of the object. The parent object can be of various types
-}
parent : SelectionSet decodesTo Wordpress.Union.PostObjectUnion -> SelectionSet (Maybe decodesTo) Wordpress.Object.Page
parent object_ =
    Object.selectionForCompositeField "parent" [] object_ (identity >> Decode.nullable)


{-| URLs that have been pinged.
-}
pinged : SelectionSet (Maybe (List (Maybe String))) Wordpress.Object.Page
pinged =
    Object.selectionForField "(Maybe (List (Maybe String)))" "pinged" [] (Decode.string |> Decode.nullable |> Decode.list |> Decode.nullable)


{-| Whether the pings are open or closed for this particular post.
-}
pingStatus : SelectionSet (Maybe String) Wordpress.Object.Page
pingStatus =
    Object.selectionForField "(Maybe String)" "pingStatus" [] (Decode.string |> Decode.nullable)


{-| The uri slug for the post. This is equivalent to the WP\_Post-&gt;post\_name field and the post\_name column in the database for the &quot;post\_objects&quot; table.
-}
slug : SelectionSet (Maybe String) Wordpress.Object.Page
slug =
    Object.selectionForField "(Maybe String)" "slug" [] (Decode.string |> Decode.nullable)


{-| The current status of the object
-}
status : SelectionSet (Maybe String) Wordpress.Object.Page
status =
    Object.selectionForField "(Maybe String)" "status" [] (Decode.string |> Decode.nullable)


type alias TermNamesOptionalArguments =
    { taxonomies : OptionalArgument (List (Maybe Wordpress.Enum.TaxonomyEnum.TaxonomyEnum)) }


{-| Terms connected to the page

  - taxonomies - Select which taxonomies to limit the results to

-}
termNames : (TermNamesOptionalArguments -> TermNamesOptionalArguments) -> SelectionSet (Maybe (List (Maybe String))) Wordpress.Object.Page
termNames fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { taxonomies = Absent }

        optionalArgs =
            [ Argument.optional "taxonomies" filledInOptionals.taxonomies (Encode.enum Wordpress.Enum.TaxonomyEnum.toString |> Encode.maybe |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForField "(Maybe (List (Maybe String)))" "termNames" optionalArgs (Decode.string |> Decode.nullable |> Decode.list |> Decode.nullable)


type alias TermsOptionalArguments =
    { taxonomies : OptionalArgument (List (Maybe Wordpress.Enum.TaxonomyEnum.TaxonomyEnum)) }


{-| Terms connected to the page

  - taxonomies - Select which taxonomies to limit the results to

-}
terms : (TermsOptionalArguments -> TermsOptionalArguments) -> SelectionSet decodesTo Wordpress.Union.TermObjectUnion -> SelectionSet (Maybe (List (Maybe decodesTo))) Wordpress.Object.Page
terms fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { taxonomies = Absent }

        optionalArgs =
            [ Argument.optional "taxonomies" filledInOptionals.taxonomies (Encode.enum Wordpress.Enum.TaxonomyEnum.toString |> Encode.maybe |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "terms" optionalArgs object_ (identity >> Decode.nullable >> Decode.list >> Decode.nullable)


type alias TermSlugsOptionalArguments =
    { taxonomies : OptionalArgument (List (Maybe Wordpress.Enum.TaxonomyEnum.TaxonomyEnum)) }


{-| Terms connected to the page

  - taxonomies - Select which taxonomies to limit the results to

-}
termSlugs : (TermSlugsOptionalArguments -> TermSlugsOptionalArguments) -> SelectionSet (Maybe (List (Maybe String))) Wordpress.Object.Page
termSlugs fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { taxonomies = Absent }

        optionalArgs =
            [ Argument.optional "taxonomies" filledInOptionals.taxonomies (Encode.enum Wordpress.Enum.TaxonomyEnum.toString |> Encode.maybe |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForField "(Maybe (List (Maybe String)))" "termSlugs" optionalArgs (Decode.string |> Decode.nullable |> Decode.list |> Decode.nullable)


type alias TitleOptionalArguments =
    { format : OptionalArgument Wordpress.Enum.PostObjectFieldFormatEnum.PostObjectFieldFormatEnum }


{-| The title of the post. This is currently just the raw title. An amendment to support rendered title needs to be made.

  - format - Format of the field output

-}
title : (TitleOptionalArguments -> TitleOptionalArguments) -> SelectionSet (Maybe String) Wordpress.Object.Page
title fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { format = Absent }

        optionalArgs =
            [ Argument.optional "format" filledInOptionals.format (Encode.enum Wordpress.Enum.PostObjectFieldFormatEnum.toString) ]
                |> List.filterMap identity
    in
    Object.selectionForField "(Maybe String)" "title" optionalArgs (Decode.string |> Decode.nullable)


{-| URLs queued to be pinged.
-}
toPing : SelectionSet (Maybe (List (Maybe String))) Wordpress.Object.Page
toPing =
    Object.selectionForField "(Maybe (List (Maybe String)))" "toPing" [] (Decode.string |> Decode.nullable |> Decode.list |> Decode.nullable)


{-| URI path for the resource
-}
uri : SelectionSet (Maybe String) Wordpress.Object.Page
uri =
    Object.selectionForField "(Maybe String)" "uri" [] (Decode.string |> Decode.nullable)
