
  module BoolAlg≤ ( Algebra : BooleanAlgebra ₀ ₀ ) where
    open BooleanAlgebra Algebra public
    open BooleanAlgebra Algebra using () renaming (_≈_ to _B≈_)
    Bool = Carrier
    _≤_ : Bool → Bool → Set
    x ≤ y = x B≈ x ∧ y
record IsSemilattice {A : Set} (_~_ : A → A → Set) (_∧_ : A → A → A) : Set where
 open Algebra.FunctionProperties _~_
 field
  isSemigroup : IsSemigroup _~_ _∧_
  comm : Commutative _∧_
  idemp : Idempotent _∧_


  module WithBooleanAlgebra 
      ( Algebra : BooleanAlgebra ₀ ₀ ) 
      ( [_]_ : let open BoolAlg≤ Algebra renaming(_≈_ to _≈-b_) in
               Bool → P → P )
      where

--    p + q ≈ q 
--  → [ b ] x + [ b ] (x + y) ≈ [ b ] (x + y)
    

    open BoolAlg≤ Algebra
{-    []-+-distrib : ∀ b x y → [ b ] x + [ b ] y ≈ [ b ] (x + y)
    []-+-distrib b x y =
     begin
      [ b ] x + [ b ] y
       ≈⟨ {!!} ⟩
      [ b ] x + [ b ] (x + y)
       ≈⟨ {!!} ⟩
      [ b ] (x + y)
     ∎ -}
    


  module WithPatternMatching where
    open import Data.Bool

    [_]_ : Bool → P → P
    [ true ] c = c
    [ false ] c = ε

    []-+-distrib : ∀ b x y → [ b ] x + [ b ] y ≈ [ b ] (x + y)
    []-+-distrib true x y = refl
    []-+-distrib false x y = idempotence

    []-⇾-distrib : ∀ b x y → [ b ] x ⇾ [ b ] y ≈ [ b ] (x ⇾ y)
    []-⇾-distrib true x y = refl
    []-⇾-distrib false x y = ⇾-identityˡ

    []-eps-ident : ∀ b → [ b ] ε ≈ ε
    []-eps-ident true = refl
    []-eps-ident false = refl

    +-is-∨ : ∀ f g a → [ f ] a + [ g ] a ≈ [ f ∨ g ] a
    +-is-∨ true true a = idempotence
    +-is-∨ true false a = +-identityʳ
    +-is-∨ false true a = +-identityˡ
    +-is-∨ false false a = idempotence

    ][-is-∧ : ∀ f g a → [ f ] [ g ] a ≈ [ f ∧ g ] a
    ][-is-∧ true true a = refl
    ][-is-∧ true false a = refl
    ][-is-∧ false true a = refl
    ][-is-∧ false false a = refl

  module WithExplicitAxioms
     (Bool : Set)
     (true false : Bool)
     (bool-elim : ∀ (x : Bool) → {P : Bool → Set} → P false → P true → P x)
     ([_]_ : Bool → P → P)
     ([false] : ∀ {x} → [ false ] x ≈ ε)
     ([true] : ∀ {x} → [ true ] x ≈ x)
     where

    bracket : ∀ {a b c d} → a ≈ b → c ≈ d → b ≈ d → a ≈ c
    bracket ab cd bd = ab ≈≈≈ bd ≈≈≈ sym cd

    []-+-distrib : ∀ b x y → [ b ] x + [ b ] y ≈ [ b ] (x + y)
    []-+-distrib b x y = bool-elim b
      (bracket ([false] ⟨ +-cong ⟩ [false]) [false]
         idempotence)
      
      (bracket ([true] ⟨ +-cong ⟩ [true]) [true]
         refl)

    []-⇾-distrib : ∀ b x y → [ b ] x ⇾ [ b ] y ≈ [ b ] (x ⇾ y)
    []-⇾-distrib b x y = bool-elim b

      (bracket ([false] ⟨ ⇾-cong ⟩ [false]) [false] 
            ⇾-identityˡ)

      (bracket ([true] ⟨ ⇾-cong ⟩ [true]) [true] 
           refl)
