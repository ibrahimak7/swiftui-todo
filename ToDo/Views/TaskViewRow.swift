//
//  TaskViewRow.swift
//  ToDo
//
//  Created by Ibbi Khan on 24/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct TaskViewRow: View {
    @Environment(\.managedObjectContext) var manageObjectContext
    @FetchRequest(fetchRequest: TasksList.getTaskList()) var items:  FetchedResults<TasksList>
    var task: TasksList!
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Rectangle()
                        .fill(getColor(name: task.category ?? ""))
                        .frame(width: 6, height: 80)
                }
                Image(systemName: "circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color.gray)
                Text(task.dueDate?.toNormalTime() ?? "00:00 AM")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                if task.completed {
                    Text(task.task ?? "No Task")
                    .font(.headline)
                    .strikethrough()
                }else{
                    Text(task.task ?? "No Task")
                    .font(.headline)
                }
                Spacer()
                Image(systemName: "bell.circle.fill")
                    .foregroundColor(task.notify ? Color.yellow : Color.gray)
                    .padding(.trailing, 10)
                    .onTapGesture {
//                        LocalNotificationManager().schedualNotificaiton(date: self.task.dueDate ?? Date(), task: self.task.task ?? "", category: self.task.category ?? "")
                        let index = self.items.firstIndex{ $0.createdAt == self.task.createdAt }
                        guard let row = index else { return }
                        self.items[row].notify.toggle()
                        do {
                            try self.manageObjectContext.save()
                        }catch{
                            print(error)
                        }
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .some(80), alignment: .topLeading)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color(red: 240/255, green: 240/255, blue: 240/255), radius: 5, x: 0, y: 1)
        }
        //    .padding(10)
    }
}

struct TaskViewRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskViewRow()
    }
}
