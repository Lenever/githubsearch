import Foundation

// MARK: - Repository
struct Repository: Codable, Identifiable, Equatable {
  let id: Int?
  let name, fullName: String?
  let welcomePrivate: Bool?
  let owner: RepoOwner?
  let updatedAt: String?
  let language: String?
  let description: String?
  let size, stargazersCount, watchersCount: Int?
  let watchers: Int?
  let topics: [String]?
  
  enum CodingKeys: String, CodingKey {
    case id
    case name
    case fullName = "full_name"
    case welcomePrivate = "private"
    case owner
    case updatedAt = "updated_at"
    case size, language, description
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
    case topics
    case watchers
  }
}


// MARK: - Owner
struct RepoOwner: Codable, Identifiable, Equatable {
  let login: String?
  let id: Int?
  let avatarURL: String?
  let htmlURL: String?

  enum CodingKeys: String, CodingKey {
    case login, id
    case avatarURL = "avatar_url"
    case htmlURL = "html_url"
    
  }
}
