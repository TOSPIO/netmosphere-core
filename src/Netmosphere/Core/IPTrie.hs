{-# LANGUAGE PackageImports #-}

module Netmosphere.Core.IPTrie where

import "bytestring-trie" Data.Trie as T
import Netmosphere.Core.IP

newtype (IP ip) => IPTrie ip = IPTrie {unTrie :: Trie Int} deriving Show


empty :: (IP ip) => IPTrie ip
empty = IPTrie {unTrie=T.empty}

insert :: (IP ip) => ip -> IPTrie ip -> IPTrie ip
insert ip ipTrie = ipTrie {unTrie=T.insert (toByteString ip) 1 (unTrie ipTrie)}

delete :: (IP ip) => ip -> IPTrie ip -> IPTrie ip
delete ip ipTrie = ipTrie {unTrie=T.delete (toByteString ip)(unTrie ipTrie)}

lookup :: (IP ip) => ip -> IPTrie ip -> Maybe ip
lookup ip ipTrie = case T.lookup (toByteString ip) (unTrie ipTrie) of
  Nothing -> Nothing
  (Just _) -> Just ip

match :: (IP ip) => ip -> IPTrie ip -> Maybe ip
match ip ipTrie = case T.match (unTrie ipTrie) (toByteString ip) of
  Nothing -> Nothing
  (Just (prefix, _, _)) -> Just $ fromByteString prefix


-- I should learn more about firewall and TCP/IP before I decide to be devoted to this work.
