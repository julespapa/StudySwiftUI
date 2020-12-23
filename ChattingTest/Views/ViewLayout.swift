//
//  ViewLayout.swift
//  ChattingTest
//
//  Created by jules.papa on 2020/12/23.
//

import SwiftUI



struct ViewLayout: View {
    
    @State var textfieldString: String = ""
    @State var isOn: Bool = false
    @State var isAlertPresented: Bool = false
    var body: some View {
        
        
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("Username", text: $textfieldString)
                    Toggle("toggle", isOn: $isOn)
                    NavigationLink(destination: Views()) {
                        Image("11")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    Button(action: {
                        self.isAlertPresented = true
                    }) {
                        Text("Show Alert")
                    }
                    .alert(isPresented: $isAlertPresented) {
                        Alert(title: Text("Title"), message: Text("Message"), primaryButton: .destructive(Text("Primary"), action: {
                            // Some action
                        }), secondaryButton: .cancel())
                    }
                    
                    TupleView((Text("First"), Text("Second")))
                }
            }
            .navigationBarTitle("Settings")
            
        }
//        ScrollView {
//
//            GroupBox {
//                ForEach(0..<5) {
//                    Text("group item \($0)")
//                }
//            }
//
//            VStack {
//
//                ForEach(0..<2) {
//                    Section(header:
//                                Text("header \($0)")
//                                .background(Color.green),
//                            footer:
//                                Text("footer \($0)")
//                                .background(Color.red)) {
//
//
//                        ForEach(0..<2) {
//                            Text("item \($0)")
//                        }
//                    }
//                }
//
//                NavigationView {
//                    Form {
//                        TextField("Username", text: $textfieldString)
//                    }.navigationBarTitle("Settings")
//                }
//            }
//
//        }
    }
}


struct ViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        ViewLayout()
    }
}
