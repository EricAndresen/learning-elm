module Main exposing (..)

import Html


type alias Item =
    { name : String
    , qty : Int
    , freeQty : Int
    }


cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


bogo : Int -> Int -> Item -> Item
bogo minQty numFree item =
    if item.qty >= minQty then
        { item
            | freeQty = item.freeQty + numFree
        }
    else
        item


newCart : List Item
newCart =
    cart
        |> List.map ((bogo 5 1) >> (bogo 10 3))


main : Html.Html msg
main =
    Html.text (toString newCart)
