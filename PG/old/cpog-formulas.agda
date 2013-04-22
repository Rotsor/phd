module cpog-formulas where

open import cpogs
open import Data.Bool
open import Data.Sum
open import Data.Product
import Data.List as List
open List using (List; []; _∷_; foldr; _++_; concatMap)
open import Function
import Relation.Binary.PropositionalEquality as PE


record FMap (Key : Set) (Val : Key → Set) : Set₁ where
 KV = Σ Key Val
 field
  M : Set
  empty : M
  insert : KV → M → M
  delete : Key → M → M
  _≈_ : M → M → Set
  toList : M → List KV
  emptyList-is-empty : PE._≡_ (toList empty) []

open import Algebra
import Level
open Level renaming (zero to ₀)

data PGFormula (A B : Set) : Set where
  _+_ : (x y : PGFormula A B) → PGFormula A B
  _⇾_ : (x y : PGFormula A B) → PGFormula A B
  ε : PGFormula A B
  prim : (a : A) → PGFormula A B
  cond : (b : B) → (x : PGFormula A B) → PGFormula A B

mapPrims : ∀ {A₁ A₂ B : Set} → (A₁ → A₂) → PGFormula A₁ B → PGFormula A₂ B
mapPrims f (x + y) = mapPrims f x + mapPrims f y
mapPrims f (x ⇾ y) = mapPrims f x ⇾ mapPrims f y
mapPrims f ε = ε
mapPrims f (prim a) = prim (f a)
mapPrims f (cond b x) = cond b (mapPrims f x)

{- module Dummy 
   (A : Set) (G : Set) (g-cpog : Cpog G) (prim⟦_⟧ : A → G) 
   (Bool-Alg : BooleanAlgebra ₀ ₀) where
 open BooleanAlgebra Bool-Alg using (⊤; _∨_; _∧_) renaming (Carrier to B) 
 open Cpog g-cpog using (_~_) renaming (_+_ to _⟦+⟧_; _⇾_ to _⟦⇾⟧_; ε to ⟦ε⟧)

 Formula = PGFormula A B

 Assignment = B → Bool

 [_]_ : Bool → G → G
 [ true ] g = g
 [ false ] _ = ⟦ε⟧

 _[_] : Formula → Assignment → G
 (x + y) [ ass ] = x [ ass ] ⟦+⟧ y [ ass ]
 (x ⇾ y) [ ass ] = x [ ass ] ⟦⇾⟧ y [ ass ]
 ε [ ass ] = ⟦ε⟧
 prim a [ ass ] = prim⟦ a ⟧
 cond b x [ ass ] = [ ass b ] (x [ ass ])

 _IsEquivalentTo_ : Formula → Formula → Set
 a IsEquivalentTo b = 
    ∀ assignment → a [ assignment ] ~ b [ assignment ]
 
 open import Relation.Binary
 import AlgebraToFunctionLifting
 open AlgebraToFunctionLifting G _~_ Assignment Formula _[_]
 formula-cpog : Cpog Formula
 formula-cpog = record
   { _~_ = _IsEquivalentTo_
   ; ε = ε
   ; _+_ = _+_
   ; _⇾_ = _⇾_
   ; isCpog = record 
     { +-isCommutativeMonoid = lift-isCommutativeMonoid (λ f g b → refl) (λ b → refl) +-isCommutativeMonoid
     ; ⇾-isMonoid = lift-isMonoid (λ f g b → refl) (λ b → refl) ⇾-isMonoid
     ; distribˡ = {!!}
     ; distribʳ = {!!}
     ; decomposition = {!!} 
     } 
   } where 
   open CpogTheory _ g-cpog
   open Cpog g-cpog hiding (ε; _+_; _⇾_)

 Vertex = A
 Arc = A × A
 Node = Vertex ⊎ Arc

 nodeFormula : Node → Formula
 nodeFormula (inj₁ v) = prim v
 nodeFormula (inj₂ (a , b)) = prim a ⇾ prim b

 nodeCond : Node → B → Formula
 nodeCond n b = cond b (nodeFormula n)

 module WithFMap (M-Impl : FMap Node (λ _ → B)) where
  open FMap M-Impl renaming (M to NF)

  fromNF : NF → Formula
  fromNF nf = foldr _+_ ε (List.map (uncurry nodeCond) (toList nf))

  _+-nf_ : (A B : NF) → ∃ (λ nf → (fromNF A + fromNF B) IsEquivalentTo fromNF nf)
  _+-nf_ A B = {!!}

  _⇾-nf_ : (A B : NF) → ∃ (λ nf → (fromNF A ⇾ fromNF B) IsEquivalentTo fromNF nf)
  _⇾-nf_ A B = {!!}

  open Cpog formula-cpog using ()
  open CpogTheory _ formula-cpog using (trans; _+-cong_; ⇾-cong)

  existsNF : (f : Formula) → Σ NF (λ nf → f IsEquivalentTo fromNF nf)
  existsNF (x + y) with existsNF x | existsNF y
  ... | xnf , x-isEq | ynf , y-isEq with xnf +-nf ynf
  ... | res , isEq = res , (_+-cong_ {x} {fromNF xnf} {y} {fromNF ynf} x-isEq y-isEq ⟨ trans {x + y} {fromNF xnf + fromNF ynf} {fromNF res} ⟩ isEq)
  existsNF (x ⇾ y) with existsNF x | existsNF y
  ... | xnf , x-isEq | ynf , y-isEq with xnf ⇾-nf ynf
  ... | res , isEq = res , (⇾-cong {x} {fromNF xnf} {y} {fromNF ynf} x-isEq y-isEq ⟨ trans {x ⇾ y} {fromNF xnf ⇾ fromNF ynf} {fromNF res} ⟩ isEq)
  existsNF ε = empty , ({!!})
  existsNF (prim a) = insert (inj₁ a , ⊤) empty , ({!!})
  existsNF (cond b x) = {!!} , {!!}
-}
open import Relation.Binary 

