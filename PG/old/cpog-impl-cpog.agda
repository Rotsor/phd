module cpog-impl-cpog where

{- open import Data.Nat
 import Data.Nat.Properties as NP
 open import Relation.Binary
 open import cpog-impl
 open Impl ℕ ℕ _<_ (StrictTotalOrder.isStrictTotalOrder NP.strictTotalOrder) -}

 open import cpogs

 _~_ : Φ → Φ → Set
 a ~ b = {!!}

 isCpog : Cpog Φ
 isCpog = record {
            _~_ = {!!};
            ε = empty;
            _+_ = {!!};
            _⇾_ = {!!};
            +-isCommutativeMonoid = {!!};
            ⇾-isMonoid = {!!};
            distribˡ = {!!};
            distribʳ = {!!};
            decomposition = {!!} }