open import PG.Eq

module PG.Reasoning {G : Set} (Equivalence : Equivalence G) where

open Equivalence Equivalence

-- Standard syntax sugar for writing equational proofs
infix 4 _≋_
data _≋_ (x y : G) : Set where
    prove : x ≈ y -> x ≋ y

infix 1 begin_
begin_ : {x y : G} -> x ≋ y -> x ≈ y
begin prove p = p

infixr 2 _≈⟨_⟩_
_≈⟨_⟩_ : (x : G) {y z : G} -> x ≈ y -> y ≋ z -> x ≋ z
_ ≈⟨ p ⟩ prove q = prove (trans p q)

infix 3 _∎
_∎ : (x : G) -> x ≋ x
_∎ _ = prove refl
