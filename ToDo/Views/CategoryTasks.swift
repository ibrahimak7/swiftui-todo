//
//  CategoryTasks.swift
//  ToDo
//
//  Created by Ibbi Khan on 01/12/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct CategoryTasks: View {
    var categoryClicked: String
    @FetchRequest(fetchRequest: TasksList.getTaskList()) var items:  FetchedResults<TasksList>
    init(category: String) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        
        UITableView.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
        UITableViewCell.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
        
        self.categoryClicked = category
    }
    var body: some View {
        VStack {
            List {
                ForEach(getItems()) { item in
                    TaskViewRow(task: item)
                    .contextMenu {
                        Button(action: {
                            // change country setting
                        }) {
                            Text("Finish")
                            Image(systemName: "checkmark.circle")
                            .foregroundColor(getColor(name: item.category ?? "Meeting"))
                        }
                        Button(action: {
                            // change country setting
                        }) {
                            Text("Delete")
                            Image(systemName: "trash.circle")
                            .foregroundColor(Color.red)
                        }

                    }
                    
                }
                
            }
        }
        .navigationBarTitle(Text(categoryClicked))
            
    }
    fileprivate func getItems()->[TasksList] {
        if categoryClicked != "all" {
            return self.items.filter { $0.category == categoryClicked }
        }
        return self.items.filter { $0.category != ""} // it will return every task in the core data.
    }
}

struct CategoryTasks_Previews: PreviewProvider {
    static var previews: some View {
        CategoryTasks(category: "all")
    }
}
