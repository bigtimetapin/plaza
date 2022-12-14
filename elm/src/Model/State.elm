module Model.State exposing (State(..), href, parse)

import Html
import Html.Attributes
import Model.Admin as Administrator exposing (Admin)
import Model.Creator as Creator exposing (Creator)
import Url
import Url.Parser as UrlParser exposing ((</>))


type State
    = Create Creator
    | Admin Admin
    | Home
    | Error String


urlParser : UrlParser.Parser (State -> c) c
urlParser =
    UrlParser.oneOf
        [ UrlParser.map Home UrlParser.top
        , UrlParser.map Home (UrlParser.s "home")
        , UrlParser.map (Create Creator.Top) (UrlParser.s "creator")
        , UrlParser.map (Admin Administrator.Top) (UrlParser.s "admin")
        ]


parse : Url.Url -> State
parse url =
    let
        target =
            -- The RealWorld spec treats the fragment like a path.
            -- This makes it *literally* the path, so we can proceed
            -- with parsing as if it had been a normal path all along.
            { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
    in
    case UrlParser.parse urlParser target of
        Just state ->
            state

        Nothing ->
            Error "404; Invalid Path"


path : State -> String
path state =
    case state of
        Admin _ ->
            "#/admin"

        Create _ ->
            "#/creator"

        Home ->
            "#/home"

        Error _ ->
            "#/invalid"


href : State -> Html.Attribute msg
href state =
    Html.Attributes.href (path state)
