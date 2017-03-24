
module PG.Formula-Eq where

open import PG.Formulae
open import PG.GraphAlgebra
open import Function

pg-eval' : ∀ {V G : Set} → (V → G) → GraphOps G → PGFormula V → G
pg-eval' f ops = pg-eval Ops._+_ Ops._⇾_ Ops.ε f where
  module Ops = GraphOps ops

_≈ˢ_ : ∀ {B V : Set} → PGFormula V → PGFormula V → Set₁
_≈ˢ_ {B} {V} f1 f2 = ∀ {G : Set} → (pg-algebra : Graph G) → (f : V → G)
    → let open Graph pg-algebra in pg-eval' f ops f1 ≈ pg-eval' f ops f2

module EQC where
 data EquivClosure {X : Set} (_~_ : X → X → Set) : X → X → Set where
  refl : ∀ {f} → EquivClosure _~_ f f
  trans : ∀ {a b c} → a ~ b → b ~ c → EquivClosure _~_ a c
  sym : ∀ {a b} → a ~ b → EquivClosure _~_ b a

open EQC
open EQC public using(EquivClosure; module EquivClosure)


formula-graph-ops : ∀ {V : Set} → GraphOps (PGFormula V)
formula-graph-ops = record
    { _+_ = _+_
    ; _⇾_ = _⇾_
    ; ε = ε }

module WithBV {V : Set} where

 infix 3 _≈_

 data _≈_ : PGFormula V → PGFormula V → Set where
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

 open import Relation.Binary

 is-eq-by-closure : ∀ {X : Set} {_~_ : X → X → Set}
   → (∀ {a b} → EquivClosure _~_ a b → a ~ b) → IsEquivalence _~_
 is-eq-by-closure fromClosure = record
   { refl = fromClosure refl
   ; sym = λ eq → fromClosure (sym eq)
   ; trans = λ l r → fromClosure (trans l r) 
   }

 ≈-is-equivalence : IsEquivalence _≈_
 ≈-is-equivalence = is-eq-by-closure isEquivalence

 open import PG.Eq
 open import Data.Product

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

 pgformula-is-pg : IsGraph (equality _≈_) formula-graph-ops
 pgformula-is-pg = pgformula-is-graph
