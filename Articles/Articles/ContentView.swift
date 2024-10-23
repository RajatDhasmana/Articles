//
//  ContentView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink {
                    ArticleListView(viewmodel: ArticleListViewModel(service: ArticleListViewService.live))
                } label: {
                    Text("Click here to move to Article list screen")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
