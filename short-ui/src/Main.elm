module Main exposing (..)

import Html exposing (Html)
import Models exposing (init, Model)
import Messages exposing (Msg)
import Update exposing (update)
import View exposing (view)


main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
