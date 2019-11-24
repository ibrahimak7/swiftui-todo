//
//  AddTask.swift
//  ToDo
//
//  Created by Ibbi Khan on 23/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct AddTask: View {
    @Binding var addTaskBoolean: Bool
    @State var taskText = ""
    @State private var birthDate = Date()
    
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
                        ForEach(0..<10) { i in
                          Image(systemName: "circle")
                          .font(.system(size: 12))
                          .foregroundColor(Color.gray)
                          Text("Category \(i)")
                        }
                        
                    }
                }.frame(height: 60)
                Divider()
            }.padding()
            VStack(alignment: .center) {
                Text("Task Date Time").font(.headline)
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: [.hourAndMinute, .date]) {
                    Text("")
                }
            }
            .padding(10)
            Button(action: {
                // TODO: ...
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
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(addTaskBoolean: .constant(false))
    }
}
