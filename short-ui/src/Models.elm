module Models exposing (..)


type alias Model =
    { shorts : List Short
    , error : String
    }

type alias Short =
    { id : String
    , href : String
    }

type alias ContainerModel =
    { data : List Short }
