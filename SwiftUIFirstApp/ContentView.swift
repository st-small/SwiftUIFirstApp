//
//  ContentView.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import SwiftUI

public struct ContentView: View {
    @FetchRequest(entity: Novel.entity(), sortDescriptors: []) var novels: FetchedResults<Novel>
    @State var showingAddNovel = false
    @Environment(\.managedObjectContext) var moc
    
    public var body: some View {
        NavigationView {
            List {
                ForEach(novels, id: \.name) { novel in
                    NavigationLink(destination: Text(novel.author)) {
                        Text(novel.rating)
                            .font(.headline)
                        Text(novel.name)
                    }
                }
            }.navigationBarTitle("Романы")
                .navigationBarItems(trailing: Button("Добавить") {
                    self.showingAddNovel.toggle()
            })
        }
        .sheet(isPresented: $showingAddNovel) {
            AddView(isPresented: self.$showingAddNovel).environment(\.managedObjectContext, self.moc)
        }
    }
}

public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        ContentView()
    }
}
