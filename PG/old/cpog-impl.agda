
open import Relation.Binary
open import Relation.Binary.PropositionalEquality using (_≡_)
open import Level renaming (zero to ₀)

module cpog-impl where

module Impl
   (X A : Set)
   (_<_ : A → A → Set) 
   (a-order : IsStrictTotalOrder _≡_ _<_) where

 open import Data.Product
 open import Data.Sum
 open import Data.List hiding(or; and)
 import BooleanFormula as BF
 open BF X

 import Data.AVL

 import Ordering
 open Ordering.Sum
 open Ordering.Product

 Node = A ⊎ A × A

 open import Function.Equivalence

 AxA-order = a-order ×-isStrictTotalOrder a-order
 Node-order = a-order ⊎-isStrictTotalOrder AxA-order

 module AVL = Data.AVL (λ _ → Formula) Node-order
 open AVL public using (empty; toList; lookup; insert) renaming (Tree to Φ)

 open import Data.Maybe

 insertWith : (f : Formula → Formula → Formula) → (Node × Formula) → Φ → Φ
 insertWith f (k , v) t = insert k (maybe′ (f v) v (lookup k t)) t

 _+_ : Φ → Φ → Φ
 a + b = foldr (insertWith _or_) b (toList a)

{-module Example where
 open import Data.Nat
 import Data.Nat.Properties as NP
 open import Relation.Binary
 open Impl ℕ ℕ _<_ (StrictTotalOrder.isStrictTotalOrder NP.strictTotalOrder)
 φ₀ : Φ
 φ₀ = empty -}
