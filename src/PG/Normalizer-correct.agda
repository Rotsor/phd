module PG.Normalizercorrect (A B : Set) where

open import Relation.Binary
import Relation.Binary.PropositionalEquality as PropEq
open PropEq using(_≡_)
open import PG.Formulae

module WithOrder {_<_ : A → A → Set} (ASTO : IsStrictTotalOrder _≡_ _<_) where

  open import PG.FormulaEq
  import PG.Normalizer
  open PG.Normalizer.WithOrder A B ASTO renaming (_+_ to _+'_; _⇾_ to _⇾'_)
  open PG.Normalizer A B
  import Data.List as List
  open List using ([]; _∷_; foldr; map)
  open import Function
  open WithBV {B} {A}

  import PG.GraphAlgebra as Alg
  module GT = Alg.GraphTheory (record {isGraph = pgformulaisgraph})
  module BEq = IsEquivalence B≈isequivalence 
  open IsEquivalence ≈isequivalence
  import Relation.Binary.EqReasoning as EqR
  open EqR record { isEquivalence = ≈isequivalence }
  open EqR record { isEquivalence = B≈isequivalence } renaming
    (begin_ to Bbegin_; _≈⟨_⟩_ to _B≈⟨_⟩_; _∎ to _B∎)

  open import Algebra.Structures
  open IsBooleanAlgebra boolformulaisboolalg using
    ()
  open import Algebra.Props.BooleanAlgebra 
    (record {isBooleanAlgebra = boolformulaisboolalg }) using
    (∧∨distrib; ∧complement; ∨complement; 
      ∨∧isCommutativeSemiring; ∧idempotent; ∨idempotent)
  open IsCommutativeSemiring ∨∧isCommutativeSemiring 
    using () renaming (*identity to ∧identity; zero to ∧zero)

  open import Data.Product using (_,_; proj₁; proj₂)
  open import Data.Sum using (inj₁; inj₂)

  absorption : ∀ {x y} → x + y + x ⇾ y ≈ x ⇾ y
  absorption = +comm ⟨ trans ⟩ (sym +assoc ⟨ trans ⟩ GT.absorption)

  lem : ∀ f p → p ≈ [ f ] p + [ ¬ f ] p
  lem f p = 
    begin
      p
        ≈⟨ sym truecondition ⟩
      [ ⊤ ] p
        ≈⟨ condcong (isEquivalence (EQC.sym ∨complementʳ)) refl ⟩
      [ f ∨ ¬ f ] p
        ≈⟨ orcondition ⟩
      [ f ] p + [ ¬ f ] p
    ∎

  caseanalyse : ∀ {f p q} → [ f ] p ≈ [ f ] q → [ ¬ f ] p ≈ [ ¬ f ] q → p ≈ q
  caseanalyse {f} {p} {q} fcase ¬fcase =
    begin
      p
     ≈⟨ lem _ _ ⟩
      [ f ] p + [ ¬ f ] p
     ≈⟨ +cong fcase ¬fcase ⟩
      [ f ] q + [ ¬ f ] q
     ≈⟨ sym (lem _ _) ⟩
      q
    ∎

  elim+ : ∀ {f a b c d} 
    → [ f ] a ≈ [ f ] c → [ f ] b ≈ [ f ] d 
    → [ f ] (a + b) ≈ [ f ] (c + d)
  elim+ a≈c b≈d = 
    trans (trans conditional+ (+cong a≈c b≈d)) (sym conditional+)

  elim⇾ : ∀ {f a b c d} → 
    [ f ] a ≈ [ f ] c → [ f ] b ≈ [ f ] d → 
    [ f ] (a ⇾ b) ≈ [ f ] (c ⇾ d)
  elim⇾ a≈c b≈d = 
    trans (trans conditional⇾ (⇾cong a≈c b≈d)) (sym conditional⇾)

  dupcond : ∀ {f x} → [ f ] [ f ] x ≈ [ f ] x
  dupcond = trans (sym andcondition) (condcong (∧idempotent _) refl)

  falsecond : ∀ {f x} → [ ¬ f ] [ f ] x ≈ [ ¬ f ] ε
  falsecond = trans (sym dupcond) (condcong BEq.refl (trans
    (trans (sym andcondition) 
      (condcong (proj₁ ∧complement _) refl))
    falsecondition
    )
    )

  condswap : ∀ {f g x} → [ f ] [ g ] x ≈ [ g ] [ f ] x
  condswap = trans (sym andcondition) (trans (condcong ∧comm refl) andcondition)

  side1 : ∀ {f g p q} 
    → [ f ] ([ f ] p ⇾ [ g ] q) 
     ≈ [ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
  side1 {f} {g} {p} {q} = 
   begin
    [ f ] ([ f ] p ⇾ [ g ] q)
      ≈⟨ elim⇾ dupcond refl ⟩
    [ f ] (p ⇾ [ g ] q)
      ≈⟨ condcong BEq.refl (caseanalyse {g} 
      (
      begin
        [ g ] (p ⇾ [ g ] q)
          ≈⟨ elim⇾ refl dupcond ⟩
        [ g ] (p ⇾ q)
          ≈⟨ sym (condcong BEq.refl absorption) ⟩
        [ g ] (p + q + p ⇾ q)
          ≈⟨ sym (elim+ (elim+ refl dupcond) dupcond) ⟩
        [ g ] (p + [ g ] q + [ g ] (p ⇾ q))
      ∎
      )
      (trans (elim⇾ refl falsecond) (trans 
        (condcong BEq.refl 
        (trans ⇾identityʳ (sym (trans GT.+identityʳ GT.+identityʳ)))) 
        (sym (elim+ (elim+ refl falsecond) falsecond))))) ⟩
    [ f ] (p + [ g ] q + [ g ] (p ⇾ q))
      ≈⟨ sym (elim+ (elim+ dupcond refl) 
        (trans (condcong BEq.refl andcondition) dupcond)) ⟩
    [ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
    ∎

  side2 : ∀ {f g p q} 
    → [ ¬ f ] ([ f ] p ⇾ [ g ] q) 
    ≈ [ ¬ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
  side2 {f} {g} {p} {q} = 
   begin
    [ ¬ f ] ([ f ] p ⇾ [ g ] q)
      ≈⟨ elim⇾ falsecond refl ⟩
    [ ¬ f ] (ε ⇾ [ g ] q)
      ≈⟨ condcong BEq.refl ⇾identityˡ ⟩
    [ ¬ f ] [ g ] q
      ≈⟨  condcong BEq.refl (sym (trans (GT.+identityʳ) (GT.+identityˡ))) ⟩
    [ ¬ f ] (ε + [ g ] q + ε)
      ≈⟨ sym (elim+ (elim+ falsecond refl) (trans (sym dupcond) 
        (condcong BEq.refl (trans (sym andcondition) 
        (trans (condcong (BEq.trans (BEq.sym ∧assoc)
        (BEq.trans (∧cong (proj₁ ∧complement _) BEq.refl) (proj₁ ∧zero _)))
        refl) falsecondition))))) ⟩
    [ ¬ f ] ([ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q))
    ∎

  conditionregularisation : ∀ {f g} → {p q : PG} 
    → [ f ] p ⇾ [ g ] q ≈ [ f ] p + [ g ] q + [ f ∧ g ] (p ⇾ q)
  conditionregularisation {f} {g} {p} {q} = caseanalyse {f} 
   side1 side2

  
  absorbbycondition : ∀ {f g p} → [ f ] p + [ f ∧ g ] p ≈ [ f ] p
  absorbbycondition {f} {g} {p} = 
    sym orcondition ⟨ trans ⟩ condcong ∨absorbs∧ refl

  conditionregularisation' : ∀ f g p q z
                              → p ⇾ q ≈ p + q + z
                              → [ f ] p ⇾ [ g ] q 
                                ≈ [ f ] p + [ g ] q + [ f ∧ g ] z
  conditionregularisation' f g p q z eq = 
   begin
    [ f ] p ⇾ [ g ] q
     ≈⟨  conditionregularisation  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p ⇾ q)
     ≈⟨  +cong refl (condcong (isEquivalence EQC.refl) eq)  ⟩
    [ f ] p + [ g ] q  + [ f ∧ g ] (p + q + z)
     ≈⟨  +cong refl (conditional+ ⟨ trans ⟩ +cong conditional+ refl)  ⟩
    [ f ] p + [ g ] q  + ([ f ∧ g ] p + [ f ∧ g ] q + [ f ∧ g ] z)
     ≈⟨ sym +assoc ⟨ trans ⟩ +cong (+assoc ⟨ trans ⟩ 
       (+cong refl (sym +assoc ⟨ trans ⟩ +cong +comm refl ⟨ trans ⟩ +assoc) 
       ⟨ trans ⟩ sym +assoc)) refl ⟩
    ([ f ] p + [ f ∧ g ] p) + ([ g ] q + [ f ∧ g ] q)  + [ f ∧ g ] z
     ≈⟨  +cong (+cong absorbbycondition (+cong refl (condcong ∧comm refl)
       ⟨ trans ⟩ absorbbycondition)) refl  ⟩
    [ f ] p + [ g ] q + [ f ∧ g ] z
   ∎

  +correct' : ∀ x y → fromNF x + fromNF y ≈ fromNF (x +' y)
  +correct' [] y = GT.+identityˡ  (fromNF y)
  +correct' (x ∷ xs) y = +assoc ⟨ trans ⟩ +cong refl (+correct' xs y)

  sumNodes = foldr _+_ ε ∘ map fromNode

  absorptionˡ : ∀ {x y} → x + x ⇾ y ≈ x ⇾ y
  absorptionˡ = +comm ⟨ trans ⟩ GT.absorptionˡ 

  absorptionʳ : ∀ {x y} → y + x ⇾ y ≈ x ⇾ y
  absorptionʳ = +comm ⟨ trans ⟩ GT.absorptionʳ

  newArrowsgood : ∀ x y → fromNode x ⇾ fromNode y 
      ≈ fromNode x + fromNode y + sumNodes (newArrows x y)
  newArrowsgood (inj₁ x) (inj₁ y) = 
    sym (+cong refl GT.+identityʳ ⟨ trans ⟩ absorption)
  newArrowsgood (inj₁ x) (inj₂ (y₁ , y₂)) =  
    sym (+cong +comm (+cong refl GT.+identityʳ) 
    ⟨ trans ⟩ (+assoc ⟨ trans ⟩ +comm ⟨ trans ⟩ 
      +cong (sym +assoc ⟨ trans ⟩ +cong absorptionˡ refl) refl) 
    ⟨ trans ⟩ sym decomposition 
    ⟨ trans ⟩ ⇾assoc)
  newArrowsgood (inj₂ (x₁ , x₂)) (inj₁ y) = 
    sym (+assoc ⟨ trans ⟩ 
      +cong refl (sym +assoc ⟨ trans ⟩ +cong absorptionʳ GT.+identityʳ) 
    ⟨ trans ⟩ sym +assoc ⟨ trans ⟩ 
    sym decomposition)
  newArrowsgood (inj₂ (x₁ , x₂)) (inj₂ (y₁ , y₂)) = 
    sym(+assoc ⟨ trans ⟩ +cong refl
     (+cong (sym GT.idempotence) (+cong refl (+cong refl 
        (+cong refl GT.+identityʳ)) ⟨ trans ⟩ sym +assoc ⟨ trans ⟩ +comm)
             ⟨ trans ⟩ sym +assoc
             ⟨ trans ⟩ +cong (+assoc ⟨ trans ⟩ +cong refl +comm) refl
             ⟨ trans ⟩ +comm 
             ⟨ trans ⟩ sym +assoc 
             ⟨ trans ⟩ +cong (sym decomposition) (sym decomposition) 
             ⟨ trans ⟩ +cong ⇾assoc ⇾assoc 
            )
           ⟨ trans ⟩ sym +assoc 
           ⟨ trans ⟩ sym decomposition)

  allmult : ∀ l c → fromNF (List.map (flip _,_ c) l) ≈ [ c ] sumNodes l
  allmult [] c = sym conditionalε
  allmult (x ∷ xs) c =  +cong refl (allmult xs c) ⟨ trans ⟩ sym conditional+

  ⇾₁preserves : ∀ x y → fromLit x ⇾ fromLit y ≈ fromNF (x ⇾₁ y)
  ⇾₁preserves (x , f) (y , g) =
   begin
    fromLit (x , f) ⇾ fromLit (y , g)
     ≈⟨ conditionregularisation' f g _ _ _ (newArrowsgood x y) ⟩
    fromLit (x , f) + fromLit (y , g) + [ f ∧ g ] sumNodes (newArrows x y)
     ≈⟨ +assoc ⟨ trans ⟩ +cong refl 
       (+cong refl (sym (allmult (newArrows x y) (f ∧ g)))) ⟩
    fromNF ((x , f) ∷ (y , g) ∷ (map (flip _,_ (f ∧ g)) (newArrows x y)))
     ≈⟨ refl ⟩
    fromNF ((x , f) ⇾₁ (y , g))
   ∎

  ⇾ʳpreserves : ∀ x y → fromLit x ⇾ fromNF y ≈ fromNF (x ⇾ʳ y)
  ⇾ʳpreserves x [] = ⇾identityʳ ⟨ trans ⟩ sym GT.+identityʳ
  ⇾ʳpreserves x (y ∷ ys) = 
    distribˡ ⟨ trans ⟩ +cong (⇾₁preserves x y) (⇾ʳpreserves x ys) 
    ⟨ trans ⟩ +correct' (x ⇾₁ y) (x ⇾ʳ ys)

  ⇾correct' : ∀ x y → fromNF x ⇾ fromNF y ≈ fromNF (x ⇾' y)
  ⇾correct' [] y = ⇾identityˡ
  ⇾correct' (x ∷ xs) y = 
    distribʳ ⟨ trans ⟩ (+cong (⇾ʳpreserves x y) (⇾correct' xs y) 
    ⟨ trans ⟩ +correct' (x ⇾ʳ y) (xs ⇾' y))

  +correct : ∀ x y → x + y ≈ fromNF (normalize x +' normalize y)
  ⇾correct : ∀ x y → x ⇾ y ≈ fromNF (normalize x ⇾' normalize y)
  normalisecorrect : ∀ f → f ≈ fromNF (normalize f)

  +correct x y = 
    +cong (normalisecorrect x) (normalisecorrect y) ⟨ trans ⟩ 
    +correct' (normalize x) (normalize y) 

  ⇾correct x y = 
    ⇾cong (normalisecorrect x) (normalisecorrect y) ⟨ trans ⟩ 
    ⇾correct' (normalize x) (normalize y) 

  mapConditionscorrect : ∀ c x → [ c ] fromNF x ≈ fromNF (mapConditions (_∧_ c) x)
  mapConditionscorrect c [] = conditionalε
  mapConditionscorrect c (x ∷ xs) = 
    conditional+ ⟨ trans ⟩ +cong (sym andcondition) (mapConditionscorrect c xs)

  normalisecorrect (x + y) = +correct x y
  normalisecorrect (x ⇾ y) = ⇾correct x y
  normalisecorrect ε = refl
  normalisecorrect (var a) =  sym truecondition ⟨ trans ⟩ sym GT.+identityʳ
  normalisecorrect ([ c ] y) = condcong BEq.refl (normalisecorrect y) ⟨ trans ⟩
    mapConditionscorrect c (normalize y)

