//
//  test.swift
//  MacroBarista Coffee Calculator
//
//  Created by Logan Brown on 2/28/23.
//

import Foundation
import SwiftUI
enum MyEnum {
    case case1
    case case2
    case case3
}

class MyData: ObservableObject {
    @Published var variable1: String = ""
    @Published var variable2: Int = 0
    @Published var myEnum: MyEnum = .case1
}

struct contentView: View {
    @State private var myData = MyData()
    
    var body: some View {
        VStack {
            Text("Variable 1: \(myData.variable1)")
            Text("Variable 2: \(myData.variable2)")
            
            ChildView(myData: $myData)
        }
    }
}

struct ChildView: View {
    @Binding var myData: MyData
    
    var body: some View {
        VStack {
            TextField("Variable 1", text: $myData.variable1)
            Stepper("Variable 2", value: $myData.variable2)
            
            Picker("My Enum", selection: $myData.myEnum) {
                Text("Case 1").tag(MyEnum.case1)
                Text("Case 2").tag(MyEnum.case2)
                Text("Case 3").tag(MyEnum.case3)
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

