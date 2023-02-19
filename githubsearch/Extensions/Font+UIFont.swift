import SwiftUI
import UIKit

extension UIFont {
  static let appSmallFont = systemFont(ofSize: 8, weight: .light)
  static let appMediumFont = systemFont(ofSize: 10, weight: .light)
  static let appHeaderFont = systemFont(ofSize: 16, weight: .semibold)
  static let appSemiBoldMediumFont = systemFont(ofSize: 10, weight: .medium)
  static let appSemiBoldLargeFont = systemFont(ofSize: 13, weight: .medium)
}

extension Font {
  static let appSmallFont = Font(UIFont.appSmallFont)
  static let appMediumFont = Font(UIFont.appMediumFont)
  static let appHeaderFont = Font(UIFont.appHeaderFont)
  static let appSemiBoldMediumFont = Font(UIFont.appSemiBoldMediumFont)
  static let appSemiBoldLargeFont = Font(UIFont.appSemiBoldLargeFont)
}
