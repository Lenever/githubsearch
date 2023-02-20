import Foundation

@MainActor
final class UserDetailViewModel: ObservableObject {
  @Published var user: User
  @Published var userRepos: [Repository] = []
  @Published var error: Error?

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
        let response = try await APIClient.shared.request(URL(string: user.url!)!, expectedResponseType: User.self)
        self.user = response
      } catch {
        self.error = error
        print(error)
      }
    }
  }

  private func getUserRepoDetails() {
    Task {
      do {
        let response = try await APIClient.shared.request(URL(string: user.reposURL!)!, expectedResponseType: [Repository].self)
        self.userRepos = response//.sorted { $0.updatedAt > $1.updatedAt }
      } catch {
        self.error = error
        print(error)
      }
    }
  }
}
