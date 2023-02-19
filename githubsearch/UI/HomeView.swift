import SwiftUI

struct HomeView: View {
  enum TabType {
    case repositories
    case users

    var name: String {
      switch self {
      case .repositories:
        return "Repositories"
      case .users:
        return "Users"
      }
    }

    var image: UIImage {
      switch self {
      case .repositories:
        return Images.repo
      case .users:
        return Images.user
      }
    }

    var backgroundColor: Color {
      switch self {
      case .repositories:
        return .cardPurple
      case .users:
        return .pillBlue
      }
    }
  }

  @Binding var tabSelection: Int

  var body: some View {
    VStack(spacing: 50) {
      HStack {
        Text("Home")
          .font(.appHeaderFont)
        Spacer()
      }

      HStack {
        cardView(tab: .users)
        cardView(tab: .repositories)
      }

      Spacer()
    }
    .padding()
  }

  func cardView(tab: TabType) -> some View {
    Button(action: {
      switch tab {
      case .repositories:
        tabSelection = 2
      case .users:
        tabSelection = 3
      }
    }) {
      HStack {
        VStack(alignment: .leading, spacing: 50) {
          Image(uiImage: tab.image)
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 30)
            .padding(5)
            .background(Color.white)

          Text(tab.name)
            .font(.appHeaderFont)
        }
        .padding()

        Spacer()
      }
      .frame(maxWidth: .infinity)
      .background(tab.backgroundColor)
      .cornerRadius(5)
    }
  }
}
