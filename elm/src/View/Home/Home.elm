module View.Home.Home exposing (body)

import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Msg.Msg exposing (Msg)


body : Html Msg
body =
    Html.div
        [ class "mt-large"
        ]
        [ Html.div
            [ class "is-size-3-desktop is-size-4-touch mb-medium mt-large"
            ]
            [ Html.text "onde artistas vestem"
            ]
        , Html.div
            [ class "is-size-5-desktop is-size-6-touch"
            ]
            [ Html.div
                [ class "mb-small"
                ]
                [ Html.text "produtos em alta"
                ]
            ]
        , Html.div
            [ class "columns is-multiline is-size-8"
            ]
            [ product
            , product
            , product
            , product
            ]
        ]


product =
    Html.div
        [ class "column is-one-fourth is-product-1 has-font-3"
        , style "margin-right" "1rem"
        ]
        [ Html.div
            [ style "position" "absolute"
            , style "bottom" "0"
            ]
            [ Html.text "camiseta 101"
            ]
        , Html.div
            [ class "pr-xsmall"
            , style "position" "absolute"
            , style "bottom" "0"
            , style "right" "0"
            ]
            [ Html.text "R$ 90"
            ]
        ]
