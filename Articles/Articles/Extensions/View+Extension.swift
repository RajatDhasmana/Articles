//
//  View+Extension.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import SwiftUI

extension View {
    func withCustomNavBar(title: String) -> some View {
        self.modifier(CustomNavBarModifier(title: title))
    }
}
