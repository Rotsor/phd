
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
  graphops : GraphOps G
  [_]_ : B → G → G
 open GraphOps graphops public

IsBoolAlg : {B : Set} → (Beq : Eq B) → (boolops : BoolOps B) → Set
IsBoolAlg (equality eq) ops = let open BoolOps ops in 
  IsBooleanAlgebra eq _∨_ _∧_ ¬ ⊤ ⊥

record IsPG {B G : Set} 
  (Beq : Eq B) (Geq : Eq G) 
  (PGops : PGOps B G) (Bops : BoolOps B) : Set where
 open PGOps PGops
 open Eq Geq
 open Eq Beq renaming (_≈_ to _B≈_)
 open BoolOps Bops
 field
  isgraph : IsGraph Geq graphops
  isbool : IsBoolAlg Beq Bops

  condcong : ∀ {f g x y} → f B≈ g → x ≈ y → [ f ] x ≈ [ g ] y

  truecondition : ∀ x → [ ⊤ ] x ≈ x
  falsecondition : ∀ x → [ ⊥ ] x ≈ ε
  andcondition : ∀ f g x → [ f ∧ g ] x ≈ [ f ] [ g ]  x
  orcondition : ∀ f g x → [ f ∨ g ] x ≈ [ f ] x + [ g ]  x
  conditional+ : ∀ f x y → [ f ] (x + y) ≈ [ f ] x + [ f ] y
  conditional⇾ : ∀ f x y → [ f ] (x ⇾ y) ≈ [ f ] x ⇾ [ f ] y
 open PGOps PGops public
 open Eq Geq public
 open IsGraph isgraph public
 open IsBooleanAlgebra isbool public using ()
 open BoolOps Bops public

record PG (B G : Set) : Set₁ where
 field
  Beq : Eq B
  Geq : Eq G
  pgops : PGOps B G
  Bops : BoolOps B
  isPg : IsPG Beq Geq pgops Bops
 open IsPG isPg public
