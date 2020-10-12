module Main where

import Prelude.Unicode
import Data.Foldable
import qualified Function
import qualified Applicative
import Data.Sequence (Seq)
import qualified Data.Sequence as Sequence
import qualified Data.List as List
import Data.Char
import GHC.Exts (fromList, IsList, Item)

n = 2^20

printableCharacters = filter isPrint [minBound.. maxBound]

xs = (take n ∘ cycle) printableCharacters

data Benchmark = forall f. (IsList (f Char), Functor f, Foldable f, Item (f Char) ~ Char) ⇒ Benchmark (f Char → f Char)

force ∷ (Foldable f, Functor f) ⇒ f Char → IO ( )
force = (print ∘ sum ∘ fmap ord)

main = do
  traverse_ benchmark
    [Benchmark (id @[Char])
    , Benchmark (id @(Seq Char))
    , Benchmark stock
    , Benchmark function
    , Benchmark applicative
    , Benchmark list
    ]

benchmark ∷ Benchmark → IO ( )
benchmark (Benchmark f) = force $ (f ∘ fromList) xs
{-# inline benchmark #-}

applicative = Applicative.intersperse '\NUL'

function = Function.intersperse '\NUL'

stock = Sequence.intersperse '\NUL'

list = List.intersperse '\NUL'
