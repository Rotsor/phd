
module PG.Normalizer (V : Set) (B : Set) where

open import Data.Empty
open import Data.Sum using(_⊎_; inj₁; inj₂)
open import Function using (id; flip; _∘_)
import Data.Product as Product
open Product using(_,_; _×_)
open import Level using () renaming (zero to ₀)

open import PG.Formulae using (BoolFormula; _∧_; _∨_; ⊤; var; PGFormula; module PGFormula; pg-eval)
open import Relation.Binary
open import Relation.Binary.PropositionalEquality using (_≡_)
import Data.List as List
open List using (foldr; List; concat; _++_; _∷_; []; map)

BF = BoolFormula B
PG = PGFormula BF V

Node = V ⊎ (V × V)
Lit = Node × BF
NF = List Lit

module WithOrder {_<_ : V → V → Set} (A-STO : IsStrictTotalOrder _≡_ _<_) where

  module Semantics where
   open PGFormula

   fromNode : Node → PG
   fromNode (inj₁ x) = var x
   fromNode (inj₂ (x , y)) = var x ⇾ var y

   fromLit : Lit → PG
   fromLit (node , cond) = [ cond ] fromNode node

   fromNF : NF → PG
   fromNF = foldr _+_ ε ∘ map fromLit
  open Semantics public

 {-  import Data.AVL as AVL

  import Ordering
  open Ordering.Sum
  open Ordering.Product
  open import Data.Maybe

  AxA-STO = A-STO ×-isStrictTotalOrder A-STO
  Node-STO = A-STO ⊎-isStrictTotalOrder AxA-STO

  open AVL (λ _ → BF) Node-STO public using (toList; insert; lookup; empty; singleton) renaming (Tree to NF)

  insertWith : (f : BF → BF → BF) → Lit → NF → NF
  insertWith f (k , v) t = insert k (maybe′ (f v) v (lookup k t)) t

  fromListWith : (f : BF → BF → BF) → List Lit → NF
  fromListWith f = foldr (insertWith f) empty -}

   -- foldr (insertWith _or_) b (toList a)
  open import Category.Monad
  open RawMonad (List.monad {₀})

  _+_ : NF → NF → NF
  a + b = a ++ b

  vertices : Node → List V
  vertices (inj₁ x) = x ∷ []
  vertices (inj₂ (x , y)) = x ∷ y ∷ []
  
  newArrows : Node → Node → List Node
  newArrows p q = map inj₂ (vertices p ⊗ vertices q)
  
  _⇾₁_ : Lit → Lit → List Lit
  (p , f) ⇾₁ (q , g) = (p , f) ∷ (q , g) ∷ (map (flip _,_ (f ∧ g)) (newArrows p q))

  _⇾ʳ_ : Lit → NF → NF
  lit ⇾ʳ [] = lit ∷ []
  lit ⇾ʳ (x ∷ xs) = (lit ⇾₁ x) + (lit ⇾ʳ xs)

  _⇾_ : NF → NF → NF
  [] ⇾ b = b
  (h ∷ t) ⇾ b = (h ⇾ʳ b) + (t ⇾ b)

  mapConditions : (BF → BF) → NF → NF
  mapConditions f = map (Product.map id f)

  fromVar : V → NF
  fromVar x = (inj₁ x , ⊤) ∷ []

  addCondition : BF → NF → NF
  addCondition = mapConditions ∘ _∧_

  normalize : PG → NF
  normalize = pg-eval
                _+_
                _⇾_
                []
                fromVar
                addCondition


  open import PG.PGAlgebra using(BoolOps)
