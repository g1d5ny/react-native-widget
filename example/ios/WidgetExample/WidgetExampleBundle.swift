//
//  WidgetExampleBundle.swift
//  WidgetExample
//
//  Created by 지언 on 11/25/24.
//

import WidgetKit
import SwiftUI

@main
struct WidgetExampleBundle: WidgetBundle {
    var body: some Widget {
        WidgetExample()
        WidgetExampleControl()
        WidgetExampleLiveActivity()
    }
}
