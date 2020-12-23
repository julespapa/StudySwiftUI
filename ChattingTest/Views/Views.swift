//
//  Views.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/23.
//

import SwiftUI

struct Views: View {
    
    @State var text: String = "first"
    @State var currentSliderPoint: Float = 0
    @State var currentStep: Int = 0
    @State var currentColor: Color = .green
    
    var body: some View {
        
        ScrollView {
            
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(8)
                }
                
                
                HStack {
                    Text(self.text)
                    Menu("Menu") {
                        Button("first") {
                            self.text = "first"
                        }
                        Button("second") {
                            self.text = "second"
                        }
                    }
                }
                
                Link("link(google)", destination: URL(string: "http://www.google.com")!)
                
                HStack {
                    Text("\(self.currentSliderPoint)")
                    Slider(value: self.$currentSliderPoint)
                }
                
                ZStack {
                    
                    Text("\(self.currentStep)")
                    Stepper("Stepper") {
                        self.currentStep += 1
                    } onDecrement: {
                        self.currentStep += -1
                    }
                }.background(
                    Image("11")
                        .resizable()
                        .scaledToFit())
                
                ColorPicker("ColorPicker", selection: self.$currentColor)
                
                ProgressView("ProgressView")
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50,
                                                       maximum: 50),
                                             spacing: 40,
                                             alignment: .center)]) {
                    
                    ForEach(0..<20) {
                        
                        Text("\($0)")
                    }
                }
                
                
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 50,
                                                    maximum: 50),
                                          spacing: 40,
                                          alignment: .center),
                                 GridItem(.fixed(10),
                                          spacing: 50,
                                          alignment: .leading),
                                 GridItem(.fixed(10),
                                          spacing: 50,
                                          alignment: .leading),
                                 GridItem(.fixed(40),
                                          spacing: 10,
                                          alignment: .leading)]) {
                    
                    ForEach(0..<20) {
                        
                        Text("\($0)")
                    }
                }.padding()
                
                ForEach(0..<100) {
                    
                    Text("\($0)").id($0)
                }
            }
        }
        .padding(.horizontal)
        .background(Color.yellow)
    }
}


struct Views_Previews: PreviewProvider {
    static var previews: some View {
        Views()

    }
}
