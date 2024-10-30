//
//  ContentView.swift
//  dtvc_check
//
//  Created by Redwan on 30/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var testBool: Bool = false
    @State var countVal: Int = 0
    @ObservedObject var CounterMOdelObject = CounterModel()
    
    var body: some View {
        Toggle(isOn: $testBool, label: {
            Text("Switch")
        })
        .padding()
        Text("Parent Count: \(countVal)")
        ChildView(argVal: $countVal, argVal2: $CounterMOdelObject.testInt)
//        VStack{
//            Button("Press Here"){
//             countVal += 1
//            }
//            
//            
//        }
        
        

        
    }
}


//Passing state between views

struct ChildView: View{
    @Binding var argVal: Int
    @Binding var argVal2: Int
  
    var body: some View {
        VStack{
           
            Button("nButton"){
                argVal += 1
            }
            Text("Child Count: \(argVal)")
            
           
        }
        
        
        Button("ModelButton"){
            argVal2 += 1
        }
        Text("Child Model Data Count: \(argVal2)")
    }
    
    
}


#Preview {
    ContentView()
}


class CounterModel: ObservableObject {
     
    @Published var testInt: Int = 0
    
    
}
