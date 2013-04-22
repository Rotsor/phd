open import Relation.Binary

module PG.Simplifier (A : Set) (_<_ : A → A → Set) (_~_ : A → A → Set) (a-is-STO : IsStrictTotalOrder _~_ _<_) where

open import Data.List
open import Data.Sum
open import Function

SumOfProduct : Set → Set
SumOfProduct = List ∘ List

data NF (A : Set) : Set where
  prim : A → SemiNF A
  sumProd : SumOfProduct (SemiNF A) → SemiNF A

simplifySemiNF : SemiNF A → 

--simplify : PGFormula A → 