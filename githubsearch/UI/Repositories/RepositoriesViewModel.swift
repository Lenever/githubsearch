import Foundation

@MainActor
final class RepositoriesViewModel: ObservableObject {
  @Published var repositories: [Repository]?
  @Published var searchText: String = ""
  @Published var error: Error?
  var pageNumber : Int?
  
  init() {}
  
  func getReposListData() {
    if searchText.isEmpty {
      repositories = nil
    } else {
      Task {
        do {
          let response = try await APIClient.shared.request(URL(string: "https://api.github.com/search/repositories?q=\(searchText)")!, expectedResponseType: SearchRepositoryResponse.self)
          self.repositories = response.items
          print(response)
        } catch {
          self.error = error
          self.repositories = []
          print(error)
        }
      }
    }
  }
}
