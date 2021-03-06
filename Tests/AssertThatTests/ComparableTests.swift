import XCTest
import AssertThat

final class ComparableTests: SuppressableTestCase {
    func testIsLessThanSuccess() {
        suppress { assertThat(1).isLessThan(2) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsLessThanFailure() {
        suppress { assertThat(1).isLessThan(1) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsLessThanOrEqualToSuccess() {
        suppress { assertThat(2).isLessThanOrEqualTo(2) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsLessThanOrEqualToFailure() {
        suppress { assertThat(3).isLessThanOrEqualTo(2) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsGreaterThanSuccess() {
        suppress { assertThat(2).isGreaterThan(1) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsGreaterThanFailure() {
        suppress { assertThat(1).isGreaterThan(1) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsGreaterThanOrEqualToSuccess() {
        suppress { assertThat(1).isGreaterThanOrEqualTo(1) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsGreaterThanOrEqualToFailure() {
        suppress { assertThat(0).isGreaterThanOrEqualTo(1) }
        XCTAssertEqual(1, suppressedIssues)
    }

    func testIsBetweenSuccess() {
        suppress {
            assertThat(1).isBetween(1, 3)
            assertThat(2).isBetween(1, 3)
            assertThat(3).isBetween(1, 3)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsBetweenFailure() {
        suppress {
            assertThat(0).isBetween(1, 3)
            assertThat(4).isBetween(1, 3)
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testIsNotBetweenSuccess() {
        suppress {
            assertThat(0).isNotBetween(1, 3)
            assertThat(4).isNotBetween(1, 3)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotBetweenFailure() {
        suppress {
            assertThat(1).isNotBetween(1, 3)
            assertThat(2).isNotBetween(1, 3)
            assertThat(3).isNotBetween(1, 3)
        }
        XCTAssertEqual(3, suppressedIssues)
    }

    func testIsStrictlyBetweenSuccess() {
        suppress { assertThat(2).isStrictlyBetween(1, 3) }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsStrictlyBetweenFailure() {
        suppress {
            assertThat(1).isStrictlyBetween(1, 3)
            assertThat(3).isStrictlyBetween(1, 3)
        }
        XCTAssertEqual(2, suppressedIssues)
    }

    func testIsNotStrictlyBetweenSuccess() {
        suppress {
            assertThat(1).isNotStrictlyBetween(1, 3)
            assertThat(3).isNotStrictlyBetween(1, 3)
        }
        XCTAssertEqual(0, suppressedIssues)
    }

    func testIsNotStrictlyBetweenFailure() {
        suppress {
            suppress { assertThat(2).isNotStrictlyBetween(1, 3) }
        }
        XCTAssertEqual(1, suppressedIssues)
    }
}
