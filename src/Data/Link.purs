module Data.Link where

import Data.Maybe   (Maybe(..))

import Data.Route   (Route)

-- | Link datatype
--   Represents external and internal (safe) links
data Link = ExternalLink String String
          | SafeLink     Route  String
