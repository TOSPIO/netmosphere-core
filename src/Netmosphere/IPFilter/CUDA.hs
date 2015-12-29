{-# LANGUAGE PackageImports #-}

module Netmosphere.IPFilter.CUDA where

import Data.Array.Accelerate as Acc
       (
         Acc,
         Scalar,
         Vector,
         fold,
         zipWith
       )
import Data.Array.Accelerate.CUDA as CUDA
import "bytestring-trie" Data.Trie

dotp :: Acc (Vector Float) -> Acc (Vector Float) -> Acc (Scalar Float)
dotp xs ys = fold (+) 0 (A.zipWith (*) xs ys)

