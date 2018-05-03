module Main exposing (..)

import Html


(~=) : String -> String -> Bool
(~=) x y =
    (String.left 1 x) == (String.left 1 y)


main =
    "hello"
        ~= "hograth"
        |> toString
        |> Html.text
