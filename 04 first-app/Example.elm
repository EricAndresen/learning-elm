module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { totalCalories : Int
    , inputCalories : Int
    }


initModel : Model
initModel =
    { totalCalories = 0
    , inputCalories = 0
    }


type Msg
    = AddCalorie
    | Clear
    | UpdateInputCalories String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model
                | totalCalories = model.totalCalories + model.inputCalories
            }

        Clear ->
            initModel

        UpdateInputCalories newContent ->
            { model
                | inputCalories = (Result.withDefault 0 (String.toInt newContent))
            }


view : Model -> Html Msg



-- view is a function that takes in the model


view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.totalCalories))
            ]
        , input
            [ type_ "text"
            , onInput UpdateInputCalories
            ]
            []
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]



-- events?


main =
    Html.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
