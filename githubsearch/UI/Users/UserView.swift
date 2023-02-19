import SwiftUI

struct UserView: View {
  var user: User
  var body: some View {
    HStack(alignment: .top, spacing: 5) {
      AsyncImage(url: URL(string: user.avatarURL ?? ""), scale: 1)
      { image in image.resizable() } placeholder: { Color.red } .frame(width: 28, height: 28) .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.trailing, 5)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(user.name ?? "")
          .font(.appSemiBoldLargeFont)
          .foregroundColor(.pillText)
        
        Text(user.login ?? "")
          .font(.appMediumFont)
        
        Text(user.bio ?? "")
          .font(.appSemiBoldMediumFont)
        
        HStack(spacing: 20) {
          bottomView(text: user.location ?? "")
          bottomView(text: user.email ?? "")
        }
      }
      
      Spacer()
    }
    .padding(10)
    .overlay(
      RoundedRectangle(cornerRadius: 5)
        .stroke(.gray, lineWidth: 0.25)
        .shadow(radius: 10)
    )
  }
  
  func bottomView(text: String) -> some View {
    Text(text)
      .font(.appSmallFont)
      .foregroundColor(.gray)
  }
}
