module PG.Formulae where

module PGF (B V : Set) where

 infixl 13 _+_
 infixl 18 _⇾_

 data PGFormula : Set where
  _+_ : (x y : PGFormula) → PGFormula
  _⇾_ : (x y : PGFormula) → PGFormula
  ε : PGFormula
  var : (a : V) → PGFormula
  [_]_ : (c : B) → PGFormula → PGFormula

open PGF public

infixl 5 _∨_
infixl 6 _∧_

data BoolFormula X : Set where
  var : X → BoolFormula X
  _∨_ _∧_ : BoolFormula X → BoolFormula X → BoolFormula X
  ¬_ : BoolFormula X → BoolFormula X
  ⊤ ⊥ : BoolFormula X


pg-eval : {A B G : Set}
  → (_+ˢ_ _⇾ˢ_ : G → G → G) 
  → (εˢ : G) 
  → (varˢ : A → G) 
  → (condˢ : B → G → G) 
  → PGFormula B A → G
pg-eval {A} {B} {G} _+ˢ_ _⇾ˢ_ εˢ varˢ condˢ = go where
  go : PGFormula B A → G
  go (x + y) = go x +ˢ go y
  go (x ⇾ y) = go x ⇾ˢ go y
  go ε = εˢ
  go (var a) = varˢ a
  go ([ c ] y) = condˢ c (go y)
