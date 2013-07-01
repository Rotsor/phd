module PG.GraphAlgebra where

open import Algebra
import Algebra.FunctionProperties
open import Algebra.Structures
open import Relation.Binary

open import Data.Product
open import PG.Eq

record GraphOps (G : Set) : Set where
 infixl 13 _+_
 infixl 18 _⇾_
 field
  _+_ : (p q : G) → G
  _⇾_ : (p q : G) → G
  ε : G

record IsGraph {G : Set} (Eq : Eq G) (Ops : GraphOps G) : Set where
 open GraphOps Ops
 open Eq Eq renaming (_≈_ to _≈_)
 field
  +cong : ∀ {p q r s} → p ≈ r → q ≈ s → p + q ≈ r + s
  ⇾cong : ∀ {p q r s} → p ≈ r → q ≈ s → p ⇾ q ≈ r ⇾ s
  ≈iseq : IsEquivalence _≈_

  +assoc : ∀ {p q r} → (p + q) + r ≈ p + (q + r)
  +comm : ∀ {p q} → p + q ≈ q + p
  ⇾assoc : ∀ {p q r} → (p ⇾ q) ⇾ r ≈ p ⇾ (q ⇾ r)
  ⇾identityˡ : ∀ {p} → ε ⇾ p ≈ p
  ⇾identityʳ : ∀ {p} → p ⇾ ε ≈ p
  distribˡ : {p q r : G} → p ⇾ (q + r) ≈ p ⇾ q + p ⇾ r
  distribʳ : {p q r : G} → (p + q) ⇾ r ≈ p ⇾ r + q ⇾ r
  decomposition : {p q r : G} → p ⇾ q ⇾ r ≈ p ⇾ q + p ⇾ r + q ⇾ r
 open IsEquivalence ≈iseq public

record Graph (G : Set) : Set₁ where
 field
  eq : Eq G
  ops : GraphOps G
  isGraph : IsGraph eq ops
 open IsGraph isGraph public
 open Eq eq public
 open GraphOps ops public

import Level
open Level using () renaming (zero to ₀)

import Relation.Binary.EqReasoning 
open import Function
open import Data.List hiding([_])

import Relation.Binary.PropositionalEquality

