//
//  Extension.swift
//  ToDo
//
//  Created by Ibbi Khan on 30/11/2019.
//  Copyright © 2019 Ibbi Khan. All rights reserved.
//

import Foundation

extension Date {
    func toNormalTime()->String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "E, d MMM yyyy HH:mm:ss Z"
        let longFormattedStrng = formatter.string(from: self)
        let newDate = formatter.date(from: longFormattedStrng)
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: newDate!)
    }
}
