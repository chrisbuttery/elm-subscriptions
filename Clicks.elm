import Html exposing (Html, text, div)
import Html.App as Html
import Mouse exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = Float

init : (Model, Cmd Msg)
init =
  (0, Cmd.none)

-- UPDATE

type Msg
  = Click

update msg model =
  case msg of
    Click ->
      (model + 1 , Cmd.none)

-- SUBSCRIPTIONS

subscriptions model =
  Mouse.clicks (\_ -> Click)

-- VIEW

view model =
  Html.text (toString model)
