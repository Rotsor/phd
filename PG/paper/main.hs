{-# LANGUAGE OverloadedStrings #-}
module Main where

import Text.LaTeX.Base
import IEEETran
import Data.Monoid
import Data.Text.IO(putStrLn)
import Data.Text(pack)
import System.Process

paper :: Text -> LaTeX
paper body = mconcat
  [ documentclass ["conference"] "IEEEtran"
  , hyphenation "op-tical net-works semi-conduc-tor"
  , document $ mconcat
    [ title "Machine-assisted Formalisation of Parametrised Graph Algebra"
    , ieeeAuthors 
      [ ("Arseniy Alekseyev", "EECE, Newcastle University")
      ]
    , maketitle
    , abstract
      "The paper shows a machine-assisted approach to formal modelling by considering a graph-based model used to describe parametrised systems of causally related events, such as microcontrol circuits. The paper gives a formal description of the model encoded with the type system of Agda programming language, defining it as an arbitrary set with specific operations on its members, forming an algebra. The data structure for formulae of this algebra is then introduced to be used as a representation type for the model. An example of an algorithm manipulating the formulae is shown. The algorithm correctness and termination are proven with each proof being checked by the compiler. The result is both a machine-verifiable formal proof of the theorems and a runnable tool for the formula manipulation."
      , introduction
      , raw body
      , ""
      , ""
    ]
  ]

introduction = section "Introduction" <> "hello"

main = do
  body <- readFile "body.tex"
  body <- readProcess "lhs2TeX" [] body
  Data.Text.IO.putStrLn $ render (paper (pack body))
