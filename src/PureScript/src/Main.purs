-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Main where

import Control.Monad.Eff (Eff)
import Prelude (Unit, bind, return, ($))
import Pebble

main :: forall e. Eff (pebble :: PEBBLE | e) Unit
main = do
  card <- newCard
  set card (title           := "What's this?"               <>
            subtitle        := "It's PureScript!"           <>
            body            := "Not much to see here (yet)" <>
            backgroundColor := "#00FF00"                    <>
            icon            := "images/purescript_icon.png")

  on card buttonUp (do win <- newWindow
                       set win (backgroundColor := "#0000FF")
                       text <- newText
                       set text (textPosition := { x:  20, y:  75 } <>
                                 textSize     := { x: 144, y: 168 } <>
                                 textFont     := FontGothic18Bold   <>
                                 textText     := "Shalom")
                       windowAdd win text
                       show win)
  show card
