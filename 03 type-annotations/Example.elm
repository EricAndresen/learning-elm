module Main exposing (..)

import Html


type alias Item =
    { name : String
    , price : Float
    , qty : Int
    , discounted : Bool
    }


cart : List Item
cart =
    [ { name = "lemon", price = 0.5, qty = 1, discounted = False }
    , { name = "apple", price = 1.0, qty = 5, discounted = False }
    , { name = "lemon", price = 1.25, qty = 11, discounted = False }
    ]


discount : Int -> Float -> Item -> Item
discount minQty discountPercent item =
    if not item.discounted && item.qty >= minQty then
        { item
            | price = item.price * (1 - discountPercent)
            , discounted = True
        }
    else
        item


newCart : List Item
newCart =
    cart
        -- feed output form first function into second function
        |> List.map ((discount 10 0.3) >> (discount 5 0.1))


main =
    Html.text (toString newCart)
