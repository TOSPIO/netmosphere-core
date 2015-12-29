{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

module Netmosphere.Core.Nat where

data Nat = Z | S Nat

type family (n :: Nat) :+ (m :: Nat) :: Nat
type instance 'Z :+ m = m
type instance 'S n :+ m = 'S (n :+ m)

type family (n :: Nat) :* (m :: Nat) :: Nat
type instance 'Z :* m = 'Z
type instance 'S n :* m = n :* m :+ m
