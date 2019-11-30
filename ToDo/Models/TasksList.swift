//
//  Task.swift
//  ToDo
//
//  Created by Ibbi Khan on 14/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import Foundation
import CoreData
    
public class TasksList: NSManagedObject, Identifiable {
    @NSManaged public var category: String?
    @NSManaged public var task: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var createdAt: Date?
    @NSManaged public var notify: Bool
    @NSManaged public var completed: Bool
}
extension TasksList {
    static func getTaskList()->NSFetchRequest<TasksList> {
        let request: NSFetchRequest<TasksList> = TasksList.fetchRequest() as! NSFetchRequest<TasksList>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        return request
    }
}
struct Category: Hashable, Identifiable {
    let id = UUID().uuidString
    let type: String
    var isSelected = false
}
