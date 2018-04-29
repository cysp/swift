// RUN: %target-run-simple-swift
// REQUIRES: executable_test
// REQUIRES: swift_test_mode_optimize
//
// Utilities tests.

import TensorFlow
import StdlibUnittest

var UtilitiesTests = TestSuite("Utilities")

UtilitiesTests.test("RandomNumberSequence") {
  var globalSequence = RandomNumberSequence()
  let globalSequenceValues = Array(globalSequence.prefix(5))
  expectFailure {
    expectEqual(globalSequenceValues[0], globalSequenceValues[1])
    expectEqual(globalSequenceValues[0], globalSequenceValues[2])
    expectEqual(globalSequenceValues[0], globalSequenceValues[3])
    expectEqual(globalSequenceValues[0], globalSequenceValues[4])
  }

  var seededSequence = RandomNumberSequence(seed: 0)
  let seededSequenceValues = Array(seededSequence.prefix(5))
  expectFailure {
    expectEqual(seededSequenceValues[0], seededSequenceValues[1])
    expectEqual(seededSequenceValues[0], seededSequenceValues[2])
    expectEqual(seededSequenceValues[0], seededSequenceValues[3])
    expectEqual(seededSequenceValues[0], seededSequenceValues[4])
  }
}

runAllTests()
