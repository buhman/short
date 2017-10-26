module View exposing (..)

import Html exposing (..)
import Models exposing (Model, ShortList)
import Messages exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ shortList model.shorts
        ]


shortList : (ShortList) -> Html Msg
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


shortListBody : (ShortList) -> Html Msg
shortListBody (shorts) =
    tbody []
        (List.map shortListItem shorts)


shortListItem : (String) -> Html Msg
shortListItem (item) =
    tr []
        [ td [] [ text item ]
        ]