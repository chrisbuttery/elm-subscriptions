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

type alias Model = {
  x: Int
  , y : Int
}

initialModel: Model
initialModel =
  { x = 0
  , y = 0
  }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

-- UPDATE

type Msg
  = Position Int Int

update: Msg -> Model -> (Model, Cmd a)
update msg model =
  case msg of
    Position x y ->
      ({model | x = x, y = y} , Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Mouse.moves (\{x, y} -> Position x y)

-- VIEW

view: Model -> Html a
view model =
  Html.text (toString model)
