{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ sources =
    [ "src/**/*.purs", "test/**/*.purs" ]
, name =
    "rit.ai"
, dependencies =
    [ "affjax"
    , "argonaut"
    , "css"
    , "console"
    , "datetime"
    , "dotenv"
    , "effect"
    , "express"
    , "halogen"
    , "halogen-formless"
    , "psci-support"
    , "routing"
    , "routing-duplex"
    , "strings"
    ]
, packages =
    ./packages.dhall
}
