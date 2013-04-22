import Data.List
import System.Process
import System.Environment

gogo file = case fmap reverse $ stripPrefix (reverse ".svg") (reverse file) of 
  Nothing -> error "why u no .svg-file???"
  Just name -> runProcess "inkscape" [name++".svg", "--export-pdf", name++".pdf"] Nothing Nothing Nothing Nothing Nothing

main=do
  args <- getArgs
  mapM_ gogo args

