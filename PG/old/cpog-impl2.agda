module cpog-impl2 where

import Level

module Qwe (A : Set) where
 SetOf : ∀ {ℓ} → (A : Set ℓ) → Set _
 SetOf {ℓ} A = A → Set ℓ

 record Graph : Set₁ where
  -- : SetOf A → Graph
  