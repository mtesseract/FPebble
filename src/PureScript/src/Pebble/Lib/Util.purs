-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.Lib.Util where

import Control.Monad.Eff (Eff)
import Pebble.UI.Element
import Pebble.Types
import Data.List (List)
import Data.Foldable (Foldable, traverse_)
import Data.Monoid
import Pebble.Internal
import  Prelude (class Semigroup)

set :: forall a eff. ElementClass a => a -> PebbleSetter a eff -> Eff (pebble :: PEBBLE | eff) Unit
set a (PebbleSetter setter) = setter a

setProp :: forall a b eff. (b -> Setter a eff) -> b -> PebbleSetter a eff
setProp setter value = PebbleSetter (setter value)

infixl 9 setProp as :=
