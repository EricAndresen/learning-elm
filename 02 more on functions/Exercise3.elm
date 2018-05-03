module Main exposing (..)

import Html


splitSentence : String -> List String
splitSentence sentence =
    String.words sentence


wordCount =
    String.words >> List.length


main =
    "Fox jumps over"
        |> wordCount
        |> toString
        |> Html.text
