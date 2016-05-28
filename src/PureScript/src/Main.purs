-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Main where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Pebble
import Prelude (Unit, unit, bind, return)

main :: forall e. Eff (console :: CONSOLE, pebble :: PEBBLE | e) Unit
main = do
  log "Hello sailor!"
  card <- newCard
  set card (title := "What's this?" <>
            subtitle := "It's PureScript!" <>
            body := "Not much to see here (yet)" <>
            backgroundColor := "#00FF00" <>
            icon := "images/purescript_icon.png")

  on card buttonUp (do log "Up!"
                       w <- newWindow
                       t <- newText { position: { x:  10, y:  70 }
                                    , size:     { x: 144, y: 168 }
                                    , font: FontGothic18Bold
                                    , text: "Shalom" }
                       windowAdd w t
                       show w)
  on card buttonSelect (log "Select!")
  on card buttonDown (log "Down!")
  on card buttonBack (log "Back!")
  show card
