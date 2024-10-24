//
//  EmptyStateView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 24/10/24.
//

import SwiftUI

struct EmptyStateView: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "tray")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 10)
            
            Text("NO DATA AVAILABLE!")
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    EmptyStateView()
}
