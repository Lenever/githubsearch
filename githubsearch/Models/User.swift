import Foundation

// MARK: - User
struct User: Codable, Identifiable, Equatable {
  let login: String?
  let id: Int?
  let avatarURL: String?
  let url, htmlURL: String?
  let reposURL: String?
  let name: String?
  let location: String?
  let email: String?
  let bio: String?
  let followers, following: Int?

  enum CodingKeys: String, CodingKey {
    case login, id
    case avatarURL = "avatar_url"
    case url
    case htmlURL = "html_url"
    case reposURL = "repos_url"
    case name, location, email, bio
    case followers, following
  }
}
