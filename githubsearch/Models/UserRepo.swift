import Foundation

// MARK: - WelcomeElement
struct UserRepo: Codable, Identifiable {
  let id: Int?
  let nodeID, name, fullName: String?
  let welcomePrivate: Bool?
  let owner: RepoOwner?
  let updatedAt: String?
  let language: String?
  let description: String?
  let size, stargazersCount, watchersCount: Int?
  
  enum CodingKeys: String, CodingKey {
    case id
    case nodeID = "node_id"
    case name
    case fullName = "full_name"
    case welcomePrivate = "private"
    case owner
    case updatedAt = "updated_at"
    case size, language, description
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
  }
  
  static var example = UserRepo(
    id: nil,
    nodeID: nil,
    name: "Ugo",
    fullName: "Ugo Val",
    welcomePrivate: nil,
    owner: nil,
    updatedAt: nil,
    language: "Vue",
    description: "This is a mock",
    size: nil,
    stargazersCount: nil,
    watchersCount: nil
  )
}


// MARK: - Owner
struct RepoOwner: Codable {
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
