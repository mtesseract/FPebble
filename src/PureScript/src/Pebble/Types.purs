-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.Types ( PEBBLE
                    , Pebble
                    , Setter
                    , PebbleSetter(..)
                    ) where

import Control.Monad.Eff (Eff)

import Data.Monoid
import Pebble.Internal
import Prelude (class Semigroup)

foreign import data PEBBLE :: !

type Pebble eff a = Eff (pebble :: PEBBLE | eff) a

type Setter a eff = a -> Eff (pebble :: PEBBLE | eff) Unit

data PebbleSetter a eff = PebbleSetter (Setter a eff)

instance semigroupPebbleSetter :: Semigroup (PebbleSetter a eff) where
  append (PebbleSetter f) (PebbleSetter g) =
       PebbleSetter (\ x -> do f x
                               g x)

instance monoidPebbleSetter :: Monoid (PebbleSetter a eff) where
    mempty = PebbleSetter (\ _ -> return unit)

