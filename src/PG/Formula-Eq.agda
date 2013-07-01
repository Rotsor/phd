
module PG.FormulaEq where

open import PG.Formulae
open import PG.GraphAlgebra
open import PG.PGAlgebra
open import Function

pgeval' : ∀ {B V G : Set} → (V → G) → PGOps B G → PGFormula B V → G
pgeval' f ops = pgeval Ops._+_ Ops._⇾_ Ops.ε f Ops.[_]_ where
  module Ops = PGOps ops

_≈ˢ_ : ∀ {B V : Set} → PGFormula B V → PGFormula B V → Set₁
_≈ˢ_ {B} {V} f1 f2 = ∀ {G : Set} → (pgalgebra : PG B G) → (f : V → G) 
    → let open PG pgalgebra in pgeval' f pgops f1 ≈ pgeval' f pgops f2 

module EQC where
 data EquivClosure {X : Set} (_~_ : X → X → Set) : X → X → Set where
  refl : ∀ {f} → EquivClosure _~_ f f
  trans : ∀ {a b c} → a ~ b → b ~ c → EquivClosure _~_ a c
  sym : ∀ {a b} → a ~ b → EquivClosure _~_ b a

open EQC
open EQC public using(EquivClosure; module EquivClosure)


formulagraphops : ∀ {B V : Set} → GraphOps (PGFormula B V)
formulagraphops = record 
    { _+_ = _+_
    ; _⇾_ = _⇾_
    ; ε = ε }

formulaops : {B V : Set} → PGOps B (PGFormula B V)
formulaops = record 
  { graphops = formulagraphops
  ; [_]_ = [_]_ }

