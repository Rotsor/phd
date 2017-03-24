module PG.Normalizer-correct (A : Set) where

open import Relation.Binary
import Relation.Binary.PropositionalEquality as PropEq
open PropEq using(_≡_)
open import PG.Formulae

module WithOrder {_<_ : A → A → Set} (A-STO : IsStrictTotalOrder _≡_ _<_) where

  open import PG.Formula-Eq
  import PG.Normalizer
  open PG.Normalizer.WithOrder A A-STO renaming (_+_ to _+'_; _⇾_ to _⇾'_)
  open PG.Normalizer A
  import Data.List as List
  open List using ([]; _∷_; foldr; map)
  open import Function
  open WithBV {A}

  import PG.GraphAlgebra as Alg
  module GT = Alg.GraphTheory (record {isGraph = pgformula-is-graph})
  open IsEquivalence ≈-is-equivalence
  import Relation.Binary.EqReasoning as EqR
  open EqR record { isEquivalence = ≈-is-equivalence }

  open import Algebra.Structures

  open import Data.Product using (_,_; proj₁; proj₂)
  open import Data.Sum using (inj₁; inj₂)

  absorption : ∀ {x y} → x + y + x ⇾ y ≈ x ⇾ y
  absorption = +-comm ⟨ trans ⟩ (sym +-assoc ⟨ trans ⟩ GT.absorption)

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

  ⇾₁-preserves : ∀ x y → fromLit x ⇾ fromLit y ≈ fromNF (x ⇾₁ y)
  ⇾₁-preserves x y =
   begin
    fromLit x ⇾ fromLit y
     ≈⟨ newArrows-good x y ⟩
    fromLit x + fromLit y + sumNodes (newArrows x y)
     ≈⟨ +-assoc ⟩
    fromNF (x ∷ y ∷ (newArrows x y))
     ≈⟨ refl ⟩
    fromNF (x ⇾₁ y)
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

  normalise-correct (x + y) = +-correct x y
  normalise-correct (x ⇾ y) = ⇾-correct x y
  normalise-correct ε = refl
  normalise-correct (var a) =  sym GT.+-identityʳ

