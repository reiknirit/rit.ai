module Main where

import Prelude
import Data.Maybe               (Maybe(..))
import Effect                   (Effect)
import Effect.Aff               (Aff, launchAff_)
import Halogen                  as H
import Halogen.Aff              as HA
import Halogen.HTML             as HH
import Halogen.VDom.Driver      (runUI)
import Routing.Duplex           (parse)
import Routing.Hash             (matchesWith)

import AppM                     (Environment(..)
                                ,Env, runAppM)

import Api.Request              (BaseURL(..))
import Component.Router         as Router
import Data.Route               (routeCodec)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody

  let 
    baseUrl = BaseURL "http://localhost:8080"
    logLevel = Development
  
    environment :: Env
    environment = { logLevel, baseUrl }

    rootComponent :: H.Component HH.HTML Router.Query Unit Void Aff
    rootComponent = H.hoist (runAppM environment) Router.component

  halogenIO <- runUI rootComponent unit body

  void $ H.liftEffect $ matchesWith (parse routeCodec) \old new ->
    when (old /= Just new) do
      launchAff_ $ halogenIO.query $ H.tell $ Router.Navigate new
  
  pure unit