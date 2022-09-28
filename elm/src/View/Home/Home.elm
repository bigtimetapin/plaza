module View.Home.Home exposing (body)

import Html exposing (Html)
import Html.Attributes exposing (class)
import Msg.Msg exposing (Msg)


body : Html Msg
body =
    Html.div
        []
        [ Html.div
            [ class "has-font-2"
            ]
            [ Html.text "Home"
            ]
        ]