module GraphTheory {P : Set} (graph : Graph P) where
  open Graph graph

  open Relation.Binary.EqReasoning record { isEquivalence = ≈iseq }
  open import Relation.Binary

  _≈≈≈_ : {p q r : P} → p ≈ q → q ≈ r → p ≈ r
  x ≈≈≈ y = trans x y

  infixl 8 _≈≈≈_

  +cong₁ : {p q r : P} → p ≈ r → p + q ≈ r + q
  +cong₁ p≈r = p≈r ⟨ +cong ⟩ refl

  +cong₂ : {p q r : P} → q ≈ r → p + q ≈ p + r
  +cong₂ q≈r = refl ⟨ +cong ⟩ q≈r

  ⇾cong₂ : {p q r : P} → q ≈ r → p ⇾ q ≈ p ⇾ r
  ⇾cong₂ q≈r = refl ⟨ ⇾cong ⟩ q≈r

  ⇾cong₁ : {p q r : P} → p ≈ r → p ⇾ q ≈ r ⇾ q
  ⇾cong₁ p≈r = p≈r ⟨ ⇾cong ⟩ refl

  rdeco : ∀ {a} → a + a + ε ≈ a
  rdeco {a} =
   begin
    a + a + ε
     ≈⟨ sym (⇾identityʳ ⟨ +cong ⟩ ⇾identityʳ ⟨ +cong ⟩ ⇾identityʳ) ⟩
    a ⇾ ε + a ⇾ ε + ε ⇾ ε
     ≈⟨ sym decomposition ⟩
    a ⇾ ε ⇾ ε
     ≈⟨ ⇾identityʳ ≈≈≈ ⇾identityʳ ⟩
    a
   ∎

  +identityʳ : ∀ {a} → a + ε ≈ a
  +identityʳ {a} =
   begin
    a + ε
     ≈⟨ sym rdeco ⟩
    (a + ε) + (a + ε) + ε
     ≈⟨ +cong₁ 
        (+assoc ≈≈≈ (+cong₂ (+comm ≈≈≈ +assoc) ≈≈≈ sym +assoc)) 
        ≈≈≈ +assoc ⟩
    a + a + (ε + ε + ε)
     ≈⟨ +cong₂ rdeco ⟩
    a + a + ε 
     ≈⟨ rdeco ⟩
    a
   ∎

  +identityˡ : {p : P} → ε + p ≈ p
  +identityˡ = +comm ≈≈≈ +identityʳ

  idempotence : ∀ {p} → p + p ≈ p
  idempotence {p} = sym +identityʳ ≈≈≈ rdeco

  absorption : ∀ {a b} → a ⇾ b + a + b ≈ a ⇾ b
  absorption {a} {b} =
   begin
    a ⇾ b + a + b
     ≈⟨ sym (refl ⟨ +cong ⟩ ⇾identityʳ ⟨ +cong ⟩  ⇾identityʳ) ⟩
    (a ⇾ b) + (a ⇾ ε) + (b ⇾ ε)
     ≈⟨ sym decomposition ⟩
    a ⇾ b ⇾ ε
     ≈⟨ ⇾identityʳ ⟩
    a ⇾ b
   ∎

  absorptionˡ : {p q : P} → p ⇾ q + p ≈ p ⇾ q
  absorptionˡ {p} {q} =
   begin
    p ⇾ q + p
     ≈⟨ +cong₁ (sym absorption) ⟩
    p ⇾ q + p + q + p
     ≈⟨ +assoc ≈≈≈ +cong₂ +comm ≈≈≈ (sym +assoc ≈≈≈ +cong₁ +assoc)  ⟩
    p ⇾ q + (p + p) + q
     ≈⟨ +cong₁ (+cong₂ idempotence) ⟩
    p ⇾ q + p + q
     ≈⟨ absorption ⟩
    p ⇾ q
   ∎

  absorptionʳ : ∀ {p} {q} → p ⇾ q + q ≈ p ⇾ q
  absorptionʳ {p} {q} =
   begin
    p ⇾ q + q
     ≈⟨ +cong₁ (sym absorption) ⟩
    p ⇾ q + p + q + q
     ≈⟨ +assoc ⟩
    p ⇾ q + p + (q + q)
     ≈⟨ +cong₂ idempotence ⟩
    p ⇾ q + p + q
     ≈⟨ absorption ⟩
    p ⇾ q
   ∎

  _⊆_ : (p q : P) → Set
  p ⊆ q = p + q ≈ q

  infix 10 _⊆_

  leastElement : {p : P} → ε ⊆ p
  leastElement = +identityˡ

  p+q⊆p⇾q : {p q : P} → p + q ⊆ p ⇾ q
  p+q⊆p⇾q = +comm ≈≈≈ sym +assoc ≈≈≈ absorption

  ⊆refl₀ : {p : P} → p ⊆ p
  ⊆refl₀ = idempotence

  ⊆refl : {p q : P} → p ≈ q → p ⊆ q
  ⊆refl p≈q = +cong₁ p≈q ≈≈≈ idempotence

  ⊆antisym : {p q : P} → p ⊆ q → q ⊆ p → p ≈ q
  ⊆antisym p+q≈q q+p≈p = sym (+comm ≈≈≈ q+p≈p) ≈≈≈ p+q≈q

  ⊆trans : {p q r : P} → p ⊆ q → q ⊆ r → p ⊆ r
  ⊆trans {p} {q} {r} p+q≈q q+r≈r = 
   begin
    p + r
     ≈⟨ sym (+assoc ≈≈≈ +cong₂ q+r≈r) ⟩
    p + q + r
     ≈⟨ +cong₁ p+q≈q ≈≈≈ q+r≈r ⟩
    r
   ∎

  ⊆isPartialOrder : IsPartialOrder _≈_ _⊆_
  ⊆isPartialOrder = record 
     { isPreorder = record
         { isEquivalence = ≈iseq
         ; trans = ⊆trans
         ; reflexive = ⊆refl
         }
     ; antisym = ⊆antisym
     }

  +isSemigroup : IsSemigroup _≈_ _+_
  +isSemigroup = record
    { isEquivalence = ≈iseq
    ; assoc = λ x y z → +assoc {x} {y} {z}
    ; ∙cong = +cong 
    }

  +isCommutativeMonoid : IsCommutativeMonoid _≈_ _+_ ε
  +isCommutativeMonoid = record 
    { isSemigroup = +isSemigroup
    ; identityˡ = λ x → +identityˡ {x}
    ; comm = λ x y → +comm {x} {y} 
    }

  ⇾isSemigroup : IsSemigroup _≈_ _⇾_
  ⇾isSemigroup = record
    { isEquivalence = ≈iseq
    ; assoc = λ x y z → ⇾assoc {x} {y} {z}
    ; ∙cong = ⇾cong
    }

  ⇾isMonoid : IsMonoid _≈_ _⇾_ ε
  ⇾isMonoid = record 
    { isSemigroup = ⇾isSemigroup
    ; identity = (λ x → ⇾identityˡ {x}) , (λ x → ⇾identityʳ {x}) 
    }

  cpogIsSemiringWithoutAnnihilatingZero 
     : IsSemiringWithoutAnnihilatingZero _≈_ _+_ _⇾_ ε ε
  cpogIsSemiringWithoutAnnihilatingZero = record 
    { +isCommutativeMonoid = +isCommutativeMonoid
    ; *isMonoid = ⇾isMonoid
    ; distrib = (λ _ _ _ → distribˡ) , (λ _ _ _ → distribʳ)
    }

  +monotony : {p q r s : P} → p ⊆ q → r ⊆ s → p + r ⊆ q + s
  +monotony {p} {q} {r} {s} p+q≈q r+s≈s = 
   begin
    (p + r) + (q + s)
      ≈⟨ sym +assoc ≈≈≈ 
           +cong₁ (+assoc ≈≈≈ +cong₂ +comm ≈≈≈ sym +assoc) 
         ≈≈≈ +assoc ⟩
    (p + q) + (r + s)
      ≈⟨ p+q≈q ⟨ +cong ⟩ r+s≈s ⟩
    q + s
   ∎

  +preserves_⊆_ : _+_ Preserves₂ _⊆_ ⟶ _⊆_ ⟶ _⊆_
  +preserves_⊆_ = +monotony

  ⇾arg1Monotony : {p q r : P} → p ⊆ q → p ⇾ r ⊆ q ⇾ r
  ⇾arg1Monotony p+q≈q = sym distribʳ ≈≈≈ ⇾cong₁ p+q≈q

  ⇾arg2Monotony : {p r s : P} → r ⊆ s → p ⇾ r ⊆ p ⇾ s
  ⇾arg2Monotony r+s≈s = sym distribˡ ≈≈≈ ⇾cong₂ r+s≈s

  ⇾monotony : {p q r s : P} → p ⊆ q → r ⊆ s → p ⇾ r ⊆ q ⇾ s
  ⇾monotony p+q≈q r+s≈s = ⊆trans (⇾arg1Monotony p+q≈q) (⇾arg2Monotony r+s≈s)

  ⇾preserves_⊆_ : _⇾_ Preserves₂ _⊆_ ⟶ _⊆_ ⟶ _⊆_
  ⇾preserves_⊆_ = ⇾monotony
