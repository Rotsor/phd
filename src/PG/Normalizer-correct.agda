module PG.Normalizer-correct (A : Set) where

open import PG.Formula

open import PG.Formula-Eq
import PG.Normalizer renaming (_+_ to _+'_; _⇾_ to _⇾'_)
open PG.Normalizer A
import PG.List as List
open List using ([]; _∷_; foldr; map)
open import PG.Function

import PG.GraphAlgebra as Alg
module GT = Alg.GraphTheory
import PG.Reasoning
open PG.Reasoning (graph-formula-equivalence {A})

G = PG.Formula.Graph-formula A

absorption : ∀ {x y : G} → x + y + x ⇾ y ≈ x ⇾ y
absorption = +-comm ⟨ trans ⟩ (sym +-assoc ⟨ trans ⟩ GT.absorption)

+-correct' : ∀ x y → fromNF x + fromNF y ≈ fromNF (x +' y)
+-correct' [] y = GT.+-identityˡ -- (fromNF y)
+-correct' (x ∷ xs) y = +-assoc ⟨ trans ⟩ +-cong refl (+-correct' xs y)

sumNodes = λ x → foldr _+_ ε (map fromLiteral x)

absorptionˡ : ∀ {x y : G} → x + x ⇾ y ≈ x ⇾ y
absorptionˡ = +-comm ⟨ trans ⟩ GT.absorptionˡ 

absorptionʳ : ∀ {x y : G} → y + x ⇾ y ≈ x ⇾ y
absorptionʳ = +-comm ⟨ trans ⟩ GT.absorptionʳ

newArrows-good : ∀ x y → fromLiteral x ⇾ fromLiteral y 
    ≈ fromLiteral x + fromLiteral y + sumNodes (newArrows x y)
newArrows-good (vertex x) (vertex y) = 
  sym (+-cong refl GT.+-identityʳ ⟨ trans ⟩ absorption)
newArrows-good (vertex x) (edge y₁ y₂) =  
  sym (+-cong +-comm (+-cong refl GT.+-identityʳ) 
  ⟨ trans ⟩ (+-assoc ⟨ trans ⟩ +-comm ⟨ trans ⟩ 
    +-cong (sym +-assoc ⟨ trans ⟩ +-cong absorptionˡ refl) refl) 
  ⟨ trans ⟩ sym decomposition 
  ⟨ trans ⟩ ⇾-assoc)
newArrows-good (edge x₁ x₂) (vertex y) = 
  sym (+-assoc ⟨ trans ⟩ 
    +-cong refl (sym +-assoc ⟨ trans ⟩ +-cong absorptionʳ GT.+-identityʳ) 
  ⟨ trans ⟩ sym +-assoc ⟨ trans ⟩ 
  sym decomposition)
newArrows-good (edge x₁ x₂) (edge y₁ y₂) = 
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

⇾₁-preserves : ∀ x y → fromLiteral x ⇾ fromLiteral y ≈ fromNF (x ⇾₁ y)
⇾₁-preserves x y =
 begin
  fromLiteral x ⇾ fromLiteral y
   ≈⟨ newArrows-good x y ⟩
  fromLiteral x + fromLiteral y + sumNodes (newArrows x y)
   ≈⟨ +-assoc ⟩
  fromNF (x ∷ y ∷ (newArrows x y))
   ≈⟨ refl ⟩
  fromNF (x ⇾₁ y)
 ∎

⇾ʳ-preserves : ∀ x y → fromLiteral x ⇾ fromNF y ≈ fromNF (x ⇾ʳ y)
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
