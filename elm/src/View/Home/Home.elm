module View.Home.Home exposing (body)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Msg.Msg exposing (Msg)


body : Html Msg
body =
    Html.div
        []
        [ Html.div
            [ class "is-size-2 mb-medium"
            ]
            [ Html.text "onde artistas vestem"
            ]
        , Html.div
            [ class "is-size-3"
            ]
            [ Html.div
                [ class "mb-small"
                ]
                [ Html.text "produtos em alta"
                ]
            , Html.div
                []
                [ Html.text "box"
                ]
            ]
        ]
