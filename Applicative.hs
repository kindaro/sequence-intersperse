module Applicative where

import Control.Applicative.Unicode
import qualified Data.Sequence as Sequence
import Data.Sequence (Seq, ViewR (EmptyR, (:>)))
import Data.Function

intersperse ∷ α → Seq α → Seq α
intersperse x xs = case Sequence.viewr (pure (&) ⊛ xs ⊛ Sequence.fromList [id, const x]) of
  EmptyR → Sequence.empty
  ys :> y → ys
