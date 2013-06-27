module PG.Normalizer-test where

open import Data.Nat using (ℕ)
open import Data.Nat.Properties
open import Data.Bool
open import Data.Sum
open import Data.Product
open import Relation.Binary
open import Relation.Binary.PropositionalEquality
import PG.Normalizer

open PG.Normalizer ℕ Bool

open WithOrder (StrictTotalOrder.isStrictTotalOrder strictTotalOrder) using (normalize; toList)

open import PG.Formulae

open import Data.List using (_∷_; [])

norm1 : toList (normalize ε) ≡ []
norm1 = refl

norm2 : toList (normalize (var 8)) ≡ (inj₁ 8 , true) ∷ []
norm2 = refl

norm3 : toList (normalize (var 8 + (var 9 ⇾ var 8))) ≡ (inj₁ 8 , true or true) ∷ (inj₁ 9 , true) ∷ (inj₂ (9 , 8) , true and true) ∷ []
norm3 = refl

norm4 : toList (normalize (var 8 + (cond false (var 9) ⇾ var 8))) ≡ (inj₁ 8 , true or true) ∷ (inj₁ 9 , var false and true) ∷ (inj₂ (9 , 8) , (var false and true) and true) ∷ []
norm4 = refl
