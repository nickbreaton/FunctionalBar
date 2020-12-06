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

//var basicViewIdentifier = NSTouchBarItem.Identifier("com.toxblh.mtmr.scrollView.".appending(UUID().uuidString))

class TouchBarController: NSObject, NSTouchBarDelegate {
    static let shared = TouchBarController()

    let touchBar = NSTouchBar()
    var slider: NSSlider!
    
    func setupControlStripPresence() {
        NSTouchBar.presentSystemModalTouchBar(touchBar, placement: 1, systemTrayItemIdentifier: .controlStripItem)
        
        touchBar.delegate = self
        touchBar.defaultItemIdentifiers = [.slider]
    
    }
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case NSTouchBarItem.Identifier.slider:
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)

            slider = NSSlider(target: self, action: #selector(onSlide))
//            customTouchBarItem.view = slider
            
            let spacer = NSView()
            spacer.setFrameSize(NSSize(width: 1, height: spacer.frame.height))
            
//                        let button = NSButton(title: "hello", target: self, action: #selector(onSlide))
            
            
            let grid = NSGridView(views: [ [ slider ]])
            
            grid.column(at: 0).width = 350
//            grid.row(at: 1).cell(at: 0).
//            grid.xPlacement = .trailing
            
            grid.wantsLayer = true
            grid.layer?.backgroundColor = NSColor.green.cgColor
            
//            view.addSubview(slider)
            
//            let button = NSButton(title: "hello", target: self, action: #selector(onSlide))
//            view.addSubview(button)
            
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
