module IPM where

module Zogo {X : Set} where
  id : X → X
  id x = x

open Zogo

record True : Set where
data False : Set where

fid : False → False
fid = id

tid : True → True
tid = id
