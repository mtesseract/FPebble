-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.UI.Element ( Element
                         , class ElementClass
                      ) where

import Control.Monad.Eff (Eff)
import Data.Foreign
import Pebble.Internal
import Pebble.Types

foreign import data Element :: *

class ElementClass a

instance elementClass :: ElementClass Element
