-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.UI.Card ( Card
                      , class CardClass
                      , newCard
                      , setSubtitle
                      , setBody
                      , setIcon
                      , subtitle
                      , body
                      , icon
                      , setSubtitle
                      , setIcon
                      , setBody
                      ) where

import Prelude
import Control.Monad.Eff (Eff)
import Data.Foreign
import Pebble.Internal
import Pebble.Types
import Pebble.UI.Window
import Pebble.UI.Element
import Pebble.Lib.Emitter
import Pebble.Lib.Util
import Data.List
import Data.Monoid

foreign import data Card :: *

newCard :: forall eff. Pebble eff Card
newCard = do
  card <- _newCard
  return card

foreign import _newCard  :: forall eff. Eff (pebble :: PEBBLE | eff) Card

foreign import _setSubtitle :: forall a eff. CardClass a =>
                               a -> String -> Eff (pebble :: PEBBLE | eff) Unit
foreign import _setIcon :: forall a eff. CardClass a =>
                           a -> String -> Eff (pebble :: PEBBLE | eff) Unit
foreign import _setBody :: forall a eff. CardClass a =>
                           a -> String -> Eff (pebble :: PEBBLE | eff) Unit

body :: forall a eff. CardClass a => String -> Setter a eff
body s = (\ card -> _setBody card s)

setBody :: forall a eff. CardClass a => String -> PebbleSetter a eff
setBody s = PebbleSetter (body s)

subtitle :: forall a eff. CardClass a => String -> Setter a eff
subtitle s = (\ card -> _setSubtitle card s)

setSubtitle :: forall a eff. CardClass a => String -> PebbleSetter a eff
setSubtitle s = PebbleSetter $ (subtitle s)

icon :: forall a eff. CardClass a => String -> Setter a eff
icon s = (\ card -> _setIcon card s)

setIcon :: forall a eff. CardClass a => String -> PebbleSetter a eff
setIcon s = PebbleSetter $ (icon s)

instance elementClassCard :: ElementClass Card

instance windowClassCard :: WindowClass Card

instance emitterClassCard :: EmitterClass Card

class CardClass a

instance cardClass :: CardClass Card
