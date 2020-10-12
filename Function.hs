module Function where

import qualified Data.Sequence as Sequence
import Data.Sequence (Seq)

intersperse ∷ α → Seq α → Seq α
intersperse x xs = Sequence.fromFunction (Sequence.length xs * 2 - 1) f
  where f k | even k = Sequence.index xs (k `div` 2) | odd k = x
