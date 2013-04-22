
module PG.PGAlgebra where

open import PG.GraphAlgebra
open import PG.Eq
open import Algebra.Structures

record BoolOps (B : Set) : Set where
 infix 8 ¬
 infixr 7 _∧_
 infixr 6 _∨_
 field
  _∨_ : B → B → B
  _∧_ : B → B → B
  ¬ : B → B
  ⊤ : B
  ⊥ : B

record PGOps (B G : Set) : Set where
 infix 20 [_]_
 field
  graph-ops : GraphOps G
  [_]_ : B → G → G
 open GraphOps graph-ops public

IsBoolAlg : {B : Set} → (B-eq : Eq B) → (bool-ops : BoolOps B) → Set
IsBoolAlg (equality eq) ops = let open BoolOps ops in IsBooleanAlgebra eq _∨_ _∧_ ¬ ⊤ ⊥

record IsPG {B G : Set} (B-eq : Eq B) (G-eq : Eq G) (PG-ops : PGOps B G) (B-ops : BoolOps B) : Set where
 open PGOps PG-ops
 open Eq G-eq
 open Eq B-eq renaming (_≈_ to _B≈_)
 open BoolOps B-ops
 field
  is-graph : IsGraph G-eq graph-ops
  is-bool : IsBoolAlg B-eq B-ops

  cond-cong : ∀ {f g x y} → f B≈ g → x ≈ y → [ f ] x ≈ [ g ] y

  true-condition : ∀ x → [ ⊤ ] x ≈ x
  false-condition : ∀ x → [ ⊥ ] x ≈ ε
  and-condition : ∀ f g x → [ f ∧ g ] x ≈ [ f ] [ g ]  x
  or-condition : ∀ f g x → [ f ∨ g ] x ≈ [ f ] x + [ g ]  x
  conditional-+ : ∀ f x y → [ f ] (x + y) ≈ [ f ] x + [ f ] y
  conditional-⇾ : ∀ f x y → [ f ] (x ⇾ y) ≈ [ f ] x ⇾ [ f ] y
--  conditional-ε : ∀ f → [ f ] ε ≈ ε
 open PGOps PG-ops public
 open Eq G-eq public
 open IsGraph is-graph public
 open IsBooleanAlgebra is-bool public using ()
 open BoolOps B-ops public

record PG (B G : Set) : Set₁ where
 field
  B-eq : Eq B
  G-eq : Eq G
  pg-ops : PGOps B G
  B-ops : BoolOps B
  isPg : IsPG B-eq G-eq pg-ops B-ops
 open IsPG isPg public
