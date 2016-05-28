-- Copyright 2016 Moritz Schulte <mtesseract@silverratio.net>
-- License: BSD3.

module Pebble.UI.Text ( Text
                      , Font(..)
                      , newText
                      ) where

import Control.Monad.Eff (Eff)
import Data.Foreign
import Pebble.Internal
import Pebble.Types
import Pebble.UI.Element

foreign import data Text :: *

data Font = FontGothic18Bold

fontToName :: Font -> String
fontToName f =
    case f of
      FontGothic18Bold -> "gothic-18-bold"

foreign import _newText :: forall e. { position :: {x :: Int, y :: Int}
                                     , size :: {x :: Int, y :: Int}
                                     , font :: String
                                     , text :: String }
                        -> Eff (pebble :: PEBBLE | e) Text

newText :: forall e. { position :: {x :: Int, y :: Int}
                     , size :: {x :: Int, y :: Int}
                     , font :: Font
                     , text :: String }
        -> Eff (pebble :: PEBBLE | e) Text
newText textSpec =
    _newText { position: textSpec.position
             , size: textSpec.size
             , font: fontToName textSpec.font
             , text: textSpec.text
             }

instance elementClassText :: ElementClass Text
