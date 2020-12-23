//
//  ChatView.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/23.
//

import SwiftUI

extension Int {
    var runloopTime: RunLoop.SchedulerTimeType.Stride {
        return RunLoop.SchedulerTimeType.Stride(TimeInterval(self))
    }
}

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    @State var currentDate = Date()
    
    @State var chats = [Chat]()
    @State var throttleTime: Int = 1

    let timer = Timer.publish(every: 1, on: .main, in: .common)
    
    var body: some View {

        VStack(alignment: .leading, content: {

            Text("\(currentDate)")
                .onReceive(timer) { input in
                    self.currentDate = input
                }

            Text("throttle time")
                .font(.system(size: 10))

            Picker("", selection: self.$throttleTime) {
                ForEach(0 ..< 4) {
                    Text("\($0)")
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            TextField("prefix", text: self.$viewModel.prefix)
                .frame(height: 30)
                .background(Color.green)
            
            List(self.chats) {
                ChatUnitView(imageName: "\($0.profileNum)",
                             message: "\($0.message)")
            }
        })
        .onReceive(self
                    .viewModel
                    .$allChats
                    .throttle(for: self.throttleTime.runloopTime,
                              scheduler: RunLoop.main,
                              latest: true),
                   perform: {
                    
                    self.chats = $0
                    
        })
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatViewModel())
    }
}
