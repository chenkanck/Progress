//
//  CounterTask.swift
//  Progress
//
//  Created by Kan Chen on 8/19/15.
//  Copyright (c) 2015 Zap. All rights reserved.
//

import Foundation

class CounterTask : AbstractTask{
    var current: Int
    var total: Int
    override init (title:String, start: NSDate, due: NSDate){
        self.total = 100
        self.current = 0
        super.init(title: title, start: start, due: due)
        
    }
}
