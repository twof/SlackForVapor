import XCTest

import SlackServiceTests

var tests = [XCTestCaseEntry]()
tests += SlackServiceTests.allTests()
XCTMain(tests)