record Eq (A : Set) : Set₁ where
 infixl 10 _≈_
 field
  _≈_ : A → A → Set

module WithAC (A C : Set) where
  record CpogFormula : Set where
   F = PGFormula A C
   field
    f-cpog : IsCpog F

module AlmostNF 
    (C : Set)
    (A : Set)
    (F-Eq : Eq (PGFormula A C))
--    (
 where
  open Eq F-Eq
  open import Data.Empty

  F = PGFormula A C
  Lit = C × A

  F1 = PGFormula Lit ⊥

  L2 = List Lit
  F2 = List L2

  L3 = Lit ⊎ Lit × Lit
  F3 = List L3

  L4 = Lit ⊎ (C × (A × A))
  F4 = List L4

  sumBy : ∀ {X : Set} → (f : X → F) → List X → F
  sumBy f = foldr _+_ ε ∘ List.map f

  fromL : Lit → F
  fromL (c , a) = cond c (prim a)

  fromF1 : F1 → F
  fromF1 (x + y) = fromF1 x + fromF1 y
  fromF1 (x ⇾ y) = fromF1 x ⇾ fromF1 y
  fromF1 ε = ε
  fromF1 (prim l) = fromL l
  fromF1 (cond () x)

  fromL2 = foldr _⇾_ ε ∘ List.map fromL
  fromF2 = sumBy fromL2

  fromL3 : L3 → F
  fromL3 (inj₁ l) = fromL l
  fromL3 (inj₂ (l , r)) = fromL l ⇾ fromL r

  fromF3 : F3 → F
  fromF3 = sumBy fromL3

  fromL4 : L4 → F
  fromL4 (inj₁ l) = fromL l
  fromL4 (inj₂ (c , a , b)) = cond c (prim a ⇾ prim b)
  fromF4 = sumBy fromL4

  cond₁ : C → F1 → F1
  cond₁ c = mapPrims applyC where
    applyC : Lit → Lit
    applyC (b , x) = {!c ∧ b!} , x

  toF1 : F → F1
  toF1 (x + y) = toF1 x + toF1 y
  toF1 (x ⇾ y) = toF1 x ⇾ toF1 y
  toF1 ε = ε
  toF1 (prim a) = prim ({! ⊤!} , a)
  toF1 (cond b x) = cond₁ b (toF1 x)

  pairwise++ : ∀ {A : Set} → List (List A) → List (List A) → List (List A)
  pairwise++ as bs = concatMap (λ a → List.map (_++_ a) bs) as

  toF2 : F1 → F2
  toF2 (x + y) = toF2 x ++ toF2 y
  toF2 (x ⇾ y) = pairwise++ ([] ∷ toF2 x) ([] ∷ toF2 y)
  toF2 ε = []
  toF2 (prim a) = (a ∷ []) ∷ []
  toF2 (cond () x)

  toL3s : L2 → List L3
  toL3s [] = []
  toL3s (x ∷ []) = (inj₁ x) ∷ []
  toL3s (x ∷ y ∷ xs) = (inj₂ (x , y)) ∷ (toL3s (x ∷ xs) ++ toL3s (y ∷ xs))

  toF3 : F2 → F3
  toF3 = concatMap toL3s

  toL4s : L3 → List L4
  toL4s (inj₁ x) = inj₁ x ∷ []
  toL4s (inj₂ ((b , x) , (c , y))) =  inj₁ (b , x) ∷ inj₁ (c , y) ∷ inj₂ ({!b ∧ c!} , (x , y)) ∷ []

  toF4 : F3 → F4
  toF4 = concatMap toL4s

  concatMap-good : ∀ {A B : Set} → (f : A → List B) 
         → (fromA : A → F) → (fromB : B → F)
         → (f-good : ∀ a → fromA a ≈ sumBy fromB (f a))
         → ∀ as → sumBy fromA as ≈ sumBy fromB (concatMap f as)
  concatMap-good f fa fb fg [] = {!refl!}
  concatMap-good f fa fb fg (x ∷ xs) = {!cong₂ _+_ (f-good ...) rec ⟨ trans ⟩
     fuse-sumbys  !}

  cond₁-good : ∀ f c → cond c (fromF1 f) ≈ fromF1 (cond₁ c f)
  cond₁-good (x + y) c = {!cond-+-distr ⟨ ⟩ cong₂ _+_ rec rec!}
  cond₁-good (x ⇾ y) c = {!cond-⇾-distr ⟨ ⟩ cong₂ _+_ rec rec!}
  cond₁-good ε c = {!fixed-point!}
  cond₁-good (prim a) c = {!cond-and!}
  cond₁-good (cond () x) c

  toF1-good : ∀ f → f ≈ fromF1 (toF1 f)
  toF1-good (x + y) = {!+-cong₂ rec rec!}
  toF1-good (x ⇾ y) = {!⇾-cong₂ rec rec!}
  toF1-good ε = {!refl!}
  toF1-good (prim a) = {!1 is fixed point :)!}
  toF1-good (cond b x) = {!cond₁-good and rec!}

  toF2-good : ∀ f → fromF1 f ≈ fromF2 (toF2 f)
  toF2-good (x + y) = {!recs ⟨ ⟩ generalize sum-++-commute!}
  toF2-good (x ⇾ y) = {! pairwise++ is O_O !}
  toF2-good ε = {!refl!}
  toF2-good (prim a) = {!identities!}
  toF2-good (cond () x)

  toL3s-good : ∀ l → fromL2 l ≈ fromF3 (toL3s l)
  toL3s-good [] = {!refl!}
  toL3s-good (x ∷ []) = {!identities!}
  toL3s-good (x ∷ y ∷ xs) = {!deco ⟨ ⟩ fuse foldr ⟨ ⟩ rec!}

  toF3-good : ∀ f → fromF2 f ≈ fromF3 (toF3 f)
  toF3-good = concatMap-good toL3s fromL2 fromL3 toL3s-good

  toL4s-good : ∀ l → fromL3 l ≈ fromF4 (toL4s l)
  toL4s-good (inj₁ x) = {!identityʳ!}
  toL4s-good (inj₂ ((b , x) , (c , y))) = {!case-analyze?!}

  toF4-good : ∀ f → fromF3 f ≈ fromF4 (toF4 f)
  toF4-good f = concatMap-good toL4s fromL3 fromL4 toL4s-good f
