import Foundation

final class UserDetailViewModel: ObservableObject {
  @Published var user: User
//  @Published var user: [FullUser] = []
  @Published var userRepos: [UserRepo] = []
  @Published var userUrl: String = ""
  @Published var repoUrl: String = ""

  init(user: User) {
    self.user = user
  }

  func getUserRepoDetails(_ url: String) {
  }

  func getUsersDetails(_ url: String) {
  }
}
