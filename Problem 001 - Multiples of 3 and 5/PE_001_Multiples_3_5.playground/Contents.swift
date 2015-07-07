// Multiples of 3 and 5
// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

import UIKit
import Foundation

func addAllMultiplesOf(factor: Int, inout toSet numbers: Set<Int>, startingAtLowerBound lowerBound: Int, toUpperBound upperBound: Int) {
  
  assert(factor > 0, "Factor must be greater than 0")
  if factor <= 0 {
    return
  }
  
  assert(lowerBound >= 0, "Lower bound must be greater than or equal to 0")
  if lowerBound < 0 {
    return
  }
  
  assert(upperBound > lowerBound, "Upper bound must be greater than lower bound")
  if upperBound <= lowerBound {
    return
  }

  var lowerBoundHasRemainder: Bool = (lowerBound%factor != 0)
  var currentMultiple: Int = lowerBoundHasRemainder ? lowerBound : ((lowerBound/factor)+1)*factor

  while currentMultiple < upperBound {
    numbers.insert(currentMultiple)
    currentMultiple+=factor
  }
}

func test01() {
  var multiplesOf3: Set<Int> = Set()

  addAllMultiplesOf(3, toSet: &multiplesOf3, startingAtLowerBound: 0, toUpperBound: 10)
  
  for number in sorted(multiplesOf3) {
    print(number)
    print(" ")
  }
  println()
}

func test02() {
  var multiplesOf5: Set<Int> = Set()
  
  addAllMultiplesOf(5, toSet: &multiplesOf5, startingAtLowerBound: 0, toUpperBound: 10)
  
  for number in sorted(multiplesOf5) {
    print(number)
    print(" ")
  }
  println()
}

func test03() {
  var multiplesOf3And5: Set<Int> = Set()
  
  addAllMultiplesOf(3, toSet: &multiplesOf3And5, startingAtLowerBound: 0, toUpperBound: 10)
  addAllMultiplesOf(5, toSet: &multiplesOf3And5, startingAtLowerBound: 0, toUpperBound: 10)
  
  for number in sorted(multiplesOf3And5) {
    print(number)
    print(" ")
  }
  println()
}

test01()
test02()
test03()

func euler() {
  var multiplesOf3And5: Set<Int> = Set()
  
  addAllMultiplesOf(3, toSet: &multiplesOf3And5, startingAtLowerBound: 0, toUpperBound: 1000)
  addAllMultiplesOf(5, toSet: &multiplesOf3And5, startingAtLowerBound: 0, toUpperBound: 1000)

  var sum: Int = 0
  
  for number in multiplesOf3And5 {
    sum+=number
  }

  println(sum)
}

euler()

