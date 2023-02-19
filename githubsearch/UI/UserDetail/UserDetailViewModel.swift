import Foundation

final class UserDetailViewModel: ObservableObject {
  @Published var user: User
  @Published var fullUser: FullUser?
//  @Published var user: [FullUser] = []
  @Published var userRepos: [UserRepo] = []
  @Published var userUrl: String = ""
  @Published var repoUrl: String = ""
  @Published var error: Error?

  init(user: User) {
    self.user = user
    getUsersDetails()
    getUserRepoDetails()
  }

  func getUsersDetails() {
    Task {
      do {
        let response = try await APIClient.shared.request(URL(string: user.url!)!, expectedResponseType: FullUser.self)
        self.fullUser = response
        print(response, "MMM")
      } catch {
        self.error = error
        print(error)
      }
    }
  }

  func getUserRepoDetails() {
    Task {
      do {
        let response = try await APIClient.shared.request(URL(string: user.reposURL!)!, expectedResponseType: [UserRepo].self)
        self.userRepos = response//.sorted { $0.updatedAt > $1.updatedAt }
        print(response, "MMM")
      } catch {
        self.error = error
        print(error)
      }
    }
  }
}
