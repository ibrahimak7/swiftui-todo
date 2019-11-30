//
//  ContentView.swift
//  ToDo
//
//  Created by Ibbi Khan on 14/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TasksList.getTaskList()) var toDoItems: FetchedResults<TasksList>
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        Group {
            if settings.login {
                HomeView()
            }else{
                GetStarted()
            }
        }
    }
    fileprivate func saveNow() {
        let todoItem = TasksList(context: self.managedObjectContext)
        todoItem.task = "Meeting with client"
        todoItem.dueDate = Date()
        todoItem.createdAt = Date()
        todoItem.category = "Meeting"
        do {
            try self.managedObjectContext.save()
            print("worked.")
        }catch{
            print(error.localizedDescription)
        }
    }
    fileprivate func getAllData() {
        for item in toDoItems {
            print(item.category)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView().environmentObject(UserSettings())
    }
}
class UserSettings: ObservableObject {
    @Published var login = DEFAULTS.bool(forKey: "login")
}
