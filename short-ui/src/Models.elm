module Models exposing (..)

import Messages exposing (Msg)


type alias Model =
    {
    }


init : ( Model, Cmd Msg )
init =
    let
        model =
            {}

        cmds =
            Cmd.none

    in
        ( model, cmds )
