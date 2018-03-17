//
//  Task.swift
//  The Night Porter
//
//  Created by Sajjad Patel on 2018-03-17.
//  Copyright © 2018 Sajjad Patel. All rights reserved.
//

import Foundation

enum TaskType {
    case daily, weekly, monthly
}

struct Task {
    var name: String
    var type: TaskType
    var completed: Bool
    var lastCompleted: NSDate?
}
