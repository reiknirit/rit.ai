module Page.Home where

import Prelude
import Data.Const                   (Const)
import Data.Maybe                   (Maybe(..))
import Data.Symbol                  (SProxy(..))
import Halogen                      as H
import Halogen.HTML                 as HH
import Halogen.HTML.Properties      as HP

import Component.HTML.Header        (defaultHeader)
import Component.HTML.Footer        (footer)
import Component.HTML.Utils         (css)
import Component.Utils              (OpaqueSlot)
import Data.Link                    (Link(..))
import Data.Route                   (Route(..))

type State = Maybe Int
data Action = NoAction

type ChildSlots = ()

component :: forall m. H.Component HH.HTML (Const Void) Unit Void m
component =
  H.mkComponent
    { initialState: const Nothing
    , render
    , eval: H.mkEval H.defaultEval
    }
  where

  render :: State -> H.ComponentHTML Action ChildSlots m
  render state =
    HH.div
      [ css "main-container" ]
      [ defaultHeader 
      , HH.div
        [ css "content" ]
        [ HH.div
          [ css "iframe-container" ]
          [ HH.iframe
            [ HP.src "https://calendar.google.com/calendar/embed?src=jaoemtr4v536qd567gi89agbug%40group.calendar.google.com&ctz=Atlantic%2FReykjavik"
            ]
          ]
        ]
      , footer
      ]
