module PG.AlgebraicStructures where

open import PG.GraphAlgebra

open import Algebra
import Algebra.FunctionProperties
open import Algebra.Structures
open import Relation.Binary hiding(IsEquivalence)
open import Data.Product

record GraphOps (G : Set) : Set where
 infixl 13 _+_
 infixl 18 _⇾_
 field
  _+_ : (p q : G) → G
  _⇾_ : (p q : G) → G
  ε : G

open import PG.Eq

record IsGraph {G : Set} (Eq : PreEq G) (Ops : GraphOps G) : Set where
 open GraphOps Ops
 open PreEq Eq renaming (_≈_ to _≈_)
 field
  +-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p + q ≈ r + s
  ⇾-cong : ∀ {p q r s} → p ≈ r → q ≈ s → p ⇾ q ≈ r ⇾ s
  ≈-is-eq : IsEquivalence Eq

  +-assoc : ∀ {p q r} → (p + q) + r ≈ p + (q + r)
  +-comm : ∀ {p q} → p + q ≈ q + p
  ⇾-assoc : ∀ {p q r} → (p ⇾ q) ⇾ r ≈ p ⇾ (q ⇾ r)
  ⇾-identityˡ : ∀ {p} → ε ⇾ p ≈ p
  ⇾-identityʳ : ∀ {p} → p ⇾ ε ≈ p
  distribˡ : {p q r : G} → p ⇾ (q + r) ≈ p ⇾ q + p ⇾ r
  distribʳ : {p q r : G} → (p + q) ⇾ r ≈ p ⇾ r + q ⇾ r
  decomposition : {p q r : G} → p ⇾ q ⇾ r ≈ p ⇾ q + p ⇾ r + q ⇾ r
 open IsEquivalence ≈-is-eq public
 equivalence = record { is-eq = ≈-is-eq }

record Graph (G : Set) : Set₁ where
 field
  eq : PreEq G
  ops : GraphOps G
  isGraph : IsGraph eq ops
 open IsGraph isGraph public
 open PreEq eq public
 open GraphOps ops public


import PG.Formula-Eq

module AboutFormulas where
  open import PG.Formula

  formula-graph-ops : ∀ {V : Set} → GraphOps (Graph-formula V)
  formula-graph-ops = record
      { _+_ = _+_
      ; _⇾_ = _⇾_
      ; ε = ε }

  pg-eval' : ∀ {V G : Set} → (V → G) → GraphOps G → Graph-formula V → G
  pg-eval' f ops = pg-eval Ops._+_ Ops._⇾_ Ops.ε f where
    module Ops = GraphOps ops

  module Proof {V G : Set} (graph : Graph G) (f : V → G) where

    open PG.Formula-Eq
    _≈ᶠ_ = _≈_
    module G = Graph graph
    open G
    _≈ˢ_ = G._≈_
    eval = pg-eval' f ops
    formula-eq-imples-graph-eq : {p q : Graph-formula V} → p ≈ᶠ q → eval p ≈ˢ eval q
    formula-eq-imples-graph-eq _≈_.refl = G.refl
    formula-eq-imples-graph-eq (_≈_.trans eq₁ eq₂) = G.trans (formula-eq-imples-graph-eq eq₁) (formula-eq-imples-graph-eq eq₂)
    formula-eq-imples-graph-eq (_≈_.sym eq₁) = G.sym (formula-eq-imples-graph-eq eq₁)
    formula-eq-imples-graph-eq (_≈_.+-cong eq₁ eq₂) = G.+-cong (formula-eq-imples-graph-eq eq₁) (formula-eq-imples-graph-eq eq₂)
    formula-eq-imples-graph-eq (_≈_.⇾-cong eq₁ eq₂) = G.⇾-cong (formula-eq-imples-graph-eq eq₁) (formula-eq-imples-graph-eq eq₂)
    formula-eq-imples-graph-eq _≈_.+-assoc = G.+-assoc
    formula-eq-imples-graph-eq _≈_.+-comm = G.+-comm
    formula-eq-imples-graph-eq _≈_.⇾-assoc = G.⇾-assoc
    formula-eq-imples-graph-eq _≈_.⇾-identityˡ = G.⇾-identityˡ
    formula-eq-imples-graph-eq _≈_.⇾-identityʳ = G.⇾-identityʳ
    formula-eq-imples-graph-eq _≈_.distribˡ = G.distribˡ
    formula-eq-imples-graph-eq _≈_.distribʳ = G.distribʳ
    formula-eq-imples-graph-eq _≈_.decomposition = G.decomposition
    

  -- Equivalence between formulae expressed in terms of their semantics
  -- (both formulae evaluate to equivalent graphs)
  _≈ˢ_ : ∀ {V : Set} → Graph-formula V → Graph-formula V → Set₁
  _≈ˢ_ {V} f1 f2 = ∀ {G : Set} → (pg-algebra : Graph G) → (f : V → G)
      → let open Graph pg-algebra in pg-eval' f ops f1 ≈ pg-eval' f ops f2

  open PG.Formula-Eq

  formula-eq-imples-graph-eq : ∀ {V : Set} {f g : Graph-formula V} →
     f ≈ g → f ≈ˢ g
  formula-eq-imples-graph-eq eq graph f = Proof.formula-eq-imples-graph-eq graph f eq

