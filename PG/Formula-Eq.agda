
module PG.Formula-Eq where

open import PG.Formulae
open import PG.GraphAlgebra
open import PG.PGAlgebra
open import Function

pg-eval' : ∀ {B V G : Set} → (V → G) → PGOps B G → PGFormula B V → G
pg-eval' f ops = pg-eval Ops._+_ Ops._⇾_ Ops.ε f Ops.[_]_ where
  module Ops = PGOps ops

_≈ˢ_ : ∀ {B V : Set} → PGFormula B V → PGFormula B V → Set₁
_≈ˢ_ {B} {V} f1 f2 = ∀ {G : Set} → (pg-algebra : PG B G) → (f : V → G) 
    → let open PG pg-algebra in pg-eval' f pg-ops f1 ≈ pg-eval' f pg-ops f2 

module EQC where
 data EquivClosure {X : Set} (_~_ : X → X → Set) : X → X → Set where
  refl : ∀ {f} → EquivClosure _~_ f f
  trans : ∀ {a b c} → a ~ b → b ~ c → EquivClosure _~_ a c
  sym : ∀ {a b} → a ~ b → EquivClosure _~_ b a

open EQC
open EQC public using(EquivClosure; module EquivClosure)


formula-graph-ops : ∀ {B V : Set} → GraphOps (PGFormula B V)
formula-graph-ops = record 
    { _+_ = _+_
    ; _⇾_ = _⇾_
    ; ε = ε }

formula-ops : {B V : Set} → PGOps B (PGFormula B V)
formula-ops = record 
  { graph-ops = formula-graph-ops
  ; [_]_ = [_]_ }

