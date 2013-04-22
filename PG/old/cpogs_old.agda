
   idempotence : {p : P} → p + p ~ p
   idempotence {p} = 
    begin
     p + p
      ≈⟨ sym (⇾-identityʳ +-cong ⇾-identityʳ) ⟩
     p ⇾ ε + p ⇾ ε
      ≈⟨ sym distribˡ ⟩
     p ⇾ (ε + ε)
      ≈⟨ ⇾-cong₂ identityIdempotence ⟩
     p ⇾ ε
      ≈⟨ ⇾-identityʳ ⟩
     p
    ∎

   

   identityIdempotence3 : ε + ε + ε ~ ε
   identityIdempotence3 = sym $
     begin
       ε
         ≈⟨ sym (⇾-identityʳ ~~~ ⇾-identityʳ) ⟩
       ε ⇾ ε ⇾ ε
         ≈⟨ decomposition ⟩
       ε ⇾ ε + ε ⇾ ε + ε ⇾ ε
         ≈⟨ ⇾-identityʳ +-cong ⇾-identityʳ +-cong ⇾-identityʳ ⟩
       ε + ε + ε
      ∎

   identityIdempotence : ε + ε ~ ε
   identityIdempotence =
      begin
        ε + ε
          ≈⟨ sym (⇾-identityʳ ~~~ ⇾-identityˡ) ⟩
        ε ⇾ (ε + ε) ⇾ ε
          ≈⟨ decomposition ⟩
        ε ⇾ (ε + ε) + (ε + ε) ⇾ ε + εε
          ≈⟨ +-cong₁ ((distribˡ +-cong distribʳ) ~~~ sym +-assoc) ⟩
        εε + εε + εε + εε + εε
          ≈⟨        ⇾-identityˡ 
             +-cong ⇾-identityˡ
             +-cong ⇾-identityˡ 
             +-cong ⇾-identityˡ 
             +-cong ⇾-identityˡ ⟩
        (ε + ε + ε) + ε + ε
          ≈⟨ +-cong₁ (+-cong₁ identityIdempotence3) ⟩
        ε + ε + ε
          ≈⟨ identityIdempotence3 ⟩
        ε
      ∎
     where
       εε = ε ⇾ ε

   +-identityʳ : {p : P} → p + ε ~ p
   +-identityʳ {p} = sym $
      begin
        p
         ≈⟨ sym (⇾-identityʳ ~~~ ⇾-identityʳ)  ⟩
        (p ⇾ ε) ⇾ ε
         ≈⟨ decomposition ⟩
        p ⇾ ε + ε ⇾ ε + p ⇾ ε 
         ≈⟨ +-comm ~~~ sym +-assoc ⟩
        p ⇾ ε + p ⇾ ε + ε ⇾ ε 
         ≈⟨ +-cong₁ idempotence ⟩
        p ⇾ ε + ε ⇾ ε
         ≈⟨ ⇾-identityʳ +-cong ⇾-identityʳ ⟩
        p + ε
      ∎

   leftAbsorption : {p q : P} → p + p ⇾ q ~ p ⇾ q
   leftAbsorption {p} {q} = 
    begin
      p + p ⇾ q
       ≈⟨ sym (+-cong₁ ⇾-identityʳ) ⟩
      p ⇾ ε + p ⇾ q
       ≈⟨ sym distribˡ ⟩
      p ⇾ (ε + q)
       ≈⟨ ⇾-cong₂ +-identityˡ ⟩
      p ⇾ q
    ∎

   rightAbsorption : {p q : P} → q + p ⇾ q ~ p ⇾ q
   rightAbsorption {p} {q} = 
     begin
      q + p ⇾ q
       ≈⟨ sym (+-cong₁ ⇾-identityˡ) ⟩
      ε ⇾ q + p ⇾ q
       ≈⟨ sym distribʳ ⟩
      (ε + p) ⇾ q
       ≈⟨ ⇾-cong₁ +-identityˡ ⟩
      p ⇾ q
     ∎
