//
//  TouchBarController.swift
//  SaturdayAfternoon
//
//  Created by Nick Breaton on 12/5/20.
//

import Foundation
import SwiftUI

extension NSTouchBarItem.Identifier {
    static let strip = NSTouchBarItem.Identifier("com.nickbreaton.FunctionalBar.strip")
    static let rootView = NSTouchBarItem.Identifier("com.nickbreaton.FunctionalBar.rootView")
}

struct MainView: View {
    @State var value = 1.0
    
    var body: some View {
        TouchBarStack {
            Spacer()
            Slider(value: $value, in: -1.0...1.0)
                .frame(width: 250)
        }
    }
}
 
class TouchBarController: NSObject, NSTouchBarDelegate {
    static let shared = TouchBarController()

    let touchBar = NSTouchBar()
    
    func setupControlStripPresence() {
        NSTouchBar.presentSystemModalTouchBar(touchBar, placement: 1, systemTrayItemIdentifier: .strip)
        
//        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) {
//            self.onModifierKeyChange(event: $0)
//        }
//
//        NSEvent.addLocalMonitorForEvents(matching: .flagsChanged) {
//            self.onModifierKeyChange(event: $0)
//            return nil
//        }
        
        touchBar.delegate = self
        touchBar.defaultItemIdentifiers = [.rootView]
    }
    
//    func onModifierKeyChange(event: NSEvent) {
//        switch event.modifierFlags.intersection(.deviceIndependentFlagsMask) {
//        case [/*.function,*/ .shift]:
//            NSTouchBar.presentSystemModalTouchBar(touchBar, placement: 1, systemTrayItemIdentifier: .strip)
//        default:
//            NSTouchBar.dismissSystemModalTouchBar(touchBar)
//        }
//    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if (identifier == NSTouchBarItem.Identifier.rootView) {
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = NSHostingView(rootView: MainView())
            return customTouchBarItem
        }
        return nil
    }
}
