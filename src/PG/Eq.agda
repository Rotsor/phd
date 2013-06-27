module PG.Eq where

record Eq (G : Set) : Set₁ where
 constructor equality
 infix 3 _≈_
 field
  _≈_ : G → G → Set
