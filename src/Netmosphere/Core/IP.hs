module Netmosphere.Core.IP where

import Data.Word
import Data.ByteString as BS

class IP ip where
  toByteString :: ip -> ByteString
  fromByteString :: ByteString -> ip


newtype IPv4 = IPv4 (Word8, Word8, Word8, Word8) deriving Show


instance IP IPv4 where
  toByteString (IPv4 (w1, w2, w3, w4)) =
    w1 `cons` w2 `cons` w3 `cons` w4 `cons` BS.empty
  fromByteString = IPv4 . mk4Tuple . unpack
    where
      mk4Tuple :: (Num a) => [a] -> (a, a, a, a)
      mk4Tuple [] = (0, 0, 0, 0)
      mk4Tuple [a1] = (a1, 0, 0, 0)
      mk4Tuple [a1, a2] = (a1, a2, 0, 0)
      mk4Tuple [a1, a2, a3] = (a1, a2, a3, 0)
      mk4Tuple [a1,a2,a3,a4] = (a1, a2, a3, a4)
      mk4Tuple _ = error "Invalid IPv4 data"

int4ToIPv4 :: (Int, Int, Int, Int) -> IPv4
int4ToIPv4 (s1, s2, s3, s4) = let
  s1' = fromIntegral s1
  s2' = fromIntegral s2
  s3' = fromIntegral s3
  s4' = fromIntegral s4
  in
    IPv4 (s1', s2', s3', s4')
