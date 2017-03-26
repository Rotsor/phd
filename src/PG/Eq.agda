module PG.Eq where

record PreEq (G : Set) : Set₁ where
 constructor equality
 infix 3 _≈_
 field
  _≈_ : G → G → Set

record IsEquivalence {G : Set} (Eq : PreEq G) : Set where
 open PreEq Eq
 field
   refl : ∀ {x} → x ≈ x
   trans : ∀ {a b c} → a ≈ b → b ≈ c → a ≈ c
   sym : ∀ {a b} → a ≈ b → b ≈ a

record Equivalence (G : Set) : Set₁ where
 field
  eq : PreEq G
  is-eq : IsEquivalence eq
 open PreEq eq public
 open IsEquivalence is-eq public
