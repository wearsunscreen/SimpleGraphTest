module Main exposing (..)

import Html
import List
import Set
import SimpleGraph exposing (Graph, findPaths)


main =
    Html.text
        <| case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length
        <| List.filter ((==) False)
            [ List.sort (findPaths 'c' 'b' graph80) == [ [ 'c', 'b' ], [ 'c', 'f', 'b' ] ]
            , List.sort (findPaths 'k' 'c' graph80) == [ [ 'k', 'f', 'b', 'c' ], [ 'k', 'f', 'c' ] ]
            , List.sort (findPaths 'x' 'y' graph80) == []
            , List.sort (findPaths 'c' 'y' graph80) == []
            , List.sort (findPaths 'y' 'c' graph80) == []
            , List.sort (findPaths 'f' 'h' graph80b)
                == [ [ 'f', 'b', 'g', 'h' ]
                   , [ 'f', 'c', 'b', 'g', 'h' ]
                   , [ 'f', 'g', 'h' ]
                   ]
            ]


graph80 =
    ( [ 'b', 'c', 'd', 'f', 'g', 'h', 'k' ]
    , [ ( 'b', 'c' ), ( 'b', 'f' ), ( 'c', 'f' ), ( 'f', 'k' ), ( 'g', 'h' ) ]
    )


graph80b =
    ( [ 'b', 'c', 'd', 'f', 'g', 'h', 'k' ]
    , [ ( 'b', 'c' ), ( 'b', 'f' ), ( 'b', 'g' ), ( 'c', 'f' ), ( 'f', 'g' ), ( 'f', 'k' ), ( 'g', 'h' ) ]
    )
