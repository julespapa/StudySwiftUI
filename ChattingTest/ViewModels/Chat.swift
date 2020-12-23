//
//  Chat.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import Foundation

class Chat: ObservableObject, Identifiable {
    
    init(profileNum: Int, message: String) {
        
        self.profileNum = profileNum
        self.message = message
    }
    
    let profileNum: Int
    var message: String
    
    var id = UUID()
}

