import SwiftUI

struct EmptyStateView: View {

  enum EmptyState {
    case noUserRepo
    case noUserSearch
    case noUserSearchResult
    case noRepoSearch
    case noRepoSearchResult

    var image: UIImage {
      switch self {
      case .noUserRepo:
        return Images.emptyRepo
      default:
        return Images.emptySearch
      }
    }

    var message: String {
      switch self {
      case .noUserRepo:
        return "This user  doesn’t have repositories yet, come back later :-)"
      case .noUserSearch:
        return "Search Github for users..."
      case .noUserSearchResult:
        return "We’ve searched the ends of the earth and we’ve not found this user, please try again"
      case .noRepoSearch:
        return "Search Github for repositories, issues and pull requests!"
      case .noRepoSearchResult:
        return "We’ve searched the ends of the earth, repository not found, please try again"
      }
    }
  }

  var state: EmptyState
  
  var body: some View {
    VStack(spacing: 30) {
      Spacer()
      Image(uiImage: state.image)

      Text(state.message)
        .multilineTextAlignment(.center)
        .padding()
      Spacer()
    }
  }
}
