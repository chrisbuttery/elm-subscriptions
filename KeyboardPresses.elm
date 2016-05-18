import Html exposing (Html, text, div)
import Html.App as Html
import Keyboard exposing (..)
import Char exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Char

init : (Model, Cmd Msg)
init =
  (' ', Cmd.none)

-- UPDATE

type Msg
  = Presses Int

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Presses code ->
      (fromCode code, Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Keyboard.presses (\code -> Presses code)

-- VIEW

view: Model -> Html Msg
view model =
  let
    str =
      if model == ' '
      then "Press a key"
      else "You pressed: " ++ (toString model)
  in
    Html.text str
