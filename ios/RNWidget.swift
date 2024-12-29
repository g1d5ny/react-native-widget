import Foundation
import React
import WidgetKit

@objc(RNWidget)
class RNWidget: NSObject {

  private var suiteName: String? {
    return Bundle.main.object(forInfoDictionaryKey: "AppGroupIdentifier") as? String
  }

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }

  @objc(setTextToWidget:withResolver:withRejecter:)
  func setTextToWidget(_ text: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {

      guard let suiteName = self.suiteName else {
        rejecter("error", "Suite name not set", nil)
        return
      }

      let userDefaults = UserDefaults(suiteName: suiteName)
      userDefaults?.set(text, forKey: "currentText")
      WidgetCenter.shared.reloadTimelines(ofKind: "WidgetExample")
      resolver("success")
  }
}
