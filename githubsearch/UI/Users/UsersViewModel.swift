import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
  @Published var users:  [User]?
  @Published var searchText: String = ""
  @Published var error: Error?

  var searchRepository: GitSearchRepository

  init(
    searchRepository: GitSearchRepository = RemoteSearchRepository()
  ) {
    self.searchRepository = searchRepository
  }

  func getUsersListData() {
    if searchText.isEmpty {
      self.users = nil
    } else {
      Task {
        do {
          let users = try await searchRepository.fetchUsers(searchText: searchText)
          self.users = users
        } catch {
          self.users = []
          self.error = error
        }
      }
    }
  }
}
