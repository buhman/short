module View exposing (..)

import Html exposing (..)
import Models exposing (Model, Short)
import Messages exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ shortList model.shorts
        , text model.error
        ]


shortList : List Short -> Html Msg
shortList (shorts) =
    table []
        [ shortListHeader
        , shortListBody shorts
        ]


shortListHeader : Html Msg
shortListHeader =
    thead []
        [ tr []
              [ td [] [ text "id" ]
              , td [] [ text "href"]
              , td [] [ text "actions"]
              ]
        ]


shortListBody : List Short -> Html Msg
shortListBody (shorts) =
    tbody []
        (List.map shortListItem shorts)


shortListItem : Short -> Html Msg
shortListItem (short) =
    tr []
        [ td [] [ text short.id ]
        , td [] [ text short.href ]
        ]
