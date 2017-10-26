module Models exposing (..)

import Messages exposing (Msg)


type alias Model =
    { shorts : List String
    }

type alias ShortList = List String


init : ( Model, Cmd Msg )
init =
    let
        model =
            Model ["foo", "bar"]

        cmds =
            Cmd.none

    in
        ( model, cmds )
