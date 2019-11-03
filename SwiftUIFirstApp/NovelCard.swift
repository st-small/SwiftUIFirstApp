//
//  NovelCard.swift
//  SwiftUIFirstApp
//
//  Created by Станислав Шияновский on 11/3/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import SwiftUI

struct NovelCard: View {
    @State var randomNumber = Int.random(in: 1...4)
    var novel: Novel
    
    var body: some View {
        VStack {
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
            }
            .multilineTextAlignment(.center)
            .background(
                Color.white
                    .shadow(color: .black, radius: 5)
            )
            
            Text(novel.rating)
                .font(.system(size: 48))
                .foregroundColor(.white)
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .frame(width: 300)
    }
}
