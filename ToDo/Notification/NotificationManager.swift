//
//  NotificationManager.swift
//  ToDo
//
//  Created by Ibbi Khan on 01/12/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import Foundation
import NotificationCenter
class LocalNotificationManager {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    // We have permission!
                    print("Permisssion Granted.")
                }else{
                    print("Permission is denied.")
                }
        }
    }
    func schedualNotificaiton(date: Date, task: String, category: String){
        let dateComponents = self.getDateComp(date: date)
        let content = UNMutableNotificationContent()
        content.title = category
        content.body = task
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = "Local Category"
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let identifier = "Task Notification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request) { (error) in
            if let err = error {
                print(err.localizedDescription)
            }else{
                print("working here")
            }
        }
        
    }
    fileprivate func getDateComp(date: Date)->DateComponents {
        var comp = DateComponents()
        let today = Calendar.current.dateComponents(in: TimeZone.current, from: date)
        
        comp.hour = today.hour
        comp.minute = today.minute
        if let minute = today.minute {
            comp.minute = minute - 10
        }
        return comp
    }
}
