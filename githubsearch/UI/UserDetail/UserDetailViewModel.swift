import Foundation

@MainActor
final class UserDetailViewModel: ObservableObject {
  @Published var user: User
  @Published var userRepos: [Repository] = []
  @Published var error: Error?

  var apiClient = APIClient.shared

  init(user: User) {
    self.user = user
    fetchUserDetails()
  }

  func fetchUserDetails() {
    getUsersDetails()
    getUserRepoDetails()
  }

  private func getUsersDetails() {
    Task {
      do {
        let user = try await apiClient.request(URL(string: user.url!)!, expectedResponseType: User.self)
        self.user = user
      } catch {
        self.error = error
      }
    }
  }

  private func getUserRepoDetails() {
    Task {
      do {
        let repositories = try await apiClient.request(URL(string: user.reposURL!)!, expectedResponseType: [Repository].self)
        self.userRepos = repositories//.sorted { $0.updatedAt > $1.updatedAt }
      } catch {
        self.error = error
        print(error)
      }
    }
  }
}
