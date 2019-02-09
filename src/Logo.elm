module Logo exposing (view)

import Browser
import Html exposing (Html, a, figure, img)
import Html.Attributes exposing (..)



-- VIEW


view : Html msg
view =
    a [ id "logo-link", href "#top" ]
        [ figure []
            [ img
                [ src "img/logo.svg"
                , alt "logo"
                , width 25
                , height 25
                , alt "menu"
                ]
                []
            ]
        ]
