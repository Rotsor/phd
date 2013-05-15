import Control.Applicative
import Control.Monad
import Control.Exception
import Data.List
import System.IO
import System.Directory
import System.Process

pwd = getCurrentDirectory
cd = setCurrentDirectory

getDirectories = getDirectoryContents "." >>= filterM doesDirectoryExist . filter (`notElem` [".",".."])
getFiles = getDirectoryContents "." >>= filterM doesFileExist . filter (`notElem` [".",".."])

inSubdir :: FilePath -> IO a -> IO a
inSubdir d x = bracket (pwd <* cd d) cd (\_ -> x)

inAllSubdirs :: IO () -> IO ()
inAllSubdirs x = do
  x
  getDirectories >>= mapM_ (\d -> inSubdir d $ inAllSubdirs x)

stripSuffix s = (reverse <$>) . stripPrefix (reverse s) . reverse

echo str = putStrLn str

main=inAllSubdirs $ do
  getFiles >>= mapM_ (\f -> case stripSuffix ".svg" f of
    Just baseF -> do
      echo ("Processing " ++ show f)
      readProcess "inkscape" ["-E", baseF ++ ".eps", f] "" *> return ()
    Nothing -> return ())
