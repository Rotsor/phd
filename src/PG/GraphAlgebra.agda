module PG.GraphAlgebra where

open import PG.Function

module GraphTheory {V : Set} where
  import PG.Formula
  open import PG.Formula-Eq

  P = PG.Formula.Graph-formula V
  open PG.Formula.Graph-formula

  import PG.Reasoning
  open PG.Reasoning (graph-formula-equivalence {V})

  _≈≈≈_ : {p q r : P} → p ≈ q → q ≈ r → p ≈ r
  x ≈≈≈ y = trans x y

  infixl 8 _≈≈≈_

  +-cong₁ : {p q r : P} → p ≈ r → p + q ≈ r + q
  +-cong₁ p≈r = p≈r ⟨ +-cong ⟩ refl

  +-cong₂ : {p q r : P} → q ≈ r → p + q ≈ p + r
  +-cong₂ q≈r = refl ⟨ +-cong ⟩ q≈r

  ⇾-cong₂ : {p q r : P} → q ≈ r → p ⇾ q ≈ p ⇾ r
  ⇾-cong₂ q≈r = refl ⟨ ⇾-cong ⟩ q≈r

  ⇾-cong₁ : {p q r : P} → p ≈ r → p ⇾ q ≈ r ⇾ q
  ⇾-cong₁ p≈r = p≈r ⟨ ⇾-cong ⟩ refl

  r-deco : ∀ {a} → a + a + ε ≈ a
  r-deco {a} =
   begin
    a + a + ε
     ≈⟨ sym (⇾-identityʳ ⟨ +-cong ⟩ ⇾-identityʳ ⟨ +-cong ⟩ ⇾-identityʳ) ⟩
    a ⇾ ε + a ⇾ ε + ε ⇾ ε
     ≈⟨ sym decomposition ⟩
    a ⇾ ε ⇾ ε
     ≈⟨ ⇾-identityʳ ≈≈≈ ⇾-identityʳ ⟩
    a
   ∎

  +-identityʳ : ∀ {a} → a + ε ≈ a
  +-identityʳ {a} =
   begin
    a + ε
     ≈⟨ sym r-deco ⟩
    (a + ε) + (a + ε) + ε
     ≈⟨ +-cong₁ 
        (+-assoc ≈≈≈ (+-cong₂ (+-comm ≈≈≈ +-assoc) ≈≈≈ sym +-assoc)) 
        ≈≈≈ +-assoc ⟩
    a + a + (ε + ε + ε)
     ≈⟨ +-cong₂ r-deco ⟩
    a + a + ε 
     ≈⟨ r-deco ⟩
    a
   ∎

  +-identityˡ : {p : P} → ε + p ≈ p
  +-identityˡ = +-comm ≈≈≈ +-identityʳ

  idempotence : ∀ {p} → p + p ≈ p
  idempotence {p} = sym +-identityʳ ≈≈≈ r-deco

  absorption : ∀ {a b : P} → a ⇾ b + a + b ≈ a ⇾ b
  absorption {a} {b} =
   begin
    a ⇾ b + a + b
     ≈⟨ sym (refl ⟨ +-cong ⟩ ⇾-identityʳ ⟨ +-cong ⟩  ⇾-identityʳ) ⟩
    (a ⇾ b) + (a ⇾ ε) + (b ⇾ ε)
     ≈⟨ sym decomposition ⟩
    a ⇾ b ⇾ ε
     ≈⟨ ⇾-identityʳ ⟩
    a ⇾ b
   ∎

  absorptionˡ : {p q : P} → p ⇾ q + p ≈ p ⇾ q
  absorptionˡ {p} {q} =
   begin
    p ⇾ q + p
     ≈⟨ +-cong₁ (sym absorption) ⟩
    p ⇾ q + p + q + p
     ≈⟨ +-assoc ≈≈≈ +-cong₂ +-comm ≈≈≈ (sym +-assoc ≈≈≈ +-cong₁ +-assoc)  ⟩
    p ⇾ q + (p + p) + q
     ≈⟨ +-cong₁ (+-cong₂ idempotence) ⟩
    p ⇾ q + p + q
     ≈⟨ absorption ⟩
    p ⇾ q
   ∎

  absorptionʳ : ∀ {p} {q} → p ⇾ q + q ≈ p ⇾ q
  absorptionʳ {p} {q} =
   begin
    p ⇾ q + q
     ≈⟨ +-cong₁ (sym absorption) ⟩
    p ⇾ q + p + q + q
     ≈⟨ +-assoc ⟩
    p ⇾ q + p + (q + q)
     ≈⟨ +-cong₂ idempotence ⟩
    p ⇾ q + p + q
     ≈⟨ absorption ⟩
    p ⇾ q
   ∎
