//
//  WindowController.swift
//  SaturdayAfternoon
//
//  Created by Nick Breaton on 12/5/20.
//

import Foundation
import Cocoa

//enum AssetNames: String {
//    case accounts = "Accounts", bookmark = "Bookmark", cat = "DorianGrayCat",
//         red = "Red", green = "Green"
//}
//
//fileprivate extension NSTouchBar.CustomizationIdentifier {
//    static let windowBar = NSTouchBar.CustomizationIdentifier("com.TouchBarCatalog.windowTouchBar")
//}
//
//fileprivate extension NSTouchBarItem.Identifier {
//    static let label = NSTouchBarItem.Identifier("com.TouchBarCatalog.TouchBarItem.label")
//}

class WindowController: NSWindowController {
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
//        touchBar.delegate = self
//        touchBar.customizationIdentifier = .windowBar
//        touchBar.defaultItemIdentifiers = [.label, .fixedSpaceLarge, .otherItemsProxy]
        return touchBar
    }
}

//extension WindowController: NSTouchBarDelegate {
//
//    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
//
//        let custom = NSCustomTouchBarItem(identifier: identifier)
//        custom.customizationLabel = "TouchBar Catalog Label"
//
//        let label = NSTextField.init(labelWithString: "Volume")
//        custom.view = label
//
//        return custom
//    }
//}
