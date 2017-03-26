
module PG.Normalizer (V : Set) where

open import PG.Formula using 
  (var; Graph-formula; module Graph-formula; pg-eval)
import PG.List as List
open List using (foldr; List; concat; _++_; _∷_; []; map)

PG = Graph-formula V

data Literal : Set where
  vertex : V → Literal
  edge : V → V → Literal

NF = List Literal

module Semantics where
 open Graph-formula

 fromLiteral : Literal → PG
 fromLiteral (vertex x) = var x
 fromLiteral (edge x y) = var x ⇾ var y

 fromNF : NF → PG
 fromNF nf = foldr _+_ ε (map fromLiteral nf)
open Semantics public

_+_ : NF → NF → NF
a + b = a ++ b

vertices : Literal → List V
vertices (vertex x) = x ∷ []
vertices (edge x y) = x ∷ y ∷ []

newArrows : Literal → Literal → List Literal
newArrows p q =
  List.concatMap (λ v1 → List.map (λ v2 → edge v1 v2) (vertices q)) (vertices p)

_⇾₁_ : Literal → Literal → List Literal
p ⇾₁ q = 
  p ∷ q ∷ newArrows p q

_⇾ʳ_ : Literal → NF → NF
lit ⇾ʳ [] = lit ∷ []
lit ⇾ʳ (x ∷ xs) = (lit ⇾₁ x) + (lit ⇾ʳ xs)

_⇾_ : NF → NF → NF
[] ⇾ b = b
(h ∷ t) ⇾ b = (h ⇾ʳ b) + (t ⇾ b)

fromVar : V → NF
fromVar x = vertex x ∷ []

normalize : PG → NF
normalize = pg-eval
              _+_
              _⇾_
              []
              fromVar
