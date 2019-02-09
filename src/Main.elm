module Main exposing (init, view)

import Browser exposing (Document)
import Html exposing (Html, div, header, section, text)
import Html.Attributes exposing (..)
import Logo
import Navbar


type Msg
    = NoOp


init : () -> ( (), Cmd Msg )
init _ =
    ( (), Cmd.none )


view : () -> Document Msg
view _ =
    { title = "日本インサイド"
    , body =
        [ header [] [ Logo.view, Navbar.view ]
        , div [] [ text "test" ]
        , section [] []
        ]
    }


update : Msg -> () -> ( (), Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : () -> Sub Msg
subscriptions model =
    Sub.none


main : Program () () Msg
main =
    Browser.document
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
