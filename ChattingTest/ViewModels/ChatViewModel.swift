//
//  ChatViewModel.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import Foundation
import Combine

class ChatViewModel: ObservableObject {
    
    var throttleTime: Int = 0 {
        
        didSet {
            
            self.chatThrottleDisposeBag =
                self
                .$allChats
                .throttle(for: RunLoop.SchedulerTimeType.Stride(TimeInterval(self.throttleTime)),
                          scheduler: RunLoop.main,
                          latest: true)
                .assign(to: \.throttledChats, on: self)
        }
    }

    @Published var prefix: String = ""
    @Published private var allChats = [Chat]()
    @Published var throttledChats = [Chat]()
    
    var chatThrottleDisposeBag: AnyCancellable?
        
    convenience init(throttleTime: Int) {
        
        self.init()
        defer {
            
            self.throttleTime = throttleTime
        }
    }
    
    func addChat(chat: Chat) {

        if self.allChats.count > 10 {
            self.allChats.removeLast()
        }
        
        if !self.prefix.isEmpty {
            chat.message = "[\(self.prefix)] " + chat.message
        }
        self.allChats.insert(chat, at: 0)
    }
}

