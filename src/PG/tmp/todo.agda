Formula-Eq:



{- formulaeq-equivalent1 : ∀ f g → f ≈ g → f ≈ˢ g
 formulaeq-equivalent1 f g eq alg ff = go eq where
  module Alg = PG alg
  open Alg using () renaming (_≈_ to _≈₁_)

  ev = pg-eval' ff Alg.pg-ops

  go : ∀ {f g} → f ≈ g → ev f ≈₁ ev g 
  go (isEquivalence (sym eq)) = Alg.sym (go eq)
  go (isEquivalence refl) = Alg.refl
  go (isEquivalence (trans l r)) = Alg.trans (go l) (go r)
  go (_≈_.+-cong l r) = Alg.+-cong (go l) (go r)
  go (_≈_.⇾-cong l r) = Alg.⇾-cong (go l) (go r)
  go _≈_.+-assoc = Alg.+-assoc
  go _≈_.+-comm = Alg.+-comm
  go _≈_.⇾-assoc = Alg.⇾-assoc
  go _≈_.⇾-identityˡ = Alg.⇾-identityˡ
  go _≈_.⇾-identityʳ = Alg.⇾-identityʳ
  go _≈_.distribˡ = Alg.distribˡ
  go _≈_.distribʳ = Alg.distribʳ
  go _≈_.decomposition = Alg.decomposition
  go (_≈_.cond-cong eq x) = Alg.cond-cong {!!} (go x) 
  go true-condition = {!!}
  go false-condition = {!!}
  go or-condition = {!!}
  go and-condition = {!!}
  go conditional-+ = {!!}
  go conditional-⇾ = {!!}
  go conditional-ε = {!!} -}


{- formulaeq-equivalent2 : ∀ f g → f ≈ˢ g → f ≈ g
 formulaeq-equivalent2 = {!!} -}


open import Relation.Binary.PropositionalEquality using (_≡_; refl)

open WithBV

{-
formulaeq-equivalent1 : ∀ {B V : Set} → (f g : PGFormula (BoolFormula B) V) → f ≈ g → FormulaEq f g

open import PG.Eq
--open import Relation.Binary.PropositionalEquality

stays-same : {B V : Set} → ∀ f → pg-eval' {B} {V} var formula-ops f ≡ f 
stays-same (x + y) rewrite stays-same x | stays-same y = refl
stays-same (x ⇾ y) rewrite stays-same x | stays-same y = refl
stays-same ε = refl
stays-same (var a) = refl
stays-same ([ c ] x) rewrite stays-same x = refl -}

{-formulaeq-equivalent2 : ∀ {B V : Set} → (f g : PGFormula B V) → FormulaEq f g → f ≈ g
formulaeq-equivalent2 {B} {V} f g eq = subst₂ _≈_ (stays-same f) (stays-same g) 
                              (eq {PGFormula B V} (record
                                { B-eq = equality _≡_
                                ; G-eq = equality _≈_
                                ; pg-ops = formula-ops
                                ; isPg = {!!} }) var) -}
