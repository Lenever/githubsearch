import SwiftUI

struct UsersView: View {
  @ObservedObject var viewModel = UsersViewModel()

  var body: some View {
    NavigationView {
      VStack(spacing: 20) {
        titleView

        SearchView(
          searchText: $viewModel.searchText,
          placeholder: "Search for users",
          searchAction: {viewModel.getUsersListData() }
        )

        usersList
      }
      .padding()
    }
  }

  var titleView: some View {
    HStack {
      Text("Users")
        .font(.appHeaderFont)
      Spacer()
    }
  }

  @ViewBuilder
  var usersList: some View {
    Group {
      if let users = viewModel.users {
        if users.count == 0 {
          noResultView
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
              if let users = viewModel.users {
                ForEach(users, id: \.id) { user in
                  NavigationLink(destination: UserDetailView(user: user)) {
                    UserView(user: user)
                  }
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
  }

  var noSearchView: some View {
    EmptyStateView(state: .noUserSearch)
  }

  var noResultView: some View {
    EmptyStateView(state: .noUserSearchResult)
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView()
  }
}
