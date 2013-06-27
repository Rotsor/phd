module PG.Normalizer-correct (A B : Set) where

open import Relation.Binary
import Relation.Binary.PropositionalEquality as PropEq
open PropEq using(_≡_)
open import PG.Formulae

module WithOrder {_<_ : A → A → Set} (A-STO : IsStrictTotalOrder _≡_ _<_) where

  open import PG.Formula-Eq
  import PG.Normalizer
  open PG.Normalizer.WithOrder A B A-STO renaming (_+_ to _+'_; _⇾_ to _⇾'_)
  open PG.Normalizer A B
  import Data.List as List
  open List using ([]; _∷_; foldr; map)
  open import Function
  open WithBV {B} {A}

  import PG.GraphAlgebra as Alg
  open Alg.GraphTheory (record {isGraph = pgformula-is-graph}) renaming (absorption to absorption'; absorptionˡ to absorptionˡ'; absorptionʳ to absorptionʳ')

  module BEq = IsEquivalence B≈-is-equivalence 
  open IsEquivalence ≈-is-equivalence
  import Relation.Binary.EqReasoning as EqR
  open EqR record { isEquivalence = ≈-is-equivalence }

  lem : ∀ f p → p ≈ [ f ] p + [ ¬ f ] p
  lem f p = 
    begin
      p
        ≈⟨ sym true-condition ⟩
      [ ⊤ ] p
        ≈⟨ cond-cong (isEquivalence (EQC.sym ∨-complementʳ)) refl ⟩
      [ f ∨ ¬ f ] p
        ≈⟨ or-condition ⟩
      [ f ] p + [ ¬ f ] p
    ∎

  condition-regularisation : ∀ {f g} → {p q : PG} → [ f ] p ⇾ [ g ] q ≈ [ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q)
  condition-regularisation {f} {g} {p} {q} =
   begin
    [ f ] p ⇾ [ g ] q
     ≈⟨ {!!} ⟩
    [ f ∧ g ∨ f ∧ ¬ g ] p ⇾ [ f ∧ g ∨ ¬ f ∧ g ] q
     ≈⟨ {!!} ⟩
    ([ f ∧ g ] p + [ f ∧ ¬ g ] p) ⇾ ([ f ∧ g ] q + [ ¬ f ∧ g ] q)
     ≈⟨ {!!} ⟩
    [ f ∧ g ] p ⇾ [ f ∧ g ] q + [ f ∧ ¬ g ] p ⇾ [ f ∧ g ] q + [ f ∧ g ] p ⇾ [ ¬ f ∧ g ] q + [ f ∧ ¬ g ] p ⇾ [ ¬ f ∧ g ] q
     ≈⟨ {!!} ⟩
    [ f ∧ g ] (p ⇾ q) + [ f ] ([ ¬ g ] p ⇾ [ g ] q) + [ f ∧ g ] p ⇾ [ ¬ f ∧ g ] q + [ f ∧ ¬ g ] p ⇾ [ ¬ f ∧ g ] q
     ≈⟨ {!!} ⟩
    [ f ∧ g ∨ f ∧ ¬ g ] p ⇾ [ g ] q
     ≈⟨ {!!} ⟩
    [ f ∧ g ] p ⇾ [ g ] q + [ f ∨ g ] ([ f ] p ⇾ [ g ] q)
     ≈⟨ {!!} ⟩
    ([ f ∧ g ] (p ⇾ q) + [ f ] (p ⇾ [ g ] q) + [ g ] ([ f ] p ⇾ q) +  p + [ f ] p) ⇾ [ g ] q -- ([ f ∧ g ] q + [ g ] q)
     ≈⟨ {!!} ⟩
    ([ f ∧ g ] p ⇾ [ f ∧ g ] q + [ f ] p ⇾ [ f ∧ g ] q) ⇾ ([ f ∧ g ] q + [ g ] q)
     ≈⟨ {!!} ⟩
    [ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q)
   ∎

  
  absorb-by-condition : ∀ {f g p} → [ f ] p + [ f ∧ g ] p ≈ [ f ] p
  absorb-by-condition {f} {g} {p} = sym or-condition ⟨ trans ⟩ cond-cong ∨-absorbs-∧ refl

  condition-regularisation' : ∀ f g p q z
                              → p ⇾ q ≈ p + q + z
                              → [ f ] p ⇾ [ g ] q ≈ [ f ] p + [ g ] q + [ f ∧ g ] z
  condition-regularisation' f g p q z eq = 
   begin
    [ f ] p ⇾ [ g ] q
     ≈⟨  condition-regularisation  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p ⇾ q)
     ≈⟨  +-cong refl (cond-cong (isEquivalence EQC.refl) eq)  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p + q + z)
     ≈⟨  +-cong refl (conditional-+ ⟨ trans ⟩ +-cong conditional-+ refl)  ⟩
    [ f ] p + [ g ] q  + ([ f ∧ g ] p + [ f ∧ g ] q + [ f ∧ g ] z)
     ≈⟨ sym +-assoc ⟨ trans ⟩ +-cong (+-assoc ⟨ trans ⟩ ( +-cong refl (sym +-assoc ⟨ trans ⟩ +-cong +-comm refl ⟨ trans ⟩ +-assoc) ⟨ trans ⟩ sym +-assoc)) refl ⟩
    ([ f ] p + [ f ∧ g ] p) + ([ g ] q + [ f ∧ g ] q)  + [ f ∧ g ] z
     ≈⟨  +-cong (+-cong absorb-by-condition (+-cong refl (cond-cong ∧-comm refl) ⟨ trans ⟩ absorb-by-condition)) refl  ⟩
    [ f ] p + [ g ] q + [ f ∧ g ] z
   ∎

  +-correct' : ∀ x y → fromNF x + fromNF y ≈ fromNF (x +' y)
  +-correct' [] y = +-identityˡ -- (fromNF y)
  +-correct' (x ∷ xs) y = +-assoc ⟨ trans ⟩ +-cong refl (+-correct' xs y)

  open import Data.Product using (_,_)
  open import Data.Sum using (inj₁; inj₂)

  sumNodes = foldr _+_ ε ∘ map fromNode

  absorption : ∀ {x y} → x + y + x ⇾ y ≈ x ⇾ y
  absorption = +-comm ⟨ trans ⟩ (sym +-assoc ⟨ trans ⟩ absorption')

  absorptionˡ : ∀ {x y} → x + x ⇾ y ≈ x ⇾ y
  absorptionˡ = +-comm ⟨ trans ⟩ absorptionˡ' 

  absorptionʳ : ∀ {x y} → y + x ⇾ y ≈ x ⇾ y
  absorptionʳ = +-comm ⟨ trans ⟩ absorptionʳ'

  newArrows-good : ∀ x y → fromNode x ⇾ fromNode y ≈ fromNode x + fromNode y + sumNodes (newArrows x y)
  newArrows-good (inj₁ x) (inj₁ y) = sym (+-cong refl +-identityʳ ⟨ trans ⟩ absorption)
  newArrows-good (inj₁ x) (inj₂ (y₁ , y₂)) =  sym (+-cong +-comm (+-cong refl +-identityʳ) 
                                    ⟨ trans ⟩ (+-assoc ⟨ trans ⟩ +-comm ⟨ trans ⟩ 
                                                       +-cong (sym +-assoc ⟨ trans ⟩ +-cong absorptionˡ refl) refl) 
                                    ⟨ trans ⟩ sym decomposition 
                                    ⟨ trans ⟩ ⇾-assoc)
  newArrows-good (inj₂ (x₁ , x₂)) (inj₁ y) = sym (+-assoc ⟨ trans ⟩ +-cong refl (sym +-assoc ⟨ trans ⟩ +-cong absorptionʳ +-identityʳ) ⟨ trans ⟩ sym +-assoc 
                                             ⟨ trans ⟩ sym decomposition)
  newArrows-good (inj₂ (x₁ , x₂)) (inj₂ (y₁ , y₂)) = sym(
                +-assoc
                ⟨ trans ⟩ +-cong refl
                 (+-cong (sym idempotence) (+-cong refl (+-cong refl (+-cong refl +-identityʳ)) ⟨ trans ⟩ sym +-assoc ⟨ trans ⟩ +-comm)
                  ⟨ trans ⟩ sym +-assoc
                  ⟨ trans ⟩ +-cong (+-assoc ⟨ trans ⟩ +-cong refl +-comm) refl
                  ⟨ trans ⟩ +-comm 
                  ⟨ trans ⟩ sym +-assoc 
                  ⟨ trans ⟩ +-cong (sym decomposition) (sym decomposition) 
                  ⟨ trans ⟩ +-cong ⇾-assoc ⇾-assoc 
                 )
                ⟨ trans ⟩ sym +-assoc 
                ⟨ trans ⟩ sym decomposition)

  all-mult : ∀ l c → fromNF (List.map (flip _,_ c) l) ≈ [ c ] sumNodes l
  all-mult [] c = sym conditional-ε
  all-mult (x ∷ xs) c =  +-cong refl (all-mult xs c) ⟨ trans ⟩ sym conditional-+

  ⇾₁-preserves : ∀ x y → fromLit x ⇾ fromLit y ≈ fromNF (x ⇾₁ y)
  ⇾₁-preserves (x , f) (y , g) =
   begin
    fromLit (x , f) ⇾ fromLit (y , g)
     ≈⟨ condition-regularisation' f g _ _ _ (newArrows-good x y) ⟩
    fromLit (x , f) + fromLit (y , g) + [ f ∧ g ] sumNodes (newArrows x y)
     ≈⟨ +-assoc ⟨ trans ⟩ +-cong refl (+-cong refl (sym (all-mult (newArrows x y) (f ∧ g)))) ⟩
    fromNF ((x , f) ∷ (y , g) ∷ (map (flip _,_ (f ∧ g)) (newArrows x y)))
     ≈⟨ refl ⟩
    fromNF ((x , f) ⇾₁ (y , g))
   ∎

  ⇾ʳ-preserves : ∀ x y → fromLit x ⇾ fromNF y ≈ fromNF (x ⇾ʳ y)
  ⇾ʳ-preserves x [] = ⇾-identityʳ ⟨ trans ⟩ sym +-identityʳ
  ⇾ʳ-preserves x (y ∷ ys) = distribˡ ⟨ trans ⟩ +-cong (⇾₁-preserves x y) (⇾ʳ-preserves x ys) ⟨ trans ⟩ +-correct' (x ⇾₁ y) (x ⇾ʳ ys)

  ⇾-correct' : ∀ x y → fromNF x ⇾ fromNF y ≈ fromNF (x ⇾' y)
  ⇾-correct' [] y = ⇾-identityˡ
  ⇾-correct' (x ∷ xs) y = distribʳ ⟨ trans ⟩ ( +-cong (⇾ʳ-preserves x y) (⇾-correct' xs y) ⟨ trans ⟩ +-correct' (x ⇾ʳ y) (xs ⇾' y))

  +-correct : ∀ x y → x + y ≈ fromNF (normalize x +' normalize y)
  ⇾-correct : ∀ x y → x ⇾ y ≈ fromNF (normalize x ⇾' normalize y)
  normalise-correct : ∀ f → f ≈ fromNF (normalize f)

  +-correct x y = +-cong (normalise-correct x) (normalise-correct y) ⟨ trans ⟩ +-correct' (normalize x) (normalize y) 
  ⇾-correct x y = ⇾-cong (normalise-correct x) (normalise-correct y) ⟨ trans ⟩ ⇾-correct' (normalize x) (normalize y) 

  mapConditions-correct : ∀ c x → [ c ] fromNF x ≈ fromNF (mapConditions (_∧_ c) x)
  mapConditions-correct c [] = conditional-ε
  mapConditions-correct c (x ∷ xs) = conditional-+ ⟨ trans ⟩ +-cong (sym and-condition) (mapConditions-correct c xs)

  normalise-correct (x + y) = +-correct x y
  normalise-correct (x ⇾ y) = ⇾-correct x y
  normalise-correct ε = refl
  normalise-correct (var a) =  sym true-condition ⟨ trans ⟩ sym +-identityʳ
  normalise-correct ([ c ] y) = cond-cong BEq.refl (normalise-correct y) ⟨ trans ⟩ mapConditions-correct c (normalize y)
