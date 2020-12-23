//
//  ContentView.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    var body: some View {
        
        TabView {
            ChatView()
                .tabItem { Text("Chat") }
            
            Views()
                .tabItem { Text("Views") }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChatViewModel(throttleTime: 1))
    }
}
