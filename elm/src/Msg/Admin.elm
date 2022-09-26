module Msg.Admin exposing (FromAdmin(..), toString)


type FromAdmin
    = Connect


toString : FromAdmin -> String
toString admin =
    case admin of
        Connect ->
            "admin-connect"