open import PG.Formula using(Graph-formula)

module WithGraph {P : Set} (graph : Graph P) where

  open Graph graph
  module Theory-of-formulas = GraphTheory {P}
  open import PG.Function
  import PG.Reasoning
  open PG.Reasoning equivalence

  eval = AboutFormulas.pg-eval' (λ x → x) ops

  _⊆_ : (p q : P) → Set
  p ⊆ q = p + q ≈ q

  by-formula-eq : ∀ {f g} → PG.Formula-Eq._≈_ f g → eval f ≈ eval g
  by-formula-eq eq = AboutFormulas.formula-eq-imples-graph-eq eq graph (λ x → x)

  +-identityˡ : {p : P} → ε + p ≈ p
  +-identityˡ {p} =
    by-formula-eq (Theory-of-formulas.+-identityˡ {PG.Formula.var _})

  absorption : ∀ {a b : P} → a ⇾ b + a + b ≈ a ⇾ b
  absorption = by-formula-eq (Theory-of-formulas.absorption {PG.Formula.var _} {PG.Formula.var _})

  idempotence : ∀ {p : P} → p + p ≈ p
  idempotence = by-formula-eq (Theory-of-formulas.idempotence {PG.Formula.var _})

  +-cong₁ : {p q r : P} → p ≈ r → p + q ≈ r + q
  +-cong₁ p≈r = p≈r ⟨ +-cong ⟩ refl

  +-cong₂ : {p q r : P} → q ≈ r → p + q ≈ p + r
  +-cong₂ q≈r = refl ⟨ +-cong ⟩ q≈r

  ⇾-cong₂ : {p q r : P} → q ≈ r → p ⇾ q ≈ p ⇾ r
  ⇾-cong₂ q≈r = refl ⟨ ⇾-cong ⟩ q≈r

  ⇾-cong₁ : {p q r : P} → p ≈ r → p ⇾ q ≈ r ⇾ q
  ⇾-cong₁ p≈r = p≈r ⟨ ⇾-cong ⟩ refl

  _≈≈≈_ = trans

  infixl 8 _≈≈≈_

  infix 10 _⊆_

  leastElement : {p : P} → ε ⊆ p
  leastElement = +-identityˡ

  p+q⊆p⇾q : {p q : P} → p + q ⊆ p ⇾ q
  p+q⊆p⇾q = +-comm ≈≈≈ sym +-assoc ≈≈≈ absorption

  ⊆-refl₀ : {p : P} → p ⊆ p
  ⊆-refl₀ = idempotence

  ⊆-refl : {p q : P} → p ≈ q → p ⊆ q
  ⊆-refl p≈q = +-cong₁ p≈q ≈≈≈ idempotence

  ⊆-antisym : {p q : P} → p ⊆ q → q ⊆ p → p ≈ q
  ⊆-antisym p+q≈q q+p≈p = sym (+-comm ≈≈≈ q+p≈p) ≈≈≈ p+q≈q

  ⊆-trans : {p q r : P} → p ⊆ q → q ⊆ r → p ⊆ r
  ⊆-trans {p} {q} {r} p+q≈q q+r≈r = 
   begin
    (p + r)
     ≈⟨ (sym (+-assoc ≈≈≈ +-cong₂ q+r≈r)) ⟩
    (p + q + r)
     ≈⟨ (+-cong₁ p+q≈q ≈≈≈ q+r≈r) ⟩
    r
   ∎

  +monotony : {p q r s : P} → p ⊆ q → r ⊆ s → p + r ⊆ q + s
  +monotony {p} {q} {r} {s} p+q≈q r+s≈s = 
   begin
    (p + r) + (q + s)
      ≈⟨ sym +-assoc ≈≈≈ 
           +-cong₁ (+-assoc ≈≈≈ +-cong₂ +-comm ≈≈≈ sym +-assoc) 
         ≈≈≈ +-assoc ⟩
    (p + q) + (r + s)
      ≈⟨ p+q≈q ⟨ +-cong ⟩ r+s≈s ⟩
    q + s
   ∎

  +-preserves-_⊆_ : ∀ {x y u v} → x ⊆ y → u ⊆ v → (x + u) ⊆ (y + v)
  +-preserves-_⊆_ = +monotony

  ⇾arg1Monotony : {p q r : P} → p ⊆ q → p ⇾ r ⊆ q ⇾ r
  ⇾arg1Monotony p+q≈q = sym distribʳ ≈≈≈ ⇾-cong₁ p+q≈q

  ⇾arg2Monotony : {p r s : P} → r ⊆ s → p ⇾ r ⊆ p ⇾ s
  ⇾arg2Monotony r+s≈s = sym distribˡ ≈≈≈ ⇾-cong₂ r+s≈s

  ⇾monotony : {p q r s : P} → p ⊆ q → r ⊆ s → p ⇾ r ⊆ q ⇾ s
  ⇾monotony p+q≈q r+s≈s = ⊆-trans (⇾arg1Monotony p+q≈q) (⇾arg2Monotony r+s≈s)

  ⇾-preserves-_⊆_ : ∀ {x y u v} → x ⊆ y → u ⊆ v → (x ⇾ u) ⊆ (y ⇾ v)
  ⇾-preserves-_⊆_ = ⇾monotony

  stdlib-isEquivalence : Relation.Binary.IsEquivalence _≈_
  stdlib-isEquivalence = record {
    refl = IsEquivalence.refl ≈-is-eq;
    trans = IsEquivalence.trans ≈-is-eq;
    sym = IsEquivalence.sym ≈-is-eq
   }

  ⊆-isPartialOrder : IsPartialOrder _≈_ _⊆_
  ⊆-isPartialOrder = record 
     { isPreorder = record
         { isEquivalence = stdlib-isEquivalence
         ; trans = ⊆-trans
         ; reflexive = ⊆-refl
         }
     ; antisym = ⊆-antisym
     }

  +-isSemigroup : IsSemigroup _≈_ _+_
  +-isSemigroup = record
    { isEquivalence = stdlib-isEquivalence
    ; assoc = λ x y z → +-assoc {x} {y} {z}
    ; ∙-cong = +-cong 
    }

  +-isCommutativeMonoid : IsCommutativeMonoid _≈_ _+_ ε
  +-isCommutativeMonoid = record 
    { isSemigroup = +-isSemigroup
    ; identityˡ = λ x → +-identityˡ {x}
    ; comm = λ x y → +-comm {x} {y} 
    }

  ⇾-isSemigroup : IsSemigroup _≈_ _⇾_
  ⇾-isSemigroup = record
    { isEquivalence = stdlib-isEquivalence
    ; assoc = λ x y z → ⇾-assoc {x} {y} {z}
    ; ∙-cong = ⇾-cong
    }

  ⇾-isMonoid : IsMonoid _≈_ _⇾_ ε
  ⇾-isMonoid = record 
    { isSemigroup = ⇾-isSemigroup
    ; identity = (λ x → ⇾-identityˡ {x}) , (λ x → ⇾-identityʳ {x}) 
    }

  cpogIsSemiringWithoutAnnihilatingZero 
     : IsSemiringWithoutAnnihilatingZero _≈_ _+_ _⇾_ ε ε
  cpogIsSemiringWithoutAnnihilatingZero = record 
    { +-isCommutativeMonoid = +-isCommutativeMonoid
    ; *-isMonoid = ⇾-isMonoid
    ; distrib = (λ _ _ _ → distribˡ) , (λ _ _ _ → distribʳ)
    }
