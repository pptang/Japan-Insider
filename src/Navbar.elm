module Navbar exposing (view)

import Browser
import Html exposing (Html, a, nav, text)
import Html.Attributes exposing (..)



-- VIEW


view : Html msg
view =
    nav []
        [ a [ href "#top" ] [ text "首頁" ]
        , a [ href "#service" ] [ text "服務內容" ]
        , a [ href "#success-case" ] [ text "過去實績" ]
        , a [ href "#team" ] [ text "團隊成員" ]
        , a [ href "#japan-insider" ] [ text "日本內幕" ]
        , a [ href "https://japaninsider.typeform.com/to/S7rcLo" ] [ text "聯絡我們" ]
        ]
