import SwiftUI

struct RepositoryView: View {
  var repository: Repository

  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      HStack(spacing: 10) {
        titleView

        Spacer()

        StarCountView(starCount: String(repository.watchers ?? 0 ))
        LanguageView(language: repository.language ?? "")
      }

      Text(repository.description ?? "")
        .font(.appMediumFont)
        .multilineTextAlignment(.leading)

      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          if let topics = repository.topics{
            ForEach(topics, id: \.self) { topic in
              tagView(tag: topic)
            }
          }
        }
      }
    }
    .padding(10)
    .overlay(
      RoundedRectangle(cornerRadius: 5)
        .stroke(.gray, lineWidth: 0.25)
        .shadow(radius: 10)
    )
  }

  var titleView: some View {
    HStack(spacing: 0) {
      AsyncImage(url: URL(string: repository.owner?.avatarURL ?? ""), scale: 1)
      { image in image.resizable() } placeholder: { Color.red } .frame(width: 28, height: 28) .clipShape(RoundedRectangle(cornerRadius: 14))
        .padding(.trailing, 5)

      Text(repository.owner?.login ?? "")
        .font(.appSemiBoldMediumFont)
        .foregroundColor(.textPurple)

      Text("/" + (repository.name ?? ""))
        .font(.appSemiBoldMediumFont)
        .foregroundColor(.black)
    }
  }

  func tagView(tag: String) -> some View {
    Text(tag)
      .font(.appSmallFont)
      .padding(.vertical, 5)
      .padding(.horizontal, 10)
      .foregroundColor(.pillText)
      .background(Color.pillBlue)
      .cornerRadius(5)
  }
}
