import Html exposing (Html, text, div)
import Html.App as Html
import Keyboard exposing (KeyCode)
import Char exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  { x: Int
  , y: Int
  , start: Bool
  }

model =
  { x = 0
  , y = 0
  , start = False
  }

init : (Model, Cmd Msg)
init =
  (model, Cmd.none)

-- UPDATE

type Msg
  = KeyDown Keyboard.KeyCode

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    KeyDown keyCode ->
      if model.start == False then
        ({model | start = True }, Cmd.none)
      else if keyCode == 37 then
        ({model | x = model.x - 1 }, Cmd.none)
      else if keyCode == 39 then
        ({model | x = model.x + 1 }, Cmd.none)
      else if keyCode == 38 then
        ({model | y = model.y + 1 }, Cmd.none)
      else if keyCode == 40 then
        ({model | y = model.y - 1 }, Cmd.none)
      else
        (model, Cmd.none)

type Key
  = Space
  | ArrowUp
  | ArrowDown
  | ArrowLeft
  | ArrowRight
  | Unknown


fromCode : Int -> Key
fromCode keyCode =
  case keyCode of
    32 ->
      Space

    38 ->
      ArrowUp

    40 ->
      ArrowDown

    37 ->
      ArrowLeft

    39 ->
      ArrowRight

    _ ->
      Unknown

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Keyboard.downs KeyDown

-- VIEW

view: Model -> Html Msg
view model =
  let
    str =
      if model.start == False
      then "Press arrow buttons"
      else "{x: " ++ toString (model.x) ++ ", y: " ++ toString (model.y) ++ "}"
  in
    Html.text str
