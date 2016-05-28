-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.UI.Text ( Text
                      , Font(..)
                      , class TextClass
                      , newText
                      , textPosition
                      , setTextPosition
                      , textSize
                      , setTextSize
                      , textFont
                      , setTextFont
                      , textText
                      , setTextText
                      ) where

import Control.Monad.Eff (Eff)
import Data.Foreign
import Pebble.Internal
import Pebble.Types
import Pebble.UI.Element
import Pebble.Lib.Emitter

foreign import data Text :: *

data Font = FontGothic18Bold

fontToName :: Font -> String
fontToName f =
    case f of
      FontGothic18Bold -> "gothic-18-bold"

foreign import _newText :: forall e. Eff (pebble :: PEBBLE | e) Text

foreign import _setPosition :: forall a eff. TextClass a =>
                               a -> {x :: Int, y :: Int} -> Eff (pebble :: PEBBLE | eff) Unit
foreign import _setSize :: forall a eff. TextClass a =>
                           a -> {x :: Int, y :: Int} -> Eff (pebble :: PEBBLE | eff) Unit
foreign import _setFont :: forall a eff. TextClass a =>
                           a -> String -> Eff (pebble :: PEBBLE | eff) Unit
foreign import _setText :: forall a eff. TextClass a =>
                           a -> String -> Eff (pebble :: PEBBLE | eff) Unit

newText :: forall e. Eff (pebble :: PEBBLE | e) Text
newText = _newText

class TextClass a

instance elementClassText :: ElementClass Text
instance emitterClassText :: EmitterClass Text
instance textClassText :: TextClass Text

textPosition :: forall a eff. TextClass a => {x :: Int, y :: Int} -> Setter a eff
textPosition s = (\ card -> _setPosition card s)

setTextPosition :: forall a eff. TextClass a => {x :: Int, y :: Int} -> PebbleSetter a eff
setTextPosition s = PebbleSetter (textPosition s)

textSize :: forall a eff. TextClass a => {x :: Int, y :: Int} -> Setter a eff
textSize s = (\ card -> _setSize card s)

setTextSize :: forall a eff. TextClass a => {x :: Int, y :: Int} -> PebbleSetter a eff
setTextSize s = PebbleSetter (textSize s)

textFont :: forall a eff. TextClass a => Font -> Setter a eff
textFont s = (\ card -> _setFont card (fontToName s))

setTextFont :: forall a eff. TextClass a => Font -> PebbleSetter a eff
setTextFont s = PebbleSetter (textFont s)

textText :: forall a eff. TextClass a => String -> Setter a eff
textText s = (\ card -> _setText card s)

setTextText :: forall a eff. TextClass a => String -> PebbleSetter a eff
setTextText s = PebbleSetter (textText s)
