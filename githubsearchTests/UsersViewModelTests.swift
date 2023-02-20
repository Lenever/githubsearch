import Foundation
import XCTest
@testable import githubsearch

class UsersViewModelTests: XCTestCase {

  @MainActor
  func test_getUsersListData() {
    let sut = UsersViewModel()
    sut.getUsersListData()
    XCTAssertEqual(sut.users, nil)
  }
}
