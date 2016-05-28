-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.Internal ( module P
                       , module List
                       , unsafeObjectCast
                       ) where

import Prelude ( Unit
               , id
               , (<<<)
               , (>>>)
               , return
               , bind
               , unit
               ) as P

import Data.Foreign
import Data.List (List) as List

foreign import unsafeObjectCast :: forall a b. a -> b
