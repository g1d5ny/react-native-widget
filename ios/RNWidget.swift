import Foundation
import React
import WidgetKit

@objc(RNWidget)
class RNWidget: NSObject {

  @objc(multiply:withB:withResolver:withRejecter:)
  func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }

  @objc(setTextToWidget:withResolver:withRejecter:)
  func setTextToWidget(_ text: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
      let userDefaults = UserDefaults(suiteName: "group.com.example.rnwidget")
      userDefaults?.set(text, forKey: "currentText")
      WidgetCenter.shared.reloadTimelines(ofKind: "WidgetExample")
      resolve("success")
  }


}
