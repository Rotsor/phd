module PG.Function where


infixl 1 _⟨_⟩_

_⟨_⟩_ : ∀ {a b c} {A : Set a} {B : Set b} {C : Set c} →
        A → (A → B → C) → B → C
x ⟨ f ⟩ y = f x y
