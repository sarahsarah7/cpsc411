//
//  ContentView.swift
//  Randomizer Project
//
//  Created by Sarah Padilla
//

import SwiftUI

struct RandomizerDO {
    var name : String
    var options : [String]
    var view : Int
}

struct ContentView: View {
    @State var fList = RandomizerService.getAllRandomizers()
    var body: some View {
        NavigationView {
            List {
                ForEach (fList, id:\.view) {f in
                    NavigationLink(destination: DetailView(randomizer: f)) {
                            Text("\(f.name)")
                    }
                }
            }.navigationBarTitle("Randomizer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
