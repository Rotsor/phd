
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
  *-assoc : ∀ {p q r} → (p * q) * r ≈ p * (q * r)
  *-identityˡ : ∀ {p} → ε * p ≈ p
  *-identityʳ : ∀ {p} → p * ε ≈ p
  distribˡ : ∀ {p q r} → p * (q + r) ≈ p * q + p * r
  distribʳ : ∀ {p q r} → (p + q) * r ≈ p * r + q * r
  decomposition : ∀ {p q r} → p * q * r ≈ p * q + p * r + q * r

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


 module Formula-equality-is-not-adequate-for-general-graphs where
    data Contradiction : Set where

    data Has-var (v : V) : (x : Graph-formula V) → Set where
      +₁ : ∀ {x y} → Has-var v x → Has-var v (x + y)
      +₂ : ∀ {x y} → Has-var v y → Has-var v (x + y)
      *₁ : ∀ {x y} → Has-var v x → Has-var v (x * y)
      *₂ : ∀ {x y} → Has-var v y → Has-var v (x * y)
      var : Has-var v (var v)

    var-stays1 : ∀ {v x y} → x ≈ y → Has-var v x → Has-var v y
    var-stays2 : ∀ {v x y} → x ≈ y → Has-var v y → Has-var v x
    var-stays1 refl = λ z → z
    var-stays1 (trans e1 e2) has = var-stays1 e2 (var-stays1 e1 has) 
    var-stays1 (sym eq) = var-stays2 eq
    var-stays1 (+-cong eq eq₁) (+₁ has) = +₁ (var-stays1 eq has)
    var-stays1 (+-cong eq eq₁) (+₂ has) = +₂ (var-stays1 eq₁ has)
    var-stays1 (*-cong eq eq₁) (*₁ has) = *₁ (var-stays1 eq has)
    var-stays1 (*-cong eq eq₁) (*₂ has) = *₂ (var-stays1 eq₁ has)
    var-stays1 +-assoc (+₁ (+₁ has)) = +₁ has
    var-stays1 +-assoc (+₁ (+₂ has)) = +₂ (+₁ has)
    var-stays1 +-assoc (+₂ has) = +₂ (+₂ has)
    var-stays1 +-comm (+₁ has) = +₂ has
    var-stays1 +-comm (+₂ has) = +₁ has
    var-stays1 *-assoc (*₁ (*₁ has)) = *₁ has
    var-stays1 *-assoc (*₁ (*₂ has)) = *₂ (*₁ has)
    var-stays1 *-assoc (*₂ has) = *₂ (*₂ has)
    var-stays1 *-identityˡ (*₁ ())
    var-stays1 *-identityˡ (*₂ has) = has
    var-stays1 *-identityʳ (*₁ has) = has
    var-stays1 *-identityʳ (*₂ ())
    var-stays1 distribˡ (*₁ has) = +₁ (*₁ has)
    var-stays1 distribˡ (*₂ (+₁ has)) = +₁ (*₂ has)
    var-stays1 distribˡ (*₂ (+₂ has)) = +₂ (*₂ has)
    var-stays1 distribʳ (*₁ (+₁ has)) = +₁ (*₁ has)
    var-stays1 distribʳ (*₁ (+₂ has)) = +₂ (*₁ has)
    var-stays1 distribʳ (*₂ has) = +₁ (*₂ has)
    var-stays1 decomposition (*₁ has) = +₁ (+₁ has)
    var-stays1 decomposition (*₂ has) = +₂ (*₂ has)
    var-stays2 refl has = has
    var-stays2 (trans e1 e2) has = var-stays2 e1 (var-stays2 e2 has)
    var-stays2 (sym eq) has = var-stays1 eq has
    var-stays2 (+-cong eq eq₁) (+₁ has) = +₁ (var-stays2 eq has)
    var-stays2 (+-cong eq eq₁) (+₂ has) = +₂ (var-stays2 eq₁ has)
    var-stays2 (*-cong eq eq₁) (*₁ has) = *₁ (var-stays2 eq has)
    var-stays2 (*-cong eq eq₁) (*₂ has) = *₂ (var-stays2 eq₁ has)
    var-stays2 +-assoc (+₁ has) = +₁ (+₁ has)
    var-stays2 +-assoc (+₂ (+₁ has)) = +₁ (+₂ has)
    var-stays2 +-assoc (+₂ (+₂ has)) = +₂ has
    var-stays2 +-comm (+₁ has) = +₂ has
    var-stays2 +-comm (+₂ has) = +₁ has
    var-stays2 *-assoc (*₁ has) = *₁ (*₁ has)
    var-stays2 *-assoc (*₂ (*₁ has)) = *₁ (*₂ has)
    var-stays2 *-assoc (*₂ (*₂ has)) = *₂ has
    var-stays2 *-identityˡ (+₁ has) = *₂ (+₁ has)
    var-stays2 *-identityˡ (+₂ has) = *₂ (+₂ has)
    var-stays2 *-identityˡ (*₁ has) = *₂ (*₁ has)
    var-stays2 *-identityˡ (*₂ has) = *₂ (*₂ has)
    var-stays2 *-identityˡ var = *₂ var
    var-stays2 *-identityʳ (+₁ has) = *₁ (+₁ has)
    var-stays2 *-identityʳ (+₂ has) = *₁ (+₂ has)
    var-stays2 *-identityʳ (*₁ has) = *₁ (*₁ has)
    var-stays2 *-identityʳ (*₂ has) = *₁ (*₂ has)
    var-stays2 *-identityʳ var = *₁ var
    var-stays2 distribˡ (+₁ (*₁ has)) = *₁ has
    var-stays2 distribˡ (+₁ (*₂ has)) = *₂ (+₁ has)
    var-stays2 distribˡ (+₂ (*₁ has)) = *₁ has
    var-stays2 distribˡ (+₂ (*₂ has)) = *₂ (+₂ has)
    var-stays2 distribʳ (+₁ (*₁ has)) = *₁ (+₁ has)
    var-stays2 distribʳ (+₁ (*₂ has)) = *₂ has
    var-stays2 distribʳ (+₂ (*₁ has)) = *₁ (+₂ has)
    var-stays2 distribʳ (+₂ (*₂ has)) = *₂ has
    var-stays2 decomposition (+₁ (+₁ has)) = *₁ has
    var-stays2 decomposition (+₁ (+₂ (*₁ has))) = *₁ (*₁ has)
    var-stays2 decomposition (+₁ (+₂ (*₂ has))) = *₂ has
    var-stays2 decomposition (+₂ (*₁ has)) = *₁ (*₂ has)
    var-stays2 decomposition (+₂ (*₂ has)) = *₂ has

    eps-different-from-var : ∀ {v : V} → var v ≈ ε → Contradiction
    eps-different-from-var eq with var-stays1 eq var
    eps-different-from-var eq | ()
