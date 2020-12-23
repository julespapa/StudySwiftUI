//
//  ChatTicker.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import Foundation

class ChatTicker {

    var interval: TimeInterval = 0.0
    weak var chatViewModel: ChatViewModel?
    
    lazy private var timer: Timer =
        Timer.scheduledTimer(withTimeInterval: self.interval,
                             repeats: true) { [weak self] _ in
            
            let num = (1...12).randomElement()!
            let message = ["This property applies to the entire text string.",
                           "The default text color is black.",
                           "In iOS 6 and later, assigning a new value to this property causes the new text color to be applied to the entire contents of the text view.",
                           "If you want to apply the color to only a portion of the text, you must create a new attributed string with the desired style information and assign it to the attributedText property.",
                           "This works well in a VStack, but when using a List the height of the row doesn't expand to show all of the text in the TextView.",
                           "I've tried a few things: changing isScrollEnabled in the TextView implementation; setting a fixed width on the TextView frame; and even putting the TextView and the Text in a ZStack (in the hope that the row would expand to match the height of the Text view) but nothing works.",
                           "Does anyone have advice on how to adapt this answer to also work in a List? – MathewS Oct 13 '19 at 1"].randomElement()!
            
            self?.chatViewModel?.addChat(chat: Chat(profileNum: num, message: message))
        }
    
    func start() {
        
        self.timer.fire()
    }
    
    func end() {
        
        self.timer.invalidate()
    }
}

extension ChatViewModel {
    
    func addChatTicker() -> ChatTicker {
        
        let ticker = ChatTicker()
        
        ticker.interval = 0.25
        ticker.chatViewModel = self
        
        ticker.start()
        
        return ticker
    }
}
