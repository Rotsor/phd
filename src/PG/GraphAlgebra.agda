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

  rotate-plus : ∀ {a b c} → a + b + c ≈ b + c + a
  rotate-plus {a} {b} {c} =
   begin
    (a + b) + c
     ≈⟨ +-assoc ⟩
    a + (b + c)
     ≈⟨ +-comm ⟩
    (b + c) + a
   ∎

  rotate-triangle : ∀ {p q r} → (p * q) * r ≈ (q * r) * p
  rotate-triangle {p} {q} {r} =
   begin
    (p * q) * r
     ≈⟨ decomposition ⟩
    p * q + q * r + r * p
     ≈⟨ rotate-plus {p * q} {q * r} {r * p} ⟩
    q * r + r * p + p * q
     ≈⟨ sym decomposition ⟩
    (q * r) * p
   ∎

  *-identityʳ : ∀ {r} → r * ε ≈ r
  *-identityʳ {r} = sym (
   begin
    r
     ≈⟨ sym (trans (*-cong *-identityˡ refl) *-identityˡ) ⟩
    (ε * ε) * r
     ≈⟨ rotate-triangle ⟩
    (ε * r) * ε
     ≈⟨ *-cong *-identityˡ refl ⟩
    r * ε
   ∎)

  *-comm : ∀ {p q} → p * q ≈ q * p
  *-comm {p} {q} =
   begin
    p * q
     ≈⟨ sym *-identityʳ ⟩
    p * q * ε
     ≈⟨ rotate-triangle ⟩
    q * ε * p
     ≈⟨ *-cong *-identityʳ refl ⟩
    q * p
   ∎

  r-deco : ∀ {a} → a + a + ε ≈ a
  r-deco {a} =
   begin
    a + a + ε
     ≈⟨ sym (*-identityˡ ⟨ +-cong ⟩ *-identityʳ ⟨ +-cong ⟩ *-identityʳ) ⟩
    ε * a  + a * ε + ε * ε
     ≈⟨ sym decomposition ⟩
    ε * a * ε
     ≈⟨ *-identityʳ ≈≈≈ *-identityˡ ⟩
    a
   ∎

  +-identityʳ : ∀ {a} → a + ε ≈ a
  +-identityʳ {a} =
   begin
    a + ε
     ≈⟨ sym r-deco ⟩
    (a + ε) + (a + ε) + ε
     ≈⟨ left 
        (+-assoc ≈≈≈ (right (+-comm ≈≈≈ +-assoc) ≈≈≈ sym +-assoc)) 
        ≈≈≈ +-assoc ⟩
    a + a + (ε + ε + ε)
     ≈⟨ right r-deco ⟩
    a + a + ε 
     ≈⟨ r-deco ⟩
    a
   ∎

  +-identityˡ : {p : P} → ε + p ≈ p
  +-identityˡ = +-comm ≈≈≈ +-identityʳ

  idempotence : ∀ {p} → p + p ≈ p
  idempotence {p} = sym +-identityʳ ≈≈≈ r-deco

  absorption : ∀ {a b : P} → a * b + a + b ≈ a * b
  absorption {a} {b} =
   begin
    a * b + a + b
     ≈⟨ trans +-assoc (+-cong refl +-comm) ⟩
    a * b + (b + a)
     ≈⟨ sym +-assoc ⟩
    a * b + b + a
     ≈⟨ sym (refl ⟨ +-cong ⟩ *-identityʳ ⟨ +-cong ⟩  *-identityˡ) ⟩
    (a * b) + (b * ε) + (ε * a)
     ≈⟨ sym decomposition ⟩
    a * b * ε
     ≈⟨ *-identityʳ ⟩
    a * b
   ∎

  absorptionˡ : {p q : P} → p * q + p ≈ p * q
  absorptionˡ {p} {q} =
   begin
    p * q + p
     ≈⟨ left (sym absorption) ⟩
    p * q + p + q + p
     ≈⟨ +-assoc ≈≈≈ right +-comm ≈≈≈ (sym +-assoc ≈≈≈ left +-assoc)  ⟩
    p * q + (p + p) + q
     ≈⟨ left (right idempotence) ⟩
    p * q + p + q
     ≈⟨ absorption ⟩
    p * q
   ∎

  absorptionʳ : ∀ {p} {q} → p * q + q ≈ p * q
  absorptionʳ {p} {q} =
   begin
    p * q + q
     ≈⟨ left (sym absorption) ⟩
    p * q + p + q + q
     ≈⟨ +-assoc ⟩
    p * q + p + (q + q)
     ≈⟨ right idempotence ⟩
    p * q + p + q
     ≈⟨ absorption ⟩
    p * q
   ∎

  *-assoc : ∀ {p q r} → (p * q) * r ≈ p * (q * r)
  *-assoc {p} {q} {r} =
   begin
    (p * q) * r
     ≈⟨ rotate-triangle ⟩
    (q * r) * p
     ≈⟨ *-comm ⟩
    p * (q * r)
   ∎

  distribʳ : ∀ {p q r} → (q + r) * p ≈ (q * p) + (r * p)
  distribʳ =
    *-comm
    ≈≈≈ 
    distribˡ
    ≈≈≈
    +-cong *-comm *-comm

  decomposition-old : ∀ {p q r} → p * q * r ≈ p * q + p * r + q * r
  decomposition-old {p} {q} {r} =
    decomposition ≈≈≈
    (begin
     p * q + q * r + r * p
      ≈⟨ +-assoc ⟩
     p * q + (q * r + r * p)
      ≈⟨ +-cong refl (+-comm ≈≈≈ +-cong *-comm refl) ⟩
     p * q + (p * r + q * r)
      ≈⟨ sym +-assoc ⟩
     p * q + p * r + q * r
    ∎)
