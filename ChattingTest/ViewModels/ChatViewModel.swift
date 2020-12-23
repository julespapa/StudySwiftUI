//
//  ChatViewModel.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import Foundation
import Combine



class ChatViewModel: ObservableObject {
    
    @Published var prefix: String = ""
    @Published var allChats = [Chat]()
    
    var chatThrottleDisposeBag: AnyCancellable?
        
    func addChat(chat: Chat) {

        if self.allChats.count > 10 {
            self.allChats.removeFirst()
        }
        
        if !self.prefix.isEmpty {
            chat.message = "[\(self.prefix)] " + chat.message
        }
        self.allChats.append(chat)
    }
}

