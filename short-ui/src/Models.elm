module Models exposing (..)

import Messages exposing (Msg)


type alias Model =
    { shorts : ShortList
    }

type alias ShortList = List Short
type alias Short =
    { id : String
    , href : String
    }


init : ( Model, Cmd Msg )
init =
    let
        model =
            Model [ Short "foo" "bar"
                  , Short "spam" "eggs"]

        cmds =
            Cmd.none

    in
        ( model, cmds )
