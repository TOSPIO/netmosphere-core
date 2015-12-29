module Paths_netmosphere_core (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/kj/.cabal/bin"
libdir     = "/home/kj/.cabal/lib/x86_64-linux-ghc-7.10.2/netmosphere-core-0.0.1.0-IoCYH4AXHKu5r2EaEgBuch"
datadir    = "/home/kj/.cabal/share/x86_64-linux-ghc-7.10.2/netmosphere-core-0.0.1.0"
libexecdir = "/home/kj/.cabal/libexec"
sysconfdir = "/home/kj/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "netmosphere_core_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "netmosphere_core_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "netmosphere_core_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "netmosphere_core_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "netmosphere_core_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
