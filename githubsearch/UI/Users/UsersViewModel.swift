import Foundation

final class UsersViewModel: ObservableObject {
  @Published var users:  [User] = []
  @Published var searchText: String = ""
  
  init() {}
  
  func getUsersListData() {
  }
}
