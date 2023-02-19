import Foundation


final class RepositoriesViewModel: ObservableObject {
  @Published var repositories: [Repository]?
  @Published var searchText: String = ""
  @Published var error: LocalizedError?
  var pageNumber : Int?
  
  init() {}
  
  func getReposListData() {}
}
