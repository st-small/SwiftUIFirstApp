//
//  AddView.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var isPresented: Bool
    
    @State var name = ""
    @State var author = ""
    @State var rating = ""
    var ratings = ["A", "B", "C"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Название", text: $name)
                    TextField("Автор", text: $author)
                    
                    Picker("Рейтинг", selection: $rating) {
                        ForEach(ratings, id: \.self) {
                            rating in
                            Text(rating)
                        }
                    }
                }
                
                Button("Добавить роман") {
                    let newNovel = Novel(context: self.moc)
                    newNovel.name = self.name
                    newNovel.author = self.author
                    newNovel.rating = self.rating
                    
                    try? self.moc.save()
                    self.isPresented = false
                }
            }.navigationBarTitle("Новый роман")
        }
    }
}
