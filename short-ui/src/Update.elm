module Update exposing (..)

import Models exposing (Model, Short)
import Messages exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ListAllDone (Ok response) ->
            ({ model | shorts = response.data }, Cmd.none)
        ListAllDone (Err error) ->
            ({ model | error = toString error }, Cmd.none)
