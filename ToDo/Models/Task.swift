//
//  Task.swift
//  ToDo
//
//  Created by Ibbi Khan on 14/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import Foundation
import CoreData
    
public class Task: NSManagedObject, Identifiable {
    @NSManaged public var task: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var category: String?
}
extension Task {
    func getTaskList()->NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest() as! NSFetchRequest<Task>
        return request
    }
}
