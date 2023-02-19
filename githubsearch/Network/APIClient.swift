import Foundation

struct APIClient {
    static let shared = APIClient()

    private let session: URLSession

    private init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }

    func request<T: Decodable>(_ url: URL, expectedResponseType: T.Type, method: String = "GET") async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }
        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(expectedResponseType, from: data)
          print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")
            return decodedResponse
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}

enum NetworkError: Error {
    case invalidResponse
    case decodingFailed
}
