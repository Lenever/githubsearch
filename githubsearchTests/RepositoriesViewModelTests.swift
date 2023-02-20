import Foundation
import XCTest
@testable import githubsearch

class RepositoriesViewModelTests: XCTestCase {

  @MainActor
  func test_getRepoListData() {
    let sut = RepositoriesViewModel()
    sut.getReposListData()
    XCTAssertEqual(sut.repositories, nil)
  }
}
