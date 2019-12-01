//
//  CategoriesTasks.swift
//  ToDo
//
//  Created by Ibbi Khan on 23/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct CategoriesTasks: View {
    @FetchRequest(fetchRequest: TasksList.getTaskList()) var items:  FetchedResults<TasksList>
    var body: some View {
        ZStack {
            TODO_BG_COLOR
            VStack(alignment: .leading) {
                IntroView()
                .padding()
                Text("Projects")
                    .padding(.leading, 20)
                List {
                    ForEach(0..<categoriesForGrid.count) { row in
                        HStack {
                            ForEach(categoriesForGrid[row]) { item in
                                CategoryView(category: item, totalTasks: self.getTotalTasks(category: item.type))
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
    fileprivate func getTotalTasks(category: String)->Int {
        let total = self.items.filter { $0.category == category }.count
        return total
    }
}

struct CategoriesTasks_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesTasks()
    }
}
//struct CatArray {
//    let uid = UUID().uuidString
//    let catArr: [Category]
//}
var categoryRow1 = [Category(type: "Personal"), Category(type: "Work")]
var categoryRow2 = [Category(type: "Meeting"), Category(type: "Study")]
var categoryRow3 = [Category(type: "Shopping"), Category(type: "Party")]
var categoriesForGrid = [categoryRow1, categoryRow2, categoryRow3]


