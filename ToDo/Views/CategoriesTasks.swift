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
    @State var showCategoryTask = false
    @State var selectedCategory = ""
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
    }
    var body: some View {
        NavigationView {
            ZStack {
                TODO_BG_COLOR
                VStack(alignment: .leading) {
//                    IntroView()
//                    .padding()
                    List {
                        ForEach(0..<categoriesForGrid.count) { row in
                            HStack {
                                ForEach(categoriesForGrid[row]) { item in
                                    CategoryView(category: item, totalTasks: self.getTotalTasks(category: item.type))
                                        .onTapGesture {
                                        self.showCategoryTask = true
                                        self.selectedCategory = item.type
                                    }
                                }
                            }
                        }
                    }
                    NavigationLink(destination: CategoryTasks(category: selectedCategory), isActive: $showCategoryTask) {
                               Text("")
                           }
                    Spacer()
                }
            }
        .background(TODO_BG_COLOR)
        .navigationBarTitle(Text("All Reminders"))
        }
    }
    fileprivate func tapped(category: String) {
        
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


