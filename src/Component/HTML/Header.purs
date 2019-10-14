module Component.HTML.Header where

import Prelude
import Data.Maybe               (Maybe(..))
import Halogen.HTML             as HH
import Halogen.HTML.Properties  as HP

import Component.HTML.Utils     (css
                                ,safeHref
                                ,maybeElem)
import Data.Link                (Link(..))
import Data.Route               (Route(..))

data HeaderLink  = HeaderLink Link (Maybe String)
type HeaderLinks = Array HeaderLink

header :: forall i p
        . HeaderLinks
       -> HH.HTML i p
header links = 
  HH.div
    [ css "header" ]
    [ HH.div
      [ css "links" ]
      (links <#> renderLink)
    ]

  where
  renderLink :: forall i p 
              . HeaderLink
             -> HH.HTML i p
  renderLink link =
    HH.div
      [ css "link" ]
      [ case link of
        (HeaderLink (SafeLink r s) icon) -> 
          HH.a
            [(renderLink' (HeaderLink (SafeLink r s) icon))]
            (renderLinkChilds s icon)

        (HeaderLink (ExternalLink r s) icon) -> 
          HH.a
            [(renderLink' (HeaderLink (ExternalLink r s) icon))]
            (renderLinkChilds s icon)
      ]

    where
      renderLink' :: forall r i 
                   . HeaderLink 
                  -> HH.IProp ( href :: String | r ) i
      renderLink' link = 
        case link of 
          (HeaderLink (SafeLink     r s) icon) -> safeHref r
          (HeaderLink (ExternalLink r s) icon) -> HP.href  r

      renderLinkChilds :: forall i p
                        . String  
                       -> Maybe String
                       -> Array (HH.HTML i p)
      renderLinkChilds s icon = 
        [ maybeElem icon \ic -> 
          HH.i 
            [ css ic ]
            []
        , HH.text s
        ]

-- | The default header displayed on the page
defaultHeader :: forall i p. HH.HTML i p 
defaultHeader = header links 
  where
    links = 
      [ HeaderLink 
        (SafeLink Home "reiknirit" ) 
        Nothing
      -- 
      , HeaderLink 
        (ExternalLink "https://github.com/reiknirit" "Github")
        (Just "fab fa-github")
      --
      , HeaderLink
        (ExternalLink 
        "https://join.slack.com/t/fpis/shared_invite/enQtNTE0MTk3NzQ5NDc5LTQwZWZjMjllNjVlODBhYWUyMGQ3MDUzZjg0MzRlYzEwYzEyYzJjOTI4NzMyZTIzZTU3NjQ5OTNjYTkyMWNmYTM" 
        "Slack" )
        (Just "fab fa-slack")
      --
      , HeaderLink 
        (ExternalLink 
        "https://www.facebook.com/groups/reykjavikfp/" 
        "Facebook")
        (Just "fab fa-facebook")
      ]
