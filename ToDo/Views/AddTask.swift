//
//  AddTask.swift
//  ToDo
//
//  Created by Ibbi Khan on 23/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI
import CoreData
struct AddTask: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Binding var addTaskBoolean: Bool
    @State var showError = false
    @State var taskText = ""
    @State private var dueDate = Date()
    @State var taskCategories = taskTypes
    @State var errorMessage = ""
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("Add Task")
            .padding()
                .font(.headline)
            TextField("Task", text: $taskText)
            .padding(10)
            VStack {
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                            ForEach(taskCategories) { category in
                                Image(systemName: category.isSelected ? "checkmark.circle.fill" : "circle.fill")
                                    .foregroundColor(Color(getColor(name: category.type)))
                              .font(.system(size: 17))
                                Text(category.type)
                                .onTapGesture {
                                    self.clearAll()
                                    let index = self.taskCategories.firstIndex(where: { $0.id == category.id })
                                    self.taskCategories[index!].isSelected.toggle()
                                }
                            
                        }
                        
                        
                    }
                }.frame(height: 60)
                Divider()
            }.padding()
            VStack(alignment: .center) {
                Text("Task Date Time").font(.headline)
                DatePicker(selection: $dueDate, in: ...Date(), displayedComponents: [.hourAndMinute, .date]) {
                    Text("")
                }
            }
            .padding(10)
            Button(action: {
                if !self.isValid() {
                    self.errorMessage = "Task is required."
                    self.showError = true
                    return
                }
                let selectedCategory = self.taskCategories.first(where: { $0.isSelected == true })
                guard let category = selectedCategory else {
                    self.errorMessage = "Category is required."
                    self.showError = true
                    return
                }
                let todoItem = TasksList(context: self.managedObjectContext)
                todoItem.task = self.taskText
                todoItem.dueDate = self.dueDate
                todoItem.createdAt = Date()
                todoItem.category = category.type
                print(self.managedObjectContext)
                do {
                    try self.managedObjectContext.save()
                    self.addTaskBoolean = false
                }catch{
                    print(error.localizedDescription)
                }
                
            }) {
                HStack {
                    Spacer()
                    Text("Save Task")
                        .font(.headline)
                        .foregroundColor(Color.white)
                    .padding(10)
                    Spacer()
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 126/255, green: 182/255, blue: 255/255), Color(red: 95/255, green: 135/255, blue: 231/255)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
            .padding()
            Spacer()
        }
        .alert(isPresented: $showError) { () -> Alert in
            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .cancel())
        }
    }
    fileprivate func clearAll() {
        for i in 0..<self.taskCategories.count {
            self.taskCategories[i].isSelected = false
        }
    }
    fileprivate func isValid()->Bool {
        if taskText == "" {
            return false
        }
        return true
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(addTaskBoolean: .constant(false))
    }
}
var taskTypes = [Category(type: "Personal"), Category(type: "Work"), Category(type: "Meeting"), Category(type: "Study"), Category(type: "Shopping"), Category(type: "Party")]
func getColor(name: String)->UIColor{
    switch name {
    case "Personal":
        return UIColor.systemYellow
    case "Work":
        return UIColor.systemGreen
    case "Meeting":
        return UIColor.systemPurple
    case "Study":
        return UIColor.systemBlue
    case "Shopping":
        return UIColor.systemOrange
    default:
        return UIColor.systemBackground
    }
}
