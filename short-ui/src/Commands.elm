module Commands exposing (..)

import Http
import Json.Decode
import Models exposing (Short, ContainerModel)
import Messages exposing (Msg(..))


decodeCollection : Json.Decode.Decoder ContainerModel
decodeCollection =
    Json.Decode.map
        ContainerModel
            (Json.Decode.field "data" shortsDecoder)


shortsDecoder : Json.Decode.Decoder (List Short)
shortsDecoder =
    Json.Decode.list shortDecoder


shortDecoder : Json.Decode.Decoder Short
shortDecoder =
    Json.Decode.map2 Short
        (Json.Decode.field "id" Json.Decode.string)
        (Json.Decode.field "href" Json.Decode.string)


listShorts : Cmd Msg
listShorts =
    let
        url =
            "http://localhost:4000/api/urls"

        request =
            Http.get url decodeCollection
    in
        Http.send ListAllDone request
