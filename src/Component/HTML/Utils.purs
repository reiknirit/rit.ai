module Component.HTML.Utils where

import Prelude
import Data.Maybe               (Maybe(..))
import Halogen.HTML             as HH
import Halogen.HTML.Properties  as HP
import Routing.Duplex           (print)

import Data.Route               (Route, routeCodec)

css :: forall r i. String 
    -> HH.IProp ( class :: String | r ) i
css = HP.class_ <<< HH.ClassName

classes_ :: forall p i. Array String 
         -> HH.IProp (class :: String | i) p
classes_ = HP.classes 
         <<< map HH.ClassName

whenElem :: forall p i. Boolean 
         -> (Unit -> HH.HTML p i) 
         -> HH.HTML p i
whenElem cond f = if cond then f unit else HH.text ""

safeHref :: forall r i. Route 
         -> HH.IProp ( href :: String | r) i
safeHref = HP.href 
         <<< append "#" 
         <<< print routeCodec

maybeElem :: forall p i a. Maybe a -> (a -> HH.HTML p i) -> HH.HTML p i
maybeElem (Just x) f = f x
maybeElem _ _ = HH.text ""
