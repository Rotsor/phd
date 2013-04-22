import System.Environment
import Data.List.Split

main = do
  ["-o1", out1, "-o2", out2] <- getArgs
  let separator = "%%%%%%% BREAK HERE %%%%%%%"
  text <- getContents
  let [part1, part2] = splitOn separator text
  writeFile out1 part1
  writeFile out2 part2
