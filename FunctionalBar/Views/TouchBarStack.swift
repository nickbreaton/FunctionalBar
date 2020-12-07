//
//  TouchBarStack.swift
//  FunctionalBar
//
//  Created by Nick Breaton on 12/6/20.
//

import Foundation
import SwiftUI

struct TouchBarStack<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
      self.content = content
    }
    
    var body: some View {
        HStack {
            content()
        }
            // TODO: calculate these values
            .frame(width: 1004, height: 30)
    }
}
