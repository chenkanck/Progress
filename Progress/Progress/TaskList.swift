//
//  TaskList.swift
//  Progress
//
//  Created by Kan Chen on 8/19/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import Foundation

class TaskList {
    static let sharedInstance = TaskList()
    var Tasks: [AbstractTask]
    private init () {
        Tasks = [];
    }
}
