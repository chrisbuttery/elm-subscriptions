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

type alias Model = Mouse.Position

init =
  ((Mouse.Position 0 0) , Cmd.none )

-- UPDATE

type Msg
  = Click Mouse.Position

update msg model =
  case msg of
    Click xy ->
      (xy, Cmd.none )


-- SUBSCRIPTIONS

subscriptions model =
  Mouse.clicks Click
  
-- VIEW

view model =
  Html.text (toString model)
