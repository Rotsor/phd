open import PG.PGAlgebra

module PG.PGTheory (B G : Set) (B-G-PG : PG B G) where
  open PG B-G-PG

  import Relation.Binary.EqReasoning 
  open import Relation.Binary
  open Relation.Binary.EqReasoning record { isEquivalence = ≈-is-eq }

  choice-elimination : ∀ f x → [ f ] x + [ ¬ f ] x ≈ x
  choice-elimination f x =
   begin
    [ f ] x + [ ¬ f ] x
     ≈⟨ {!!} ⟩
    [ f ∨ ¬ f ] x
     ≈⟨ {!!} ⟩
    [ ⊤ ] x
     ≈⟨ {!!} ⟩
    x
   ∎

  sequence-elimination : ∀ f p q → [ f ] p ⇾ [ ¬ f ] q ≈ [ f ] p + [ ¬ f ] q 
  sequence-elimination f p q = 
   begin
    [ f ] p ⇾ [ ¬ f ] q
     ≈⟨ sym (choice-elimination f _) ⟩
    [ f ] ([ f ] p ⇾ [ ¬ f ] q) + [ ¬ f ] ([ f ] p ⇾ [ ¬ f ] q)
     ≈⟨ +-cong left right ⟩
    [ f ] p + [ ¬ f ] q 
   ∎ where
    left =
     begin
      [ f ] ([ f ] p ⇾ [ ¬ f ] q)
       ≈⟨ conditional-⇾ _ _ _ ⟩
      [ f ] [ f ] p ⇾ [ f ] [ ¬ f ] q
       ≈⟨ ⇾-cong (sym (and-condition f f p)) (sym (and-condition f (¬ f) q)) ⟩
      [ f ∧ f ] p ⇾ [ f ∧ ¬ f ] q
       ≈⟨ ⇾-cong (cond-cong {!!} refl) (cond-cong {!!} refl) ⟩
      [ f ] p ⇾ [ ⊥ ] q
       ≈⟨ ⇾-cong refl (false-condition _) ⟩
      [ f ] p ⇾ ε
       ≈⟨ ⇾-identityʳ ⟩
      [ f ] p
     ∎

    right : [ ¬ f ] ([ f ] p ⇾ [ ¬ f ] q) ≈ [ ¬ f ] q
    right = {!conditional-⇾ _ _ _ ⟨ trans ⟩ ⇾-cong ? ? ⟨ trans ⟩ !}


  choice-propagation₁ : ∀ b p q r → [ b ] (p ⇾ q) + [ ¬ b ] (p ⇾ r) ≈ p ⇾ ([ b ] q + [ ¬ b ] r) 
  choice-propagation₁ b p q r = {!!}

  choice-propagation₂ : ∀ b p q r → [ b ] (p ⇾ r) + [ ¬ b ] (q ⇾ r) ≈ ([ b ] p + [ ¬ b ] q) ⇾ r
  choice-propagation₂ b p q r = {!!}

  condition-regularisation : ∀ f g p q → [ f ] p ⇾ [ g ] q ≈ [ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q)
  condition-regularisation f g p q = {!!}

{-  choice-propagation₁ =
   begin
    [ b ] (p ⇾ q) + [ ¬ b ] (p ⇾ r)
      ≈⟨ conditional-⇾ b p q ⟨ +-cong ⟩ conditional-⇾ (¬ b) p r ⟩
    [ b ] p ⇾ [ b ] q + [ ¬ b ] p ⇾ [ ¬ b ] r
      ≈⟨ ? ⟩
    ([ b ] p ⇾ [ b ] q + [ b ] p ⇾ [ ¬ b ] r) + ([ ¬ b ] p ⇾ [ b ] q + [ ¬ b ] p ⇾ [ ¬ b ] r)
      ≈⟨ ? ⟩
    [ b ] p ⇾ ([ b ] q + [ ¬ b ] r) + [ ¬ b ] p ⇾ ([ b ] q + [ ¬ b ] r)
      ≈⟨ ? ⟩
    ([ b ] p + [ ¬ b ] p) ⇾ ([ b ] q + [ ¬ b ] r) 
      ≈⟨ ? ⟩
    p ⇾ ([ b ] q + [ ¬ b ] r) 
   ∎ -}

