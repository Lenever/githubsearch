import SwiftUI

struct UserRepoView: View {
  var repo: UserRepo
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      HStack(spacing: 10) {
        titleView
        repoAccessView
        
        Spacer()
        
        StarCountView(starCount: String(repo.stargazersCount ?? 0))
        LanguageView(language: repo.language ?? "")
      }
      
      Text(repo.description ?? "")
        .font(.appMediumFont)
        .multilineTextAlignment(.leading)
      
      HStack(spacing: 15) {
        bottomView(text: "Forked from discordify")
        bottomView(text: "updated " + (repo.updatedAt ?? ""))
      }
    }
    .padding()
    .overlay(
      RoundedRectangle(cornerRadius: 5)
        .stroke(.gray, lineWidth: 0.25)
        .shadow(radius: 10)
    )
  }
  
  var titleView: some View {
    HStack(spacing: 0) {
      Text(repo.owner?.login ?? "")
        .font(.appSemiBoldMediumFont)
        .foregroundColor(.textPurple)
      
      Text("/" + (repo.name ?? ""))
        .font(.appSemiBoldMediumFont)
        .foregroundColor(.black)
    }
  }
  
  var repoAccessView: some View {
    Text(repo.welcomePrivate == true ? "Private" : "Public")
      .font(.appSmallFont)
      .padding(.vertical, 5)
      .padding(.horizontal, 5)
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(.gray, lineWidth: 0.25)
          .shadow(radius: 8)
      )
  }
  
  func bottomView(text: String) -> some View {
    Text(text)
      .font(.appMediumFont)
      .foregroundColor(.textGrey)
  }
}
