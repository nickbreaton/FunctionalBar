//
//  TouchBarController.swift
//  SaturdayAfternoon
//
//  Created by Nick Breaton on 12/5/20.
//

import Foundation

extension NSTouchBarItem.Identifier {
    static let controlStripItem = NSTouchBarItem.Identifier("com.nickbreaton.FunctionalBar.controlStrip")
    static let slider = NSTouchBarItem.Identifier("com.nickbreaton.FunctionalBar.slider")
}

class TouchBarController: NSObject, NSTouchBarDelegate {
    static let shared = TouchBarController()

    let touchBar = NSTouchBar()
    var slider: NSSlider!
    
    func setupControlStripPresence() {
      
        
        NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) {
            self.onModifierKeyChange(event: $0)
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .flagsChanged) {
            self.onModifierKeyChange(event: $0)
            return nil
        }
        
        touchBar.delegate = self
        touchBar.defaultItemIdentifiers = [.slider]
    }
    
    func onModifierKeyChange(event: NSEvent) {
        switch event.modifierFlags.intersection(.deviceIndependentFlagsMask) {
        case [/*.function,*/ .shift]:
            NSTouchBar.presentSystemModalTouchBar(touchBar, placement: 1, systemTrayItemIdentifier: .controlStripItem)
        default:
            NSTouchBar.dismissSystemModalTouchBar(touchBar)
        }
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.slider:
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)

            slider = NSSlider(target: self, action: #selector(onSlide))
            
            let spacer = NSView()
            
            let grid = NSGridView(views: [[ spacer, slider ]])
            grid.setFrameSize(NSSize(width: 1004, height: 30))
            
            grid.column(at: 1).width = 300
            
            customTouchBarItem.view = grid
            return customTouchBarItem
        default:
          return nil
        }
    }
    
    @objc func onSlide() {
        print(slider.floatValue)
    }
}
