module Main exposing (init, view)

import Browser exposing (Document)
import Html exposing (Html, a, article, aside, div, em, figure, footer, h2, h3, header, img, li, nav, p, section, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (Decoder, field, list, map2, map4, string)
import String exposing (append)



-- MODEL


type alias Model =
    { navBarClassNames : List String
    , serviceContentList : List ServiceContent
    , serviceDetailList : List ServiceDetail
    , serviceIndex : Int
    , successCaseIndex : Int
    , mediaList : List String
    }


type alias ServiceContent =
    { imgSrc : String
    , imgAlt : String
    , title : String
    , description : String
    }


type alias ServiceDetail =
    { title : String
    , description : String
    }


type CarouselUseCase
    = Service
    | SuccessCase


serviceCarouselLength =
    2


successCaseCarouselLength =
    3


assetPath =
    "img/"


type CarouselBehaviour
    = Next
    | Prev


type Msg
    = TOGGLE
    | GotServiceContentList (Result Http.Error (List ServiceContent))
    | GotServiceDetailList (Result Http.Error (List ServiceDetail))
    | Carousel CarouselUseCase CarouselBehaviour
    | GotMediaList (Result Http.Error (List String))


init : () -> ( Model, Cmd Msg )
init _ =
    ( { navBarClassNames = []
      , serviceContentList = []
      , serviceDetailList = []
      , serviceIndex = 0
      , successCaseIndex = 0
      , mediaList = []
      }
    , Cmd.batch
        [ Http.get
            { url = "service_content.json"
            , expect = Http.expectJson GotServiceContentList decodeServiceContentList
            }
        , Http.get
            { url = "service_detail.json"
            , expect = Http.expectJson GotServiceDetailList decodeServiceDetailList
            }
        , Http.get
            { url = "media.json"
            , expect = Http.expectJson GotMediaList decodeMediaList
            }
        ]
    )



-- JSON DECODE


decodeServiceContentList : Decoder (List ServiceContent)
decodeServiceContentList =
    field "data" (list serviceContentDecoder)


serviceContentDecoder : Decoder ServiceContent
serviceContentDecoder =
    map4 ServiceContent
        (field "imgSrc" string)
        (field "imgAlt" string)
        (field "title" string)
        (field "description" string)


decodeServiceDetailList : Decoder (List ServiceDetail)
decodeServiceDetailList =
    field "data" (list serviceDetailDecoder)


serviceDetailDecoder : Decoder ServiceDetail
serviceDetailDecoder =
    map2 ServiceDetail
        (field "title" string)
        (field "description" string)


decodeMediaList : Decoder (List String)
decodeMediaList =
    field "data" (list string)



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TOGGLE ->
            case List.length model.navBarClassNames of
                0 ->
                    ( { model | navBarClassNames = "responsive" :: model.navBarClassNames }
                    , Cmd.none
                    )

                _ ->
                    ( { model | navBarClassNames = [] }, Cmd.none )

        GotServiceContentList result ->
            case result of
                Ok serviceContentList ->
                    ( { model | serviceContentList = serviceContentList }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        GotServiceDetailList result ->
            case result of
                Ok serviceDetailList ->
                    ( { model | serviceDetailList = serviceDetailList }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )

        Carousel useCase behaviour ->
            case useCase of
                Service ->
                    case behaviour of
                        Next ->
                            ( { model | serviceIndex = nextIndex model.serviceIndex serviceCarouselLength }, Cmd.none )

                        Prev ->
                            ( { model | serviceIndex = prevIndex model.serviceIndex serviceCarouselLength }, Cmd.none )

                SuccessCase ->
                    case behaviour of
                        Next ->
                            ( { model | serviceIndex = nextIndex model.serviceIndex successCaseCarouselLength }, Cmd.none )

                        Prev ->
                            ( { model | serviceIndex = prevIndex model.serviceIndex successCaseCarouselLength }, Cmd.none )

        GotMediaList result ->
            case result of
                Ok mediaList ->
                    ( { model | mediaList = mediaList }, Cmd.none )

                Err _ ->
                    ( model, Cmd.none )


nextIndex : Int -> Int -> Int
nextIndex currentIndex maxIndex =
    if currentIndex + 1 == maxIndex then
        0

    else
        currentIndex + 1


prevIndex : Int -> Int -> Int
prevIndex currentIndex maxIndex =
    if currentIndex - 1 < 0 then
        maxIndex - 1

    else
        currentIndex - 1



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


viewHeader : Model -> Html Msg
viewHeader model =
    header []
        [ a [ id "logo-link", href "#top" ]
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
        , nav [ class (String.join " " model.navBarClassNames) ]
            [ a [ href "#top" ] [ text "首頁" ]
            , a [ href "#service" ] [ text "服務內容" ]
            , a [ href "#success-case" ] [ text "過去實績" ]
            , a [ href "#team" ] [ text "團隊成員" ]
            , a [ href "#japan-insider" ] [ text "日本內幕" ]
            , a [ href "https://japaninsider.typeform.com/to/S7rcLo" ] [ text "聯絡我們" ]
            ]
        , a [ class "hamburger", href "javascript:void(0);", onClick TOGGLE ] [ img [] [] ]
        ]


viewMailBtn : Html Msg
viewMailBtn =
    div [ class "mailBtn" ]
        [ a [ href "https://japaninsider.typeform.com/to/S7rcLo" ]
            [ figure []
                [ img [ src "./img/mail.svg", alt "mail button" ] []
                ]
            ]
        ]


viewSectionTop : Html Msg
viewSectionTop =
    section [ id "top" ]
        [ aside []
            [ h2 [] [ text "成為你日本現地的即時成員" ]
            , h2 [] [ text "支援日本群眾募資的專業團隊" ]
            ]
        , div [ class "dot-container" ]
            [ div [ id "dot-1", class "dot selected" ] []
            , div [ id "dot-2", class "dot" ] []
            , div [ id "dot-3", class "dot" ] []
            ]
        ]


viewSectionIntroduction : Html Msg
viewSectionIntroduction =
    section [ id "id", class "intro-description" ]
        [ h2 []
            [ text "提供日本群眾募資"
            , em [] [ text "在地化、全方位" ]
            , text "支援"
            ]
        , h2 [] [ text "成功經驗累積成的專業流程" ]
        , h2 []
            [ text "能依據團隊需求為您"
            , em [] [ text "客製化" ]
            , text "服務"
            ]
        ]


viewSectionService : Model -> Html Msg
viewSectionService { serviceContentList, serviceDetailList, serviceIndex } =
    section [ id "service" ]
        [ h3 [ class "section-title" ] [ text "服務內容" ]
        , div [ class "carousel" ]
            [ div [ class "prev" ] [ div [ class "arrow-left", onClick (Carousel Service Prev) ] [] ]
            , ul [ class "slider" ]
                [ li
                    [ class
                        (if serviceIndex == 0 then
                            "visible"

                         else
                            ""
                        )
                    ]
                    [ div [ class "three-grid-view-container" ]
                        (List.map viewServiceContent serviceContentList)
                    ]
                , li
                    [ class
                        (if serviceIndex == 1 then
                            "visible"

                         else
                            ""
                        )
                    ]
                    [ div [ class "four-grid-view-container" ]
                        (List.map viewServiceDetail serviceDetailList)
                    ]
                ]
            , div [ class "next" ] [ div [ class "arrow-right", onClick (Carousel Service Next) ] [] ]
            ]
        , div [ class "mobile-list-container" ]
            (List.map viewMobileServiceContent serviceContentList)
        ]


viewServiceContent : ServiceContent -> Html Msg
viewServiceContent { imgSrc, imgAlt, title, description } =
    article [ class "three-grid-item" ]
        [ div [ class "circle-container" ] [ figure [] [ img [ src imgSrc, alt imgAlt ] [] ] ]
        , h3 [ class "custom-list-item-title" ] [ text title ]
        , p [ class "custom-list-item-description" ] [ text description ]
        ]


viewMobileServiceContent : ServiceContent -> Html Msg
viewMobileServiceContent { imgSrc, imgAlt, title, description } =
    article [ class "list-item no-bottom-border" ]
        [ div [ class "circle-container" ] [ figure [] [ img [ src imgSrc, alt imgAlt ] [] ] ]
        , h3 [ class "custom-list-item-title" ] [ text title ]
        , p [ class "custom-list-item-description" ] [ text description ]
        ]


viewServiceDetail : ServiceDetail -> Html Msg
viewServiceDetail { title, description } =
    article [ class "circle-container list-item circle-item-content no-bottom-border big-circle yellow-border" ]
        [ h3 [ class "circle-item-title" ] [ text title ]
        , p [ class "circle-item-description" ] [ text description ]
        ]


viewSectionPromotion : Html Msg
viewSectionPromotion =
    section [ id "promotion", class "intro-description" ]
        [ h2 [ class "text" ] [ text "JAPAN INSIDER" ]
        , h2 [ class "text" ] [ text "協助團隊成功募資的金額" ]
        , h2 [] [ em [] [ text "超過 4000萬日幣" ] ]
        ]



-- TODO : success-case
-- TODO : mobile-sucess-case


viewSectionTeamIntroduction : Html Msg
viewSectionTeamIntroduction =
    section [ id "team-introduction" ]
        [ div [ class "float-title" ]
            [ h2 []
                [ text "JAPAN INSIDER 成員背景包括"
                , em [] [ text "工程、供應鍊、數位行銷、產品設計," ]
                , text "並且皆任職於其專業領域位於日本的公司。透過對日本市場熟悉的專業團隊, 成為你專案的一份子, 協助你進入日本市場。"
                ]
            ]
        ]



-- TODO : team
-- TODO : mobile-team
-- TODO : japan-insider
-- TODO : mobile-japan-insider


viewSectionMarketDev : Html Msg
viewSectionMarketDev =
    section [ id "market-development-description" ]
        [ div [ class "float-title" ]
            [ h3 [ class "section-title" ] [ text "後續市場開發" ]
            , h2 [ class "promoting-title" ]
                [ text "JAPAN INSIDER 除了協助團隊規劃群眾募資外, 並協助團隊後續的市場開發。已經成功協助團隊以各種方式開拓日本市場, 包括與"
                , em [] [ text "當地知名品牌談定合作, 導入當地通路商、進入日本電商平台販賣" ]
                , text "等。"
                , a [ id "amazon-link", href "https://japaninsider.typeform.com/to/PXWmex", target "_blank" ]
                    [ text "日本電商代營運" ]
                ]
            ]
        ]



-- TODO : partner


viewSectionMedia : Model -> Html Msg
viewSectionMedia { mediaList } =
    section [ id "media" ]
        [ h3 [ class "section-title" ] [ text "媒體報導" ]
        , div [ class "media-container" ]
            (List.map viewMedia mediaList)
        ]


viewMedia : String -> Html Msg
viewMedia imgName =
    let
        imgSrc =
            append assetPath imgName

        imgAlt =
            imgName
    in
    figure [] [ img [ class "media-image", src imgSrc, alt imgAlt ] [] ]


viewFooter : Html Msg
viewFooter =
    footer [] [ figure [] [ img [ class "media-image", src "img/logo.svg", alt "logo" ] [] ] ]


view : Model -> Document Msg
view model =
    { title = "日本インサイド"
    , body =
        [ viewHeader model
        , viewMailBtn
        , viewSectionTop
        , viewSectionIntroduction
        , viewSectionService model
        , viewSectionPromotion
        , viewSectionTeamIntroduction
        , viewSectionMarketDev
        , viewSectionMedia model
        , viewFooter
        ]
    }


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }
