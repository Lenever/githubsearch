import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
  @Published var users:  [User]?
  @Published var searchText: String = ""
  @Published var error: Error?

  init() {}

  func getUsersListData() {
    if searchText.isEmpty {
      self.users = []
    } else {
      Task {
        do {
          let response = try await APIClient.shared.request(URL(string: "https://api.github.com/search/users?q=\(searchText)")!, expectedResponseType: SearchUserResponse.self)
          self.users = response.items
          print(response)
        } catch {
          self.error = error
          self.users = []
          print(error)
        }
      }
    }
  }
}
