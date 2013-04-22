{-# LANGUAGE OverloadedStrings #-}
module IEEETran where

import Text.LaTeX.Base.Syntax
import Text.LaTeX.Base.Commands

ieeeauthorblockA :: LaTeX -> LaTeX
ieeeauthorblockA x = TeXComm "IEEEauthorblockA" [FixArg x]

ieeeauthorblockN :: LaTeX -> LaTeX
ieeeauthorblockN x = TeXComm "IEEEauthorblockN" [FixArg x]

ieeeAuthor :: LaTeX -> LaTeX -> LaTeX
ieeeAuthor name addr = ieeeauthorblockA name <> ieeeauthorblockN addr

and_ a b = TeXComm "and" [FixArg a, FixArg b]

ieeeAuthors :: [(LaTeX, LaTeX)] -> LaTeX
ieeeAuthors [] = ""
ieeeAuthors l = author $ foldr1 and_ (map (uncurry ieeeAuthor) l)