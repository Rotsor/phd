module PG.List where

data List (A : Set) : Set where
  [] : List A
  _∷_ : A → List A → List A

infixr 20 _∷_

foldr : ∀ {A B : Set} → (A → B → B) → B → List A → B
foldr f b [] = b
foldr f b (x ∷ xs) = f x (foldr f b xs)

map : ∀ {A B} → (A → B) → List A → List B
map f [] = []
map f (x ∷ xs) = f x ∷ map f xs

_++_ : ∀ {A} → List A → List A → List A
[] ++ l = l
(x ∷ xs) ++ l = x ∷ (xs ++ l)

concat : ∀ {A} → List (List A) → List A
concat [] = []
concat (x ∷ xs) = x ++ concat xs

concatMap : ∀ {A B} → (A → List B) → List A → List B
concatMap f l = concat (map f l)
