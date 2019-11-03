//
//  NovelCard.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import SwiftUI

struct NovelCard: View {
    @Environment(\.managedObjectContext) var moc
    @State var randomNumber = Int.random(in: 1...4)
    @State var showingAuthor = false
    @State var dragAmount = CGSize.zero
    var novel: Novel
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack {
                    Image("\(self.randomNumber)").resizable()
                        .frame(width: 300.0, height: 150.0)
                    Text(self.novel.name)
                        .font(.largeTitle)
                        .lineLimit(10)
                        .padding([.horizontal])
                    
                    Text(self.novel.author)
                        .font(.title)
                        .lineLimit(10)
                        .padding([.horizontal, .bottom])
                        .blur(radius: self.showingAuthor ? 0 : 6)
                        .opacity(self.showingAuthor ? 1 : 0.25)
                }
                .multilineTextAlignment(.center)
                .background(
                    Color.white
                        .shadow(color: .black, radius: 5)
                )
                .onTapGesture {
                    withAnimation {
                        self.showingAuthor.toggle()
                    }
                }
                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 10), axis: (x: 0, y: 1, z: 0))
            }
            
            Text(novel.rating)
                .font(.system(size: 48))
                .foregroundColor(.white)
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .frame(width: 300)
        .offset(y: self.dragAmount.height)
        .gesture(
            DragGesture()
                .onChanged { self.dragAmount = $0.translation }
                .onEnded { value in
                    if self.dragAmount.height < -200 {
                        self.dragAmount = CGSize(width: 0, height: -1000)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.moc.delete(self.novel)
                            //                            try? self.moc.save()
                        }
                    } else {
                        self.dragAmount = .zero
                    }
            }
        )
            .animation(.spring())
    }
}
