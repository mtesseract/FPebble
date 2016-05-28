-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.UI.Window 
    ( Window
    , class WindowClass
    , show
    , hide
    , newWindow
    , windowAdd
    , setBackgroundColor
    , backgroundColor
    , setColor
    , color
    , setTitle
    , title
    ) where

import Control.Monad.Eff (Eff)
import Pebble.Internal
import Pebble.Types
import Pebble.Lib.Emitter
import Pebble.UI.Element

foreign import data Window :: *

class WindowClass a

foreign import _show :: forall e w. WindowClass w => w -> Eff (pebble :: PEBBLE | e) Unit
foreign import _hide :: forall e w. WindowClass w => w -> Eff (pebble :: PEBBLE | e) Unit
foreign import _windowAdd :: forall w eff element. (WindowClass w, ElementClass element) =>
                             w -> element -> Eff (pebble :: PEBBLE | eff) Unit

instance windowClassWindow :: WindowClass Window
instance elementClassWindow :: ElementClass Window

show :: forall a e. WindowClass a => a -> Eff (pebble :: PEBBLE | e) Unit
show = _show

hide :: forall a e. WindowClass a => a -> Eff (pebble :: PEBBLE | e) Unit
hide = _hide

windowAdd :: forall w eff element. (WindowClass w, ElementClass element) =>
             w -> element -> Eff (pebble :: PEBBLE | eff) Unit
windowAdd w e = _windowAdd w e

foreign import _newWindow :: forall eff. Eff (pebble :: PEBBLE | eff) Window

newWindow :: forall eff. Eff (pebble :: PEBBLE | eff) Window
newWindow = _newWindow

foreign import _setBackgroundColor :: forall a eff. WindowClass a =>
                                      a -> String -> Eff (pebble :: PEBBLE | eff) Unit

backgroundColor :: forall a eff. WindowClass a => String -> Setter a eff
backgroundColor s = (\ card -> _setBackgroundColor card s)

setBackgroundColor :: forall a eff. WindowClass a => String -> PebbleSetter a eff
setBackgroundColor s = PebbleSetter (backgroundColor s)

foreign import _setColor :: forall a eff. WindowClass a =>
                            a -> String -> Eff (pebble :: PEBBLE | eff) Unit

color :: forall a eff. WindowClass a => String -> Setter a eff
color s = (\ card -> _setColor card s)

setColor :: forall a eff. WindowClass a => String -> PebbleSetter a eff
setColor s = PebbleSetter (color s)

title :: forall a eff. WindowClass a => String -> Setter a eff
title s = (\ card -> _setTitle card s)

setTitle :: forall a eff. WindowClass a => String -> PebbleSetter a eff
setTitle s = PebbleSetter (title s)

foreign import _setTitle :: forall a eff. WindowClass a =>
                            a -> String -> Eff (pebble :: PEBBLE | eff) Unit
