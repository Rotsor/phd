import System.Environment
import System.IO
import Data.List.Split

writeFileUtf8 f txt = withFile f WriteMode (\ hdl -> hSetEncoding hdl utf8 >> hPutStr hdl txt)

main = do
  hSetEncoding stdin utf8
  ["-o1", out1, "-o2", out2] <- getArgs
  let separator = "%%%%%%% BREAK HERE %%%%%%%"
  text <- getContents
  let [part1, part2] = splitOn separator text
  writeFileUtf8 out1 part1
  writeFileUtf8 out2 part2
