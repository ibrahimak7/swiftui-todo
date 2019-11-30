//
//  TaskViewRow.swift
//  ToDo
//
//  Created by Ibbi Khan on 24/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import SwiftUI

struct TaskViewRow: View {
    var task: TasksList!
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Rectangle()
                        .fill(Color(getColor(name: task.category ?? "")))
                    .frame(width: 10, height: 80)
                }
                Image(systemName: "circle")
                    .font(.system(size: 20))
                    .foregroundColor(Color.gray)
                Text(task.dueDate?.toNormalTime() ?? "00:00 AM")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Text(task.task ?? "No Task")
                .font(.headline)
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(Color.gray)
                    .padding(.trailing, 10)
                
            }
        
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .some(80), alignment: .topLeading)
            .background(Color.white)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.white, lineWidth: 1)
//            )
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
