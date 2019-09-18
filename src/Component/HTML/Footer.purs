module Component.HTML.Footer where

import Halogen.HTML             as HH
import Halogen.HTML.Properties  as HP

import Component.HTML.Utils     (css)

footer :: forall i p. HH.HTML i p
footer = 
  HH.div
    [ css "footer" ]
    [ HH.ul
      [ css "items" ]
      [ HH.li 
        [ css "item" ]
        [ HH.i
          [ css "fas fa-phone" ]
          []
        , HH.text "Sími: 6182195" 
        ]
      ]
    ]
