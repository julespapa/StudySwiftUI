//
//  ChatUnitView.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/22.
//

import SwiftUI

struct ChatUnitView: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        
        HStack {
            Image(self.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
            
            Text(self.message)
                .font(.caption2)
        }
    }
}

struct ChatUnitView_Previews: PreviewProvider {
    static var previews: some View {
        ChatUnitView(imageName: "1", message: "message")
    }
}
