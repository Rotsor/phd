module PG.Formula where

module Formula (V : Set) where

 infixl 13 _+_
 infixl 18 _⇾_

 data Graph-formula : Set where
  _+_ : (x y : Graph-formula) → Graph-formula
  _⇾_ : (x y : Graph-formula) → Graph-formula
  ε : Graph-formula
  var : (a : V) → Graph-formula

open Formula public

pg-eval : {A G : Set}
  → (_+ˢ_ _⇾ˢ_ : G → G → G) 
  → (εˢ : G) 
  → (varˢ : A → G) 
  → Graph-formula A → G
pg-eval {A} {G} _+ˢ_ _⇾ˢ_ εˢ varˢ = go where
  go : Graph-formula A → G
  go (x + y) = go x +ˢ go y
  go (x ⇾ y) = go x ⇾ˢ go y
  go ε = εˢ
  go (var a) = varˢ a
