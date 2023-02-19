import SwiftUI

struct StarCountView: View {
  var starCount: String
  
  var body: some View {
    HStack(spacing: 2) {
      Image(uiImage: Images.star)
        .resizable()
        .frame(width: 12, height: 12)
      
      Text(starCount)
        .font(.appSmallFont)
    }
  }
}

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    StarCountView(starCount: "10")
  }
}
