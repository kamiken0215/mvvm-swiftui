//
//  ContentView.swift
//  mvvm
//
//  Created by 神山賢太郎 on 2021/10/14.
//

import SwiftUI

//  models
struct Person {
    var name:String
    var birthday:Date
}

//  viewmodel (logic)
class ContentViewModel:ObservableObject {
    //  noticicate change to model
    @Published private var alice = Person(name: "Alice", birthday: Date())
    
    var name: String {
        alice.name
    }
    
    var age: String {
        //  date magic -> age string
        return "32"
    }
    
    //  intent
    func changeName(_ name:String) {
        alice.name = name
    }
}

//  views
struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        
        VStack {
            Text(viewModel.name)
                .padding()
            Text(viewModel.age)
                .padding()
            Button("change name") {
                // change name to BOB
                viewModel.changeName("BOB")
            }
        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
