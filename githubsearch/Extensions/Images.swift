import UIKit

enum Images {
  public static let emptyRepo = moduleImage(named: "emptyRepo")
  public static let emptySearch = moduleImage(named: "emptySearch")
  public static let home = moduleImage(named: "home")
  public static let repo = moduleImage(named: "repo")
  public static let search = moduleImage(named: "search")
  public static let star = moduleImage(named: "star")
  public static let user = moduleImage(named: "user")
}

// MARK: - Helper functions

func moduleImage(named name: String) -> UIImage {
  UIImage(named: name)!
}
