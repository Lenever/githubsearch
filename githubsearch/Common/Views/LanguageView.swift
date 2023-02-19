import SwiftUI

struct LanguageView: View {
  var language: String
  
  var body: some View {
    HStack(spacing: 5) {
      Color.appGreen
        .frame(width: 12, height: 12)
        .cornerRadius(10)
      
      Text(language)
        .font(.appSmallFont)
    }
  }
}

struct StackView_Previews: PreviewProvider {
  static var previews: some View {
    LanguageView(language: "Vue")
  }
}
