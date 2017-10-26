module Update exposing (..)

import Models exposing (Model)
import Messages exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)
