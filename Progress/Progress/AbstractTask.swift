//
//  AbstractTask.swift
//  Progress
//
//  Created by Kan Chen on 8/19/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import Foundation

class AbstractTask{
    var title: String
    var startTime: NSDate
    var dueTime: NSDate
    init (title: String, start: NSDate, due: NSDate){
        self.title = title
        self.startTime = start
        self.dueTime = due
    }
}
