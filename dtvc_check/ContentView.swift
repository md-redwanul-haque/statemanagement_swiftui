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
    @ObservedObject var CounterDataModelObject = counterDataModel()
    
    var body: some View {
        Toggle(isOn: $testBool, label: {
            Text("Switch")
        })
        .padding()
        Text("Parent Count: \(countVal)")
        ChildView(argVal: $countVal, argVal2: $CounterMOdelObject.testInt)
        
        Button("model2Button"){
            CounterMOdelObject.testInt += 1
        }
        Text("Model Data Count: \(CounterMOdelObject.testInt)")
        TimerView()
        
        SuperVIew(counter: CounterDataModelObject)
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


class counterDataModel: ObservableObject {
    @Published var testValue: Int = 0
}

class TimerModel: ObservableObject{
    
    @Published var timeElipsed: Int = 0
    
    
}

struct SuperVIew: View{
    @StateObject var counter: counterDataModel
    var body: some View {
        SubView().environmentObject(counter)
       }
    
}

struct SubView: View{
    @EnvironmentObject var counter: counterDataModel
    var body: some View {
        VStack{
            Spacer()
            Text("Global Count: \(counter.testValue)")
            Button("Increase Global Val"){
                counter.testValue += 1
                
            }
            
        }
       }
}

struct TimerView: View{
    @StateObject var timer = TimerModel()
    
    var body: some View{
        
        Text("TIme Elapsed: \(timer.timeElipsed)")
        Button("Increment Time"){
            timer.timeElipsed += 1
        }
        
    }
    
}
