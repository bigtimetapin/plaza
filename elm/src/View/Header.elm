module View.Header exposing (view)

import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Model.Model exposing (Model)
import Model.State as State exposing (State(..))
import Msg.Msg exposing (Msg(..))


view : Model -> Html Msg
view model =
    let
        tab_ : Args -> Html Msg
        tab_ =
            tab model
    in
    Html.div
        [ class "is-navbar has-font-1"
        ]
        [ Html.nav
            [ class "level mx-6 my-3"
            ]
            [ Html.div
                [ class "level-left"
                ]
                [ Html.div
                    [ class "level-item"
                    ]
                    [ Html.div
                        [ class "is-size-1"
                        ]
                        [ Html.text "Plaza"
                        ]
                    ]
                ]
            , Html.div
                [ class "level-right has-font-3 is-size-3"
                ]
                [ Html.div
                    [ class "level-item pr-6"
                    ]
                    [ Html.div
                        [ class "is-search-bar-1"
                        ]
                        [ Html.div
                            [ class "has-dark-gray-text ml-2"
                            ]
                            [ Html.text "buscar artista"
                            ]
                        ]
                    ]
                , Html.div
                    [ class "level-item pr-6"
                    ]
                    [ Html.text "quero vender"
                    ]
                , Html.div
                    [ class "level-item pr-6"
                    ]
                    [ Html.text "registre-se"
                    ]
                , Html.div
                    [ class "level-item"
                    ]
                    [ Html.text "carrinho"
                    ]
                ]
            ]
        ]


type alias Args =
    { state : State
    , title : String
    , msg : Msg
    }


tab : Model -> Args -> Html Msg
tab model args =
    Html.div
        [ style "float" "left"
        ]
        [ Html.a
            [ State.href args.state
            , onClick args.msg
            ]
            [ Html.button
                [ class (String.join " " [ "has-font-1", "is-button-1", isActive model args.state ])
                ]
                [ Html.text args.title
                ]
            ]
        ]


isActive : Model -> State -> String
isActive model state =
    let
        class_ =
            "is-active-header-tab"
    in
    case state of
        Create _ ->
            case model.state of
                Create _ ->
                    class_

                _ ->
                    ""

        Admin _ ->
            ""

        Home ->
            ""

        Error _ ->
            ""
