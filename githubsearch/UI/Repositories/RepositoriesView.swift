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
    }
    .padding()
  }
  
  var titleView: some View {
    HStack {
      Text("Repositories")
        .font(.appHeaderFont)
      Spacer()
    }
  }
  
  @ViewBuilder
  var reposListView: some View {
    if let repos = viewModel.repositories {
      if repos.count == 0 {
        noResultView
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          LazyVStack {
            if let repositories = viewModel.repositories {
              ForEach(repositories, id: \.id) { repo in
                RepositoryView(repository: repo)
              }
            }
            Spacer()
          }
        }
      }
    } else {
      noSearchView
    }
  }
  
  var noSearchView: some View {
    EmptyStateView(state: .noRepoSearch)
  }
  
  var noResultView: some View {
    EmptyStateView(state: .noRepoSearchResult)
  }
}

struct RepositoryView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}
