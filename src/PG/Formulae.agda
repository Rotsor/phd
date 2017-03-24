module PG.Formulae where

module PGF (V : Set) where

 infixl 13 _+_
 infixl 18 _⇾_

 data PGFormula : Set where
  _+_ : (x y : PGFormula) → PGFormula
  _⇾_ : (x y : PGFormula) → PGFormula
  ε : PGFormula
  var : (a : V) → PGFormula

open PGF public

pg-eval : {A G : Set}
  → (_+ˢ_ _⇾ˢ_ : G → G → G) 
  → (εˢ : G) 
  → (varˢ : A → G) 
  → PGFormula A → G
pg-eval {A} {G} _+ˢ_ _⇾ˢ_ εˢ varˢ = go where
  go : PGFormula A → G
  go (x + y) = go x +ˢ go y
  go (x ⇾ y) = go x ⇾ˢ go y
  go ε = εˢ
  go (var a) = varˢ a
