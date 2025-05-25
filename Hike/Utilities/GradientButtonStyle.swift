//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Sree Lakshman on 25/05/25.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                //condition ? A : B
                configuration.isPressed ?
                // A - When user pressed the button
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
        :
                // B - When the button is not pressed
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom))
            .cornerRadius(40)
            
    }
}