module WithBV {B : Set} {V : Set} where

 infix 3 _≈_
 infix 3 _B≈_

 data _B≈_ : BoolFormula B → BoolFormula B → Set where

  isEquivalence : ∀ {a b} → EquivClosure _B≈_ a b → a B≈ b
  ∧-cong : ∀ {p q r s} → p B≈ r → q B≈ s → p ∧ q B≈ r ∧ s
  ∨-cong : ∀ {p q r s} → p B≈ r → q B≈ s → p ∨ q B≈ r ∨ s
  ¬-cong : ∀ {p q} → p B≈ q → ¬ p B≈ ¬ q

  ∨-complementʳ : ∀ {x} → x ∨ ¬ x B≈ ⊤
  ∧-complementʳ : ∀ {x} → x ∧ ¬ x B≈ ⊥

  ∨-comm : ∀ {x y} → x ∨ y B≈ y ∨ x
  ∨-assoc : ∀ {x y z} → (x ∨ y) ∨ z B≈ x ∨ (y ∨ z)
  ∧-comm : ∀ {x y} → x ∧ y B≈ y ∧ x
  ∧-assoc : ∀ {x y z} → (x ∧ y) ∧ z B≈ x ∧ (y ∧ z)
  ∨-absorbs-∧ : ∀ {x y} → x ∨ (x ∧ y) B≈ x
  ∧-absorbs-∨ : ∀ {x y} → x ∧ (x ∨ y) B≈ x
  ∨-distributes : ∀ {x y z} → (y ∧ z) ∨ x B≈ (y ∨ x) ∧ (z ∨ x)

 data _≈_ : PGFormula (BoolFormula B) V → PGFormula (BoolFormula B) V → Set where
  isEquivalence : ∀ {a b} → EquivClosure _≈_ a b → a ≈ b
  +-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p + q ≈ r + s
  ⇾-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p ⇾ q ≈ r ⇾ s

  +-assoc : ∀ {p q r} → (p + q) + r ≈ p + (q + r)
  +-comm : ∀ {p q} → p + q ≈ q + p
  ⇾-assoc : ∀ {p q r} → (p ⇾ q) ⇾ r ≈ p ⇾ (q ⇾ r)
  ⇾-identityˡ : ∀ {p} → ε ⇾ p ≈ p
  ⇾-identityʳ : ∀ {p} → p ⇾ ε ≈ p
  distribˡ : ∀ {p q r} → p ⇾ (q + r) ≈ p ⇾ q + p ⇾ r
  distribʳ : ∀ {p q r} → (p + q) ⇾ r ≈ p ⇾ r + q ⇾ r
  decomposition : ∀ {p q r} → p ⇾ q ⇾ r ≈ p ⇾ q + p ⇾ r + q ⇾ r

  cond-cong : ∀ {f g p q} → f B≈ g → p ≈ q → [ f ] p ≈ [ g ] q

  true-condition : ∀ {x} → [ ⊤ ] x ≈ x
  false-condition : ∀ {x} → [ ⊥ ] x ≈ ε
  or-condition : ∀ {f g x} → [ f ∨ g ] x ≈ [ f ] x + [ g ] x
  and-condition : ∀ {f g x} → [ f ∧ g ] x ≈ [ f ] [ g ] x

  conditional-+ : ∀ {f x y} → [ f ] (x + y) ≈ [ f ] x + [ f ] y
  conditional-⇾ : ∀ {f x y} → [ f ] (x ⇾ y) ≈ [ f ] x ⇾ [ f ] y
  conditional-ε : ∀ {f} → [ f ] ε ≈ ε

 open import Relation.Binary

 is-eq-by-closure : ∀ {X : Set} {_~_ : X → X → Set} → (∀ {a b} → EquivClosure _~_ a b → a ~ b) → IsEquivalence _~_
 is-eq-by-closure fromClosure = record
   { refl = fromClosure refl
   ; sym = λ eq → fromClosure (sym eq)
   ; trans = λ l r → fromClosure (trans l r) 
   }

 ≈-is-equivalence : IsEquivalence _≈_
 ≈-is-equivalence = is-eq-by-closure isEquivalence

 B≈-is-equivalence : IsEquivalence _B≈_
 B≈-is-equivalence = is-eq-by-closure isEquivalence

 bool-formula-ops : ∀ {B : Set} → BoolOps (BoolFormula B)
 bool-formula-ops = record 
   { _∨_ = _∨_
   ; _∧_ = _∧_
   ; ¬ = ¬_
   ; ⊤ = ⊤
   ; ⊥ = ⊥ }
 open import PG.Eq
 open import Data.Product

 bool-formula-is-bool-alg : IsBoolAlg (equality _B≈_) bool-formula-ops
 bool-formula-is-bool-alg = record 
                            { isDistributiveLattice = record { 
                                isLattice = record {
                                              isEquivalence = B≈-is-equivalence;
                                              ∨-comm = λ x y → ∨-comm;
                                              ∨-assoc = λ x y z → ∨-assoc;
                                              ∨-cong = ∨-cong;
                                              ∧-comm = λ x y → ∧-comm;
                                              ∧-assoc = λ x y z → ∧-assoc;
                                              ∧-cong = ∧-cong;
                                              absorptive = (λ x y → ∨-absorbs-∧) , (λ x y → ∧-absorbs-∨) }; 
                                ∨-∧-distribʳ = λ x y z → ∨-distributes }
                            ; ∨-complementʳ = λ x → ∨-complementʳ
                            ; ∧-complementʳ = λ x → ∧-complementʳ
                            ; ¬-cong = ¬-cong 
                            }

 pgformula-is-graph : IsGraph (equality _≈_) formula-graph-ops
 pgformula-is-graph = record {
                        +-cong = +-cong;
                        ⇾-cong = ⇾-cong;
                        ≈-is-eq = ≈-is-equivalence;
                        +-assoc = +-assoc;
                        +-comm = +-comm;
                        ⇾-assoc = ⇾-assoc;
                        ⇾-identityˡ = ⇾-identityˡ;
                        ⇾-identityʳ = ⇾-identityʳ;
                        distribˡ = distribˡ;
                        distribʳ = distribʳ;
                        decomposition = decomposition }

 pgformula-is-pg : IsPG (equality _B≈_) (equality _≈_) formula-ops bool-formula-ops
 pgformula-is-pg = record {
                     is-graph = pgformula-is-graph;
                     is-bool = bool-formula-is-bool-alg;
                     cond-cong = λ l r → cond-cong l r;
                     true-condition = λ x → true-condition;
                     false-condition = λ x → false-condition;
                     and-condition = λ f g x → and-condition;
                     or-condition = λ f g x → or-condition;
                     conditional-+ = λ f x y → conditional-+;
                     conditional-⇾ = λ f x y → conditional-⇾ }


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
  go conditional-ε = {!!}
 formulaeq-equivalent2 : ∀ f g → f ≈ˢ g → f ≈ g
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
