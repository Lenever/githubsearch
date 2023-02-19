import SwiftUI

struct EmptyStateView: View {
  var message: String
  var image: UIImage
  
  var body: some View {
    VStack(spacing: 30) {
      Spacer()
      Image(uiImage: image)

      Text(message)
        .multilineTextAlignment(.center)
        .padding()
      Spacer()
    }
  }
}
