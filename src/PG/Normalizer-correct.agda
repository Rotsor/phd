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
  module GT = Alg.GraphTheory (record {isGraph = pgformula-is-graph})
  module BEq = IsEquivalence B≈-is-equivalence 
  open IsEquivalence ≈-is-equivalence
  import Relation.Binary.EqReasoning as EqR
  open EqR record { isEquivalence = ≈-is-equivalence }
  open EqR record { isEquivalence = B≈-is-equivalence } renaming
    (begin_ to Bbegin_; _≈⟨_⟩_ to _B≈⟨_⟩_; _∎ to _B∎)

  open import Algebra.Structures
  open IsBooleanAlgebra bool-formula-is-bool-alg using
    ()
  open import Algebra.Props.BooleanAlgebra 
    (record {isBooleanAlgebra = bool-formula-is-bool-alg }) using
    (∧-∨-distrib; ∧-complement; ∨-complement; 
      ∨-∧-isCommutativeSemiring; ∧-idempotent; ∨-idempotent)
  open IsCommutativeSemiring ∨-∧-isCommutativeSemiring 
    using () renaming (*-identity to ∧-identity; zero to ∧-zero)

  open import Data.Product using (_,_; proj₁; proj₂)
  open import Data.Sum using (inj₁; inj₂)

  absorption : ∀ {x y} → x + y + x ⇾ y ≈ x ⇾ y
  absorption = +-comm ⟨ trans ⟩ (sym +-assoc ⟨ trans ⟩ GT.absorption)

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

  case-analyse : ∀ {f p q} → [ f ] p ≈ [ f ] q → [ ¬ f ] p ≈ [ ¬ f ] q → p ≈ q
  case-analyse {f} {p} {q} fcase ¬fcase =
    begin
      p
     ≈⟨ lem _ _ ⟩
      [ f ] p + [ ¬ f ] p
     ≈⟨ +-cong fcase ¬fcase ⟩
      [ f ] q + [ ¬ f ] q
     ≈⟨ sym (lem _ _) ⟩
      q
    ∎

  elim-+ : ∀ {f a b c d} 
    → [ f ] a ≈ [ f ] c → [ f ] b ≈ [ f ] d 
    → [ f ] (a + b) ≈ [ f ] (c + d)
  elim-+ a≈c b≈d = 
    trans (trans conditional-+ (+-cong a≈c b≈d)) (sym conditional-+)

  elim-⇾ : ∀ {f a b c d} → 
    [ f ] a ≈ [ f ] c → [ f ] b ≈ [ f ] d → 
    [ f ] (a ⇾ b) ≈ [ f ] (c ⇾ d)
  elim-⇾ a≈c b≈d = 
    trans (trans conditional-⇾ (⇾-cong a≈c b≈d)) (sym conditional-⇾)

  dupcond : ∀ {f x} → [ f ] [ f ] x ≈ [ f ] x
  dupcond = trans (sym and-condition) (cond-cong (∧-idempotent _) refl)

  falsecond : ∀ {f x} → [ ¬ f ] [ f ] x ≈ [ ¬ f ] ε
  falsecond = trans (sym dupcond) (cond-cong BEq.refl (trans
    (trans (sym and-condition) 
      (cond-cong (proj₁ ∧-complement _) refl))
    false-condition
    )
    )

  condswap : ∀ {f g x} → [ f ] [ g ] x ≈ [ g ] [ f ] x
  condswap = trans (sym and-condition) (trans (cond-cong ∧-comm refl) and-condition)

  side1 : ∀ {f g p q} 
    → [ f ] ([ f ] p ⇾ [ g ] q) 
     ≈ [ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
  side1 {f} {g} {p} {q} = 
   begin
    [ f ] ([ f ] p ⇾ [ g ] q)
      ≈⟨ elim-⇾ dupcond refl ⟩
    [ f ] (p ⇾ [ g ] q)
      ≈⟨ cond-cong BEq.refl (case-analyse {g} 
      (
      begin
        [ g ] (p ⇾ [ g ] q)
          ≈⟨ elim-⇾ refl dupcond ⟩
        [ g ] (p ⇾ q)
          ≈⟨ sym (cond-cong BEq.refl absorption) ⟩
        [ g ] (p + q + p ⇾ q)
          ≈⟨ sym (elim-+ (elim-+ refl dupcond) dupcond) ⟩
        [ g ] (p + [ g ] q + [ g ] (p ⇾ q))
      ∎
      )
      (trans (elim-⇾ refl falsecond) (trans 
        (cond-cong BEq.refl 
        (trans ⇾-identityʳ (sym (trans GT.+-identityʳ GT.+-identityʳ)))) 
        (sym (elim-+ (elim-+ refl falsecond) falsecond))))) ⟩
    [ f ] (p + [ g ] q + [ g ] (p ⇾ q))
      ≈⟨ sym (elim-+ (elim-+ dupcond refl) 
        (trans (cond-cong BEq.refl and-condition) dupcond)) ⟩
    [ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
    ∎

  side2 : ∀ {f g p q} 
    → [ ¬ f ] ([ f ] p ⇾ [ g ] q) 
    ≈ [ ¬ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
  side2 {f} {g} {p} {q} = 
   begin
    [ ¬ f ] ([ f ] p ⇾ [ g ] q)
      ≈⟨ elim-⇾ falsecond refl ⟩
    [ ¬ f ] (ε ⇾ [ g ] q)
      ≈⟨ cond-cong BEq.refl ⇾-identityˡ ⟩
    [ ¬ f ] [ g ] q
      ≈⟨  cond-cong BEq.refl (sym (trans (GT.+-identityʳ) (GT.+-identityˡ))) ⟩
    [ ¬ f ] (ε + [ g ] q + ε)
      ≈⟨ sym (elim-+ (elim-+ falsecond refl) (trans (sym dupcond) 
        (cond-cong BEq.refl (trans (sym and-condition) 
        (trans (cond-cong (BEq.trans (BEq.sym ∧-assoc)
        (BEq.trans (∧-cong (proj₁ ∧-complement _) BEq.refl) (proj₁ ∧-zero _)))
        refl) false-condition))))) ⟩
    [ ¬ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
    ∎

  condition-regularisation : ∀ {f g} → {p q : PG} 
    → [ f ] p ⇾ [ g ] q ≈ [ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q)
  condition-regularisation {f} {g} {p} {q} = case-analyse {f} 
   side1 side2

  
  absorb-by-condition : ∀ {f g p} → [ f ] p + [ f ∧ g ] p ≈ [ f ] p
  absorb-by-condition {f} {g} {p} = 
    sym or-condition ⟨ trans ⟩ cond-cong ∨-absorbs-∧ refl

  condition-regularisation' : ∀ f g p q z
                              → p ⇾ q ≈ p + q + z
                              → [ f ] p ⇾ [ g ] q 
                                ≈ [ f ] p + [ g ] q + [ f ∧ g ] z
  condition-regularisation' f g p q z eq = 
   begin
    [ f ] p ⇾ [ g ] q
     ≈⟨  condition-regularisation  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p ⇾ q)
     ≈⟨  +-cong refl (cond-cong (isEquivalence EQC.refl) eq)  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p + q + z)
     ≈⟨  +-cong refl (conditional-+ ⟨ trans ⟩ +-cong conditional-+ refl)  ⟩
    [ f ] p + [ g ] q  + ([ f ∧ g ] p + [ f ∧ g ] q + [ f ∧ g ] z)
     ≈⟨ sym +-assoc ⟨ trans ⟩ +-cong (+-assoc ⟨ trans ⟩ 
       (+-cong refl (sym +-assoc ⟨ trans ⟩ +-cong +-comm refl ⟨ trans ⟩ +-assoc) 
       ⟨ trans ⟩ sym +-assoc)) refl ⟩
    ([ f ] p + [ f ∧ g ] p) + ([ g ] q + [ f ∧ g ] q)  + [ f ∧ g ] z
     ≈⟨  +-cong (+-cong absorb-by-condition (+-cong refl (cond-cong ∧-comm refl)
       ⟨ trans ⟩ absorb-by-condition)) refl  ⟩
    [ f ] p + [ g ] q + [ f ∧ g ] z
   ∎

  +-correct' : ∀ x y → fromNF x + fromNF y ≈ fromNF (x +' y)
  +-correct' [] y = GT.+-identityˡ -- (fromNF y)
  +-correct' (x ∷ xs) y = +-assoc ⟨ trans ⟩ +-cong refl (+-correct' xs y)

  sumNodes = foldr _+_ ε ∘ map fromNode

  absorptionˡ : ∀ {x y} → x + x ⇾ y ≈ x ⇾ y
  absorptionˡ = +-comm ⟨ trans ⟩ GT.absorptionˡ 

  absorptionʳ : ∀ {x y} → y + x ⇾ y ≈ x ⇾ y
  absorptionʳ = +-comm ⟨ trans ⟩ GT.absorptionʳ

  newArrows-good : ∀ x y → fromNode x ⇾ fromNode y 
      ≈ fromNode x + fromNode y + sumNodes (newArrows x y)
  newArrows-good (inj₁ x) (inj₁ y) = 
    sym (+-cong refl GT.+-identityʳ ⟨ trans ⟩ absorption)
  newArrows-good (inj₁ x) (inj₂ (y₁ , y₂)) =  
    sym (+-cong +-comm (+-cong refl GT.+-identityʳ) 
    ⟨ trans ⟩ (+-assoc ⟨ trans ⟩ +-comm ⟨ trans ⟩ 
      +-cong (sym +-assoc ⟨ trans ⟩ +-cong absorptionˡ refl) refl) 
    ⟨ trans ⟩ sym decomposition 
    ⟨ trans ⟩ ⇾-assoc)
  newArrows-good (inj₂ (x₁ , x₂)) (inj₁ y) = 
    sym (+-assoc ⟨ trans ⟩ 
      +-cong refl (sym +-assoc ⟨ trans ⟩ +-cong absorptionʳ GT.+-identityʳ) 
    ⟨ trans ⟩ sym +-assoc ⟨ trans ⟩ 
    sym decomposition)
  newArrows-good (inj₂ (x₁ , x₂)) (inj₂ (y₁ , y₂)) = 
    sym(+-assoc ⟨ trans ⟩ +-cong refl
     (+-cong (sym GT.idempotence) (+-cong refl (+-cong refl 
        (+-cong refl GT.+-identityʳ)) ⟨ trans ⟩ sym +-assoc ⟨ trans ⟩ +-comm)
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
     ≈⟨ +-assoc ⟨ trans ⟩ +-cong refl 
       (+-cong refl (sym (all-mult (newArrows x y) (f ∧ g)))) ⟩
    fromNF ((x , f) ∷ (y , g) ∷ (map (flip _,_ (f ∧ g)) (newArrows x y)))
     ≈⟨ refl ⟩
    fromNF ((x , f) ⇾₁ (y , g))
   ∎

  ⇾ʳ-preserves : ∀ x y → fromLit x ⇾ fromNF y ≈ fromNF (x ⇾ʳ y)
  ⇾ʳ-preserves x [] = ⇾-identityʳ ⟨ trans ⟩ sym GT.+-identityʳ
  ⇾ʳ-preserves x (y ∷ ys) = 
    distribˡ ⟨ trans ⟩ +-cong (⇾₁-preserves x y) (⇾ʳ-preserves x ys) 
    ⟨ trans ⟩ +-correct' (x ⇾₁ y) (x ⇾ʳ ys)

  ⇾-correct' : ∀ x y → fromNF x ⇾ fromNF y ≈ fromNF (x ⇾' y)
  ⇾-correct' [] y = ⇾-identityˡ
  ⇾-correct' (x ∷ xs) y = 
    distribʳ ⟨ trans ⟩ (+-cong (⇾ʳ-preserves x y) (⇾-correct' xs y) 
    ⟨ trans ⟩ +-correct' (x ⇾ʳ y) (xs ⇾' y))

  +-correct : ∀ x y → x + y ≈ fromNF (normalize x +' normalize y)
  ⇾-correct : ∀ x y → x ⇾ y ≈ fromNF (normalize x ⇾' normalize y)
  normalise-correct : ∀ f → f ≈ fromNF (normalize f)

  +-correct x y = 
    +-cong (normalise-correct x) (normalise-correct y) ⟨ trans ⟩ 
    +-correct' (normalize x) (normalize y) 

  ⇾-correct x y = 
    ⇾-cong (normalise-correct x) (normalise-correct y) ⟨ trans ⟩ 
    ⇾-correct' (normalize x) (normalize y) 

  mapConditions-correct : ∀ c x → [ c ] fromNF x ≈ fromNF (mapConditions (_∧_ c) x)
  mapConditions-correct c [] = conditional-ε
  mapConditions-correct c (x ∷ xs) = 
    conditional-+ ⟨ trans ⟩ +-cong (sym and-condition) (mapConditions-correct c xs)

  normalise-correct (x + y) = +-correct x y
  normalise-correct (x ⇾ y) = ⇾-correct x y
  normalise-correct ε = refl
  normalise-correct (var a) =  sym true-condition ⟨ trans ⟩ sym GT.+-identityʳ
  normalise-correct ([ c ] y) = cond-cong BEq.refl (normalise-correct y) ⟨ trans ⟩
    mapConditions-correct c (normalize y)

