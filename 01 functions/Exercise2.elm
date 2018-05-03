module Main exposing (..)

import Html


uppercase : String -> String
uppercase name =
    if String.length name > 10 then
        String.toUpper name
    else
        name


main =
    let
        name =
            "eric"
    in
        (uppercase name)
            ++ " length: "
            ++ toString (String.length name)
            |> Html.text
