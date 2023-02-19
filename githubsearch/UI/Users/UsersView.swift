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

        Spacer()
      }
      .padding()
    }
  }

  var titleView: some View {
    HStack {
      Text("Users")
      Spacer()
    }
  }

  @ViewBuilder
  var usersList: some View {
    ScrollView(.vertical, showsIndicators: false) {
      LazyVStack {
        if let user = viewModel.users {
          ForEach(user, id: \.id) { user in
            NavigationLink(destination: UserDetailView(user: user)) {
              UserView(user: user)
            }
          }
        } else if viewModel.users.count < 1{
          noResultView
        }else {
          noSearchView
        }
      }
    }
  }

  var noSearchView: some View {
    EmptyStateView(message: "Search Github for users...", image: Images.emptySearch)
  }

  var noResultView: some View {
    EmptyStateView(message: "We’ve searched the ends of the earth and we’ve not found this user, please try again", image: Images.emptySearch)
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView()
  }
}
