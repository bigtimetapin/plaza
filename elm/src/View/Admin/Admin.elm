module View.Admin.Admin exposing (body)

import Html exposing (Html)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Model.Admin exposing (Admin(..))
import Model.Wallet exposing (Wallet)
import Msg.Admin as AdminMsg
import Msg.Msg exposing (Msg(..))
import View.Generic.Wallet


body : Admin -> Html Msg
body admin =
    let
        html =
            case admin of
                Top ->
                    Html.div
                        [ class "has-border-2 px-2 pt-2 pb-6 pb-6"
                        ]
                        [ Html.button
                            [ class "is-button-1"
                            , onClick <| FromAdmin <| AdminMsg.Connect
                            , style "float" "right"
                            ]
                            [ Html.text "Connect"
                            ]
                        ]

                WaitingForWallet ->
                    Html.div
                        [ class "has-border-2 px-2 pt-2 pb-6"
                        ]
                        [ Html.div
                            [ class "my-2 is-loading"
                            ]
                            []
                        ]

                HasWallet wallet ->
                    case wallet == boss of
                        True ->
                            Html.div
                                [ class "has-border-2 px-2 pt-2 pb-6 pb-6"
                                ]
                                [ View.Generic.Wallet.view wallet
                                ]

                        False ->
                            Html.div
                                [ class "has-border-2 px-2 pt-2 pb-6 pb-6"
                                ]
                                [ Html.text "unauthorized;"
                                ]
    in
    Html.div
        [ class "container"
        ]
        [ html
        ]


boss : Wallet
boss =
    "DEuG4JnzvMVxMFPoBVvf2GH38mn3ybunMxtfmVU3ms86"
