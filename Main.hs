module Main where

import Prelude.Unicode
import qualified Function
import qualified Applicative
import qualified Data.Sequence as Sequence
import Data.Char

n = 2^22

main = do
  let xs = (Sequence.cycleTaking n ∘ Sequence.fromList ∘ filter isPrint) [minBound.. maxBound]
  (print ∘ sum ∘ fmap ord) xs
  {-# SCC function #-} (print ∘ sum ∘ fmap ord) (Function.intersperse '\NUL' xs)
  {-# SCC applicative #-} (print ∘ sum ∘ fmap ord) (Applicative.intersperse '\NUL' xs)
