module Messages exposing (..)

import Http
import Models exposing (Short, ContainerModel)


type Msg
    = ListAllDone (Result Http.Error (ContainerModel))
