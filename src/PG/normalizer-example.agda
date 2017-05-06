module PG.normalizer-example where

open import Data.Nat hiding (_+_; _*_)
open import Data.Nat.Properties
open import Relation.Binary
open import PG.Formula
import PG.Normalizer
import PG.Normalizer-correct
module N = PG.Normalizer (ℕ)

module NC = PG.Normalizer-correct (ℕ)

x = N.fromNF (N.normalize ((var 0 + var 1) * (var 2 + var 3)))
