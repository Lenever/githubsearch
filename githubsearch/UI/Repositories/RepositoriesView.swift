import SwiftUI

struct RepositoriesView: View {
  @ObservedObject var viewModel = RepositoriesViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      titleView
      
      SearchView(
        searchText: $viewModel.searchText,
        placeholder: "Search for repositories",
        searchAction: { viewModel.getReposListData() }
      )
      
      reposListView
      
      Spacer()
    }
    .padding()
  }
  
  var titleView: some View {
    HStack {
      Text("Repositories")
      Spacer()
    }
  }
  
  @ViewBuilder
  var reposListView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack {
        if let repositories = viewModel.repositories {
          ForEach(repositories, id: \.id) { repository in
            RepositoryView(repository: repository)
          }
        } else if viewModel.repositories?.count == 0 {
          noResultView
        }else {
          noSearchView
        }
      }
    }
  }
  
  var noSearchView: some View {
    EmptyStateView(message: "Search Github for repositories, issues and pull requests!", image: Images.emptySearch)
  }
  
  var noResultView: some View {
    EmptyStateView(message: "We’ve searched the ends of the earth, repository not found, please try again", image: Images.emptySearch)
  }
}

struct RepositoryView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}
