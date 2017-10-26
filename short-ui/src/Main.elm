module Main exposing (..)

import Html exposing (Html)
import Models exposing (Model, Short)
import Messages exposing (Msg)
import Update exposing (update)
import View exposing (view)
import Commands exposing (listShorts)


main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }


init : ( Model, Cmd Msg )
init =
    let
        model =
            Model [ Short "foo" "bar"
                  , Short "spam" "eggs"
                  ]
                  ""

        cmds =
            listShorts

    in
        ( model, cmds )
