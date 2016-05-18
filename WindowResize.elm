import Html exposing (Html, text, div)
import Html.App as Html
import Window exposing (..)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model = {
  height: Int
  , width : Int
}

initialModel: Model
initialModel =
  { height = 0
  , width = 0
  }

init : (Model, Cmd Msg)
init =
  (initialModel, Cmd.none)

-- UPDATE

type Msg
  = Resize Int Int

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Resize h w ->
      ({model | height = h, width = w} , Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Window.resizes (\{height, width} -> Resize height width)

-- VIEW

view: Model -> Html Msg
view model =
  let
    str =
      if model.height == 0 && model.width == 0 then
        "Resize the window"
      else
        toString model
  in
    Html.text str
