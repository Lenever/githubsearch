import SwiftUI

struct UserDetailView: View {
  @ObservedObject var viewModel : UserDetailViewModel
  
  init(user: User) {
    self.viewModel = UserDetailViewModel(user: user)
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      titleView
      
      Text(viewModel.user.bio ?? "")
        .font(.appSemiBoldMediumFont)
      
      HStack(spacing: 15) {
        locationView
        linkView
      }
      
      followView
      repositoriesView
      Spacer()
    }
    .padding()
  }
  
  var titleView: some View {
    HStack(alignment: .top, spacing: 15) {
      AsyncImage(url: URL(string: viewModel.user.avatarURL ?? ""), scale: 1)
      { image in image.resizable() } placeholder: { Color.red } .frame(width: 45, height: 45) .clipShape(RoundedRectangle(cornerRadius: 22.5))
        .padding(.trailing, 5)
      
      VStack(alignment: .leading, spacing: 10) {
        Text(viewModel.user.name ?? "").foregroundColor(.pillText).font(.appSemiBoldLargeFont)
        Text(viewModel.user.login ?? "").font(.appSemiBoldMediumFont)
      }
      
      Spacer()
    }
  }
  
  var locationView: some View {
    HStack {
      Image(systemName: "mappin.circle")
      Text(viewModel.user.location ?? "")
      
    }
    .font(.appMediumFont)
    .foregroundColor(.textGrey)  }
  
  var linkView: some View {
    HStack {
      Image(systemName: "link")
      Text(viewModel.user.htmlURL ?? "")
    }
    .font(.appMediumFont)
    .foregroundColor(.gray)
  }
  
  var followView: some View {
    HStack {
      Image(systemName: "person.3.sequence")
      Text(String(viewModel.user.followers ?? 0))
      Text("followers.")
      Text(String(viewModel.user.following ?? 0))
      Text("following")
    }
    .font(.appMediumFont)
    .foregroundColor(.textGrey)
  }
  
  var repositoriesView: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 5) {
        Text("Repositories")
        
        Text(String(viewModel.userRepos.count))
          .foregroundColor(.black)
          .padding(.vertical, 3)
          .padding(.horizontal, 5)
          .background(Color.textGrey)
          .cornerRadius(10)
      }
      .font(.appSemiBoldMediumFont)
      
      HStack(spacing: 0) {
        Color.black
        Color.gray
      }
      .frame(height: 0.5)
      
      ScrollView(.vertical, showsIndicators: false) {
        LazyVStack {
          if let repo = viewModel.userRepos {
            ForEach(repo, id: \.id) { repo in
              UserRepoView(repo: repo)
            }
          }else{
            EmptyStateView(message: "This user  doesn’t have repositories yet, come back later :-)", image: Images.emptyRepo)
          }
        }
      }
    }
  }
}
