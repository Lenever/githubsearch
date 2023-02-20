import Foundation

protocol GitSearchRepository {
  func fetchRepos(searchText: String) async throws -> [Repository]
  func fetchUsers(searchText: String) async throws -> [User]
}

enum APIPath: String {
  case repo = "repositories"
  case users = "users"
}

struct RemoteSearchRepository: GitSearchRepository {
  let apiClient = APIClient.shared
  let baseUrl = URL(string: "https://api.github.com/search/")!

  func fetchRepos(searchText: String) async throws -> [Repository] {
      do {
        let response = try await apiClient.request(URL(string: "https://api.github.com/search/repositories?q=\(searchText)")!, expectedResponseType: SearchRepositoryResponse.self)
        return response.items
      } catch {
        throw error
      }
  }

  func fetchUsers(searchText: String) async throws -> [User] {
      do {
        let response = try await apiClient.request(URL(string: "https://api.github.com/search/users?q=\(searchText)")!, expectedResponseType: SearchUserResponse.self)
        return response.items
      } catch {
        throw error
      }
  }
}
