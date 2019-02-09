module Main exposing (init, view)

import Browser exposing (Document)
import Html exposing (Html, a, article, aside, div, em, figure, h2, h3, header, img, li, nav, p, section, text, ul)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Http
import Json.Decode exposing (Decoder, field, list, map2, map4, string)



-- MODEL


type alias Model =
    { navBarClassNames : List String
    , serviceContentList : List ServiceContent
    , serviceDetailList : List ServiceDetail
    , serviceIndex : Int
    , successCaseIndex : Int
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


type CarouselBehaviour
    = Next
    | Prev


type Msg
    = TOGGLE
    | GotServiceContentList (Result Http.Error (List ServiceContent))
    | GotServiceDetailList (Result Http.Error (List ServiceDetail))
    | Carousel CarouselUseCase CarouselBehaviour


init : () -> ( Model, Cmd Msg )
init _ =
    ( { navBarClassNames = []
      , serviceContentList = []
      , serviceDetailList = []
      , serviceIndex = 0
      , successCaseIndex = 0
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
        ]


viewServiceContent : ServiceContent -> Html Msg
viewServiceContent { imgSrc, imgAlt, title, description } =
    article [ class "three-grid-item" ]
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


view : Model -> Document Msg
view model =
    { title = "日本インサイド"
    , body =
        [ viewHeader model
        , viewMailBtn
        , viewSectionTop
        , viewSectionIntroduction
        , viewSectionService model
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
