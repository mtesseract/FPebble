-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.Lib.Emitter ( Emitter
                          , class EmitterClass
                          , Signal(..)
                          , on
                          , buttonUp
                          , buttonSelect
                          , buttonDown
                          , buttonBack
                          ) where

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
import Pebble.Internal
import Pebble.Types
        
foreign import data Emitter :: *

class EmitterClass a

newtype Signal object handler eff0 = Signal (object -> handler -> Eff (pebble :: PEBBLE | eff0) Unit)

on :: forall obj cb eff0. obj -> Signal obj cb eff0 -> cb -> Eff (pebble :: PEBBLE | eff0) Unit
on obj (Signal connect) cb = connect obj cb

buttonUp :: forall eff0 eff1 emitter. EmitterClass emitter => Signal emitter (Eff eff1 Unit) eff0
buttonUp = Signal (connect_2_0 "click" "up")

buttonSelect :: forall eff0 eff1 emitter. EmitterClass emitter => Signal emitter (Eff eff1 Unit) eff0
buttonSelect = Signal (connect_2_0 "click" "select")

buttonDown :: forall eff0 eff1 emitter. EmitterClass emitter => Signal emitter (Eff eff1 Unit) eff0
buttonDown = Signal (connect_2_0 "click" "down")

buttonBack :: forall eff0 eff1 emitter. EmitterClass emitter => Signal emitter (Eff eff1 Unit) eff0
buttonBack = Signal (connect_2_0 "click" "back")

connect_2_0 :: forall eff0 eff1 emitter. EmitterClass emitter =>
               String -> String -> emitter -> Eff eff1 Unit
            -> Eff (pebble :: PEBBLE | eff0) Unit
connect_2_0 s0 s1 e cb = _connect_2_0 e s0 s1 cb

foreign import _connect_2_0 :: forall eff0 eff1 emitter. EmitterClass emitter =>
                               emitter -> String -> String -> Eff eff1 Unit
                            -> Eff (pebble :: PEBBLE | eff0) Unit

instance emitterClassEmitter :: EmitterClass Emitter
