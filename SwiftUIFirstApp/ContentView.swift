//
//  ContentView.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import SwiftUI

public struct Novel {
    public var name: String
    public var author: String
    public var rating: String
}

public struct ContentView: View {
    
    public var novels = [
        Novel(name: "Войн и мир", author: "Лев Толстой", rating: "B"),
        Novel(name: "Мастер и Маргарита", author: "Михаил Булгаков", rating: "A")
    ]
    
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
        }
    }
}

public struct ContentView_Previews: PreviewProvider {
    public static var previews: some View {
        ContentView()
    }
}