module WithBV {B : Set} {V : Set} where

 infix 3 _≈_
 infix 3 _B≈_

 data _B≈_ : BoolFormula B → BoolFormula B → Set where

  isEquivalence : ∀ {a b} → EquivClosure _B≈_ a b → a B≈ b
  ∧cong : ∀ {p q r s} → p B≈ r → q B≈ s → p ∧ q B≈ r ∧ s
  ∨cong : ∀ {p q r s} → p B≈ r → q B≈ s → p ∨ q B≈ r ∨ s
  ¬cong : ∀ {p q} → p B≈ q → ¬ p B≈ ¬ q

  ∨complementʳ : ∀ {x} → x ∨ ¬ x B≈ ⊤
  ∧complementʳ : ∀ {x} → x ∧ ¬ x B≈ ⊥

  ∨comm : ∀ {x y} → x ∨ y B≈ y ∨ x
  ∨assoc : ∀ {x y z} → (x ∨ y) ∨ z B≈ x ∨ (y ∨ z)
  ∧comm : ∀ {x y} → x ∧ y B≈ y ∧ x
  ∧assoc : ∀ {x y z} → (x ∧ y) ∧ z B≈ x ∧ (y ∧ z)
  ∨absorbs∧ : ∀ {x y} → x ∨ (x ∧ y) B≈ x
  ∧absorbs∨ : ∀ {x y} → x ∧ (x ∨ y) B≈ x
  ∨distributes : ∀ {x y z} → (y ∧ z) ∨ x B≈ (y ∨ x) ∧ (z ∨ x)

 data _≈_ : PGFormula (BoolFormula B) V → PGFormula (BoolFormula B) V → Set where
  isEquivalence : ∀ {a b} → EquivClosure _≈_ a b → a ≈ b
  +cong : ∀ {p q r s} → p ≈ r → q ≈ s → p + q ≈ r + s
  ⇾cong : ∀ {p q r s} → p ≈ r → q ≈ s → p ⇾ q ≈ r ⇾ s

  +assoc : ∀ {p q r} → (p + q) + r ≈ p + (q + r)
  +comm : ∀ {p q} → p + q ≈ q + p
  ⇾assoc : ∀ {p q r} → (p ⇾ q) ⇾ r ≈ p ⇾ (q ⇾ r)
  ⇾identityˡ : ∀ {p} → ε ⇾ p ≈ p
  ⇾identityʳ : ∀ {p} → p ⇾ ε ≈ p
  distribˡ : ∀ {p q r} → p ⇾ (q + r) ≈ p ⇾ q + p ⇾ r
  distribʳ : ∀ {p q r} → (p + q) ⇾ r ≈ p ⇾ r + q ⇾ r
  decomposition : ∀ {p q r} → p ⇾ q ⇾ r ≈ p ⇾ q + p ⇾ r + q ⇾ r

  condcong : ∀ {f g p q} → f B≈ g → p ≈ q → [ f ] p ≈ [ g ] q

  truecondition : ∀ {x} → [ ⊤ ] x ≈ x
  falsecondition : ∀ {x} → [ ⊥ ] x ≈ ε
  orcondition : ∀ {f g x} → [ f ∨ g ] x ≈ [ f ] x + [ g ] x
  andcondition : ∀ {f g x} → [ f ∧ g ] x ≈ [ f ] [ g ] x

  conditional+ : ∀ {f x y} → [ f ] (x + y) ≈ [ f ] x + [ f ] y
  conditional⇾ : ∀ {f x y} → [ f ] (x ⇾ y) ≈ [ f ] x ⇾ [ f ] y
  conditionalε : ∀ {f} → [ f ] ε ≈ ε

 open import Relation.Binary

 iseqbyclosure : ∀ {X : Set} {_~_ : X → X → Set} 
   → (∀ {a b} → EquivClosure _~_ a b → a ~ b) → IsEquivalence _~_
 iseqbyclosure fromClosure = record
   { refl = fromClosure refl
   ; sym = λ eq → fromClosure (sym eq)
   ; trans = λ l r → fromClosure (trans l r) 
   }

 ≈isequivalence : IsEquivalence _≈_
 ≈isequivalence = iseqbyclosure isEquivalence

 B≈isequivalence : IsEquivalence _B≈_
 B≈isequivalence = iseqbyclosure isEquivalence

 boolformulaops : ∀ {B : Set} → BoolOps (BoolFormula B)
 boolformulaops = record 
   { _∨_ = _∨_
   ; _∧_ = _∧_
   ; ¬ = ¬_
   ; ⊤ = ⊤
   ; ⊥ = ⊥ }
 open import PG.Eq
 open import Data.Product

 boolformulaisboolalg : IsBoolAlg (equality _B≈_) boolformulaops
 boolformulaisboolalg = record 
   { isDistributiveLattice = record { 
       isLattice = record {
         isEquivalence = B≈isequivalence;
         ∨comm = λ x y → ∨comm;
         ∨assoc = λ x y z → ∨assoc;
         ∨cong = ∨cong;
         ∧comm = λ x y → ∧comm;
         ∧assoc = λ x y z → ∧assoc;
         ∧cong = ∧cong;
         absorptive = (λ x y → ∨absorbs∧) , (λ x y → ∧absorbs∨) }; 
       ∨∧distribʳ = λ x y z → ∨distributes }
   ; ∨complementʳ = λ x → ∨complementʳ
   ; ∧complementʳ = λ x → ∧complementʳ
   ; ¬cong = ¬cong 
   }

 pgformulaisgraph : IsGraph (equality _≈_) formulagraphops
 pgformulaisgraph = record {
                        +cong = +cong;
                        ⇾cong = ⇾cong;
                        ≈iseq = ≈isequivalence;
                        +assoc = +assoc;
                        +comm = +comm;
                        ⇾assoc = ⇾assoc;
                        ⇾identityˡ = ⇾identityˡ;
                        ⇾identityʳ = ⇾identityʳ;
                        distribˡ = distribˡ;
                        distribʳ = distribʳ;
                        decomposition = decomposition }

 pgformulaispg : IsPG (equality _B≈_) (equality _≈_) formulaops boolformulaops
 pgformulaispg = record {
                     isgraph = pgformulaisgraph;
                     isbool = boolformulaisboolalg;
                     condcong = λ l r → condcong l r;
                     truecondition = λ x → truecondition;
                     falsecondition = λ x → falsecondition;
                     andcondition = λ f g x → andcondition;
                     orcondition = λ f g x → orcondition;
                     conditional+ = λ f x y → conditional+;
                     conditional⇾ = λ f x y → conditional⇾ }

