//
//  ViewTasks.swift
//  ToDo
//
//  Created by Ibbi Khan on 23/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct ViewTasks: View {
    var searchCategoryTasks: String
    @FetchRequest(fetchRequest: TasksList.getTaskList()) var items:  FetchedResults<TasksList>
    init(category: String) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        
        UITableView.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
        UITableViewCell.appearance().backgroundColor = UIColor(red: 249/255, green: 252/255, blue: 255/255, alpha: 1)
        
        self.searchCategoryTasks = category
    }
    var body: some View {
        ZStack
            {
                TODO_BG_COLOR
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    IntroView()
                    .padding()
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
                
        }
    }
    func showa() {
        
    }
    fileprivate func getItems()->[TasksList] {
        if searchCategoryTasks != "all" {
            return self.items.filter { $0.category == searchCategoryTasks }
        }
        return self.items.filter { $0.category != ""} // it will return every task in the core data.
    }
    fileprivate func getImage()->UIImage {
        let imageData = DEFAULTS.data(forKey: "displayImage")
        if let imageData = imageData {
            let image = UIImage(data: imageData)
            if let image = image {
                return image
            }
        }
        return UIImage(named: "default") ?? UIImage()
    }
}

struct ViewTasks_Previews: PreviewProvider {
    static var previews: some View {
        ViewTasks(category: "all")
    }
}
