
module PG.Formula-Eq where

open import PG.Formula

module _ {V : Set} where

 infix 3 _≈_

 data _≈_ : Graph-formula V → Graph-formula V → Set where
  refl : ∀ {p} → p ≈ p
  trans : ∀ {p q r} → p ≈ q → q ≈ r → p ≈ r
  sym : ∀ {p q} → p ≈ q → _≈_ q p
  
  +-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p + q ≈ r + s
  *-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p * q ≈ r * s

  +-assoc : ∀ {p q r} → (p + q) + r ≈ p + (q + r)
  +-comm : ∀ {p q} → p + q ≈ q + p
  *-identityˡ : ∀ {p} → ε * p ≈ p
  distribˡ : ∀ {p q r} → p * (q + r) ≈ p * q + p * r
  decomposition : ∀ {p q r} → (p * q) * r ≈ p * q + q * r + r * p

 open import PG.Eq

 graph-formula-equivalence : Equivalence (Graph-formula V)
 graph-formula-equivalence = record {
    eq = record {
      _≈_ = _≈_
     };
    is-eq = record {
     trans = trans;
     sym = sym;
     refl = refl
   }
  }

 left : {op : WhichBinOp} → ∀ {a b c} → a ≈ b → bin-op op a c ≈ bin-op op b c
 left {plus} eq = +-cong eq refl
 left {mult} eq = *-cong eq refl

 right : {op : WhichBinOp} → ∀ {a b c} → a ≈ b → bin-op op c a ≈ bin-op op c b
 right {plus} eq = +-cong refl eq
 right {mult} eq = *-cong refl eq


