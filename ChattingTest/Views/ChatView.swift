//
//  ChatView.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/23.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    
    var body: some View {

        VStack(alignment: .leading, content: {

            Text("throttle time")
                .font(.system(size: 10))

            Picker("", selection: self.$viewModel.throttleTime) {
                ForEach(0 ..< 4) {
                    Text("\($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("prefix", text: self.$viewModel.prefix)
                .frame(height: 30)
                .background(Color.green)
            
            List(self.viewModel.throttledChats) {
                ChatUnitView(imageName: "\($0.profileNum)",
                             message: "\($0.message)")
            }
        })
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatViewModel(throttleTime: 1))
    }
}
