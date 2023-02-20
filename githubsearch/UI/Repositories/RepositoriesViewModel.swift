import Foundation

@MainActor
final class RepositoriesViewModel: ObservableObject {
  @Published var repositories: [Repository]?
  @Published var searchText: String = ""
  @Published var error: Error?

  var searchRepository: GitSearchRepository

  init(
    searchRepository: GitSearchRepository = RemoteSearchRepository()
  ) {
    self.searchRepository = searchRepository
  }
  
  func getReposListData() {
    if searchText.isEmpty {
      repositories = nil
    } else {
      Task {
        do {
          let repositories = try await searchRepository.fetchRepos(searchText: searchText)
          self.repositories = repositories
        } catch {
          self.error = error
          self.repositories = []
        }
      }
    }
  }
}
