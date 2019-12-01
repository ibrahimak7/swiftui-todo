//
//  CategoryView.swift
//  ToDo
//
//  Created by Ibbi Khan on 30/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var totalTasks: Int
    var body: some View {
        ZStack {
            Color.white
            HStack {
                VStack {
                    Image(category.type.lowercased())
                    Text(category.type)
                        .font(Font.system(size: 22, weight: .semibold, design: .rounded))
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    Text("\(totalTasks) Tasks")
                        .font(Font.headline)
                        .foregroundColor(Color(UIColor.systemGray3))
                }
                .background(Color.white)
                
            }
                
            .background(Color.white)
                
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
        }
        .clipped()
        .shadow(color: Color(red: 240/255, green: 240/255, blue: 240/255), radius: 5, x: 0, y: 1)
        
        
    }
}

//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
//}
