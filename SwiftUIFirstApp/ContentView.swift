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
        // Uncomment this block to use default UI
        /*
        
        NavigationView {
            List {
                ForEach(novels, id: \.name) { novel in
                    NavigationLink(destination: Text(novel.author)) {
                        Text(novel.rating)
                            .font(.headline)
                        Text(novel.name)
                    }
                }.onDelete(perform: removeNovels)
            }.navigationBarTitle("Романы")
                .navigationBarItems(leading: EditButton(), trailing: Button("Добавить") {
                    self.showingAddNovel.toggle()
            })
        }
 */
        // Use custom UI
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(novels, id: \.name) { novel in
                        NovelCard(novel: novel)
                    }
                }.padding()
            }
            
            Button("Добавить роман") {
                self.showingAddNovel.toggle()
            }
            .foregroundColor(.white)
            .offset(y: 50)
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showingAddNovel) {
            AddView(isPresented: self.$showingAddNovel).environment(\.managedObjectContext, self.moc)
        }
    }
    
    public func removeNovels(at offsets: IndexSet) {
        for index in offsets {
            let novel = novels[index]
            moc.delete(novel)
        }
        
        try? moc.save()
    }
}

public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        ContentView()
    }
}
