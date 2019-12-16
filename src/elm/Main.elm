module Main exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Ui.Templates exposing (mainTemplate)




-- MAIN
main =
  Browser.sandbox
    { init = init
    , update = update
    , view = view
    }



-- MODEL
type alias Model =
  Int


init : Model
init =
  0



-- UPDATE
type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW
view : Model -> Html Msg
view model = mainTemplate
  (Just <| div [] [ text "header"])
  Nothing
  (div [] [ text "content"])


